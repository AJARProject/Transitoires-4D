//%attributes = {"shared":true}
  // print_selection_cb ()
  // Print the current selection. User cancel is error -128, stored by err.

#DECLARE()

var $over; $printed; $listPrinted : Boolean
var $count : Integer

SET PRINT OPTION(Orientation option; 2)
SET PRINT OPTION(Scale option; 80)
PRINT SETTINGS

If (OK=1)
	prepareDataToPrint
	OPEN PRINTING JOB
	$over:=False
	gError:=0
	$count:=1
	FORM LOAD("print_form")
	ON ERR CALL("err")
	
	Repeat 
		  // Print object returns False only for a list box that still has rows.
		  // https://developer.4d.com/docs/21-R4/commands/print-object
		$printed:=Print object(*; "print_label")
		$listPrinted:=Print object(*; "Invoice_lb")
		<>page:="Page "+String($count)
		$printed:=Print object(*; "print_page")
		$printed:=Print object(*; "print_date")
		LISTBOX GET PRINT INFORMATION(*; "Invoice_lb"; lk printing is over; $over)
		If ($listPrinted)
			$over:=True
		End if 
		If (Not($over))
			PAGE BREAK
		End if 
		If (gError=-128)
			$over:=True
		End if 
		$count:=$count+1
	Until ($over)
	
	CLOSE PRINTING JOB
	ON ERR CALL("")
End if 
