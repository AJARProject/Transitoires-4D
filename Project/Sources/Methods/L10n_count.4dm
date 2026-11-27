//%attributes = {}
  // L10n_count ( baseKey ; count ) -> text
  //
  // Singular or plural text: baseKey+"One" or baseKey+"Other", with {1} = count.
  // French uses the singular for 0 and 1 ("0 facture supprimée"),
  // English, German and Italian only for 1.
  // https://developer.4d.com/docs/21-R4/commands/get-database-localization

#DECLARE($baseKey : Text; $count : Integer) -> $text : Text

var $one : Boolean

$one:=($count=1)
If ($count=0)
	$one:=(Get database localization(Current localization)="fr@")
End if 

If ($one)
	$text:=L10n($baseKey+"One"; String($count))
Else 
	$text:=L10n($baseKey+"Other"; String($count))
End if 
