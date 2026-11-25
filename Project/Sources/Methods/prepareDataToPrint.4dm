//%attributes = {}
  // prepareDataToPrint ()
  // Fill the interprocess variables read by print_form.
  // The printing refactor (no interprocess variables) is left for the next PR.

#DECLARE()

var $invoice : Object

<>allInvoices_selection:=Form.allInvoices.toCollection()
<>allInvoices_selection:=<>allInvoices_selection.orderBy("invoice_date asc, invoice_ref asc")

For each ($invoice; <>allInvoices_selection)
	$invoice.days_currentyear:=days_currentyear(Form.year; $invoice.start; $invoice.end)
	$invoice.days_nextyear:=days_nextyear(Form.year; $invoice.start; $invoice.end)
	$invoice.amount_currentYear:=amount_currentYear($invoice)
	$invoice.amount_nextYear:=amount_nextYear($invoice)
End for each 

<>invoice_count:=<>allInvoices_selection.count("invoice_ref")
<>tot_amount_invoiced:=<>allInvoices_selection.sum("amount_invoiced")
<>tot_amount_payed:=<>allInvoices_selection.sum("amount_payed")
<>amount_this_year:=<>allInvoices_selection.sum("amount_currentYear")
<>amount_next_year:=<>allInvoices_selection.sum("amount_nextYear")

<>print_label:=" Summary - "+Form.typeFilter+" "+Form.currencyFilter+" "+String(Form.year)

<>isFrs:=(Form.currencyFilter="Frs") 

<>days_currentYear_title:="Days ("+String(Form.year)+")"
<>days_nextYear_title:="Days ("+String(Form.year+1)+")"
<>amount_currentYear_title:="Amount ("+String(Form.year)+")"
<>amount_nextYear_title:="Amount ("+String(Form.year+1)+")"
<>total:="Total"
