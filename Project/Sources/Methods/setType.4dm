//%attributes = {"shared":true}
  // setType ( params )
  // Breadcrumb callback. The method name is called by AJUI_BreadCrumb.

#DECLARE($params : Object)

Form.currentInvoice.type:=$params.type
Form.btnSave.Enable(True)
