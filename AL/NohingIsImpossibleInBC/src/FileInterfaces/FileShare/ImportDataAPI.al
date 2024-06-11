namespace PatrickSchiefer.IO;

page 50404 ImportDataAPI
{
    PageType = API;
    Caption = 'ImportDataAPI';
    APIPublisher = 'PatrickSchiefer';
    APIGroup = 'DOK';
    APIVersion = 'v1.0';
    EntityName = 'ImportData';
    EntitySetName = 'ImportData';
    SourceTable = ImportData;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                }
                field(data; Rec.Content)
                {
                    Caption = 'Content';
                }
            }
        }
    }
}