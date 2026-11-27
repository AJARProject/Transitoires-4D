#DECLARE()

var $btn : Object

Case of 
	: (Form event code=On Load)
		$btn:={}
		$btn.templateName:="invoice_refresh"
		$btn.templatePath:=Get 4D folder(Current resources folder)+"invoice_refresh"+Folder separator
		Form.btnNoFilterAccount:=New AJUI_Button($btn)
		Form.btnNoFilterAccount.Name("btnNoFilterAccount")
		Form.btnNoFilterAccount.OnClick("typeFilter_cb"; {type: ""})
		Form.tipNoFilterAccount:=tip_templatesButtons("btnNoFilterAccount"; "")
		
	: (Form event code=On Mouse Enter)
		If (OBJECT Get enabled(*; "btnNoFilterAccount"))
			Form.tipNoFilterAccount.TextLabel(L10n("trTipNoTypeFilter"))
			Form.tipNoFilterAccount.Show()
		End if 
		
	: (Form event code=On Mouse Leave)
		Form.tipNoFilterAccount.Hide()
		
	: (Form event code=On Clicked)
		Form.bc2.RemoveCurrent()
		Form.bc2.Draw()
End case 

Form.btnNoFilterAccount.Draw()
