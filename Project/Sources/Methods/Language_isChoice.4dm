//%attributes = {}
  // Language_isChoice ( choice ) -> valid
  //
  // True for the values of the Language menu: "auto", "fr", "de", "it", "en".

#DECLARE($choice : Text) -> $valid : Boolean

$valid:=(["auto"; "fr"; "de"; "it"; "en"].indexOf($choice)>=0)
