pageextension 50117 "VAT Posting Setup Ext" extends "VAT Posting Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Reverse Chrg. VAT Acc.")
        {
            field("VAT Emirate"; "VAT Emirate")
            {
                ApplicationArea = All;
            }
            field("Zero rated (BOX 4)"; "Zero rated (BOX 4)")
            {
                ApplicationArea = All;
            }
            field("Exempt (BOX 5) "; "Exempt (BOX 5) ")
            {
                ApplicationArea = All;
            }
            field("SR Expenses (BOX 9)"; "SR Expenses (BOX 9)")
            {
                ApplicationArea = All;
            }

        }
    }

    actions
    {

    }

    var
        myInt: Integer;
}