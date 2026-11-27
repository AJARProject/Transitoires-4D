//%attributes = {}
  // reloadInvoicesSelection ()
  // Reload the invoice selection for the year, the filters and the search box.
  // Search patterns, unchanged:
  //   "01.01.20...05.05.20"  period inside the year
  //   "01.01&05.05"          invoice dates inside the year

#DECLARE()

var $startInvoiceYear; $endInvoiceYear; $searchDate; $dateStart; $dateEnd : Date
var $invoices : 4D.EntitySelection
var $searchInvoice : Text
var $date : Collection

$invoices:=ds.invoice.all()

Case of 
	: (vSearch="@...@")
		$date:=Split string(vSearch; "...")
		$startInvoiceYear:=Add to date(!00-00-00!; Form.year; 1; 1)
		$endInvoiceYear:=Add to date(!00-00-00!; Form.year; 12; 31)
		$dateStart:=dateFromText($date[0])
		$dateEnd:=dateFromText($date[1])
		
		If ($dateStart=!00-00-00!)
			$dateStart:=Add to date(!00-00-00!; 1960; 1; 1)
		End if 
		If ($dateEnd=!00-00-00!)
			$dateEnd:=Current date
		End if 
		
		Case of 
			: (Form.currencyFilter#"") && (Form.typeFilter#"")
				Form.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND currency= :3 AND type= :4 AND start >= :5 AND end <= :6"; $startInvoiceYear; $endInvoiceYear; Form.currencyFilter; Form.typeFilter; $dateStart; $dateEnd)
				Form.ribbon.Message(filterSummary)
			: (Form.currencyFilter="") && (Form.typeFilter#"")
				Form.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND type= :3 AND start >= :4 AND end <= :5"; $startInvoiceYear; $endInvoiceYear; Form.typeFilter; $dateStart; $dateEnd)
				Form.ribbon.Message(filterSummary)
			: (Form.currencyFilter#"") && (Form.typeFilter="")
				Form.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND currency= :3 AND start >= :4 AND end <= :5"; $startInvoiceYear; $endInvoiceYear; Form.currencyFilter; $dateStart; $dateEnd)
				Form.ribbon.Message(filterSummary)
			Else 
				Form.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND start >= :3 AND end <= :4"; $startInvoiceYear; $endInvoiceYear; $dateStart; $dateEnd)
				Form.ribbon.Message(filterSummary)
		End case 
		
	: (vSearch="@&@")
		$date:=Split string(vSearch; "&")
		$startInvoiceYear:=dateFromText($date[0]+"/"+String(Form.year))
		$endInvoiceYear:=dateFromText($date[1]+"/"+String(Form.year))
		
		If ($startInvoiceYear=!00-00-00!)
			$startInvoiceYear:=Add to date(!00-00-00!; Form.year; 1; 1)
		End if 
		If ($endInvoiceYear=!00-00-00!)
			$endInvoiceYear:=Add to date(!00-00-00!; Form.year; 12; 31)
		End if 
		
		Case of 
			: (Form.currencyFilter#"") && (Form.typeFilter#"")
				Form.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND currency= :3 AND type= :4 "; $startInvoiceYear; $endInvoiceYear; Form.currencyFilter; Form.typeFilter)
				Form.ribbon.Message(filterSummary)
			: (Form.currencyFilter="") && (Form.typeFilter#"")
				Form.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND type= :3 "; $startInvoiceYear; $endInvoiceYear; Form.typeFilter)
				Form.ribbon.Message(filterSummary)
			: (Form.currencyFilter#"") && (Form.typeFilter="")
				Form.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND currency= :3 "; $startInvoiceYear; $endInvoiceYear; Form.currencyFilter)
				Form.ribbon.Message(filterSummary)
			Else 
				Form.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 "; $startInvoiceYear; $endInvoiceYear)
				Form.ribbon.Message(filterSummary)
		End case 
		
	Else 
		$startInvoiceYear:=Add to date(!00-00-00!; Form.year; 1; 1)
		$endInvoiceYear:=Add to date(!00-00-00!; Form.year; 12; 31)
		$searchInvoice:="@"+vSearch+"@"
		$searchDate:=dateFromText(vSearch)
		
		Case of 
			: (Form.currencyFilter#"") && (Form.typeFilter#"")
				Form.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND currency= :3 AND type= :4 AND (invoice_ref = :5 OR start = :6 OR end = :6)"; $startInvoiceYear; $endInvoiceYear; Form.currencyFilter; Form.typeFilter; $searchInvoice; $searchDate)
				Form.ribbon.Message(filterSummary)
			: (Form.currencyFilter="") && (Form.typeFilter#"")
				Form.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND type= :3 AND (invoice_ref = :4 OR start = :5 OR end = :5)"; $startInvoiceYear; $endInvoiceYear; Form.typeFilter; $searchInvoice; $searchDate)
				Form.ribbon.Message(filterSummary)
			: (Form.currencyFilter#"") && (Form.typeFilter="")
				Form.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND currency= :3 AND (invoice_ref = :4 OR start = :5 OR end = :5)"; $startInvoiceYear; $endInvoiceYear; Form.currencyFilter; $searchInvoice; $searchDate)
				Form.ribbon.Message(filterSummary)
			Else 
				Form.allInvoices:=$invoices.query("invoice_date >= :1 AND invoice_date<= :2 AND (invoice_ref = :3 OR start = :4 OR end = :4 )"; $startInvoiceYear; $endInvoiceYear; $searchInvoice; $searchDate)
				Form.ribbon.Message(filterSummary)
		End case 
End case 

Form.tot_nextYear:=tot_amount_nextYear
Form.tot_currentYear:=tot_amount_currentYear
Form.ribbon.DrawBanner()
