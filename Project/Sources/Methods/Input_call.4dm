//%attributes = {}
  // Input_call ( {process} )
  // Without a parameter, open the input form in a new process.
  // The process installs the shared menu bar (Menu_install): processes have no
  // menu bar by default. Its window is listed in <>input_windows so that a
  // language change can reopen it (Input_reopenAll); the filters are kept.

#DECLARE($process : Boolean)

var $ref_process : Integer
var $setup_obj; $previous_obj : Object
var $ref_win; $index : Integer

If (Count parameters=0)
	$ref_process:=New process(Current method name; 0; Current method name; True)
	SHOW PROCESS($ref_process)
	BRING TO FRONT($ref_process)
Else 
	vSearch:=""
	Menu_install
	If (<>input_windows=Null)
		<>input_windows:=[]
	End if 
	$setup_obj:=setupFormObject
	Repeat 
		vInput_reopen:=False
		$ref_win:=Open form window("Input"; Plain form window; On the left; At the top)
		<>input_windows.push($ref_win)
		DIALOG("Input"; $setup_obj)
		$index:=<>input_windows.indexOf($ref_win)
		If ($index>=0)
			<>input_windows.remove($index)
		End if 
		CLOSE WINDOW($ref_win)
		If (vInput_reopen)
			  // New form data in the new language, same filters.
			$previous_obj:=$setup_obj
			$setup_obj:=setupFormObject
			$setup_obj.typeFilter:=$previous_obj.typeFilter
			$setup_obj.currencyFilter:=$previous_obj.currencyFilter
			$setup_obj.year:=$previous_obj.year
			$setup_obj.search:=$previous_obj.search
			$setup_obj.lastSearch:=$previous_obj.lastSearch
		End if 
	Until (Not(vInput_reopen))
End if 
