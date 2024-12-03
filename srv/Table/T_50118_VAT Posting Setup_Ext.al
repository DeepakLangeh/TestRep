tableextension 50118 "VAT Posting Setup_Ext" extends "VAT Posting Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "VAT Emirate"; Option)
        {
            OptionCaption = ' ,AUH,DXB,SHJ,AJM,UAQ,RAK,FUJ';
            OptionMembers = ,AUH,DXB,SHJ,AJM,UAQ,RAK,FUJ;
            Description = 'VAT_RTN1.0';
        }
        field(50001; "Zero rated (BOX 4)"; Boolean)
        {
            Description = 'VAT_RTN1.0';
        }
        field(50002; "Exempt (BOX 5) "; Boolean)
        {
            Description = 'VAT_RTN1.0';
        }
        field(50003; "SR Expenses (BOX 9)"; Boolean)
        {
            Description = 'VAT_RTN1.0';
        }
    }

    var
        myInt: Integer;
}