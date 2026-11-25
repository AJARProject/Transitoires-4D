#DECLARE()

var $evt : Integer

Form.target:=OBJECT Get name(Object current)
Form.placeholder:=OBJECT Get placeholder(*; Form.target)
Form.formPath:="currentInvoice.amount_invoiced"

$evt:=Form event code

Case of 
	: ($evt=On Load)
		
	: ($evt=On Data Change)
		Form.btnSave.Enable(True)
		Case of 
			: (Form.currentInvoice.currency#"Frs") && (Form.currentInvoice.type="debit")
				If (Form.currentInvoice.amount_invoiced=0)
					Form.currentInvoice.rate:=0
				Else 
					Form.currentInvoice.rate:=Form.currentInvoice.amount_payed/Form.currentInvoice.amount_invoiced
				End if 
			: (Form.currentInvoice.currency#"Frs") && (Form.currentInvoice.type="credit")
				Form.currentInvoice.amount_payed:=Form.currentInvoice.rate*Form.currentInvoice.amount_invoiced
			: (Form.currentInvoice.currency="Frs") && (Form.currentInvoice.type="debit")
			: (Form.currentInvoice.currency="Frs") && (Form.currentInvoice.type="credit")
		End case 
End case 

AJUI_FloatingLabel_main(Form)
