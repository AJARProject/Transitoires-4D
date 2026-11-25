//%attributes = {}
  // UT_assert ( label ; expected ; actual )
  // Local replacement for AJ_Tools_UT_describe.

#DECLARE($label : Text; $expected : Real; $actual : Real)

If ($expected#$actual)
	UT_failureCount:=UT_failureCount+1
	ALERT($label+"\rExpected: "+String($expected)+"\rActual: "+String($actual))
End if 
