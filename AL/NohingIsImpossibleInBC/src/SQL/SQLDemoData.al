namespace PatrickSchiefer.SQL;

table 50300 SQLDemoData
{
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; PrimaryKey; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;

        }
    }
}