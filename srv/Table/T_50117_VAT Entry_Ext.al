tableextension 50117 "VAT Entry_Ext" extends "VAT Entry"
{
    fields
    {
        // Add changes to table fields here
        field(50050; "VAT Return Ref. Nos."; Code[20])
        {

            Description = 'VAT_RTN1.0';
        }
    }

    var
        myInt: Integer;
}