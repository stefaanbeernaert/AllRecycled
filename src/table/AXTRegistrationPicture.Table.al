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
            AutoIncrement = true;
        }
        field(2; "Weighing Registration No."; Code[20])
        {
            Caption = 'Weighing Registration No.';
            DataClassification = SystemMetadata;
            TableRelation = "AXT Weighing Registration"."No.";
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
    procedure ImportPicture()
    var
        FileName: Text;
        PictureStream: InStream;
        DialogCaptionQst: Label 'Select a picture to upload';
    begin
        if UploadIntoStream(DialogCaptionQst, '', '', FileName, PictureStream) then begin
            Picture.ImportStream(PictureStream, FileName);
            Modify(true);
        end;

    end;
}
