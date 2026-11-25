//%attributes = {"shared":true}
  // saveInvoice ()
  // Callback: save the current invoice.

#DECLARE()

var $status : Object
var $invoiceNew : 4D.Entity
var $pos : Integer
var $invoices : Collection

If (Not(Macintosh option down))
	CONFIRM("Do you want to Save the invoice : "+Form.currentInvoice.invoice_ref; "YES"; "NO")
End if 

If (OK=1)
	If (Form.currentInvoice.UUID#"")
		If (Form.currentInvoice.UUID=Form.invoice_item.UUID)
			Form.invoice_item.invoice_ref:=Form.currentInvoice.invoice_ref
			Form.invoice_item.start:=Form.currentInvoice.start
			Form.invoice_item.end:=Form.currentInvoice.end
			Form.invoice_item.invoice_date:=Form.currentInvoice.invoice_date
			Form.invoice_item.amount_invoiced:=Form.currentInvoice.amount_invoiced
			Form.invoice_item.amount_payed:=Form.currentInvoice.amount_payed
			Form.invoice_item.type:=Form.currentInvoice.type
			Form.invoice_item.rate:=Form.currentInvoice.rate
			Form.invoice_item.currency:=Form.currentInvoice.currency
			Form.invoice_item.locked:=Form.btnProtect.protect
			$status:=Form.invoice_item.save()
			
			If ($status.success)
				checkYear(Year of(Form.invoice_item.invoice_date); True)
				Form.btnSave.Enable(False)
			Else 
				ALERT("Error, Invoice can't be edited")
			End if 
		Else 
			ALERT("Unknow UUID")
		End if 
	Else 
		$invoiceNew:=ds.invoice.new()
		$invoiceNew.invoice_ref:=Form.currentInvoice.invoice_ref
		$invoiceNew.start:=Form.currentInvoice.start
		$invoiceNew.end:=Form.currentInvoice.end
		$invoiceNew.invoice_date:=Form.currentInvoice.invoice_date
		$invoiceNew.amount_invoiced:=Form.currentInvoice.amount_invoiced
		$invoiceNew.amount_payed:=Form.currentInvoice.amount_payed
		$invoiceNew.type:=Form.currentInvoice.type
		$invoiceNew.rate:=Form.currentInvoice.rate
		$invoiceNew.currency:=Form.currentInvoice.currency
		$invoiceNew.locked:=Form.btnProtect.protect
		$invoiceNew.save()
		
		checkYear(Year of(Form.currentInvoice.invoice_date); True)
		
		$invoices:=Form.allInvoices.toCollection()
		$pos:=$invoices.extract("UUID").indexOf($invoiceNew.UUID)
		If ($pos<0)
			$pos:=0
		End if 
		Form.currentInvoice.UUID:=$invoiceNew.UUID
		LISTBOX SELECT ROW(*; "Invoice_lb"; $pos+1)
		OBJECT SET SCROLL POSITION(*; "Invoice_lb")
		Form.invoice_item:=Form.allInvoices[$pos]
		Form.btnSave.Enable(False)
	End if 
End if 
