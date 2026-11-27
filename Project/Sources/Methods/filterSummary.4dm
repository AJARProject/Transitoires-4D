//%attributes = {}
  // filterSummary () -> text
  //
  // Active filters shown in the corner ribbon and in the print title:
  // type, currency and year, each translated for display, separated by spaces.
  // Form.typeFilter and Form.currencyFilter keep the stored values used by the queries.

#DECLARE() -> $text : Text

var $parts : Collection

$parts:=[]
If (String(Form.typeFilter)#"")
	$parts.push(L10n_value(Form.typeFilter))
End if 
If (String(Form.currencyFilter)#"")
	$parts.push(L10n_value(Form.currencyFilter))
End if 
$parts.push(String(Form.year))

$text:=$parts.join(" ")
