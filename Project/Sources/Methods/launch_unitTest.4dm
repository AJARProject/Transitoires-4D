//%attributes = {}
  // launch_unitTest ()
  // Run the days_* assertions.

#DECLARE()

UT_failureCount:=0
_days_currentyear
_days_nextyear

If (UT_failureCount=0)
	ALERT("days_currentyear / days_nextyear : all assertions passed")
Else 
	ALERT(String(UT_failureCount)+" assertion(s) failed")
End if 
