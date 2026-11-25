#DECLARE()

var $btn : Object

Case of 
	: (Form event code=On Load)
		$btn:={}
		$btn.templateName:="invoice_refresh"
		$btn.templatePath:=Get 4D folder(Current resources folder)+"invoice_refresh"+Folder separator
		Form.btnCalcDiscount:=New AJUI_Button($btn)
		Form.btnCalcDiscount.Name("btnCalcDiscount")
		Form.btnCalcDiscount.OnClick("calcDiscount")
		Form.tipCalcDiscount:=tip_templatesButtons("btnCalcDiscount"; "")
		
	: (Form event code=On Mouse Enter)
		If (OBJECT Get enabled(*; "btnCalcDiscount"))
			Form.tipCalcDiscount.TextLabel("Calc Discount")
			Form.tipCalcDiscount.Show()
		End if 
		
	: (Form event code=On Mouse Leave)
		Form.tipCalcDiscount.Hide()
End case 

Form.btnCalcDiscount.Draw()
