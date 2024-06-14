namespace PatrickSchiefer.IO;
table 50401 FileShareSetup
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; StorageAccount; Text[50])
        {

        }
        field(3; Sharename; Text[50])
        {

        }
        field(4; SASToken; Text[200])
        {
            ExtendedDatatype = Masked;
        }
        field(5; BlobContainer; Text[50])
        {

        }
    }

    keys
    {
        key(Key1; PK)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }


}