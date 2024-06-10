
namespace PatrickSchiefer.Printer;

codeunit 50400 BCAgentPrinters implements IPrinterList
{
    // var
    //     ServiceBusRelay: codeunit AzureServiceBusRelay;
    //     PrinterPluginNameTok: Label '/printers/V1.0', Locked = true;
    //     PrinterFuncDefTok: Label '/Get', Locked = true;

    // procedure GetPrinters(var rec: Record Printer)
    // var
    //     ResultText: Text;
    //     JSONArray: JsonArray;
    //     JSONToken: JsonToken;
    //     i: Integer;
    // begin
    //     ServiceBusRelay.Get(PrinterPluginNameTok + StrSubstNo(PrinterFuncDefTok), ResultText);
    //     rec.DeleteAll();
    //     JSONArray.ReadFrom(ResultText);
    //     if (JSONArray.Count > 0) then begin
    //         for i := 0 to JSONArray.Count - 1 do begin
    //             JSONArray.Get(i, JSONToken);
    //             rec.Init();
    //             rec.Name := JSONToken.AsValue().AsText();
    //             rec.Insert();
    //         end;
    //     end;
    // end;

    procedure GetPrinters(var rec: Record Printer)
    begin

    end;
}
