page 50001 DemoLandingPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    actions
    {
        area(Processing)
        {
            action(HardwareAccess)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Page.Run(Page::PrinterList);
                end;
            }
            action(ClientAddIn)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Page.Run(Page::ClientAddinDemo);
                end;
            }
            action(FileDemo)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Page.Run(Page::FileDemo);
                end;
            }

            action(BlobDemo)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Page.Run(Page::BlobDemo);
                end;
            }

            action(FilesystemWatcherDemo)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Page.Run(Page::ImportData);
                end;
            }
        }
    }

}