report 50100 "AXT Weighing Receipt"
{
    Caption = 'Weighing Receipt';
    UsageCategory = None;
    RDLCLayout = '.\src\report\AXTWeighingReceipt.rdl';
    dataset
    {
        dataitem(AXTWeighingRegistration; "AXT Weighing Registration")
        {
            column(CustomerNo_AXTWeighingRegistration; "Customer No.")
            {

            }
            column(CustomerName_AXTWeighingRegistration; "Customer Name")
            {
            }
            column(DriverName_AXTWeighingRegistration; "Driver Name")
            {
            }
            column(IncomingDateTime_AXTWeighingRegistration; "Incoming Date Time")
            {
            }
            column(IncomingGrossWeight_AXTWeighingRegistration; "Incoming Gross Weight")
            {
            }
            column(LicencePlate_AXTWeighingRegistration; "Licence Plate")
            {
            }
            column(OutgoingDateTime_AXTWeighingRegistration; "Outgoing Date Time")
            {
            }
            column(OutgoingGrossWeight_AXTWeighingRegistration; "Outgoing Gross Weight")
            {
            }
            column(MaterialTypeCode_AXTWeighingRegistration; "Material Type Code")
            {
            }
            column(NetWeight_AXTWeighingRegistration; "Net Weight")
            {
            }
            column(No_AXTWeighingRegistration; "No.")
            {
            }
        }
    }
    labels
    {
        Info = 'Info';
        DriverInfo = 'Driver Info:';
        Incoming = 'Incoming:';
        Outgoing = 'Outgoing:';
        NetWeight = 'Net Weight:';
        kg = 'kg';


    }

}
