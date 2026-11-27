//%attributes = {}
  // launch_unitTest ()
  // Run the days_* assertions and the PR #7 ones (preferences.json, number formats).

#DECLARE()

UT_failureCount:=0
_days_currentyear
_days_nextyear
_i18n_unitTests

If (UT_failureCount=0)
	ALERT("days_currentyear / days_nextyear / i18n : all assertions passed")
Else 
	ALERT(String(UT_failureCount)+" assertion(s) failed")
End if 
