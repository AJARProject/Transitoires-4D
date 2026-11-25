//%attributes = {}
  // checkYear ( year ; newInvoice )
  // Keep the year popup aligned with the invoice date.

#DECLARE($year : Integer; $newInvoice : Boolean)

var $years_list_ptr : Pointer
var $pos : Integer

If (False)
	ARRAY TEXT(years_list; 0)
End if 

If (Form.year=$year)
	If ($newInvoice)
		reloadInvoicesSelection
	End if 
Else 
	$years_list_ptr:=OBJECT Get pointer(Object named; "years_list")
	$pos:=Find in array($years_list_ptr->; String($year))
	If ($pos=-1)
		APPEND TO ARRAY($years_list_ptr->; String($year))
		SORT ARRAY($years_list_ptr->)
	End if 
	Form.year:=$year
	$pos:=Find in array($years_list_ptr->; String($year))
	$years_list_ptr->:=$pos
	reloadInvoicesSelection
End if 
