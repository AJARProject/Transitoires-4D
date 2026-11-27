#DECLARE()

compiler_variables

  // Language first, before any form or menu bar is loaded: the user's choice
  // (Language menu, saved per user) or the automatic one. Then the menu bar
  // of the main process, built in that language.
Language_startup
Menu_install

  // Seed only an empty interpreted database. A compiled or merged
  // application (4D Volume desktop) keeps whatever data it is given.
  // https://developer.4d.com/docs/21-R4/commands/is-compiled-mode
  // https://developer.4d.com/docs/21-R4/commands/application-type

If ((Not(Is compiled mode)) && (Application type#4D Volume desktop))
	If (ds.invoice.all().length=0)
		DEV_seedFakeData(True)
	End if 
End if 

Input_call
