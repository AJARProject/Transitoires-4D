//%attributes = {}
  // DEV_seedFakeData ( {silent} ) -> created
  //
  // Inserts a fixed set of about 30 invoices when the database is interpreted
  // and not a merged 4D Volume desktop application.
  // Pass True to skip confirm and alert (used from On Startup).
  //
  // Currency values are the ones the forms already store:
  //   Frs = CHF, € = EUR, $ = USD.
  // Only "Frs" is treated as the local currency by the prorata.

#DECLARE($silent : Boolean) -> $created : Integer

var $specs : Collection
var $spec : Object
var $entity : 4D.Entity
var $status : Object

If ((Is compiled mode) || (Application type=4D Volume desktop))
	If (Not($silent))
		ALERT(L10n("trMsgSeedCompiledOnly"))
	End if 
	return 0
End if 

If ((ds.invoice.all().length>0) && (Not($silent)))
	CONFIRM(L10n("trConfirmSeedNotEmpty"); L10n("trBtnAdd"); L10n("trBtnCancel"))
	If (OK=0)
		return 0
	End if 
End if 

If ((ds.invoice.all().length>0) && ($silent))
	return 0
End if 

$specs:=[]
$specs.push({ref: "TR-2024-001"; type: "debit"; currency: "Frs"; invoiced: 2400; rate: 1; payed: 2400; locked: False; sy: 2024; sm: 1; sd: 1; ey: 2024; em: 12; ed: 31; iy: 2024; im: 1; id: 15})
$specs.push({ref: "TR-2024-002"; type: "credit"; currency: "Frs"; invoiced: 600; rate: 1; payed: 600; locked: True; sy: 2024; sm: 2; sd: 29; ey: 2024; em: 2; ed: 29; iy: 2024; im: 2; id: 29})
$specs.push({ref: "TR-2024-003"; type: "debit"; currency: "€"; invoiced: 1500; rate: 0.96; payed: 1440; locked: False; sy: 2024; sm: 2; sd: 1; ey: 2024; em: 3; ed: 31; iy: 2024; im: 2; id: 10})
$specs.push({ref: "TR-2024-004"; type: "credit"; currency: "$"; invoiced: 2000; rate: 0.9; payed: 1800; locked: False; sy: 2024; sm: 11; sd: 1; ey: 2025; em: 2; ed: 28; iy: 2024; im: 11; id: 5})
$specs.push({ref: "TR-2024-005"; type: "debit"; currency: "Frs"; invoiced: 450.5; rate: 1; payed: 450.5; locked: True; sy: 2024; sm: 7; sd: 1; ey: 2024; em: 7; ed: 1; iy: 2024; im: 7; id: 1})
$specs.push({ref: "TR-2024-006"; type: "credit"; currency: "€"; invoiced: 2200; rate: 0.95; payed: 2090; locked: False; sy: 2024; sm: 6; sd: 1; ey: 2024; em: 6; ed: 30; iy: 2024; im: 6; id: 15})
$specs.push({ref: "TR-2024-007"; type: "debit"; currency: "$"; invoiced: 800; rate: 0.88; payed: 704; locked: False; sy: 2025; sm: 1; sd: 1; ey: 2025; em: 3; ed: 31; iy: 2024; im: 12; id: 20})
$specs.push({ref: "TR-2024-008"; type: "credit"; currency: "Frs"; invoiced: 300; rate: 1; payed: 300; locked: False; sy: 2023; sm: 10; sd: 1; ey: 2023; em: 12; ed: 31; iy: 2024; im: 1; id: 8})
$specs.push({ref: "TR-2024-009"; type: "debit"; currency: "€"; invoiced: 1000; rate: 0.97; payed: 970; locked: True; sy: 2024; sm: 2; sd: 28; ey: 2024; em: 3; ed: 1; iy: 2024; im: 2; id: 28})
$specs.push({ref: "TR-2024-010"; type: "credit"; currency: "$"; invoiced: 1250; rate: 0.85; payed: 1062.5; locked: False; sy: 2024; sm: 12; sd: 1; ey: 2025; em: 1; ed: 31; iy: 2024; im: 12; id: 18})
$specs.push({ref: "TR-2025-001"; type: "debit"; currency: "Frs"; invoiced: 3600; rate: 1; payed: 3600; locked: False; sy: 2025; sm: 1; sd: 1; ey: 2025; em: 12; ed: 31; iy: 2025; im: 1; id: 10})
$specs.push({ref: "TR-2025-002"; type: "credit"; currency: "€"; invoiced: 1750; rate: 0.94; payed: 1645; locked: True; sy: 2025; sm: 3; sd: 1; ey: 2025; em: 3; ed: 1; iy: 2025; im: 3; id: 1})
$specs.push({ref: "TR-2025-003"; type: "debit"; currency: "$"; invoiced: 2100; rate: 0.9; payed: 1890; locked: False; sy: 2025; sm: 10; sd: 15; ey: 2026; em: 4; ed: 15; iy: 2025; im: 10; id: 20})
$specs.push({ref: "TR-2025-004"; type: "credit"; currency: "Frs"; invoiced: 875; rate: 1; payed: 875; locked: False; sy: 2025; sm: 4; sd: 1; ey: 2025; em: 9; ed: 30; iy: 2025; im: 4; id: 2})
$specs.push({ref: "TR-2025-005"; type: "debit"; currency: "€"; invoiced: 640; rate: 0.95; payed: 608; locked: True; sy: 2026; sm: 1; sd: 1; ey: 2026; em: 1; ed: 31; iy: 2025; im: 12; id: 15})
$specs.push({ref: "TR-2025-006"; type: "credit"; currency: "$"; invoiced: 500; rate: 0.88; payed: 440; locked: False; sy: 2025; sm: 2; sd: 1; ey: 2025; em: 2; ed: 28; iy: 2025; im: 2; id: 5})
$specs.push({ref: "TR-2025-007"; type: "debit"; currency: "Frs"; invoiced: 1500; rate: 1; payed: 1500; locked: False; sy: 2025; sm: 12; sd: 31; ey: 2026; em: 1; ed: 1; iy: 2025; im: 12; id: 31})
$specs.push({ref: "TR-2025-008"; type: "credit"; currency: "€"; invoiced: 1000; rate: 0.92; payed: 920; locked: False; sy: 2025; sm: 8; sd: 1; ey: 2025; em: 8; ed: 31; iy: 2025; im: 8; id: 12})
$specs.push({ref: "TR-2025-009"; type: "debit"; currency: "Frs"; invoiced: 5050; rate: 1; payed: 5050; locked: True; sy: 2025; sm: 6; sd: 15; ey: 2025; em: 6; ed: 15; iy: 2025; im: 6; id: 15})
$specs.push({ref: "TR-2026-001"; type: "debit"; currency: "Frs"; invoiced: 4800; rate: 1; payed: 4800; locked: False; sy: 2026; sm: 1; sd: 1; ey: 2026; em: 12; ed: 31; iy: 2026; im: 1; id: 6})
$specs.push({ref: "TR-2026-002"; type: "credit"; currency: "$"; invoiced: 1250; rate: 0.86; payed: 1075; locked: True; sy: 2026; sm: 2; sd: 1; ey: 2026; em: 2; ed: 1; iy: 2026; im: 2; id: 1})
$specs.push({ref: "TR-2026-003"; type: "debit"; currency: "€"; invoiced: 3100; rate: 0.94; payed: 2914; locked: False; sy: 2026; sm: 9; sd: 1; ey: 2027; em: 3; ed: 31; iy: 2026; im: 9; id: 3})
$specs.push({ref: "TR-2026-004"; type: "credit"; currency: "Frs"; invoiced: 720.5; rate: 1; payed: 720.5; locked: False; sy: 2026; sm: 5; sd: 1; ey: 2026; em: 5; ed: 31; iy: 2026; im: 5; id: 4})
$specs.push({ref: "TR-2026-005"; type: "debit"; currency: "$"; invoiced: 540; rate: 0.85; payed: 459; locked: True; sy: 2027; sm: 1; sd: 15; ey: 2027; em: 6; ed: 30; iy: 2026; im: 11; id: 20})
$specs.push({ref: "TR-2026-006"; type: "credit"; currency: "€"; invoiced: 2600; rate: 0.96; payed: 2496; locked: False; sy: 2026; sm: 2; sd: 28; ey: 2026; em: 3; ed: 1; iy: 2026; im: 2; id: 28})
$specs.push({ref: "TR-2026-007"; type: "debit"; currency: "Frs"; invoiced: 180; rate: 1; payed: 180; locked: False; sy: 2026; sm: 11; sd: 25; ey: 2026; em: 11; ed: 25; iy: 2026; im: 11; id: 25})
$specs.push({ref: "TR-2026-008"; type: "credit"; currency: "$"; invoiced: 800; rate: 0.9; payed: 720; locked: False; sy: 2026; sm: 4; sd: 1; ey: 2026; em: 10; ed: 31; iy: 2026; im: 4; id: 7})
$specs.push({ref: "TR-2026-009"; type: "debit"; currency: "€"; invoiced: 4100; rate: 0.95; payed: 3895; locked: True; sy: 2025; sm: 12; sd: 1; ey: 2026; em: 6; ed: 30; iy: 2026; im: 1; id: 4})
$specs.push({ref: "TR-2026-010"; type: "credit"; currency: "Frs"; invoiced: 95; rate: 1; payed: 95; locked: False; sy: 2026; sm: 12; sd: 31; ey: 2027; em: 1; ed: 1; iy: 2026; im: 12; id: 31})
$specs.push({ref: "TR-2026-011"; type: "credit"; currency: "€"; invoiced: 1250; rate: 0.96; payed: 1200; locked: False; sy: 2026; sm: 7; sd: 1; ey: 2027; em: 1; ed: 15; iy: 2026; im: 7; id: 2})

$created:=0
For each ($spec; $specs)
	$entity:=ds.invoice.new()
	$entity.invoice_ref:=$spec.ref
	$entity.type:=$spec.type
	$entity.currency:=$spec.currency
	$entity.amount_invoiced:=$spec.invoiced
	$entity.rate:=$spec.rate
	$entity.amount_payed:=$spec.payed
	$entity.locked:=$spec.locked
	$entity.start:=Add to date(!00-00-00!; $spec.sy; $spec.sm; $spec.sd)
	$entity.end:=Add to date(!00-00-00!; $spec.ey; $spec.em; $spec.ed)
	$entity.invoice_date:=Add to date(!00-00-00!; $spec.iy; $spec.im; $spec.id)
	$status:=$entity.save()
	If ($status.success)
		$created:=$created+1
	End if 
End for each 

If (Not($silent))
	ALERT(L10n_count("trMsgSeedCreated"; $created))
End if 

return $created
