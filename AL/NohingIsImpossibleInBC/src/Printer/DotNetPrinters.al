namespace PatrickSchiefer.Printer;

codeunit 50402 DotNetPrinters implements IPrinterList
{

    procedure GetPrinters(var rec: Record Printer)
    var
        objectSearcher: DotNet ManagementObjectSearcher;
        printer: DotNet ManagementBaseObject;
        collection: DotNet ManagementObjectCollection;

    begin
        rec.DeleteAll();
        objectSearcher := objectSearcher.ManagementObjectSearcher('SELECT * FROM Win32_Printer');
        collection := objectSearcher.Get();
        foreach printer in collection do begin
            rec.Init();
            rec.Name := printer.GetPropertyValue('Name').ToString();
            rec.Insert();
        end;
    end;
}