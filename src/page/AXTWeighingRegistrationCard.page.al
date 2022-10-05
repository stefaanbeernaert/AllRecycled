page 50101 "AXT Weighing Registration Card"
{
    Caption = 'Weighing Registration Card';
    PageType = Card;
    SourceTable = "AXT Weighing Registration";
    Description = '20.0.0.0';
    Editable = false;
    // ModifyAllowed = false;
    //InsertAllowed = false;
    UsageCategory = None;

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
                    ToolTip = 'Specifies the value of the Customer No. field.';
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
                field("Material Type Code"; Rec."Material Type Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Material Type Code field.';
                }
                field("Weighing Status"; Rec."Weighing Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weighing Status field.';
                }
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project No. field.';
                }
            }
        }
    }
}
