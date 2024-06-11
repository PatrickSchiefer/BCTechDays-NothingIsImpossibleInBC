namespace PatrickSchiefer.IO;

page 50402 FileShareSetup
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = FileShareSetup;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field(StorageAccount; Rec.StorageAccount)
                {
                    ToolTip = 'Specifies the value of the StorageAccount field.';
                }
                field(Sharename; Rec.Sharename)
                {
                    ToolTip = 'Specifies the value of the Sharename field.';
                }
                field(SharedKey; Rec.SASToken)
                {
                    ToolTip = 'Specifies the value of the SharedKey field.';
                }
            }
        }
    }

    trigger OnInit()
    begin
        If not rec.Get() then
            rec.Insert;
    end;

}