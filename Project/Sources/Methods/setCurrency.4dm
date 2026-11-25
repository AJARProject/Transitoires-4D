//%attributes = {"shared":true}
  // setCurrency ( params )
  // Breadcrumb callback. The method name is called by AJUI_BreadCrumb.

#DECLARE($params : Object)

Form.currentInvoice.currency:=$params.currency
Form.btnSave.Enable(True)
