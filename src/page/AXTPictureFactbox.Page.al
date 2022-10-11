page 50105 "AXT Picture Factbox"
{
    Caption = 'Picture Factbox';
    PageType = CardPart;
    SourceTable = "AXT Registration Picture";

    layout
    {
        area(content)
        {
            field(Picture; Rec.Picture)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Picture field.';

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Next")
            {
                ApplicationArea = All;
                Caption = 'Next';
                ToolTip = 'Next';
                Image = NextRecord;
                trigger OnAction()
                begin
                    rec.Next()
                end;

            }
            action(Previous)
            {
                ApplicationArea = All;
                Caption = 'Previous';
                ToolTip = 'Previous';
                Image = NextRecord;
                trigger OnAction()
                begin
                    rec.Next(-1)
                end;

            }
        }
    }
}
