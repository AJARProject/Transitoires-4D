#DECLARE()

var $evt : Integer
var $bc; $section_obj; $params : Object

$evt:=Form event code

Case of 
	: ($evt=On Load)
		$bc:={}
		$bc.templateName:="Debit-Credit"
		$bc.templatePath:=Get 4D folder(Current resources folder)+"Debit-Credit"+Folder separator
		Form.bc1:=New AJUI_BreadCrumb($bc)
		Form.bc1.Name("bc1")
		Form.bc1.RemoveCurrent()
		
		$section_obj:={}
		$section_obj.onClickCB:="setType"
		$params:={}
		$params.type:="debit"
		$section_obj.onClickCBParams:=OB Copy($params)
		Form.bc1.UpdateSection("debit"; $section_obj)
		
		$params.type:="credit"
		$section_obj.onClickCBParams:=OB Copy($params)
		Form.bc1.UpdateSection("credit"; $section_obj)
End case 

Form.bc1.Draw()
