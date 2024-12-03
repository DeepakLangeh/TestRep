tableextension 50116 "General Ledger Setup_Ext" extends "General Ledger Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50050; "VAT Return Ref. Nos."; Code[10])
        {
            TableRelation = "No. Series";
            Description = 'VAT_RTN1.0';
        }
    }

    var
        myInt: Integer;
}