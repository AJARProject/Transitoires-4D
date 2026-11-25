//%attributes = {"shared":true}
  // refreshInvoice ()
  // Callback: reload the selected invoice into the input area.

#DECLARE()

var $row; $column : Integer

If (Form.currentInvoice.UUID="")
	newInvoice
Else 
	LISTBOX GET CELL POSITION(*; "Invoice_lb"; $column; $row)
	If ($row>0)
		Form.currentInvoice.UUID:=Form.invoice_item.UUID
		Form.currentInvoice.invoice_ref:=Form.invoice_item.invoice_ref
		Form.currentInvoice.start:=Form.invoice_item.start
		Form.currentInvoice.oldStart:=Form.invoice_item.start
		Form.currentInvoice.end:=Form.invoice_item.end
		Form.currentInvoice.oldEnd:=Form.invoice_item.end
		Form.currentInvoice.invoice_date:=Form.invoice_item.invoice_date
		Form.currentInvoice.amount_invoiced:=Form.invoice_item.amount_invoiced
		Form.currentInvoice.amount_payed:=Form.invoice_item.amount_payed
		Form.currentInvoice.rate:=Form.invoice_item.rate
		
		Form.currentInvoice.type:=Form.invoice_item.type
		Form.bc1.SetCurrentSection(Form.invoice_item.type)
		Form.bc1.Draw()
		
		Form.currentInvoice.currency:=Form.invoice_item.currency
		Form.bc4.SetCurrentSection(Form.invoice_item.currency)
		Form.bc4.Draw()
		
		Form.btnSave.Enable(False)
	End if 
End if 
