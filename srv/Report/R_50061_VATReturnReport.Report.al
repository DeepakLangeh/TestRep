report 50061 "VAT Return Report"
{
    // VAT_RTN1.0        25.02.18      Munira      Created New

    ProcessingOnly = true;
    Caption = 'VAT Return Report';
    ApplicationArea = all;
    UsageCategory = Administration;


    dataset
    {
    }


    requestpage
    {

        layout
        {
            area(content)
            {
                field(SubmissionDate; SubmissionDate)
                {
                    Caption = 'Submission Date';
                }
                field(VATRtnRefNo; VATRtnRefNo)
                {
                    Caption = 'VAT Return Period Ref. No.';
                }
                field(Month; Month)
                {
                    Caption = 'VAT Return Period - Month';
                }
                field(Year; Year)
                {
                    Caption = 'TAX Year';
                }
                field(StartDate; StartDate)
                {
                    Caption = 'Start Date';
                }
                field(EndDate; EndDate)
                {
                    Caption = 'End Date';
                }
                field(BOX16; BOX16)
                {
                    Caption = 'Refund Reclaimable VAT';
                }
                field(BOX3DimFilter; BOX3DimFilter)
                {
                    Caption = 'Import-Customs Undeclared (BOX 3)';
                }
                field(BOX1DimFilter; BOX1DimFilter)
                {
                    Caption = 'Adjustment Output VAT (BOX 1)';
                }
                field(BOX9DimFilter; BOX9DimFilter)
                {
                    Caption = 'Adjustment Input VAT (BOX 9)';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        /*
        TempExcelBuffer.CreateBook;
        TempExcelBuffer.CreateSheet('Tax','Tax',COMPANYNAME,USERID);
        TempExcelBuffer.GiveUserControl;
        */
        TempExcelBuffer.CreateNewBook('Tax');
        TempExcelBuffer.WriteSheet('Tax', 'Tax', USERID);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.OpenExcel();

    end;

    trigger OnPreReport()
    var
        Emirate: Integer;
        SerialNo: Text[10];
        SubSerialValue: Text[10];
        BoxDesc: Text[100];
    begin

        TempExcelBuffer.DELETEALL;
        CompanyInformation.GET();

        TempExcelBuffer.DELETEALL;
        Row += 2;
        EnterCell(Row, 3, ReportHeading, TRUE, FALSE, FALSE);
        Row += 2;

        EnterCell(Row, 3, TextMain, TRUE, FALSE, FALSE);
        Row += 2;
        EnterCell(Row, 3, TextFormType, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, TextNA, FALSE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 3, TextDocLocater, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, TextNA, FALSE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 3, TextFormFillingType, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, TextNA, FALSE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 3, TextSubmissionDate, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, FORMAT(SubmissionDate), FALSE, FALSE, FALSE);
        Row += 2;

        EnterCell(Row, 3, TextTaxablePersonDetls, TRUE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 3, TextTRN, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, CompanyInformation."VAT Registration No.", FALSE, FALSE, FALSE);

        Row += 1;
        EnterCell(Row, 3, TextTaxablePersonName, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, CompanyInformation.Name, FALSE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 3, TextTaxablePersonNameAra, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, CompanyInformation."Name Arabic", FALSE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 3, TextTaxAgencyName, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, TextNA, FALSE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 3, TextTAN, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, TextNA, FALSE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 3, TextAgentName, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, TextNA, FALSE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 3, TextTAAN, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, TextNA, FALSE, FALSE, FALSE);

        Row += 2;
        EnterCell(Row, 3, TextVATReturnPeriod, TRUE, FALSE, FALSE);
        Row += 2;

        EnterCell(Row, 3, TextVATReturnPeriod, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, FORMAT(Month) + '-' + FORMAT(Year), FALSE, FALSE, FALSE);
        Row += 1;

        EnterCell(Row, 3, TextTaxYear, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, FORMAT(Year), FALSE, FALSE, FALSE);
        Row += 1;

        EnterCell(Row, 3, TextVATReturnRefNo, FALSE, FALSE, FALSE);
        //EnterCell(Row,4,TextNA,FALSE,FALSE,FALSE);
        EnterCell(Row, 4, VATRtnRefNo, FALSE, FALSE, FALSE);
        Row += 2;

        EnterCell(Row, 3, TextVATonSales, TRUE, FALSE, FALSE);

        CLEAR(Box1a1);
        CLEAR(Box1a2);
        CLEAR(Box1a3);
        CLEAR(Box1b1);
        CLEAR(Box1b2);
        CLEAR(Box1b3);
        CLEAR(Box1c1);
        CLEAR(Box1c2);
        CLEAR(Box1c3);
        CLEAR(Box1d1);
        CLEAR(Box1d2);
        CLEAR(Box1d3);
        CLEAR(Box1e1);
        CLEAR(Box1e2);
        CLEAR(Box1e3);
        CLEAR(Box1f1);
        CLEAR(Box1f2);
        CLEAR(Box1f3);
        CLEAR(Box1g1);
        CLEAR(Box1g2);
        CLEAR(Box1g3);
        CLEAR(Box21);
        CLEAR(Box22);
        CLEAR(Box22);
        CLEAR(Box31);
        CLEAR(Box32);
        CLEAR(Box33);
        CLEAR(Box41);
        CLEAR(Box42);
        CLEAR(Box43);
        CLEAR(Box51);
        CLEAR(Box52);
        CLEAR(Box53);
        CLEAR(Box61);
        CLEAR(Box62);
        CLEAR(Box63);
        CLEAR(Box71);
        CLEAR(Box72);
        CLEAR(Box73);
        CLEAR(Box81);
        CLEAR(Box82);
        CLEAR(Box83);
        CLEAR(Box91);
        CLEAR(Box92);
        CLEAR(Box93);
        CLEAR(Box101);
        CLEAR(Box102);
        CLEAR(Box103);
        CLEAR(Box111);
        CLEAR(Box112);
        CLEAR(Box113);
        CLEAR(Box12);
        CLEAR(Box12);
        CLEAR(Box12);
        CLEAR(Box13);
        CLEAR(Box1aDesc);
        CLEAR(Box1bDesc);
        CLEAR(Box1cDesc);
        CLEAR(Box1dDesc);
        CLEAR(Box1eDesc);
        CLEAR(Box1fDesc);
        CLEAR(Box1gDesc);
        CLEAR(Box16Value);

        Row += 1;
        EnterCell(Row, 4, TextAmount, TRUE, FALSE, FALSE);
        EnterCell(Row, 5, TextVATAmount, TRUE, FALSE, FALSE);
        EnterCell(Row, 6, TextAdjustment, TRUE, FALSE, FALSE);

        //Array[1] --> Amount
        //Array[2] --> VAT Amount
        //Array[3] --> Adjustment

        Emirate := 1;
        CalcBox1(Box1a1, Emirate, Box1aDesc, Box1a2, Box1a3);
        Emirate := 2;
        CalcBox1(Box1b1, Emirate, Box1bDesc, Box1b2, Box1b3);
        Emirate := 3;
        CalcBox1(Box1c1, Emirate, Box1cDesc, Box1c2, Box1c3);
        Emirate := 4;
        CalcBox1(Box1d1, Emirate, Box1dDesc, Box1d2, Box1d3);
        Emirate := 5;
        CalcBox1(Box1e1, Emirate, Box1eDesc, Box1e2, Box1e3);
        Emirate := 6;
        CalcBox1(Box1f1, Emirate, Box1fDesc, Box1f2, Box1f3);
        Emirate := 7;
        CalcBox1(Box1g1, Emirate, Box1gDesc, Box1g2, Box1g3);
        CalcBox3(Box31, Box32, Box33);
        CalcBox4(Box41, Box42, Box43);
        CalcBox5(Box51, Box52, Box53);
        CalcBox9(Box91, Box92, Box93);
        CalcBox10(Box101, Box102, Box103);

        Box21 := 0;
        Box22 := 0;
        Box23 := 0;

        Box71 := 0;
        Box72 := 0;
        Box73 := 0;

        Box61 := Box101 - Box31;
        Box62 := Box102 - Box32;
        Box63 := Box103 - Box33;

        Box81 := ABS(Box1a1) + ABS(Box1b1) + ABS(Box1c1) + ABS(Box1d1) + ABS(Box1e1) + ABS(Box1f1) + ABS(Box1g1) +
                   ABS(Box21) + ABS(Box31) + ABS(Box41) + ABS(Box51) + ABS(Box61) + ABS(Box71);
        Box82 := ABS(Box1a2) + ABS(Box1b2) + ABS(Box1c2) + ABS(Box1d2) + ABS(Box1e2) + ABS(Box1f2) + ABS(Box1g2) +
                   ABS(Box22) + ABS(Box32) + ABS(Box42) + ABS(Box52) + ABS(Box62) + ABS(Box72);
        Box83 := Box1a3 + Box1b3 + Box1c3 + Box1d3 + Box1e3 + Box1f3 + Box1g3 +
                   Box23 + Box33 + Box43 + Box53 + Box63 + Box73;

        Box111 := ABS(Box91) + ABS(Box101);
        Box112 := ABS(Box92) + ABS(Box102);
        Box113 := Box93 + Box103;

        Box12 := Box82 + Box83;
        Box13 := Box112 + Box113;
        Box14 := Box12 - Box13;

        IF BOX16 = TRUE THEN
            Box16Value := 'Y'
        ELSE
            Box16Value := 'N';

        SerialNo := '1';
        SubSerialValue := '1a';
        EnterData(SerialNo, SubSerialValue, Box1aDesc, Box1a1, Box1a2, Box1a3);
        SerialNo := '1';
        SubSerialValue := '1b';
        EnterData(SerialNo, SubSerialValue, Box1bDesc, Box1b1, Box1b2, Box1b3);
        SerialNo := '1';
        SubSerialValue := '1c';
        EnterData(SerialNo, SubSerialValue, Box1cDesc, Box1c1, Box1c2, Box1c3);
        SerialNo := '1';
        SubSerialValue := '1d';
        EnterData(SerialNo, SubSerialValue, Box1dDesc, Box1d1, Box1d2, Box1d3);
        SerialNo := '1';
        SubSerialValue := '1e';
        EnterData(SerialNo, SubSerialValue, Box1eDesc, Box1e1, Box1e2, Box1e3);
        SerialNo := '1';
        SubSerialValue := '1f';
        EnterData(SerialNo, SubSerialValue, Box1fDesc, Box1f1, Box1f2, Box1f3);
        SerialNo := '1';
        SubSerialValue := '1g';
        EnterData(SerialNo, SubSerialValue, Box1gDesc, Box1g1, Box1g2, Box1g3);
        SerialNo := '2';
        SubSerialValue := '';
        BoxDesc := TextBOX2;
        EnterData(SerialNo, SubSerialValue, BoxDesc, Box21, Box22, Box23);
        SerialNo := '3';
        SubSerialValue := '';
        BoxDesc := TextBOX3;
        EnterData(SerialNo, SubSerialValue, BoxDesc, Box31, Box32, Box33);
        SerialNo := '4';
        SubSerialValue := '';
        BoxDesc := TextBOX4;
        EnterData(SerialNo, SubSerialValue, BoxDesc, Box41, Box42, Box43);
        SerialNo := '5';
        SubSerialValue := '';
        BoxDesc := TextBOX5;
        EnterData(SerialNo, SubSerialValue, BoxDesc, Box51, Box52, Box53);
        SerialNo := '6';
        SubSerialValue := '';
        BoxDesc := TextBOX6;
        EnterData(SerialNo, SubSerialValue, BoxDesc, Box61, Box62, Box63);
        SerialNo := '7';
        SubSerialValue := '';
        BoxDesc := TextBOX7;
        EnterData(SerialNo, SubSerialValue, BoxDesc, Box71, Box72, Box73);
        SerialNo := '8';
        SubSerialValue := '';
        BoxDesc := TextTotal;
        EnterData(SerialNo, SubSerialValue, BoxDesc, Box81, Box82, Box83);

        Row += 4;
        EnterCell(Row, 3, TextVATonExpenses, TRUE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 4, TextAmount, TRUE, FALSE, FALSE);
        EnterCell(Row, 5, TextRecoverableVAT, TRUE, FALSE, FALSE);
        EnterCell(Row, 6, TextAdjustment, TRUE, FALSE, FALSE);

        SerialNo := '9';
        SubSerialValue := '';
        BoxDesc := TextBOX9;
        EnterData(SerialNo, SubSerialValue, BoxDesc, Box91, Box92, Box93);
        SerialNo := '10';
        SubSerialValue := '';
        BoxDesc := TextBOX10;
        EnterData(SerialNo, SubSerialValue, BoxDesc, Box101, Box102, Box103);
        SerialNo := '11';
        SubSerialValue := '';
        BoxDesc := TextTotal;
        EnterData(SerialNo, SubSerialValue, BoxDesc, Box111, Box112, Box113);

        Row += 2;
        EnterCell(Row, 3, TextNetDue, TRUE, FALSE, FALSE);
        Row += 2;
        EnterCell(Row, 1, '12', FALSE, FALSE, FALSE);
        EnterCell(Row, 3, TextBOX12, TRUE, FALSE, FALSE);
        EnterCell(Row, 4, FORMAT(ABS(Box12)), FALSE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 1, '13', FALSE, FALSE, FALSE);
        EnterCell(Row, 3, TextBOX13, TRUE, FALSE, FALSE);
        EnterCell(Row, 4, FORMAT(ABS(Box13)), FALSE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 1, '14', FALSE, FALSE, FALSE);
        EnterCell(Row, 3, TextBOX14, TRUE, FALSE, FALSE);
        EnterCell(Row, 4, FORMAT(ABS(Box14)), FALSE, FALSE, FALSE);
        Row += 1;
        EnterCell(Row, 1, '15', FALSE, FALSE, FALSE);
        EnterCell(Row, 3, TextBOX15, TRUE, FALSE, FALSE);
        EnterCell(Row, 4, Box16Value, FALSE, FALSE, FALSE);
    end;

    var
        VATRtnRefNo: Text[100];
        BOX9DimFilter: Code[250];
        BOX1DimFilter: Code[250];
        BOX3DimFilter: Code[250];
        DimensionValue: Record "Dimension Value";
        StartDate: Date;
        EndDate: Date;
        Month: Option January,February,March,April,May,June,July,August,September,October,November,December;
        Year: Integer;
        SubmissionDate: Date;
        DimensionValueList: Page "Dimension Value List";
        ExcelBuffer: Record "Excel Buffer";
        TempExcelBuffer: Record "Excel Buffer" temporary;
        Row: Integer;
        Box1a1: Decimal;
        Box1a2: Decimal;
        Box1a3: Decimal;
        Box1b1: Decimal;
        Box1b2: Decimal;
        Box1b3: Decimal;
        Box1c1: Decimal;
        Box1c2: Decimal;
        Box1c3: Decimal;
        Box1d1: Decimal;
        Box1d2: Decimal;
        Box1d3: Decimal;
        Box1e1: Decimal;
        Box1e2: Decimal;
        Box1e3: Decimal;
        Box1f1: Decimal;
        Box1f2: Decimal;
        Box1f3: Decimal;
        Box1g1: Decimal;
        Box1g2: Decimal;
        Box1g3: Decimal;
        Box21: Decimal;
        Box22: Decimal;
        Box23: Decimal;
        Box31: Decimal;
        Box32: Decimal;
        Box33: Decimal;
        Box41: Decimal;
        Box42: Decimal;
        Box43: Decimal;
        Box51: Decimal;
        Box52: Decimal;
        Box53: Decimal;
        Box61: Decimal;
        Box62: Decimal;
        Box63: Decimal;
        Box71: Decimal;
        Box72: Decimal;
        Box73: Decimal;
        Box81: Decimal;
        Box82: Decimal;
        Box83: Decimal;
        Box91: Decimal;
        Box92: Decimal;
        Box93: Decimal;
        Box101: Decimal;
        Box102: Decimal;
        Box103: Decimal;
        Box111: Decimal;
        Box112: Decimal;
        Box113: Decimal;
        Box12: Decimal;
        Box13: Decimal;
        Box14: Decimal;
        CompanyInformation: Record "Company Information";
        BOX16: Boolean;
        Box1aDesc: Text[50];
        Box1bDesc: Text[50];
        Box1cDesc: Text[50];
        Box1dDesc: Text[50];
        Box1eDesc: Text[50];
        Box1fDesc: Text[50];
        Box1gDesc: Text[50];
        Box16Value: Text[10];
        TextBOX2: Label 'TAX refunds provided to tourist under the tax refund for tourist scheme';
        TextBOX3: Label 'Supplies subject to the reverse charge provisions';
        TextBOX4: Label 'Zero rated supplies';
        TextBOX5: Label 'Exempt supplies';
        TextBOX6: Label 'Goods imported into the UAE';
        TextBOX7: Label 'Adjustments to goods imported in the UAE';
        TextTotal: Label 'Total';
        TextBOX9: Label 'Standard rated expenses';
        TextBOX10: Label 'Supplies subject to the reverse charge provision';
        TextBOX12: Label 'Total value of due tax for the period';
        TextBOX13: Label 'Total value of recoverable tax for the period';
        TextBOX14: Label 'Net VAT payable (or reclaimable) for the period';
        TextBOX15: Label 'Do you wish to request a refund for the above amount of excess recoverable Tax ?';
        TextNetDue: Label 'Net Due';
        TextAmount: Label 'Amount (AED)';
        TextRecoverableVAT: Label 'Recoverable VAT Amount (AED)';
        TextAdjustment: Label 'Adjustment (AED)';
        TextVATAmount: Label 'VAT Amount (AED)';
        ReportHeading: Label 'Value Added Tax Return';
        TextMain: Label 'Main';
        TextFormType: Label 'Form Type';
        TextNA: Label 'N/A';
        TextDocLocater: Label 'Document Locator';
        TextFormFillingType: Label 'Tax Form Filling Type';
        TextSubmissionDate: Label 'Submission Date';
        TextTaxablePersonDetls: Label 'Taxable Person details';
        TextTRN: Label 'TRN';
        TextTaxablePersonName: Label 'Taxable Person Name (English)';
        TextTaxablePersonNameAra: Label 'Taxable Person Name (Arabic)';
        TextTaxAgencyName: Label 'Tax Agency Name';
        TextTAN: Label 'TAN';
        TextAgentName: Label 'Tax Agent Name';
        TextTAAN: Label 'TAAN';
        TextVATReturnPeriod: Label 'VAT Return Period';
        TextTaxYear: Label 'Tax Year';
        TextVATReturnRefNo: Label 'VAT Return Period Reference Number';
        TextVATonSales: Label 'VAT on Sales and all other Outputs';
        TextVATonExpenses: Label 'VAT on Expenses and all other Inputs';

    local procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[250]; Bold: Boolean; Italic: Boolean; UnderLine: Boolean)
    begin
        TempExcelBuffer.INIT;
        TempExcelBuffer.VALIDATE("Row No.", RowNo);
        TempExcelBuffer.VALIDATE("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.Italic := Italic;
        TempExcelBuffer.Underline := UnderLine;
        TempExcelBuffer.INSERT;
    end;

    [Scope('Internal')]
    procedure EnterData(SerialNo: Text[10]; SubSerialNo: Text[10]; Description: Text[100]; Value1: Decimal; Value2: Decimal; Value3: Decimal)
    begin
        Row += 1;
        IF SerialNo <> '' THEN
            EnterCell(Row, 1, SerialNo, FALSE, FALSE, FALSE);
        IF SubSerialNo <> '' THEN
            EnterCell(Row, 2, SubSerialNo, FALSE, FALSE, FALSE);
        EnterCell(Row, 3, Description, FALSE, FALSE, FALSE);
        EnterCell(Row, 4, FORMAT(ABS(Value1)), FALSE, FALSE, FALSE);
        EnterCell(Row, 5, FORMAT(ABS(Value2)), FALSE, FALSE, FALSE);
        EnterCell(Row, 6, FORMAT(-ABS(Value3)), FALSE, FALSE, FALSE);
    end;

    [Scope('Internal')]
    procedure CalcBox1(var Value1: Decimal; Emirate: Integer; var Desc: Text[50]; var Value2: Decimal; var Value3: Decimal)
    var
        VATEntry: Record "VAT Entry";
        VATPostingSetup: Record "VAT Posting Setup";
        VATBusinessPostingGroup: Record "VAT Business Posting Group";
        GLEntryNo: Integer;
        LedgerEntryDimension: Record "Dimension Set ID Filter Line";
        GLEntryVATEntryLink: Record "G/L Entry - VAT Entry Link";
        GLEntry: Record "G/L Entry";
    begin
        VATPostingSetup.RESET;

        IF Emirate = 1 THEN VATPostingSetup.SETRANGE("VAT Emirate", VATPostingSetup."VAT Emirate"::AUH);
        IF Emirate = 2 THEN VATPostingSetup.SETRANGE("VAT Emirate", VATPostingSetup."VAT Emirate"::DXB);
        IF Emirate = 3 THEN VATPostingSetup.SETRANGE("VAT Emirate", VATPostingSetup."VAT Emirate"::SHJ);
        IF Emirate = 4 THEN VATPostingSetup.SETRANGE("VAT Emirate", VATPostingSetup."VAT Emirate"::AJM);
        IF Emirate = 5 THEN VATPostingSetup.SETRANGE("VAT Emirate", VATPostingSetup."VAT Emirate"::UAQ);
        IF Emirate = 6 THEN VATPostingSetup.SETRANGE("VAT Emirate", VATPostingSetup."VAT Emirate"::RAK);
        IF Emirate = 7 THEN VATPostingSetup.SETRANGE("VAT Emirate", VATPostingSetup."VAT Emirate"::FUJ);

        IF VATPostingSetup.FINDFIRST THEN
            REPEAT
                VATEntry.RESET;
                VATEntry.SETRANGE(VATEntry.Type, VATEntry.Type::Sale);
                VATEntry.SETRANGE(VATEntry."VAT Bus. Posting Group", VATPostingSetup."VAT Bus. Posting Group");
                VATEntry.SETRANGE(VATEntry."VAT Prod. Posting Group", VATPostingSetup."VAT Prod. Posting Group");
                VATEntry.SETRANGE("Posting Date", StartDate, EndDate);
                VATEntry.SETRANGE(VATEntry.Closed, FALSE);
                IF VATEntry.FINDFIRST THEN
                    REPEAT
                        Value1 += VATEntry.Base;
                        Value2 += VATEntry.Amount;
                        GLEntryNo := 0;
                        GLEntryVATEntryLink.RESET;
                        GLEntryVATEntryLink.SETRANGE(GLEntryVATEntryLink."VAT Entry No.", VATEntry."Entry No.");
                        IF GLEntryVATEntryLink.FINDFIRST THEN
                            GLEntryNo := GLEntryVATEntryLink."G/L Entry No.";
                        // APNT
                        GLEntry.RESET;
                        GLEntry.SETRANGE(GLEntry."Entry No.", GLEntryNo);
                        GLEntry.SETRANGE(GLEntry."Global Dimension 1 Code", BOX1DimFilter);
                        IF GLEntry.FINDFIRST THEN BEGIN
                            Value1 -= VATEntry.Base;
                            Value2 -= VATEntry.Amount;
                            Value3 += VATEntry.Amount;
                        END;
                    // APNT
                    UNTIL VATEntry.NEXT = 0;
            UNTIL VATPostingSetup.NEXT = 0;

        IF VATBusinessPostingGroup.GET(VATPostingSetup."VAT Bus. Posting Group") THEN;
        Desc := VATBusinessPostingGroup.Description;
    end;

    [Scope('Internal')]
    procedure CalcBox3(var Value1: Decimal; var Value2: Decimal; var Value3: Decimal)
    var
        VATEntry: Record "VAT Entry";
        VATPostingSetup: Record "VAT Posting Setup";
        GLEntryNo: Integer;
        LedgerEntryDimension: Record "Dimension Set ID Filter Line";
        GLEntryVATEntryLink: Record "G/L Entry - VAT Entry Link";
        GLEntry: Record "G/L Entry";
    begin
        VATPostingSetup.RESET;
        VATPostingSetup.SETRANGE("VAT Calculation Type", VATPostingSetup."VAT Calculation Type"::"Reverse Charge VAT");
        IF VATPostingSetup.FINDFIRST THEN
            REPEAT
                VATEntry.RESET;
                VATEntry.SETRANGE(VATEntry.Type, VATEntry.Type::Purchase);
                VATEntry.SETRANGE(VATEntry."VAT Bus. Posting Group", VATPostingSetup."VAT Bus. Posting Group");
                VATEntry.SETRANGE(VATEntry."VAT Prod. Posting Group", VATPostingSetup."VAT Prod. Posting Group");
                VATEntry.SETRANGE("Posting Date", StartDate, EndDate);
                VATEntry.SETRANGE(VATEntry.Closed, FALSE);
                IF VATEntry.FINDFIRST THEN BEGIN
                    REPEAT
                        GLEntryNo := 0;
                        GLEntryVATEntryLink.RESET;
                        GLEntryVATEntryLink.SETRANGE(GLEntryVATEntryLink."VAT Entry No.", VATEntry."Entry No.");
                        IF GLEntryVATEntryLink.FINDFIRST THEN
                            GLEntryNo := GLEntryVATEntryLink."G/L Entry No.";

                        GLEntry.RESET;
                        GLEntry.SETRANGE(GLEntry."Entry No.", GLEntryNo);
                        GLEntry.SETRANGE(GLEntry."Global Dimension 1 Code", BOX3DimFilter);
                        IF GLEntry.FINDFIRST THEN BEGIN
                            Value1 += VATEntry.Base;
                            Value2 += VATEntry.Amount;
                            Value3 += VATEntry."VAT Difference";
                        END;

                    UNTIL VATEntry.NEXT = 0;
                END;
            UNTIL VATPostingSetup.NEXT = 0;
    end;

    [Scope('Internal')]
    procedure CalcBox4(var Value1: Decimal; var Value2: Decimal; var Value3: Decimal)
    var
        VATEntry: Record "VAT Entry";
        VATPostingSetup: Record "VAT Posting Setup";
    begin
        VATPostingSetup.RESET;
        VATPostingSetup.SETRANGE("Zero rated (BOX 4)", TRUE);
        IF VATPostingSetup.FINDFIRST THEN
            REPEAT
                VATEntry.RESET;
                VATEntry.SETRANGE(VATEntry.Type, VATEntry.Type::Sale);
                VATEntry.SETRANGE(VATEntry."VAT Bus. Posting Group", VATPostingSetup."VAT Bus. Posting Group");
                VATEntry.SETRANGE(VATEntry."VAT Prod. Posting Group", VATPostingSetup."VAT Prod. Posting Group");
                VATEntry.SETRANGE("Posting Date", StartDate, EndDate);
                VATEntry.SETRANGE(VATEntry.Closed, FALSE);
                IF VATEntry.FINDFIRST THEN
                    REPEAT
                        Value1 += VATEntry.Base;
                        Value2 += VATEntry.Amount;
                        Value3 += VATEntry."VAT Difference";
                    UNTIL VATEntry.NEXT = 0;
            UNTIL VATPostingSetup.NEXT = 0;
    end;

    [Scope('Internal')]
    procedure CalcBox5(var Value1: Decimal; var Value2: Decimal; var Value3: Decimal)
    var
        VATEntry: Record "VAT Entry";
        VATPostingSetup: Record "VAT Posting Setup";
    begin
        VATPostingSetup.RESET;
        VATPostingSetup.SETRANGE("Exempt (BOX 5) ", TRUE);
        IF VATPostingSetup.FINDFIRST THEN
            REPEAT
                VATEntry.RESET;
                VATEntry.SETRANGE(VATEntry.Type, VATEntry.Type::Sale);
                VATEntry.SETRANGE(VATEntry."VAT Bus. Posting Group", VATPostingSetup."VAT Bus. Posting Group");
                VATEntry.SETRANGE(VATEntry."VAT Prod. Posting Group", VATPostingSetup."VAT Prod. Posting Group");
                VATEntry.SETRANGE("Posting Date", StartDate, EndDate);
                VATEntry.SETRANGE(VATEntry.Closed, FALSE);
                IF VATEntry.FINDFIRST THEN
                    REPEAT
                        Value1 += VATEntry.Base;
                        Value2 += VATEntry.Amount;
                        Value3 += VATEntry."VAT Difference";
                    UNTIL VATEntry.NEXT = 0;
            UNTIL VATPostingSetup.NEXT = 0;
    end;

    [Scope('Internal')]
    procedure CalcBox9(var Value1: Decimal; var Value2: Decimal; var Value3: Decimal)
    var
        VATEntry: Record "VAT Entry";
        VATPostingSetup: Record "VAT Posting Setup";
        VATBusinessPostingGroup: Record "VAT Business Posting Group";
        GLEntryNo: Integer;
        LedgerEntryDimension: Record "Dimension Set ID Filter Line";
        GLEntryVATEntryLink: Record "G/L Entry - VAT Entry Link";
        GLEntry: Record "G/L Entry";
    begin
        VATPostingSetup.RESET;
        VATPostingSetup.SETRANGE("SR Expenses (BOX 9)", TRUE);
        IF VATPostingSetup.FINDFIRST THEN
            REPEAT
                VATEntry.RESET;
                VATEntry.SETRANGE(VATEntry.Type, VATEntry.Type::Purchase);
                VATEntry.SETRANGE(VATEntry."VAT Bus. Posting Group", VATPostingSetup."VAT Bus. Posting Group");
                VATEntry.SETRANGE(VATEntry."VAT Prod. Posting Group", VATPostingSetup."VAT Prod. Posting Group");
                VATEntry.SETRANGE("Posting Date", StartDate, EndDate);
                VATEntry.SETRANGE(VATEntry.Closed, FALSE);
                IF VATEntry.FINDFIRST THEN
                    REPEAT
                        Value1 += VATEntry.Base;
                        Value2 += VATEntry.Amount;
                        GLEntryNo := 0;
                        GLEntryVATEntryLink.RESET;
                        GLEntryVATEntryLink.SETRANGE(GLEntryVATEntryLink."VAT Entry No.", VATEntry."Entry No.");
                        IF GLEntryVATEntryLink.FINDFIRST THEN
                            GLEntryNo := GLEntryVATEntryLink."G/L Entry No.";
                        GLEntry.RESET;
                        GLEntry.SETRANGE(GLEntry."Entry No.", GLEntryNo);
                        GLEntry.SETRANGE(GLEntry."Global Dimension 1 Code", BOX9DimFilter);
                        IF GLEntry.FINDFIRST THEN BEGIN
                            Value1 -= VATEntry.Base;
                            Value2 -= VATEntry.Amount;
                            Value3 += VATEntry.Amount;
                        END;

                    UNTIL VATEntry.NEXT = 0;
            UNTIL VATPostingSetup.NEXT = 0;
    end;

    [Scope('Internal')]
    procedure CalcBox10(var Value1: Decimal; var Value2: Decimal; var Value3: Decimal)
    var
        VATEntry: Record "VAT Entry";
        VATPostingSetup: Record "VAT Posting Setup";
    begin
        VATPostingSetup.RESET;
        VATPostingSetup.SETRANGE("VAT Calculation Type", VATPostingSetup."VAT Calculation Type"::"Reverse Charge VAT");

        IF VATPostingSetup.FINDFIRST THEN
            REPEAT
                VATEntry.RESET;
                VATEntry.SETRANGE(VATEntry.Type, VATEntry.Type::Purchase);
                VATEntry.SETRANGE(VATEntry."VAT Bus. Posting Group", VATPostingSetup."VAT Bus. Posting Group");
                VATEntry.SETRANGE(VATEntry."VAT Prod. Posting Group", VATPostingSetup."VAT Prod. Posting Group");
                VATEntry.SETRANGE("Posting Date", StartDate, EndDate);
                VATEntry.SETRANGE(VATEntry.Closed, FALSE);
                IF VATEntry.FINDFIRST THEN
                    REPEAT
                        Value1 += VATEntry.Base;
                        Value2 += VATEntry.Amount;
                        Value3 += VATEntry."VAT Difference";
                    UNTIL VATEntry.NEXT = 0;
            UNTIL VATPostingSetup.NEXT = 0;
    end;
}

