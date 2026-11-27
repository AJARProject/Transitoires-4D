//%attributes = {}
  // Language_getChoice () -> choice
  //
  // Saved language choice: "auto", "fr", "de", "it" or "en".
  // "auto" when the preference file is missing or cannot be read, and for any
  // content Language_choiceFromText does not accept.
  // https://developer.4d.com/docs/21-R4/Concepts/error-handling#tryexpression

#DECLARE() -> $choice : Text

var $file : 4D.File
var $json : Text

$choice:="auto"
$file:=Language_prefsFile
If ($file.exists)
	$json:=Try($file.getText("UTF-8")) || ""
	$choice:=Language_choiceFromText($json)
End if 
