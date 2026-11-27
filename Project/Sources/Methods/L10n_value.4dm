//%attributes = {}
  // L10n_value ( storedValue ) -> text
  //
  // Text displayed for a value stored in [invoice]type or [invoice]currency.
  // Only the display changes: the stored values ("debit", "credit", "Frs")
  // and the queries that use them stay as they are.
  // The comparison ignores the case, as typeFilter holds "DEBIT" or "Debit".
  // Other values ("€", "$", "") are returned unchanged.

#DECLARE($value : Text) -> $text : Text

Case of 
	: ($value="debit")
		$text:=L10n("trValueDebit")
	: ($value="credit")
		$text:=L10n("trValueCredit")
	: ($value="Frs")
		$text:=L10n("trValueCurrencyCHF")
	Else 
		$text:=$value
End case 
