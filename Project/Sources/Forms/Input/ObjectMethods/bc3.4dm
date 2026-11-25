#DECLARE()

var $evt : Integer
var $bc; $section_obj; $params : Object

$evt:=Form event code

Case of 
	: ($evt=On Load)
		$bc:={}
		$bc.templateName:="Currencies"
		$bc.templatePath:=Get 4D folder(Current resources folder)+"Currencies"+Folder separator
		Form.bc3:=New AJUI_BreadCrumb($bc)
		Form.bc3.Name("bc3")
		Form.bc3.SetCurrentSection("Frs")
		
		$section_obj:={}
		$section_obj.onClickCB:="currencyFilter_cb"
		$params:={}
		$params.currency:="Frs"
		$section_obj.onClickCBParams:=OB Copy($params)
		Form.bc3.UpdateSection("Frs"; $section_obj)
		
		$params.currency:="€"
		$section_obj.onClickCBParams:=OB Copy($params)
		Form.bc3.UpdateSection("€"; $section_obj)
		
		$params.currency:="$"
		$section_obj.onClickCBParams:=OB Copy($params)
		Form.bc3.UpdateSection("$"; $section_obj)
End case 

Form.bc3.Draw()
