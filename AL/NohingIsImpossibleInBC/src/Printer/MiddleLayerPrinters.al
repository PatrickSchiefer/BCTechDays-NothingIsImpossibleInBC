namespace PatrickSchiefer.Printer;
using System.RestClient;

codeunit 50401 MiddleLayerPrinters implements IPrinterList
{

    procedure GetPrinters(var rec: Record Printer)
    var
        JSONArray: JsonArray;
        JSONToken: JsonToken;
        i: Integer;
        RestClient: Codeunit "Rest Client";
        RestResponse: Codeunit "Http Response Message";
    begin
        RestResponse := RestClient.Get('http://localhost:5142/printers/');
        if (not RestResponse.GetIsSuccessStatusCode()) then
            Error(RestResponse.GetErrorMessage());
        rec.DeleteAll();
        JSONArray := RestResponse.GetContent().AsJson().AsArray();
        if (JSONArray.Count > 0) then begin
            for i := 0 to JSONArray.Count - 1 do begin
                JSONArray.Get(i, JSONToken);
                rec.Init();
                rec.Name := JSONToken.AsValue().AsText();
                rec.Insert();
            end;
        end;
    end;
}