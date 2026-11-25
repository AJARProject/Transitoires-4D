//%attributes = {"shared":true}
  // AJUI_Tip_getSubFormSize ( formName ; width ; height )
  //
  // Called by name from the AJUI_Tip component. Must stay shared.
  // Writes the form width and height through the two pointers.

#DECLARE($formName : Text; $width : Pointer; $height : Pointer)

FORM GET PROPERTIES($formName; $width->; $height->)
