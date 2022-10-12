codeunit 50101 "AXT Weighing Reg.n Overview"
{
    trigger OnRun()
    begin
        SendOverviewMails();
    end;

    procedure SendOverviewMails()
    var
        Email: codeunit Email;
        TempBlob: Codeunit "Temp Blob";
        EmailMessage: codeunit "Email Message";
        EmailBody: TextBuilder;
        Message: TextBuilder;
        OutStr: OutStream;
        InStr: InStream;
        WeighingQuery: Query "AXT Weighing Registrations";
        WeighingReceipt: Report "AXT Weighing Receipt";
    begin
        WeighingQuery.open();
        while WeighingQuery.Read() do begin
            Message.clear();
            Message.AppendLine(WeighingQuery.No);
            Message.AppendLine(WeighingQuery.Address_Customer);
            Message(Message.ToText());
        end;

        /*  EmailBody.AppendLine('Beste klant,');
         EmailBody.AppendLine();
         EmailBody.AppendLine(' Gelieve in deze mail uw overzicht van de gedane registraties te vinden voor vandaag.');
         EmailBody.AppendLine();
         EmailBody.AppendLine('Met vriendelijke groeten.');
         EmailBody.AppendLine('WIj');

         EmailMessage.Create('beernaertstefaan@gmail.com', 'Weighing Registrations', EmailBody.ToText());
         TempBlob.CreateOutStream(OutStr);
         report.SaveAs(Report::"AXT Weighing Receipt", '', ReportFormat::Pdf, Outstr);
         TempBlob.CreateInStream(InStr);


         EmailMessage.AddAttachment('Weighing Registration', 'PDF', InStr);
         Email.Send(EmailMessage);
  */

    end;

}
