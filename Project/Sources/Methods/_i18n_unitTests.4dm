//%attributes = {}
  // _i18n_unitTests ()
  // Assertions for the multilingual interface (called by launch_unitTest):
  // 1. Language_choiceFromText: any malformed preferences.json gives "auto"
  //    without an error (error 54 seen in testing with {"language":{"x":1}}).
  // 2. Number formats |Schweiz and |Schweiz2 (filters.json): no <<< up to
  //    99'999'999'999.99 (4D converts reals on 13 significant digits, so
  //    larger values lose their last decimals), negatives with their own part. The apostrophe is a
  //    literal character (shown between digits); "." is replaced by the system
  //    decimal separator, so the expected texts use it too.
  // https://developer.4d.com/docs/21-R4/FormObjects/properties_Display#number-format
  // https://developer.4d.com/docs/21-R4/commands/string

#DECLARE()

var $dec : Text

  // 1. preferences.json content
UT_assertText("prefs: empty"; "auto"; Language_choiceFromText(""))
UT_assertText("prefs: spaces"; "auto"; Language_choiceFromText("   "))
UT_assertText("prefs: truncated JSON"; "auto"; Language_choiceFromText("{\"language\":\"de"))
UT_assertText("prefs: not JSON"; "auto"; Language_choiceFromText("hello"))
UT_assertText("prefs: null"; "auto"; Language_choiceFromText("null"))
UT_assertText("prefs: array"; "auto"; Language_choiceFromText("[\"fr\"]"))
UT_assertText("prefs: string"; "auto"; Language_choiceFromText("\"fr\""))
UT_assertText("prefs: no language"; "auto"; Language_choiceFromText("{}"))
UT_assertText("prefs: language object"; "auto"; Language_choiceFromText("{\"language\":{\"x\":1}}"))
UT_assertText("prefs: language number"; "auto"; Language_choiceFromText("{\"language\":123}"))
UT_assertText("prefs: language null"; "auto"; Language_choiceFromText("{\"language\":null}"))
UT_assertText("prefs: language boolean"; "auto"; Language_choiceFromText("{\"language\":true}"))
UT_assertText("prefs: language array"; "auto"; Language_choiceFromText("{\"language\":[\"fr\"]}"))
UT_assertText("prefs: unknown code"; "auto"; Language_choiceFromText("{\"language\":\"es\"}"))
UT_assertText("prefs: region code"; "auto"; Language_choiceFromText("{\"language\":\"fr-ch\"}"))
UT_assertText("prefs: auto"; "auto"; Language_choiceFromText("{\"language\":\"auto\"}"))
UT_assertText("prefs: de"; "de"; Language_choiceFromText("{\"language\":\"de\"}"))
UT_assertText("prefs: upper case FR"; "fr"; Language_choiceFromText("{\"language\":\"FR\"}"))
UT_assertText("prefs: it with other properties"; "it"; Language_choiceFromText("{\"other\":1,\"language\":\"it\"}"))
UT_assertText("prefs: en"; "en"; Language_choiceFromText("{\"language\":\"en\"}"))

  // 2. number formats (values exact in binary and within 13 significant digits)
GET SYSTEM FORMAT(Decimal separator; $dec)
UT_assertText("Schweiz 0"; "0"+$dec+"00"; String(0; "|Schweiz"))
UT_assertText("Schweiz 0.5"; "0"+$dec+"50"; String(0.5; "|Schweiz"))
UT_assertText("Schweiz -0.5"; "-0"+$dec+"50"; String(-0.5; "|Schweiz"))
UT_assertText("Schweiz -5"; "-5"+$dec+"00"; String(-5; "|Schweiz"))
UT_assertText("Schweiz 1000"; "1'000"+$dec+"00"; String(1000; "|Schweiz"))
UT_assertText("Schweiz 999999.5"; "999'999"+$dec+"50"; String(999999.5; "|Schweiz"))
UT_assertText("Schweiz -999999.5"; "-999'999"+$dec+"50"; String(-999999.5; "|Schweiz"))
UT_assertText("Schweiz 1234567.75"; "1'234'567"+$dec+"75"; String(1234567.75; "|Schweiz"))
UT_assertText("Schweiz -1234567.75"; "-1'234'567"+$dec+"75"; String(-1234567.75; "|Schweiz"))
UT_assertText("Schweiz 12345678901.25"; "12'345'678'901"+$dec+"25"; String(12345678901.25; "|Schweiz"))
UT_assertText("Schweiz -12345678901.25"; "-12'345'678'901"+$dec+"25"; String(-12345678901.25; "|Schweiz"))
UT_assertText("Schweiz2 1.5"; "1"+$dec+"5000"; String(1.5; "|Schweiz2"))
UT_assertText("Schweiz2 -0.75"; "-0"+$dec+"7500"; String(-0.75; "|Schweiz2"))
UT_assertText("Schweiz2 1234567.25"; "1'234'567"+$dec+"2500"; String(1234567.25; "|Schweiz2"))
UT_assertText("Schweiz2 -1234567.25"; "-1'234'567"+$dec+"2500"; String(-1234567.25; "|Schweiz2"))
