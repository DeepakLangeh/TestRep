tableextension 50119 "Dimension_Ext" extends Dimension
{
    fields
    {
        // Add changes to table fields here
        field(50050; "VAT Reporting"; Boolean)
        {

            Description = 'VAT_RTN1.0';

            trigger onvalidate()
            var
                myInt: Integer;
                Dimension: Record Dimension;
            begin

                IF Rec."VAT Reporting" = TRUE THEN BEGIN
                    Dimension.RESET;
                    Dimension.SETRANGE(Dimension."VAT Reporting", TRUE);
                    IF Dimension.FINDFIRST THEN
                        ERROR('Only one Dimension code can be VAT Reporting.');
                END;


            end;
        }
    }

    var
        myInt: Integer;
}