//%attributes = {}
  // deleteSelection ( {optionShortcut} )
  // Drop every unlocked invoice in the highlighted selection.
  // Protected invoices (locked = True) are never dropped.
  // No parameter (list-box menu): the confirm is always shown.
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
		ALERT(L10n("trMsgSelectInvoice"))
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
		ALERT(L10n("trMsgProtectedOne"))
	Else 
		ALERT(L10n("trMsgProtectedOther"))
	End if 
Else 
	If ($optionShortcut) && (Macintosh option down)
		OK:=1
	Else 
		If ($toDrop.length=1)
			$invoiceRef:=$toDrop.first().invoice_ref
			CONFIRM(L10n("trConfirmDeleteInvoice"; $invoiceRef); L10n("trBtnYes"); L10n("trBtnNo"))
		Else 
			CONFIRM(L10n("trConfirmDeleteSelection"); L10n("trBtnYes"); L10n("trBtnNo"))
		End if 
	End if 
	If (OK=1)
		$count:=$toDrop.length
		$notDropped:=$toDrop.drop()
		reloadInvoicesSelection
		reloadListAndInputArea
		If ($notDropped.length=0)
			If ($protected.length>0)
				ALERT(L10n_count("trMsgProtectedKept"; $protected.length))
			Else 
				ALERT(L10n_count("trMsgInvoiceDeleted"; $count))
			End if 
		Else 
			ALERT(L10n_count("trMsgNotDeleted"; $notDropped.length))
		End if 
	End if 
End if 
