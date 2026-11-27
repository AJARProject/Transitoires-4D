//%attributes = {}
  // UT_assertText ( label ; expected ; actual )
  // Text version of UT_assert (case-sensitive comparison).
  // https://developer.4d.com/docs/21-R4/commands/compare-strings

#DECLARE($label : Text; $expected : Text; $actual : Text)

If (Compare strings($expected; $actual; sk char codes)#0)
	UT_failureCount:=UT_failureCount+1
	ALERT($label+"\rExpected: "+$expected+"\rActual: "+$actual)
End if 
