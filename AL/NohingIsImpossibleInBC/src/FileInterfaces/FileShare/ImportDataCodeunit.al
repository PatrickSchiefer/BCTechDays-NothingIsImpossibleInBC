namespace PatrickSchiefer.IO;

using System.Azure.Storage.Files;
using System.Azure.Storage;

codeunit 50405 ImportData
{
    procedure ImportData()
    var
        FileClient: Codeunit "AFS File Client";
        AFSResponse: Codeunit "AFS Operation Response";
        StorageServiceAuth: Codeunit "Storage Service Authorization";
        fileSetup: Record FileShareSetup;
        content: Text;
        contentList: List of [Text];
        contentElement: Text;
        recImportData: Record ImportData;
    begin
        fileSetup.Get();
        FileClient.Initialize(fileSetup.StorageAccount, fileSetup.Sharename, StorageServiceAuth.UseReadySAS(fileSetup.SASToken));
        AFSResponse := FileClient.GetFileAsText(filenameTok, content);
        if (not AFSResponse.IsSuccessful()) then
            Error(AFSResponse.GetError());

        contentList := content.Split(';');
        foreach contentElement in contentList do begin
            recImportData."Entry No." := 0;
            recImportData.Content := contentElement;
            recImportData.Insert();
        end;

        AFSResponse := FileClient.DeleteFile(filenameTok);


    end;

    var
        filenameTok: Label 'import.txt', Locked = true;
}