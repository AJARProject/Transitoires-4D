//%attributes = {}
  // deleteSelection ( {optionShortcut} )
  // Drop every unlocked invoice in the highlighted selection.
  // Protected invoices (locked = True) are never dropped.
  // No parameter (list-box menu): the English confirm is always shown.
  // optionShortcut True (trash): Option skips only that confirm and sets OK to 1.
  // Trash with an empty selection falls back to Form.invoice_item.

#DECLARE($optionShortcut : Boolean)

var $selection; $toDrop; $protected; $notDropped : 4D.EntitySelection
var $selectedCount; $count : Integer
var $invoiceRef : Text

If (Form.invoice_items#Null) && (Form.invoice_items.length>=1)
	$selectedCount:=Form.invoice_items.length
	$toDrop:=Form.invoice_items.query("locked = :1"; False)
	$protected:=Form.invoice_items.query("locked = :1"; True)
Else 
	If (Not($optionShortcut))
		return 
	End if 
	If (Form.invoice_item=Null) || (Form.currentInvoice.UUID="")
		ALERT("Select an invoice")
		return 
	End if 
	If (Form.currentInvoice.UUID#Form.invoice_item.UUID)
		return 
	End if 
	$selection:=ds.invoice.newSelection()
	$selection.add(Form.invoice_item)
	$selectedCount:=$selection.length
	$toDrop:=$selection.query("locked = :1"; False)
	$protected:=$selection.query("locked = :1"; True)
End if 

If ($toDrop.length=0)
	If ($selectedCount<=1)
		ALERT("Cette facture est \"protect\", elle ne peut pas être supprimée.")
	Else 
		ALERT("Ces factures sont protégées, elles ne peuvent pas être supprimées.")
	End if 
Else 
	If ($optionShortcut) && (Macintosh option down)
		OK:=1
	Else 
		If ($toDrop.length=1)
			$invoiceRef:=$toDrop.first().invoice_ref
			CONFIRM("Do you want to delete the invoice : "+$invoiceRef; "YES"; "NO")
		Else 
			CONFIRM("Do you want to delete the selection ?"; "Yes"; "No")
		End if 
	End if 
	If (OK=1)
		$count:=$toDrop.length
		$notDropped:=$toDrop.drop()
		reloadInvoicesSelection
		reloadListAndInputArea
		If ($notDropped.length=0)
			If ($protected.length>0)
				ALERT(String($protected.length)+" facture(s) protégée(s) conservée(s).")
			Else 
				If ($count=1)
					ALERT("Invoice deleted")
				Else 
					ALERT("Invoices deleted")
				End if 
			End if 
		Else 
			ALERT(String($notDropped.length)+" invoice(s) not deleted")
		End if 
	End if 
End if 
