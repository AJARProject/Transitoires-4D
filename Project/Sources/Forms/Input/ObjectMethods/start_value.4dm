#DECLARE()

var $evt : Integer

Form.target:=OBJECT Get name(Object current)
Form.placeholder:=OBJECT Get placeholder(*; Form.target)
Form.formPath:="currentInvoice.start"

$evt:=Form event code

Case of 
	: ($evt=On Load)
		
	: ($evt=On Data Change)
		If (Form.currentInvoice.start>Form.currentInvoice.end)
			Form.currentInvoice.start:=Form.currentInvoice.oldStart
			BEEP
			ALERT("Start date must be lower than end date")
		Else 
			Form.btnSave.Enable(True)
			Form.currentInvoice.oldStart:=Form.currentInvoice.start
		End if 
End case 

AJUI_FloatingLabel_main(Form)
