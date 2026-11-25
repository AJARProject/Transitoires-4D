#DECLARE()

Case of 
	: (Form event code=On Load)
		Form.tipSearchPicker:=tip_templatesButtons("HelpPicker"; "")
		Form.tipSearchPicker.TipboxMaxWidth(190)
		
	: (Form event code=On Mouse Enter)
		If (OBJECT Get enabled(*; "HelpPicker"))
			Form.tipSearchPicker.TextLabel("Start/End : 01.01.20...05.05.20 Date : 01.01&05.05")
			Form.tipSearchPicker.Show()
		End if 
		
	: (Form event code=On Mouse Leave)
		Form.tipSearchPicker.Hide()
End case 
