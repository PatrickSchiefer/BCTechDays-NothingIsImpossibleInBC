namespace PatrickSchiefer.IO;
using System.Azure.Storage.Files;
using System.Azure.Storage;

page 50405 BlobDemo
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
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                begin
                    content := '';
                end;
            }
            action(WriteFile)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    FileClient: Codeunit "ABS Blob Client";
                    StorageServiceAuth: Codeunit "Storage Service Authorization";
                    BlobOptions: Codeunit "ABS Optional Parameters";
                    fileSetup: Record FileShareSetup;
                begin
                    fileSetup.Get();
                    FileClient.Initialize(fileSetup.StorageAccount, fileSetup.BlobContainer,
                        StorageServiceAuth.UseReadySAS(fileSetup.SASToken));

                    if FileClient.BlobExists(filename) then
                        FileClient.DeleteBlob(filename);
                    FileClient.PutBlobAppendBlobText(filename, BlobOptions);
                    FileClient.AppendBlockText(filename, content);
                end;
            }

            action(Read)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    FileClient: Codeunit "ABS Blob Client";
                    StorageServiceAuth: Codeunit "Storage Service Authorization";
                    fileSetup: Record FileShareSetup;
                begin
                    fileSetup.Get();
                    FileClient.Initialize(fileSetup.StorageAccount,
                                fileSetup.BlobContainer, StorageServiceAuth.UseReadySAS(fileSetup.SASToken));

                    FileClient.GetBlobAsText(filename, content);
                end;
            }

            action(ReadFileViaAgent)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    FileAgent: Codeunit "FileAgent";
                begin
                    content := FileAgent.GetFile();
                end;
            }
        }
    }


    var
        content: Text;
        filename: Text;
}