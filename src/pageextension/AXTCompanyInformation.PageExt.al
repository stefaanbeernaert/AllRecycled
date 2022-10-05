pageextension 50100 "AXT Company Information" extends "Company Information"
{
    Description = '20.0.0.0';

    layout
    {
        addlast(Other)
        {
            field("AXT Weighing Reg. Nos."; Rec."AXT Weighing Reg. Nos.")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }

        }

    }


}
