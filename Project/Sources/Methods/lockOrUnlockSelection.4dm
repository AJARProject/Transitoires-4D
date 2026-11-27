//%attributes = {}
  // lockOrUnlockSelection ( {lock} )
  // Lock or unlock the invoice selection and save it.
  // Without a parameter, the button state is used and a confirm is shown for several rows.

#DECLARE($lock : Boolean)

var $invoice : 4D.Entity
var $status : Object
var $error : Boolean

If (Count parameters=1)
	OK:=1
Else 
	$lock:=Form.btnProtect.protect
	If (Form.invoice_items.length>1)
		If ($lock)
			CONFIRM(L10n("trConfirmLockInvoices"; String(Form.invoice_items.length)); L10n("trBtnYes"); L10n("trBtnNo"))
		Else 
			CONFIRM(L10n("trConfirmUnlockInvoices"; String(Form.invoice_items.length)); L10n("trBtnYes"); L10n("trBtnNo"))
		End if 
	Else 
		OK:=1
	End if 
End if 

If (OK=1)
	For each ($invoice; Form.invoice_items)
		$invoice.locked:=$lock
		$status:=$invoice.save()
		If (Not($status.success))
			$error:=True
		Else 
			If (Form.invoice_item#Null) && ($invoice.UUID=Form.invoice_item.UUID)
				$status:=Form.invoice_item.reload()
				If ($status.success)
					Form.btnProtect.protect:=Form.invoice_item.locked
					Lock_invoice_item
				End if 
			End if 
		End if 
	End for each 
	Form.allInvoices:=Form.allInvoices
	Form.btnSave.Enable(False)
	Form.btnSave.Draw()
End if 

If ($error)
	ALERT(L10n("trMsgLockFailed"))
End if 
