//%attributes = {}
  // AJUI_FloatingLabel_main ( params )
  //
  // Local replacement of AJUI_FloatingLabel 1.1.1. Same call:
  //   AJUI_FloatingLabel_main(Form)
  // after Form.target, Form.placeholder and Form.formPath are set.
  // No return value. The 2020 component is not loaded.
  //
  // Defaults when a property is absent (AJUI_FloatingLabel wiki, 1.1.1):
  //   target          current object name
  //   placeholder     the target's own placeholder
  //   position        "top"  ("left" is the other supported value)
  //   offset          0      (gap between the target's top and the label's bottom)
  //   activColor      foreground of FLabel_obj, else #0C13DF
  //   inactivColor    0x00AAAAAA
  //   showOnEmptyField False
  //   formEvent       Form event code
  // A non-zero formEvent simulates that event (Reset_Var passes On After Edit).
  //
  // https://developer.4d.com/docs/21-R4/commands/object-duplicate
  // https://developer.4d.com/docs/21-R4/commands/object-get-coordinates
  // https://developer.4d.com/docs/21-R4/commands/object-set-coordinates
  // https://developer.4d.com/docs/21-R4/commands/object-set-rgb-colors
  // https://developer.4d.com/docs/21-R4/commands/object-set-visible
  // https://developer.4d.com/docs/21-R4/commands/object-get-pointer

#DECLARE($params : Object)

var $target; $placeholder; $labelName; $position; $edited : Text
var $offset; $labelW; $labelH; $bestW; $bestH : Integer
var $tLeft; $tTop; $tRight; $tBottom : Integer
var $lLeft; $lTop; $lRight; $lBottom : Integer
var $templateFg; $templateBg : Integer
var $activeColor; $inactiveColor : Variant
var $evt : Integer
var $showOnEmpty; $isEmpty; $liveAfterEdit : Boolean
var $value : Variant
var $node : Variant
var $parts : Collection
var $part : Text
var $labelPtr : Pointer

ARRAY TEXT($objectNames; 0)
FORM GET OBJECTS($objectNames)
If (Find in array($objectNames; "FLabel_obj")<=0)
	If (Not(FLabel_templateMissing))
		FLabel_templateMissing:=True
		ALERT("You must create the FLabel form object (FLabel_obj) to process.")
	End if 
	return
End if 

If ($params=Null)
	return
End if 

If (String($params.target)="")
	$params.target:=OBJECT Get name(Object current)
End if 
$target:=String($params.target)
If ($target="")
	return
End if 

$labelName:=$target+"_FLabel_obj"

If (String($params.placeholder)="")
	$placeholder:=OBJECT Get placeholder(*; $target)
	$params.placeholder:=$placeholder
Else 
	$placeholder:=String($params.placeholder)
End if 
  // The input object methods copy the widget placeholder into Form.placeholder
  // on every event. Once that widget text is cleared, the remembered text is
  // the only copy left.
If ($params.flabelPlaceholders=Null)
	$params.flabelPlaceholders:={}
End if 
If ($placeholder#"")
	$params.flabelPlaceholders[$target]:=$placeholder
Else 
	$placeholder:=String($params.flabelPlaceholders[$target])
End if 
  // A placeholder set in the form as ":xliff:resname" comes back as that reference,
  // not as its translation, so it is resolved here before it is shown as the label.
  // https://developer.4d.com/docs/21-R4/commands/object-get-placeholder
If (Position(":xliff:"; $placeholder; *)=1)
	$placeholder:=L10n(Substring($placeholder; 8))
End if 

If (($params.offset=Null) || (Value type($params.offset)=Is undefined))
	$offset:=0
Else 
	$offset:=Int($params.offset)
End if 

$position:=Lowercase(String($params.position))
If ($position="")
	$position:="top"
End if 

If ($params.showOnEmptyField=Null)
	$showOnEmpty:=False
Else 
	$showOnEmpty:=($params.showOnEmptyField=True)
End if 

OBJECT GET RGB COLORS(*; "FLabel_obj"; $templateFg; $templateBg)
If ($templateFg=0)
	$templateFg:=0x000C13DF
End if 
If (($params.activColor=Null) || (String($params.activColor)=""))
	$activeColor:=$templateFg
Else 
	$activeColor:=$params.activColor
End if 
If (($params.inactivColor=Null) || (String($params.inactivColor)=""))
	$inactiveColor:=0x00AAAAAA
Else 
	$inactiveColor:=$params.inactivColor
End if 

If (($params.formEvent=Null) || (Num($params.formEvent)=0))
	$evt:=Form event code
	$liveAfterEdit:=($evt=On After Edit)
Else 
	$evt:=Num($params.formEvent)
	$liveAfterEdit:=False
End if 

If (String($params.formPath)#"")
	$node:=$params
	$parts:=Split string(String($params.formPath); ".")
	For each ($part; $parts)
		If (($node=Null) || (Value type($node)=Is undefined) || (Value type($node)#Is object))
			$node:=Null
		Else 
			$node:=$node[$part]
		End if 
	End for each 
	$value:=$node
Else 
	$value:=OBJECT Get value($target)
End if 

If ($liveAfterEdit)
	$edited:=Get edited text
	$isEmpty:=($edited="")
	$params.value:=$edited
Else 
	$isEmpty:=True
	Case of 
		: (($value=Null) || (Value type($value)=Is undefined) || (Value type($value)=Is null))
			$isEmpty:=True
		: (Value type($value)=Is text)
			$isEmpty:=($value="")
		: (Value type($value)=Is date)
			$isEmpty:=($value=!00-00-00!)
		: ((Value type($value)=Is real) || (Value type($value)=Is integer))
			  // 0 is displayed in the field, so the label stays. Only a null number is empty.
			$isEmpty:=False
		Else 
			$isEmpty:=(String($value)="")
	End case 
	$params.value:=$value
End if 

If (Find in array($objectNames; $labelName)<=0)
	OBJECT DUPLICATE(*; "FLabel_obj"; $labelName)
	  // showOnEmptyField would otherwise draw the hint both in the field and above it.
	  // https://developer.4d.com/docs/21-R4/commands/object-set-placeholder
	OBJECT SET PLACEHOLDER(*; $target; "")
End if 

$labelPtr:=OBJECT Get pointer(Object named; $labelName)
If (Not(Is nil pointer($labelPtr)))
	$labelPtr->:=$placeholder
End if 

OBJECT GET COORDINATES(*; $target; $tLeft; $tTop; $tRight; $tBottom)
OBJECT GET COORDINATES(*; $labelName; $lLeft; $lTop; $lRight; $lBottom)
$labelW:=$lRight-$lLeft
$labelH:=$lBottom-$lTop
OBJECT GET BEST SIZE(*; $labelName; $bestW; $bestH)
If ($bestW>$labelW)
	$labelW:=$bestW
End if 
If ($bestH>$labelH)
	$labelH:=$bestH
End if 
If ($labelW<=0)
	$labelW:=101
End if 
If ($labelH<=0)
	$labelH:=14
End if 

If ($position="left")
	$lRight:=$tLeft-$offset
	$lLeft:=$lRight-$labelW
	$lTop:=$tTop+Int(($tBottom-$tTop-$labelH)/2)
	$lBottom:=$lTop+$labelH
Else 
	$lBottom:=$tTop-$offset
	$lTop:=$lBottom-$labelH
	$lLeft:=$tLeft
	$lRight:=$lLeft+$labelW
End if 
OBJECT SET COORDINATES(*; $labelName; $lLeft; $lTop; $lRight; $lBottom)
$params.left:=$lLeft
$params.top:=$lTop

Case of 
	: ($evt=On Getting Focus)
		OBJECT SET RGB COLORS(*; $labelName; $activeColor)
	: ($evt=On Losing Focus)
		OBJECT SET RGB COLORS(*; $labelName; $inactiveColor)
	: (($evt=On After Edit) || ($evt=On Data Change))
		If ($isEmpty)
			OBJECT SET RGB COLORS(*; $labelName; $inactiveColor)
		Else 
			OBJECT SET RGB COLORS(*; $labelName; $activeColor)
		End if 
	Else 
		OBJECT SET RGB COLORS(*; $labelName; $inactiveColor)
End case 

OBJECT SET VISIBLE(*; $labelName; ($showOnEmpty || (Not($isEmpty))))
