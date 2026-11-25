#DECLARE()

var $evt : Integer

Form.target:=OBJECT Get name(Object current)
Form.placeholder:=OBJECT Get placeholder(*; Form.target)
Form.formPath:="currentInvoice.invoice_ref"

$evt:=Form event code

Case of 
	: ($evt=On Load)
		
	: ($evt=On Data Change)
		If (Form.currentInvoice.invoice_ref=" @")
			Form.currentInvoice.invoice_ref:=Substring(Form.currentInvoice.invoice_ref; 2)
		End if 
		Form.btnSave.Enable(True)
End case 

AJUI_FloatingLabel_main(Form)
