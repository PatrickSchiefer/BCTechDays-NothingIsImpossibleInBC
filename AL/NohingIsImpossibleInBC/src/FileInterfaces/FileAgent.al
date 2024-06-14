
namespace PatrickSchiefer.IO;

codeunit 50200 FileAgent
{
    var
        ServiceBusRelay: codeunit AzureServiceBusRelay;
        PrinterPluginNameTok: Label '/File/V1.0', Locked = true;
        PrinterFuncDefTok: Label '/Get', Locked = true;

    procedure GetFile(): Text;
    var
        ResultText: Text;
    begin
        ServiceBusRelay.Get(PrinterPluginNameTok + StrSubstNo(PrinterFuncDefTok), ResultText);
        exit(ResultText);
    end;
}
