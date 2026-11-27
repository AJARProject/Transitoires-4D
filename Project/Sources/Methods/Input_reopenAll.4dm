//%attributes = {}
  // Input_reopenAll ()
  //
  // After a language change: forms already displayed keep their language, so
  // the open Transitoires windows must be closed and reopened. Asks first,
  // because changes not saved in the input area are lost.
  // "Later": the windows are translated the next time they are opened.
  // https://developer.4d.com/docs/21-R4/commands/call-form

#DECLARE()

var $window : Integer

If (<>input_windows#Null)
	If (<>input_windows.length>0)
		CONFIRM(L10n("trConfirmReopenWindows"); L10n("trBtnReopenNow"); L10n("trBtnLater"))
		If (OK=1)
			For each ($window; <>input_windows.copy())
				CALL FORM($window; "Input_reopenForLanguage")
			End for each 
		End if 
	End if 
End if 
