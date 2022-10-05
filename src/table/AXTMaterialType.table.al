table 50101 "AXT Material Type"
{
    Caption = 'Material Type';
    DataClassification = SystemMetadata;
    LookupPageId = "AXT Material Types";
    DrillDownPageId = "AXT Material Types";

    Description = '20.0.0.0';

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = SystemMetadata;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
        }
        field(3; Type; Option)
        {
            Caption = 'Type';
            DataClassification = SystemMetadata;
            OptionMembers = "Pay","Refund";
            OptionCaption = 'Pay,Refund';
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = SystemMetadata;
            TableRelation = item."No.";

        }

    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
