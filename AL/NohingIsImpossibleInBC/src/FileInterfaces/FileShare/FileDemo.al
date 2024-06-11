namespace PatrickSchiefer.IO;
using System.Azure.Storage.Files;
using System.Azure.Storage;

page 50401 FileDemo
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(filename; filename)
                {
                    ApplicationArea = All;
                }
                field(FileContent; content)
                {
                    ApplicationArea = All;
                    MultiLine = true;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            action(Clear)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                begin
                    content := '';
                end;
            }
            action(WriteFile)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    FileClient: Codeunit "AFS File Client";
                    AFSResponse: Codeunit "AFS Operation Response";
                    StorageServiceAuth: Codeunit "Storage Service Authorization";
                    fileSetup: Record FileShareSetup;
                begin
                    fileSetup.Get();
                    FileClient.Initialize(fileSetup.StorageAccount, fileSetup.Sharename,
                        StorageServiceAuth.UseReadySAS(fileSetup.SASToken));

                    AFSResponse := FileClient.CreateFile(filename, StrLen(content));
                    if (not AFSResponse.IsSuccessful()) then
                        Error(AFSResponse.GetError());

                    AFSResponse := FileClient.PutFileText(filename, content);
                    if (not AFSResponse.IsSuccessful()) then
                        Error(AFSResponse.GetError());
                end;
            }

            action(Read)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    FileClient: Codeunit "AFS File Client";
                    AFSResponse: Codeunit "AFS Operation Response";
                    StorageServiceAuth: Codeunit "Storage Service Authorization";
                    fileSetup: Record FileShareSetup;
                begin
                    fileSetup.Get();
                    FileClient.Initialize(fileSetup.StorageAccount,
                                fileSetup.Sharename, StorageServiceAuth.UseReadySAS(fileSetup.SASToken));

                    AFSResponse := FileClient.GetFileAsText(filename, content);
                end;
            }
        }
    }


    var
        content: Text;
        filename: Text;
}