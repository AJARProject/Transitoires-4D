#DECLARE()

Case of 
	: (Form event code=On Load)
		Form.tipSearchPicker:=tip_templatesButtons("HelpPicker"; "")
		Form.tipSearchPicker.TipboxMaxWidth(190)
		
	: (Form event code=On Mouse Enter)
		If (OBJECT Get enabled(*; "HelpPicker"))
			Form.tipSearchPicker.TextLabel(L10n("trTipSearchHelp"))
			Form.tipSearchPicker.Show()
		End if 
		
	: (Form event code=On Mouse Leave)
		Form.tipSearchPicker.Hide()
End case 
