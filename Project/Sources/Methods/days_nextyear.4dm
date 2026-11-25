//%attributes = {}
  // days_nextyear ( year ; start ; end ) -> days
  // Days of the invoice period that fall after the evaluated year.

#DECLARE($year : Integer; $start : Date; $end : Date) -> $days : Integer

var $year_end : Date

$days:=0
$year_end:=Add to date(!00-00-00!; $year; 12; 31)

If ($year>0)
	If (Year of($end)<=$year)
		$days:=0
	Else 
		If ($start>$year_end)
			$days:=$end-$start+1
		Else 
			$days:=$end-$year_end
		End if 
	End if 
End if 

return $days 
