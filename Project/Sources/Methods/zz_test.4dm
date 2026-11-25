//%attributes = {}
  // zz_test ()
  // Maintenance helper: recompute the rate of 2014 euro debits.

#DECLARE()

var $entities : 4D.EntitySelection
var $entity : 4D.Entity
var $ok : Object

$entities:=ds.invoice.all()
$entities:=$entities.query(" invoice_date = :1 AND type = :2 AND currency = :3"; Add to date(!00-00-00!; 2014; 1; 1); "debit"; "€")

For each ($entity; $entities)
	If ($entity.amount_invoiced=0)
		$entity.rate:=0
	Else 
		$entity.rate:=AJ_Math.new().roundDecimal($entity.amount_payed/$entity.amount_invoiced; 0.0001; "ROUND_HALF_UP")
	End if 
	$ok:=$entity.save()
End for each 
