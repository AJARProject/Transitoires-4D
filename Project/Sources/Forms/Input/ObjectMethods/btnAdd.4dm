#DECLARE()

var $btn : Object

Case of 
	: (Form event code=On Load)
		$btn:={}
		$btn.templateName:="invoice_add"
		$btn.templatePath:=Get 4D folder(Current resources folder)+"invoice_add"+Folder separator
		Form.btnAdd:=New AJUI_Button($btn)
		Form.btnAdd.Name("btnAdd")
		Form.btnAdd.OnClick("newInvoice")
		Form.tipAdd:=tip_templatesButtons("btnAdd"; "")
		
	: (Form event code=On Mouse Enter)
		If (OBJECT Get enabled(*; "btnAdd"))
			Form.tipAdd.TextLabel(L10n("trTipAddLine"))
			Form.tipAdd.Show()
		End if 
		
	: (Form event code=On Mouse Leave)
		Form.tipAdd.Hide()
		
	: (Form event code=On Clicked) && (Macintosh option down)
		GOTO OBJECT(*; "amount_invoiced_value")
		
	: (Form event code=On Clicked)
		GOTO OBJECT(*; "invoice_ref_value")
End case 

Form.btnAdd.Draw()
