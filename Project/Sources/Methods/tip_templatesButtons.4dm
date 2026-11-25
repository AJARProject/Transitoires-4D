//%attributes = {}
  // tip_templatesButtons ( targetName ; label ) -> tip

#DECLARE($tipTargetName : Text; $tipLabel : Text) -> $tip_obj : Object

$tip_obj:=New AJUI_Tip
$tip_obj.TipName("AJUI_Tip_sf")
$tip_obj.TipDuration(5000)
$tip_obj.AutoRebuild(False)
$tip_obj.TextLabel($tipLabel)
$tip_obj.TextRotation("")
$tip_obj.TextFontSize(13)
$tip_obj.TextFontName("Arial,Helvetica,MS Sans Serif")
$tip_obj.TextFontColor("#FFFFFF")
$tip_obj.TextOpacity(100)
$tip_obj.TipPosition("bottom")
$tip_obj.TargetName($tipTargetName)
$tip_obj.TargetOffset(0)
$tip_obj.TargetMargin(0)
$tip_obj.CornerRadius(5)
$tip_obj.TipboxMaxWidth(0)
$tip_obj.TipboxMaxHeight(0)
$tip_obj.Padding(10)
$tip_obj.BorderSize(2)
$tip_obj.BorderColor("#005EA8")
$tip_obj.BorderOpacity(100)
$tip_obj.BackgroundColor("#076BFF")
$tip_obj.BackgroundOpacity(90)
$tip_obj.ActivateShadow(False)
$tip_obj.ShadowOffset(2)
$tip_obj.ArrowWidth(20)
$tip_obj.ArrowHeight(10)
$tip_obj.ArrowPosition("middle")
$tip_obj.ArrowOffset(10)
$tip_obj.Curved(True)

return $tip_obj
