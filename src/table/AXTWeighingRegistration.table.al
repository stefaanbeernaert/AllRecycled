table 50100 "AXT Weighing Registration"
{
    Caption = 'Weighing Registration';
    DataClassification = SystemMetadata;
    // welke pagina's zijn er gekoppeld aan dit tabel
    LookupPageId = "AXT Weighing Registration List";
    DrillDownPageId = "AXT Weighing Registration Card";

    Description = '20.0.0.0';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = SystemMetadata;
            TableRelation = Customer."No.";
            trigger OnValidate()
            begin
                rec.CalcFields("Customer Name"); // refresh eens customer name
            end;
        }
        field(12; "Customer Name"; Text[200])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(customer.Name where("No." = field("Customer No.")));
        }
        field(3; "Project No."; code[20])
        {
            Caption = 'Project No.';
            DataClassification = SystemMetadata;
        }
        field(4; "Driver Name"; Text[150])
        {
            Caption = 'Driver Name';
            DataClassification = SystemMetadata;

        }
        field(5; "Licence Plate"; Text[20])
        {
            Caption = 'Licence Plate';
            DataClassification = SystemMetadata;
        }
        field(6; "Material Type Code"; Code[20])
        {
            Caption = 'Material Type Code';
            DataClassification = SystemMetadata;
            TableRelation = "AXT Material Type".Code;
        }
        field(7; "Incoming Date Time"; DateTime)
        {
            Caption = 'Incoming Date Time';
            DataClassification = SystemMetadata;
        }
        field(8; "Incoming Gross Weight"; Decimal)
        {
            Caption = 'Incoming Gross Weight';
            DataClassification = SystemMetadata;
            MinValue = 0;

            trigger OnValidate()
            begin
                calculateNetWeight()
            end;
        }
        field(9; "Outgoing Date Time"; DateTime)
        {
            Caption = 'Outgoing Date Time';
            DataClassification = SystemMetadata;

        }
        field(10; "Outgoing Gross Weight"; Decimal)
        {
            Caption = 'Outgoing Gross Weight';
            DataClassification = SystemMetadata;
            MinValue = 0;

            trigger OnValidate()
            begin
                if rec."Outgoing Date Time" = 0DT then
                    rec."Outgoing Date Time" := CurrentDateTime();
                // zet status op out als gross weight is insert
                Rec."Weighing Status" := Rec."Weighing Status"::OUT;
                calculateNetWeight()

            end;
        }
        field(11; "Weighing Status"; enum "AXT Weighing Status")
        {
            Caption = 'Weighing Status';
            DataClassification = SystemMetadata;
        }
        field(13; "Net Weight"; Decimal)
        {
            caption = 'Net Weight';
            DataClassification = SystemMetadata;
            Editable = false;
        }



    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        CompanyInformation: Record "Company Information";
        NoSeriesManagement: codeunit NoSeriesManagement;
    begin
        // init new no.series when no.field is validated and
        if rec."No." = '' then begin
            CompanyInformation.Get();
            NoSeriesManagement.InitSeries(CompanyInformation."AXT Weighing Reg. Nos.", CompanyInformation."AXT Weighing Reg. Nos.", WorkDate(), Rec."No.", CompanyInformation."AXT Weighing Reg. Nos.");
        end;
        rec."Incoming Date Time" := CurrentDateTime();
    end;

    local procedure calculateNetWeight()
    begin
        "Net Weight" := abs("Incoming Gross Weight" - "Outgoing Gross Weight");
    end;


}
