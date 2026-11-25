#DECLARE()

var $objectName : Text

Case of 
	: (Form event code=On Load)
		$objectName:=OBJECT Get name(Object current)
		SearchPicker SET HELP TEXT($objectName; "Invoice ref or date")
		
	: (Form event code=On Data Change)
		// 4D Widgets (GitHub) re-pushes vSearch on window (re)activation, e.g. after CONFIRM.
		// Reload only when the search text really changed.
		If (vSearch#String(Form.lastSearch))
			Form.lastSearch:=vSearch
			reloadInvoicesSelection
			reloadListAndInputArea
		End if
End case 
