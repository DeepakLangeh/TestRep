pageextension 50116 "General Ledger Setup_Ext" extends "General Ledger Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Bank Account Nos.")
        {
            field("VAT Return Ref. Nos."; "VAT Return Ref. Nos.")
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

