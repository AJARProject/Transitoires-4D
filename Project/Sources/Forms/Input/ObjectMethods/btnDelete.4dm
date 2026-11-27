#DECLARE()

var $btn : Object

Case of 
	: (Form event code=On Load)
		$btn:={}
		$btn.templateName:="invoice_delete"
		$btn.templatePath:=Get 4D folder(Current resources folder)+"invoice_delete"+Folder separator
		Form.btnDelete:=New AJUI_Button($btn)
		Form.btnDelete.Name("btnDelete")
		Form.btnDelete.OnClick("deleteInvoice")
		Form.tipDelete:=tip_templatesButtons("btnDelete"; "")
		
	: (Form event code=On Mouse Enter)
		If (OBJECT Get enabled(*; "btnDelete"))
			If (Form.invoice_items#Null) && (Form.invoice_items.length>1)
				Form.tipDelete.TextLabel(L10n("trTipDeleteLineOther"))
			Else 
				Form.tipDelete.TextLabel(L10n("trTipDeleteLineOne"))
			End if 
			Form.tipDelete.Show()
		End if 
		
	: (Form event code=On Mouse Leave)
		Form.tipDelete.Hide()
End case 

Form.btnDelete.Draw()
