tableextension 50115 "Company_Ext" extends "Company Information"
{
    fields
    {
        // Add changes to table fields here
        field(50050; "Name Arabic"; Text[100])
        {
            Description = 'VAT_RTN1.0';
        }
    }

    var
        myInt: Integer;
}