#DECLARE()

var $evt : Integer

Form.target:=OBJECT Get name(Object current)
Form.placeholder:=OBJECT Get placeholder(*; Form.target)
Form.formPath:="currentInvoice.end"

$evt:=Form event code

Case of 
	: ($evt=On Load)
		
	: ($evt=On Data Change)
		If (Form.currentInvoice.start>Form.currentInvoice.end)
			Form.currentInvoice.end:=Form.currentInvoice.oldEnd
			BEEP
			ALERT("Start date must be lower than end date")
		Else 
			Form.btnSave.Enable(True)
			Form.currentInvoice.oldEnd:=Form.currentInvoice.end
			Form.currentInvoice.start:=Add to date(Form.currentInvoice.end; -1; 0; 1)
		End if 
End case 

AJUI_FloatingLabel_main(Form)
