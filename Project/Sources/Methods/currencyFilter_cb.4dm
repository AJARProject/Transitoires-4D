//%attributes = {"shared":true}
  // currencyFilter_cb ( params )
  // Breadcrumb callback. The method name is called by AJUI_BreadCrumb.

#DECLARE($params : Object)

Form.currencyFilter:=$params.currency
reloadInvoicesSelection
reloadListAndInputArea
