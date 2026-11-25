#DECLARE()

var $evt : Integer

$evt:=Form event code

Case of 
	: ($evt=On Load)
		OBJECT SET VISIBLE(*; "rate"; Not(<>isFrs))
		OBJECT SET VISIBLE(*; "amount_invoiced_eur"; Not(<>isFrs))
		OBJECT SET TITLE(*; "days_current_year_head"; <>days_currentYear_title)
		OBJECT SET TITLE(*; "days_next_year_head"; <>days_nextYear_title)
		OBJECT SET TITLE(*; "amount_this_year_head"; <>amount_currentYear_title)
		OBJECT SET TITLE(*; "amount_next_year_head"; <>amount_nextYear_title)
End case 
