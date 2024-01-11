Class FMS.Document Extends %Persistent
{

Property BatchNumber As %String;

/// MOA
Property BudgetBeginningFiscalYear As %String;

/// MOA
Property BudgetEndingFiscalYear As %String;

/// MOA
Property BudgetObjectCode As %String;

/// MOA
Property CostOrganization As %String;

/// MOA
Property CostSubOrg As %String;

Property DestinationSystem As %String [ Required ];

/// MO2
Property DocumentAction As %String;

/// MO3
Property DocumentId As %String;

/// MO2
Property FiscalMonth As %String;

/// MO2
Property FiscalYear As %String;

/// MOA
Property FundCode As %String;

/// MO2
Property HDRBudgetFY As %String;

/// MO2
Property HDREndBudgetFY As %String;

/// MO2
Property HDRTransType As %String;

/// MOA
Property LineAction As %String;

/// MOA
Property LineAmount As %String;

/// MO2
Property RecordDate As %Date;

/// MOA
Property ReferenceDocumentNumber As %String;

/// MOA
Property ReferenceTransactionCode As %String;

/// MOA
Property ReferenceTransactionLineItemNumber As %Integer;

/// MOA
Property ReferenceTransactionNumber As %String;

Property Sec1Code As %String [ Required ];

Property SourceSystem As %String [ Required ];

Property SubmittingStation As %String [ Required ];

Property TransactionClass As %String [ Required ];

Property TransactionCode As %String [ Required ];

Property TransactionDate As %Date;

/// MOA
Property TransactionLineNumber As %Integer;

Property TransactionNumber As %String [ Required ];

Property TransactionTime As %Time;

/// MOA
Property XProgram As %String;

Trigger LogEvent [ Event = INSERT, Time = AFTER ]
{
	// get row id of inserted row
	NEW id,SQLCODE
	SET id = {ID}
	// INSERT value into Log table
	&sql(INSERT INTO LogTable (TableName, IDValue) VALUES ('FMS.Document', :id))
	IF SQLCODE<0 {
		SET baderr="SQLCODE ERROR:"_SQLCODE_" "_%msg
		SET %ok=0
		RETURN baderr
	}
}

}
