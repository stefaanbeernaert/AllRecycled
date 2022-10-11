page 50103 "AXT Weighing Registration Out"
{
    Caption = 'Weighing Registration Out';
    PageType = Card;
    SourceTable = "AXT Weighing Registration";
    UsageCategory = none;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(Out)
            {
                field("Outgoing Gross Weight"; Rec."Outgoing Gross Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outgoing Gross Weight field.';
                }
                field("Outgoing Date Time"; Rec."Outgoing Date Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outgoing Date Time field.';
                }
                field("Weighing Status"; Rec."Weighing Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Weighing Status field.';
                    Editable = false;
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Net weight field.';
                }

            }
            group("In")
            {
                Editable = false;
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
            part("Registration Picture Factbox"; "AXT Picture Factbox")
            {
                ApplicationArea = all;
                SubPageLink = "Weighing Registration No." = field("No.");


            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Import Picture")
            {
                ApplicationArea = all;
                Caption = 'Import Picture';
                Tooltip = 'Import Picture';
                Image = Camera;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    RegistationPicture: Record "AXT Registration Picture";
                begin
                    RegistationPicture.Init();
                    RegistationPicture.Validate("Weighing Registration No.", rec."No.");
                    RegistationPicture.Insert(true);

                    RegistationPicture.importPicture();


                end;
            }
        }
    }

}
