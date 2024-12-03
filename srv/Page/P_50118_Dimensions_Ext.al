pageextension 50118 "Dimensions_Ext" extends Dimensions
{
    layout
    {
        // Add changes to page layout here
        addafter(Blocked)
        {
            field("VAT Reporting"; "VAT Reporting")
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}

