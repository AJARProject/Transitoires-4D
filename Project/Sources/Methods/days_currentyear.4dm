//%attributes = {}
  // days_currentyear ( year ; start ; end ) -> days
  // Days of the invoice period that fall in the evaluated year.

#DECLARE($year : Integer; $start : Date; $end : Date) -> $days : Integer

var $year_end : Date

$days:=0
$year_end:=Add to date(!00-00-00!; $year; 12; 31)

If ($year>0)
	Case of 
		: (Year of($start)=$year)
			Case of 
				: (Year of($end)=$year)
					$days:=$end-$start+1
				: (Year of($end)>$year)
					$days:=$year_end-$start+1
				Else 
					$days:=0
			End case 
		: (Year of($start)>$year)
			$days:=0
		: (Year of($start)<$year)
			Case of 
				: (Year of($end)<=$year)
					$days:=$end-$start+1
				: (Year of($end)>$year)
					$days:=$year_end-$start+1
			End case 
	End case 
End if 

return $days 
