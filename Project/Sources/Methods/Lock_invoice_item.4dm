//%attributes = {}
  // Lock_invoice_item ()
  // Show or hide the locked state of the current invoice.

#DECLARE()

If (Form.btnProtect.protect)
	Form.btnProtect.Label(AJUI_btn_default; L10n("trTipProtected"))  // shown as the tooltip of btnProtect
	Form.btnProtectBanner.DrawBanner()
	OBJECT SET VISIBLE(*; "RectProtect"; True)
	Form.btnProtect.PicturePath(AJUI_btn_default; "invoice_lock/3994379---lock-padlock-privacy-protection-security.svg")
	OBJECT SET ENTERABLE(*; "invoice_ref_value"; False)
	OBJECT SET ENTERABLE(*; "amount_invoiced_value"; False)
	OBJECT SET ENTERABLE(*; "amount_payed_value"; False)
	OBJECT SET ENTERABLE(*; "rate_value"; False)
	OBJECT SET ENTERABLE(*; "end_value"; False)
	OBJECT SET ENTERABLE(*; "start_value"; False)
	OBJECT SET ENTERABLE(*; "invoice_date_value"; False)
	OBJECT SET ENTERABLE(*; "Form.discount"; False)
Else 
	Form.btnProtect.Label(AJUI_btn_default; L10n("trTipUnprotected"))
	Form.btnProtectBanner.HideBanner()
	OBJECT SET VISIBLE(*; "RectProtect"; False)
	Form.btnProtect.PicturePath(AJUI_btn_default; "invoice_lock/3994412---key-lock-open-password-unlock.svg")
	OBJECT SET ENTERABLE(*; "invoice_ref_value"; True)
	OBJECT SET ENTERABLE(*; "amount_invoiced_value"; True)
	OBJECT SET ENTERABLE(*; "amount_payed_value"; True)
	OBJECT SET ENTERABLE(*; "rate_value"; True)
	OBJECT SET ENTERABLE(*; "end_value"; True)
	OBJECT SET ENTERABLE(*; "start_value"; True)
	OBJECT SET ENTERABLE(*; "invoice_date_value"; True)
	OBJECT SET ENTERABLE(*; "Form.discount"; True)
End if 

Form.btnProtect.Draw()
