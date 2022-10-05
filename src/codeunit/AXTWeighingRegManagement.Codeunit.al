codeunit 50100 "AXT Weighing Reg. Management"
{
    procedure ProcessToInvoice(var WeighingRegistrations: Record "AXT Weighing Registration")
    var
        SalesHeader: Record "Sales Header";
        Window: Dialog;
        DialogLbl: label '#1 of #2';
        TotalRegistrations: Integer;
        counter: Integer;
    begin
        // Get selected weighing registrations
        // pass value by var
        // 1. loop over weighing registrations
        WeighingRegistrations.SetFilter("Customer No.", '<>%1', '');
        WeighingRegistrations.SetFilter("Net Weight", '>%1', 0);
        WeighingRegistrations.SetFilter("Material Type Code", '<>%1', '');

        WeighingRegistrations.SetRange("Weighing Status", WeighingRegistrations."Weighing Status"::OUT);
        TotalRegistrations := WeighingRegistrations.Count();
        if GuiAllowed then begin
            Window.Open(DialogLbl, counter, TotalRegistrations);
            Counter := 0;
            Window.Open(DialogLbl, counter, TotalRegistrations);

        end;


        if WeighingRegistrations.FindSet() then
            repeat
                if GuiAllowed then begin
                    counter += 1;
                    Window.Update();

                end;

                //2. validaties do needed checks before creating invoice
                //replaced by filtering
                //  WeighingRegistrations.TestField("Customer No.");



                // 3. Sales invoice header
                CreateSalesHeader(WeighingRegistrations, SalesHeader);

                // 4. add sales invoice line
                AddSalesLine(WeighingRegistrations, SalesHeader);


                // 5. status weiging registration change
                WeighingRegistrations.validate("Weighing Status", WeighingRegistrations."Weighing Status"::CLOSED);
                WeighingRegistrations.Modify(true);
                Sleep(1000);

            until WeighingRegistrations.next() = 0;
        Sleep(3000);


        Window.Close();



    end;

    local procedure CreateSalesHeader(WeighingRegistrations: Record "AXT Weighing Registration"; var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.Reset();
        SalesHeader.init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
        SalesHeader."No." := '';
        SalesHeader.Insert(true);

        // SalesHeader."Sell-to Customer No." := WeighingRegistrations."Customer No.";
        SalesHeader.Validate("Sell-to Customer No.", WeighingRegistrations."Customer No.");
        SalesHeader.Validate("Document Date", WorkDate());

        SalesHeader.Modify(true);

    end;

    local procedure AddSalesLine(WeighingRegistrations: Record "AXT Weighing Registration"; var SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";

    begin
        SalesLine.reset();
        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine."Document No." := SalesHeader."No.";
        SalesLine."Line No." := 10000;
        SalesLine.Insert(true);

        SalesLine.Validate(Type, SalesLine.Type::Item);
        SalesLine.Validate("No.", GetItem(WeighingRegistrations)); // get item no. 
        salesline.validate("description", WeighingRegistrations."No.");

        SalesLine.validate(Quantity, GetQuantity(WeighingRegistrations));

        SalesLine.Modify(true);

    end;


    // haalt de item no. op en geeft die terug in de getitem functie
    local procedure GetItem(WeighingRegistration: Record "AXT Weighing Registration"): code[20] // wat je teruggeeft van je procedure
    var
        MaterialType: Record "AXT Material Type";
        Item: Record Item;
    begin
        WeighingRegistration.TestField("Material Type Code");

        if not MaterialType.Get(WeighingRegistration."Material Type Code") then
            Error('Material Type  ' + WeighingRegistration."Material Type Code" + ' not found.');

        MaterialType.TestField("Item No.");
        if not Item.Get(MaterialType."Item No.") then
            Error('Item not found.');

        exit(Item."No.");

    end;

    local procedure GetQuantity(weighingRegistration: Record "AXT Weighing Registration"): Decimal
    var
        MaterialType: Record "AXT Material Type";
    begin
        MaterialType.get(weighingRegistration."Material Type Code");

        case MaterialType.Type of
            MaterialType.Type::Pay:

                exit(-weighingRegistration."Net Weight");


            MaterialType.Type::Refund:

                exit(weighingRegistration."Net Weight");

        end;



    end;



}
