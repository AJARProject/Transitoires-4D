//%attributes = {"shared":true}
  // calcDiscount ()
  // Apply the discount typed on the form, and append it to the invoice reference.

#DECLARE()

var $position : Integer

Form.currentInvoice.amount_invoiced:=Form.currentInvoice.amount_invoiced*(100-Form.discount)/100
Form.currentInvoice.amount_payed:=Form.currentInvoice.amount_payed*(100-Form.discount)/100

$position:=Position("-"; Form.currentInvoice.invoice_ref)
If ($position>0)
	Form.currentInvoice.invoice_ref:=Substring(Form.currentInvoice.invoice_ref; 1; $position-2)
End if 

If (Form.discount#0)
	Form.currentInvoice.invoice_ref:=Form.currentInvoice.invoice_ref+" -"+String(Form.discount)+"%"
End if 

Form.discount:=0
