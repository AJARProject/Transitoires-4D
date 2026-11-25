#DECLARE()

var $btn : Object

Case of 
	: (Form event code=On Load)
		$btn:={}
		$btn.templateName:="invoice_refresh"
		$btn.templatePath:=Get 4D folder(Current resources folder)+"invoice_refresh"+Folder separator
		Form.btnNoFilterCurrency:=New AJUI_Button($btn)
		Form.btnNoFilterCurrency.Name("btnNoFilterCurrency")
		Form.btnNoFilterCurrency.OnClick("currencyFilter_cb"; {currency: ""})
		Form.tipNoFilterCurrency:=tip_templatesButtons("btnNoFilterCurrency"; "")
		
	: (Form event code=On Mouse Enter)
		If (OBJECT Get enabled(*; "btnNoFilterCurrency"))
			Form.tipNoFilterCurrency.TextLabel("No currency filters")
			Form.tipNoFilterCurrency.Show()
		End if 
		
	: (Form event code=On Mouse Leave)
		Form.tipNoFilterCurrency.Hide()
		
	: (Form event code=On Clicked)
		Form.bc3.RemoveCurrent()
		Form.bc3.Draw()
End case 

Form.btnNoFilterCurrency.Draw()
