//%attributes = {}
  // Language_resolve ( choice ) -> language
  //
  // Language code to pass to SET DATABASE LOCALIZATION.
  // "auto": the language of the current system user (User system localization,
  // for example "de" or "fr-ch"), reduced to its language part, if it is one of
  // fr, de, it, en; otherwise "en". Default localization is not used because
  // 4D may pick it from the language of the 4D application.
  // https://developer.4d.com/docs/21-R4/commands/get-database-localization

#DECLARE($choice : Text) -> $language : Text

var $system : Text
var $parts : Collection

If ($choice="auto")
	$system:=Lowercase(Replace string(Get database localization(User system localization); "_"; "-"))
	$parts:=Split string($system; "-")
	$language:=($parts.length>0) ? $parts[0] : ""
Else 
	$language:=$choice
End if 

If (["fr"; "de"; "it"; "en"].indexOf($language)<0)
	$language:="en"
End if 
