//%attributes = {}
  // Menu_applyTexts ()
  //
  // Writes the texts of the shared menus again in the current language and
  // puts the check mark on the active item of the Language menu.
  // Changes to a menu reference apply to every process at once.
  // https://developer.4d.com/docs/21-R4/commands/set-menu-item
  // https://developer.4d.com/docs/21-R4/commands/set-menu-item-mark

#DECLARE()

var $entry : Object
var $i : Integer
var $choice : Text

If (<>menu_texts#Null)
	For each ($entry; <>menu_texts)
		SET MENU ITEM($entry.menu; $entry.item; L10n($entry.key); *)
	End for each 
End if 

If (<>menu_language#"")
	$choice:=(<>language_choice="") ? "auto" : <>language_choice
	For ($i; 1; Count menu items(<>menu_language))
		If (Get menu item parameter(<>menu_language; $i)#"")
			If (Get menu item parameter(<>menu_language; $i)=$choice)
				SET MENU ITEM MARK(<>menu_language; $i; Char(18))
			Else 
				SET MENU ITEM MARK(<>menu_language; $i; "")
			End if 
		End if 
	End for 
End if 
