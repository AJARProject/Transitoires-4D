#DECLARE()

var $evt : Integer
var $bc; $section_obj; $params : Object

$evt:=Form event code

Case of 
	: ($evt=On Load)
		$bc:={}
		$bc.templateName:="Currencies"
		$bc.templatePath:=Get 4D folder(Current resources folder)+"Currencies"+Folder separator
		Form.bc4:=New AJUI_BreadCrumb($bc)
		Form.bc4.Name("bc4")
		Form.bc4.RemoveCurrent()
		
		$section_obj:={}
		$section_obj.onClickCB:="setCurrency"
		$params:={}
		$params.currency:="Frs"
		$section_obj.label:=L10n_value("Frs")  // shows CHF, the stored value and the id stay "Frs"
		$section_obj.onClickCBParams:=OB Copy($params)
		Form.bc4.UpdateSection("Frs"; $section_obj)
		
		$params.currency:="€"
		$section_obj.label:="€"
		$section_obj.onClickCBParams:=OB Copy($params)
		Form.bc4.UpdateSection("€"; $section_obj)
		
		$params.currency:="$"
		$section_obj.label:="$"
		$section_obj.onClickCBParams:=OB Copy($params)
		Form.bc4.UpdateSection("$"; $section_obj)
End case 

Form.bc4.Draw()
