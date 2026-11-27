//%attributes = {}
  // Language_saveChoice ( choice ) -> saved
  //
  // Writes {"language": choice} in the per-user preference file, keeping the
  // other properties when the file holds a JSON object (otherwise it is
  // replaced). Returns False when the file cannot be written.
  // https://developer.4d.com/docs/21-R4/API/FileClass#settext
  // https://developer.4d.com/docs/21-R4/API/FolderClass#create

#DECLARE($choice : Text) -> $saved : Boolean

var $file : 4D.File
var $parsed : Variant
var $prefs : Object

$file:=Language_prefsFile
If ($file.exists)
	$parsed:=Try(JSON Parse(Try($file.getText("UTF-8")) || ""))
	If (Value type($parsed)=Is object)
		$prefs:=$parsed
	End if 
End if 
If ($prefs=Null)
	$prefs:={}
End if 
$prefs.language:=$choice

$file.parent.create()  // False when the folder already exists: not an error
Try($file.setText(JSON Stringify($prefs; *); "UTF-8"))
$saved:=(Last errors=Null)
