page 50100 "AXT Weighing Registration List"
{
    ApplicationArea = All;
    Caption = 'Weighing Registration List';
    PageType = List;
    SourceTable = "AXT Weighing Registration";
    UsageCategory = Lists;
    Description = '20.0.0.0';
    PromotedActionCategories = 'New,processs,Report,Extras';
    QueryCategory = 'Registrations with customer';

    Editable = false;
    CardPageId = "AXT Weighing Registration Card"; // koppelt de list naar de card pagina.


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';

                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the customer Name field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Licence Plate"; Rec."Licence Plate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Licence Plate field.';
                }
                field("Incoming Date Time"; Rec."Incoming Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incoming Date Time field.';
                }
                field("Incoming Gross Weight"; Rec."Incoming Gross Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incoming Gross Weight field.';
                }
                field("Outgoing Date Time"; Rec."Outgoing Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outgoing Date Time field.';
                }
                field("Outgoing Gross Weight"; Rec."Outgoing Gross Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outgoing Gross Weight field.';
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Net weight field.';
                }
                field("Weighing Status"; Rec."Weighing Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weighing Status field.';
                }
                field("Material Type Code"; Rec."Material Type Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Material Type Code field.';
                }
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project No. field.';
                }

            }
        }
        area(FactBoxes)
        {
            systempart(Notes; Notes)
            {
                ApplicationArea = All;

            }
            systempart(Links; Links)
            {
                ApplicationArea = ALl;
            }
            part(CustomerFactbox; "Customer Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Customer No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Create New In Registration")
            {
                ApplicationArea = All;
                Caption = 'Create New In Registration';
                ToolTip = ' ';
                Image = Open;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                // PromotedOnly = true;
                trigger OnAction()
                var
                    WeighingRegistration: Record "AXT Weighing Registration";
                begin
                    // 1. Maak nieuw record aan.
                    WeighingRegistration.Init();
                    WeighingRegistration.Insert(true);


                    // 2. open weighing registration Pagina
                    Page.Run(Page::"AXT Weighing Registration In", WeighingRegistration);
                end;
            }
            action("Create New Out Registration")
            {
                ApplicationArea = All;
                Caption = 'Out Registration';
                ToolTip = ' ';
                Image = Closed;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                // PromotedOnly = true;
                trigger OnAction()
                begin

                    Page.RunModal(Page::"AXT Weighing Registration Out", Rec);

                end;
            }
            group(Extras)
            {
                Caption = 'Extras';
                action("Print Weighing Receipt")
                {
                    ApplicationArea = All;
                    Caption = 'Print';
                    ToolTip = ' ';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    // PromotedOnly = true;
                    trigger OnAction()
                    var
                        weighRegistration: Record "AXT Weighing Registration";
                    begin
                        weighRegistration.Reset();
                        weighRegistration.SetRange("No.", rec."No.");
                        weighRegistration.FindFirst();
                        Report.run(Report::"AXT Weighing Receipt", true, false, weighRegistration);
                    end;




                }
                action("Process Weighing Registration")
                {
                    ApplicationArea = All;
                    Caption = 'Process Weighing Registration';
                    ToolTip = ' ';
                    Image = Process;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    // PromotedOnly = true;
                    trigger OnAction()
                    var
                        WeighingRegistrations: Record "AXT Weighing Registration";
                        WeighingRegManagement: codeunit "AXT Weighing Reg. Management";
                    begin
                        // 1. get selected weighing registrations
                        CurrPage.SetSelectionFilter(WeighingRegistrations); // neem alle geselecteerde


                        // 2. codeunit aanspreken and provide sleected weighing registration
                        WeighingRegManagement.ProcessToInvoice(WeighingRegistrations);



                    end;
                }
                action("show weighing reg")
                {
                    ApplicationArea = All;
                    Caption = 'Shows Weighing Registration';
                    ToolTip = ' ';
                    Image = Process;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    // PromotedOnly = true;
                    trigger OnAction()
                    begin
                        codeunit.run(codeunit::"AXT Weighing Reg.n Overview");
                    end;



                }
                action("call api")
                {
                    ApplicationArea = All;
                    Caption = 'call api';
                    ToolTip = ' ';
                    Image = Process;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    // PromotedOnly = true;
                    trigger OnAction()
                    var
                        client: HttpClient;
                        ResMessage: HttpResponseMessage;
                        Jsontxt: Text;
                    begin
                        client.get('http://hp-api.herokuapp.com/api/characters', ResMessage);
                        if ResMessage.IsSuccessStatusCode() then Error(ResMessage.ReasonPhrase);

                        ResMessage.content.ReadAs(Jsontxt);

                        Message(Jsontxt);
                    end;

                }
            }

        }
    }
}
