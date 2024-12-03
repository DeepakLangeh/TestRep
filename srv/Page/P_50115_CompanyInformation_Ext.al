
pageextension 50115 "Company Information_Ext" extends "Company Information"
{
    layout
    {
        // Add changes to page layout here
        addafter(Name)
        {
            field("Name Arabic"; "Name Arabic")
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