#DECLARE()

var $btn : Object

Case of 
	: (Form event code=On Load)
		$btn:={}
		$btn.templateName:="invoice_edit"
		$btn.templatePath:=Get 4D folder(Current resources folder)+"invoice_edit"+Folder separator
		Form.btnSave:=New AJUI_Button($btn)
		Form.btnSave.Name("btnSave")
		Form.btnSave.OnClick("saveInvoice")
		Form.tipSave:=tip_templatesButtons("btnSave"; "")
		
	: (Form event code=On Mouse Enter)
		If (OBJECT Get enabled(*; "btnSave"))
			Form.tipSave.TextLabel("Save")
			Form.tipSave.Show()
		End if 
		
	: (Form event code=On Mouse Leave)
		Form.tipSave.Hide()
End case 

Form.btnSave.Draw()
