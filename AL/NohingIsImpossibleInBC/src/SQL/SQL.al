
namespace PatrickSchiefer.SQL;

codeunit 50300 SQL
{
    var
        ServiceBusRelay: codeunit AzureServiceBusRelay;
        PrinterPluginNameTok: Label '/SQL/V1.0', Locked = true;
        PrinterFuncDefTok: Label '/Get', Locked = true;

    procedure GetSQL(): Text;
    var
        ResultText: Text;
    begin
        ServiceBusRelay.Get(PrinterPluginNameTok + StrSubstNo(PrinterFuncDefTok), ResultText);
        exit(ResultText);
    end;
}
