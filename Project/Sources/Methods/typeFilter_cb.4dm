//%attributes = {"shared":true}
  // typeFilter_cb ( params )
  // Breadcrumb callback. The method name is called by AJUI_BreadCrumb.

#DECLARE($params : Object)

Form.typeFilter:=Uppercase($params.type)
reloadInvoicesSelection
reloadListAndInputArea
