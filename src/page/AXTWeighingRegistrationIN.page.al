page 50102 "AXT Weighing Registration IN"
{
    Caption = 'Weighing Registration IN';
    PageType = Card;
    SourceTable = "AXT Weighing Registration";
    UsageCategory = None;
    DeleteAllowed = false;
    InsertAllowed = false;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Speciefies the name';


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
                field("Incoming Gross Weight"; rec."Incoming Gross Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incoming Gross weight field.';
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Net weight field.';
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
                field("Weighing Status"; Rec."Weighing Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weighing Status field.';
                    Editable = false;
                }

            }
        }
    }
}
