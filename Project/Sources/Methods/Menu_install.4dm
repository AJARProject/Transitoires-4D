//%attributes = {}
  // Menu_install ()
  //
  // Installs the Transitoires menu bar in the current process, built once by
  // Menu_build and shared by all processes. Processes have no menu bar by default.
  // https://developer.4d.com/docs/21-R4/commands/set-menu-bar
  // https://developer.4d.com/docs/21-R4/Develop/processes

#DECLARE()

If (<>menu_bar="")
	Menu_build
End if 
Menu_applyTexts
SET MENU BAR(<>menu_bar)
