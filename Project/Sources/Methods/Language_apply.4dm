//%attributes = {}
  // Language_apply ( choice )
  //
  // Remembers the choice of the Language menu ("auto", "fr", "de", "it", "en")
  // and sets the current language of the database for the session.
  // Forms already loaded keep their language; menus are refreshed by Menu_applyTexts.
  // https://developer.4d.com/docs/21-R4/commands/set-database-localization

#DECLARE($choice : Text)

If (Not(Language_isChoice($choice)))
	$choice:="auto"
End if 
<>language_choice:=$choice
SET DATABASE LOCALIZATION(Language_resolve($choice))
