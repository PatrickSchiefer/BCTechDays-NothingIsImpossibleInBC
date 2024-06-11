namespace PatrickSchiefer.SQL;
page 50300 SQLExample
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = SQLDemoData;

    layout
    {
        area(Content)
        {
            repeater(list)
            {
                field(PrimaryKey; Rec.PrimaryKey)
                {
                }
                field(Name; Rec.Name)
                {
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CallSQL)
            {
                ApplicationArea = all;
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    SQL: Codeunit "SQL";
                    ResultText: Text;
                    JSONArray: JsonArray;
                    JSONToken: JsonToken;
                    JSONTokenPrimaryKey: JsonToken;
                    JSONTokenText: JsonToken;
                    i: Integer;
                begin
                    ResultText := SQL.GetSQL();
                    rec.DeleteAll();
                    JSONArray.ReadFrom(ResultText);
                    if (JSONArray.Count > 0) then begin
                        for i := 0 to JSONArray.Count - 1 do begin
                            JSONArray.Get(i, JSONToken);
                            rec.Init();
                            JSONToken.SelectToken('PrimaryKey', JSONTokenPrimaryKey);
                            JSONToken.SelectToken('Name', JSONTokenText);
                            rec.PrimaryKey := JSONTokenPrimaryKey.AsValue().AsInteger();
                            rec.Name := JSONTokenText.AsValue().AsText();
                            rec.Insert();
                        end;
                    end;
                end;
            }
        }
    }
}