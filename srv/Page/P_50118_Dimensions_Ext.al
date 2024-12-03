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
    [IntegrationEvent(false, false)]
    local procedure MyProcedure(Var Item: Record Item; Var ItelLedgerEntry: Record "Item Ledger Entry";)
    begin
    end;

    var
        myInt: Integer;

}

