//%attributes = {}
  // Language_menu ()
  //
  // Method of the items of the Language menu. The item parameter holds the
  // choice: "auto", "fr", "de", "it" or "en" (set by Menu_build).
  // 1. save the choice for the current user, 2. apply it, 3. refresh the menu
  // texts and check marks (shared menus: immediate in every process),
  // 4. offer to reopen the Transitoires windows, which keep the language
  // they were opened with.
  // https://developer.4d.com/docs/21-R4/commands/get-selected-menu-item-parameter

#DECLARE()

var $choice; $before : Text

$choice:=Get selected menu item parameter
If (Language_isChoice($choice))
	$before:=Get database localization(Current localization)
	If (Not(Language_saveChoice($choice)))
		ALERT(L10n("trMsgLanguageNotSaved"))
	End if 
	Language_apply($choice)
	Menu_applyTexts
	If (Get database localization(Current localization)#$before)
		Input_reopenAll
	End if 
End if 
