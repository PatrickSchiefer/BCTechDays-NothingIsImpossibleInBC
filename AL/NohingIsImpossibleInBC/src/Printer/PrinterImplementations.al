namespace PatrickSchiefer.Printer;
enum 50400 PrinterImplementations implements IPrinterList
{
    Extensible = true;

    value(0; MiddleLayer)
    {
        Implementation = IPrinterList = MiddleLayerPrinters;
    }
    value(1; BCAgent)
    {
        Implementation = IPrinterList = BCAgentPrinters;
    }
    value(2; DotNet)
    {
        Implementation = IPrinterList = DotNetPrinters;
    }
}