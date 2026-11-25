//%attributes = {}
  // tot_amount_currentYear () -> total

#DECLARE() -> $total : Real

var $invoice : Object

$total:=0
For each ($invoice; Form.allInvoices)
	$total:=$total+amount_currentYear($invoice)
End for each 

return $total 
