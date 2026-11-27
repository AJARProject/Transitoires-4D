#DECLARE()

var $evt : Integer
var $bc; $section_obj; $params : Object

$evt:=Form event code

Case of 
	: ($evt=On Load)
		$bc:={}
		$bc.templateName:="Debit-Credit"
		$bc.templatePath:=Get 4D folder(Current resources folder)+"Debit-Credit"+Folder separator
		Form.bc2:=New AJUI_BreadCrumb($bc)
		Form.bc2.Name("bc2")
		Form.bc2.SetCurrentSection("debit")
		
		$section_obj:={}
		$section_obj.onClickCB:="typeFilter_cb"
		$params:={}
		$params.type:="debit"
		$section_obj.label:=L10n_value("debit")  // display only, the id stays "debit"
		$section_obj.onClickCBParams:=OB Copy($params)
		Form.bc2.UpdateSection("debit"; $section_obj)
		
		$params.type:="credit"
		$section_obj.label:=L10n_value("credit")
		$section_obj.onClickCBParams:=OB Copy($params)
		Form.bc2.UpdateSection("credit"; $section_obj)
End case 

Form.bc2.Draw()
