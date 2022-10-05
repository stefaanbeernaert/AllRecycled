table 50102 "AXT Registration Picture"
{
    Caption = 'Rezgistration Picture';
    DataClassification = SystemMetadata;
    Description = '20.0.0.0';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Weighing Registration Code"; Code[20])
        {
            Caption = 'Weighing Registration Code';
            DataClassification = SystemMetadata;
        }
        field(3; Picture; MediaSet)
        {
            Caption = 'Picture';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
