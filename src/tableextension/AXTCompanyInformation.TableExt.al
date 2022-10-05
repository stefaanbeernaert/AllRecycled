tableextension 50100 "AXT Company Information" extends "Company Information"
{
    Description = '20.0.0.0';

    fields
    {
        field(50100; "AXT Weighing Reg. Nos."; Code[20])
        {
            Caption = 'Weighing Registation No. Series';
            DataClassification = SystemMetadata;
            TableRelation = "No. Series".Code;
        }
    }
}
