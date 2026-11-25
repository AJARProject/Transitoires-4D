#DECLARE()

var $btn : Object

Case of 
	: (Form event code=On Load)
		$btn:={}
		$btn.templateName:="invoice_print"
		$btn.templatePath:=Get 4D folder(Current resources folder)+"invoice_print"+Folder separator
		Form.btnPrint:=New AJUI_Button($btn)
		Form.btnPrint.Name("btnPrint")
		Form.btnPrint.OnClick("print_selection_cb")
		Form.tipPrint:=tip_templatesButtons("btnPrint"; "")
		
	: (Form event code=On Mouse Enter)
		If (OBJECT Get enabled(*; "btnPrint"))
			Form.tipPrint.TextLabel("Print Selection")
			Form.tipPrint.Show()
		End if 
		
	: (Form event code=On Mouse Leave)
		Form.tipPrint.Hide()
		
	: (Form event code=On Clicked)
End case 

Form.btnPrint.Draw()
