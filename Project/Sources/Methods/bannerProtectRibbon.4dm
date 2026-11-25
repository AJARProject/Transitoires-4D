//%attributes = {}
  // bannerProtectRibbon ()

#DECLARE()

var $left; $top; $right; $bottom : Integer

Form.btnProtectBanner:=New AJUI_Banner
Form.btnProtectBanner.BannerType("cornerRibbon")
Form.btnProtectBanner.BannerName("protect")
Form.btnProtectBanner.Message("Locked")
Form.btnProtectBanner.BannerPosition("top-right")
Form.btnProtectBanner.TextColor("White")
Form.btnProtectBanner.TextFontSize(20)
Form.btnProtectBanner.TextFontWeight("bold")
Form.btnProtectBanner.BannerBGColor("red:70")
Form.btnProtectBanner.BorderColor("red")
Form.btnProtectBanner.BorderSize(2)
Form.btnProtectBanner.RibbonTargetName("inputLineInvoiceGroup")

OBJECT GET COORDINATES(*; "AJUI_Banner"; $left; $top; $right; $bottom)
Form.btnProtectBanner.BannerHeight(100)
Form.btnProtectBanner.BannerWidth(165)
