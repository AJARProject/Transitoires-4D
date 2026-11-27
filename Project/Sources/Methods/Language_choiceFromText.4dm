//%attributes = {}
  // Language_choiceFromText ( json ) -> choice
  //
  // Language choice held by the text of preferences.json: "auto", "fr", "de",
  // "it" or "en". Anything else gives "auto", without an error dialog:
  // empty or unreadable JSON, null, an array, a string, a missing "language"
  // property, a "language" that is not text (number, object, null...) or an
  // unknown code. The type is checked before any use of the value: String() on
  // an object raised error 54 at startup (Testsky, PR #7).
  // https://developer.4d.com/docs/21-R4/Concepts/error-handling#tryexpression
  // https://developer.4d.com/docs/21-R4/commands/value-type

#DECLARE($json : Text) -> $choice : Text

var $parsed : Variant
var $prefs : Object
var $language : Text

$choice:="auto"
$parsed:=Try(JSON Parse($json))
If (Value type($parsed)=Is object)
	$prefs:=$parsed
	If (Value type($prefs.language)=Is text)
		$language:=Lowercase($prefs.language)
		If (Language_isChoice($language))
			$choice:=$language
		End if 
	End if 
End if 
