#DECLARE()

var $evt : Integer

Form.target:=OBJECT Get name(Object current)
Form.placeholder:=OBJECT Get placeholder(*; Form.target)
Form.formPath:="currentInvoice.rate"

$evt:=Form event code

Case of 
	: ($evt=On Load)
		
	: ($evt=On Data Change)
		Form.btnSave.Enable(True)
		Form.currentInvoice.amount_payed:=Form.currentInvoice.rate*Form.currentInvoice.amount_invoiced
End case 

AJUI_FloatingLabel_main(Form)
