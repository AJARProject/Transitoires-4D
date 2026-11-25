#DECLARE()

var $evt : Integer
var $refMenu; $choix : Text
var $row; $column : Integer

$evt:=Form event code

Case of 
	: ($evt=On Clicked) && (Contextual click)
		If (Form.invoice_items.length>=1)
			$refMenu:=Create menu
			APPEND MENU ITEM($refMenu; "Lock selection")
			SET MENU ITEM PARAMETER($refMenu; -1; "lock")
			APPEND MENU ITEM($refMenu; "Unlock selection")
			SET MENU ITEM PARAMETER($refMenu; -1; "unlock")
			APPEND MENU ITEM($refMenu; "Delete selection")
			SET MENU ITEM PARAMETER($refMenu; -1; "delete")
			
			$choix:=Dynamic pop up menu($refMenu)
			RELEASE MENU($refMenu)
			
			If ($choix#"")
				Case of 
					: ($choix="lock")
						lockOrUnlockSelection(True)
					: ($choix="unlock")
						lockOrUnlockSelection(False)
					: ($choix="delete")
						deleteSelection
				End case 
			End if 
		End if 
		
	: ($evt=On Clicked) || ($evt=On Selection Change)
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
			Form.btnProtect.protect:=Form.invoice_item.locked
			Lock_invoice_item
			Form.currentInvoice.type:=Form.invoice_item.type
			Form.bc1.SetCurrentSection(Form.invoice_item.type)
			Form.bc1.Draw()
			Form.currentInvoice.currency:=Form.invoice_item.currency
			Form.bc4.SetCurrentSection(Form.invoice_item.currency)
			Form.bc4.Draw()
			Form.btnSave.Enable(False)
			GOTO OBJECT(*; "invoice_ref_value")
		End if 
End case 
