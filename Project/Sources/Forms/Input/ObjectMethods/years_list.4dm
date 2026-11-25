#DECLARE()

var $years_list_ptr : Pointer
var $invoices : 4D.EntitySelection
var $evt : Integer
var $min; $max; $currentYear; $i; $pos : Integer

If (False)
	ARRAY TEXT(years_list; 0)
End if 

$evt:=Form event code

Case of 
	: ($evt=On Load)
		$years_list_ptr:=OBJECT Get pointer(Object current)
		CLEAR VARIABLE($years_list_ptr->)
		$invoices:=ds.invoice.all()
		If ($invoices.length>0)
			$min:=Year of($invoices.min("invoice_date"))
			$max:=Year of($invoices.max("invoice_date"))
			APPEND TO ARRAY($years_list_ptr->; String($min))
			If ($max>$min)
				For ($i; 1; $max-$min)
					APPEND TO ARRAY($years_list_ptr->; String($min+$i))
				End for 
			End if 
			$currentYear:=Year of(Current date)
			$pos:=Find in array($years_list_ptr->; String($currentYear))
			If ($pos>0)
				$years_list_ptr->:=$pos
				Form.year:=$currentYear
			Else 
				$pos:=Size of array($years_list_ptr->)
				$years_list_ptr->:=$pos
				Form.year:=Num($years_list_ptr->{$pos})
			End if 
		End if 
		reloadInvoicesSelection
		
	: ($evt=On Data Change)
		$years_list_ptr:=OBJECT Get pointer(Object current)
		$pos:=$years_list_ptr->
		Form.year:=Num($years_list_ptr->{$pos})
		reloadInvoicesSelection
		reloadListAndInputArea
End case 
