//%attributes = {}
  // setupFormObject () -> setup

#DECLARE() -> $setup_obj : Object

$setup_obj:={}
$setup_obj.currentInvoice:={}
$setup_obj.showOnEmptyField:=True
$setup_obj.typeFilter:="Debit"
$setup_obj.currencyFilter:="Frs"
$setup_obj.year:=Year of(Current date)
$setup_obj.search:=""
$setup_obj.lastSearch:=""
$setup_obj.discount:=0
$setup_obj.tot_currentYear:=0
$setup_obj.tot_nextYear:=0

$setup_obj.ribbon:=New AJUI_Banner
$setup_obj.ribbon.BannerType("cornerRibbon")
$setup_obj.ribbon.BannerName("resume")
$setup_obj.ribbon.Message(L10n("trRibbonNoFilter"))
$setup_obj.ribbon.BannerPosition("top-right")
$setup_obj.ribbon.TextColor("White")
$setup_obj.ribbon.TextFontSize(18)
$setup_obj.ribbon.TextFontWeight("bold")
$setup_obj.ribbon.BannerBGColor("blue:70")
$setup_obj.ribbon.BorderColor("blue")
$setup_obj.ribbon.BorderSize(2)
$setup_obj.ribbon.BannerHeight(80)
$setup_obj.ribbon.BannerWidth(200)

return $setup_obj
