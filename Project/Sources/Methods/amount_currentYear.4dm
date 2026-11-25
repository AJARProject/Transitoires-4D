//%attributes = {}
  // amount_currentYear ( invoice ) -> amount
  // Prorata of the invoice amount for the evaluated year, rounded to 0.05.

#DECLARE($invoice : Object) -> $amount : Real

var $dayCurrentYear; $dayNextYear : Integer

$dayCurrentYear:=days_currentyear(Form.year; $invoice.start; $invoice.end)
$dayNextYear:=days_nextyear(Form.year; $invoice.start; $invoice.end)

$amount:=($invoice.currency="Frs") ? $invoice.amount_invoiced : $invoice.amount_payed

If (($dayCurrentYear+$dayNextYear)=0)
	$amount:=0
Else 
	$amount:=$amount/($dayCurrentYear+$dayNextYear)*$dayCurrentYear
End if 
return AJ_Math.new().roundDecimal($amount; 0.05; "ROUND_HALF_UP")
