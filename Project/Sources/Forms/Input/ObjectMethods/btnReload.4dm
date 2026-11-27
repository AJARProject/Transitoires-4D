#DECLARE()

var $btn : Object

Case of 
	: (Form event code=On Load)
		$btn:={}
		$btn.templateName:="invoice_refresh"
		$btn.templatePath:=Get 4D folder(Current resources folder)+"invoice_refresh"+Folder separator
		Form.btnReload:=New AJUI_Button($btn)
		Form.btnReload.Name("btnReload")
		Form.btnReload.OnClick("refreshInvoice")
		Form.tipReload:=tip_templatesButtons("btnReload"; "")
		
	: (Form event code=On Mouse Enter)
		If (OBJECT Get enabled(*; "btnReload"))
			Form.tipReload.TextLabel(L10n("trTipReloadLine"))
			Form.tipReload.Show()
		End if 
		
	: (Form event code=On Mouse Leave)
		Form.tipReload.Hide()
End case 

Form.btnReload.Draw()
