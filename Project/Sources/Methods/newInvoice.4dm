//%attributes = {"shared":true}
  // newInvoice ()
  // Create a new invoice with the default parameters.
  // Option-click keeps the current amounts and only clears the UUID.

#DECLARE()

If (Not(Macintosh option down))
	Form.currentInvoice:={}
	Form.currentInvoice.UUID:=""
	Form.currentInvoice.invoice_ref:=" "
	Form.currentInvoice.start:=Current date
	Form.currentInvoice.oldStart:=Current date
	Form.currentInvoice.end:=Current date+365
	Form.currentInvoice.oldEnd:=Current date
	Form.currentInvoice.invoice_date:=Add to date(!00-00-00!; Year of(Current date); 1; 1)
	Form.currentInvoice.rate:=0
Else 
	Form.currentInvoice.UUID:=""
End if 

Form.btnProtect.protect:=False

Lock_invoice_item

Form.currentInvoice.amount_invoiced:=0
Form.currentInvoice.amount_payed:=0

If (Not(Macintosh option down))
	Form.currentInvoice.type:="debit"
	Form.bc1.SetCurrentSection("debit")
End if 
Form.bc1.Draw()

If (Not(Macintosh option down))
	Form.currentInvoice.currency:="Frs"
	Form.bc4.SetCurrentSection("Frs")
End if 
Form.bc4.Draw()

Form.btnSave.Enable(False)
