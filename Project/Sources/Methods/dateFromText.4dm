//%attributes = {}
  // dateFromText ( text ) -> date
  //
  // Locale-independent replacement for Date(text) in this project.
  // "YYYY-MM-DD" is read as year, month, day.
  // Anything else is read as day/month/year, which is the short-date order
  // Date() used under the Swiss settings this application was written for.
  // Two-digit years keep the default pivot of 30 (SET DEFAULT CENTURY).
  // Empty or invalid text returns an empty date, the same result as Date of an empty string.
  // https://developer.4d.com/docs/21-R4/commands/date

#DECLARE($text : Text) -> $date : Date

var $work : Text
var $parts : Collection
var $day; $month; $year; $maxDay : Integer
var $leap : Boolean

$date:=!00-00-00!
If ($text="")
	return $date
End if 

$work:=$text
If ((Length($work)>=10) && ($work[[5]]="-") && ($work[[8]]="-") && (Num(Substring($work; 1; 4))>31))
	$year:=Int(Num(Substring($work; 1; 4)))
	$month:=Int(Num(Substring($work; 6; 2)))
	$day:=Int(Num(Substring($work; 9; 2)))
Else 
	$work:=Replace string($work; "."; "/")
	$work:=Replace string($work; "-"; "/")
	$work:=Replace string($work; ","; "/")
	$work:=Replace string($work; " "; "/")
	$parts:=Split string($work; "/")
	If ($parts.length<3)
		return $date
	End if 
	$day:=Int(Num($parts[0]))
	$month:=Int(Num($parts[1]))
	$year:=Int(Num($parts[2]))
	If (($year>=0) && ($year<100))
		If ($year<30)
			$year:=$year+2000
		Else 
			$year:=$year+1900
		End if 
	End if 
End if 

If (($month<1) || ($month>12) || ($day<1))
	return $date
End if 

Case of 
	: ($month=2)
		$leap:=(($year%4)=0) && ((($year%100)#0) || (($year%400)=0))
		$maxDay:=$leap ? 29 : 28
	: ($month=4) || ($month=6) || ($month=9) || ($month=11)
		$maxDay:=30
	Else 
		$maxDay:=31
End case 

If ($day>$maxDay)
	return $date
End if 

return Add to date(!00-00-00!; $year; $month; $day)
