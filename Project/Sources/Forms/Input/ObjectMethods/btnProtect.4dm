#DECLARE()

var $btn : Object

Case of 
	: (Form event code=On Load)
		$btn:={}
		$btn.templateName:="invoice_lock"
		$btn.templatePath:=Get 4D folder(Current resources folder)+"invoice_lock"+Folder separator
		Form.btnProtect:=New AJUI_Button($btn)
		Form.btnProtect.Name("btnProtect")
		Form.btnProtect.protect:=False
		bannerProtectRibbon
		Lock_invoice_item
		Form.tipProtect:=tip_templatesButtons("btnProtect"; "")
		
	: (Form event code=On Mouse Enter)
		If (OBJECT Get enabled(*; "btnProtect"))
			Form.tipProtect.TextLabel(Form.btnProtect.Label(AJUI_btn_default))
			Form.tipProtect.Show()
		End if 
		
	: (Form event code=On Mouse Leave)
		Form.tipProtect.Hide()
		
	: (Form event code=On Clicked)
		Form.tipProtect.Hide()
		Form.btnProtect.protect:=Not(Form.btnProtect.protect)
		Lock_invoice_item
		If (Macintosh option down) && (Form.invoice_items.length>=1)
			lockOrUnlockSelection
		Else 
			Form.btnSave.Enable(True)
			Form.btnSave.Draw()
		End if 
End case 

Form.btnProtect.Draw()
