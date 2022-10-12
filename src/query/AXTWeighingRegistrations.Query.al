query 50100 "AXT Weighing Registrations"
{
    Caption = 'Weighing Registrations';
    QueryType = Normal;
    QueryCategory = 'Registrations with customer';

    elements
    {
        dataitem(AXTWeighingRegistration; "AXT Weighing Registration")
        {
            column(No; "No.")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(DriverName; "Driver Name")
            {
            }
            column(IncomingDateTime; "Incoming Date Time")
            {
            }
            column(IncomingGrossWeight; "Incoming Gross Weight")
            {
            }
            column(LicencePlate; "Licence Plate")
            {
            }
            column(MaterialTypeCode; "Material Type Code")
            {
            }
            column(NetWeight; "Net Weight")
            {
            }
            column(OutgoingDateTime; "Outgoing Date Time")
            {
            }
            column(OutgoingGrossWeight; "Outgoing Gross Weight")
            {
            }
            column(ProjectNo; "Project No.")
            {
            }

            dataitem(Customer; customer)
            {
                DataItemLink = "No." = AXTWeighingRegistration."Customer No.";



                column(No_customer; "No.")
                {
                }
                column(Address_Customer; Address)
                {
                }
                column(City_Customer; City)
                {
                }
                column(CountryRegionCode_Customer; "Country/Region Code")
                {
                }
                column(Name_Customer; Name)
                {
                }
            }

        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
