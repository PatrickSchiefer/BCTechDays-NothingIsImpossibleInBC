page 50000 ClientAddinDemo
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
                usercontrol(WebserviceAddin; WebserviceAddin)
                {
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            action(OpenCashDrawer)
            {
                ApplicationArea = All;
                Image = Print;
                trigger OnAction()
                begin
                    CurrPage.WebserviceAddin.CallWebService('http://localhost:5142/CashDrawer/Open');
                end;
            }
        }
    }

    var
        myInt: Integer;
}