//%attributes = {}
  // tot_amount_nextYear () -> total

#DECLARE() -> $total : Real

var $invoice : Object

$total:=0
For each ($invoice; Form.allInvoices)
	$total:=$total+amount_nextYear($invoice)
End for each 

return $total 
