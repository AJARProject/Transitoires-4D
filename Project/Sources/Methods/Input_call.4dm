//%attributes = {}
  // Input_call ( {process} )
  // Without a parameter, open the input form in a new process.

#DECLARE($process : Boolean)

var $ref_process : Integer
var $setup_obj : Object
var $ref_win : Integer

If (Count parameters=0)
	$ref_process:=New process(Current method name; 0; Current method name; True)
	SHOW PROCESS($ref_process)
	BRING TO FRONT($ref_process)
Else 
	vSearch:=""
	$setup_obj:=setupFormObject
	$ref_win:=Open form window("Input"; Plain form window; On the left; At the top)
	DIALOG("Input"; $setup_obj)
	CLOSE WINDOW($ref_win)
End if 
