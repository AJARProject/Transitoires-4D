//%attributes = {}
  // L10n ( key {; value1 ; value2 ...} ) -> text
  //
  // Text of the XLIFF trans-unit whose resname is key, in the current
  // language of the database (Resources/<lang>.lproj/Transitoires.xlf),
  // with {1}, {2}... replaced by value1, value2...
  // When the key is missing, Localized string returns "" and sets OK to 0:
  // the key itself is returned so that the gap shows on screen.
  // OK is saved and restored, so L10n can be called between CONFIRM and If (OK=1).
  // https://developer.4d.com/docs/21-R4/commands/localized-string
  // https://developer.4d.com/docs/21-R4/Concepts/parameters#declaring-variadic-parameters
  // https://developer.4d.com/docs/21-R4/commands/replace-string

#DECLARE($key : Text; ... : Text) -> $text : Text

var $ok; $i : Integer

$ok:=OK
$text:=Localized string:C991($key)
If ($text="")
	$text:=$key
End if 

For ($i; 2; Count parameters)
	$text:=Replace string($text; "{"+String($i-1)+"}"; ${$i}; *)
End for 

OK:=$ok
