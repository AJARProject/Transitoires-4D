//%attributes = {}
  // compiler_variables ()
  //
  // One declaration for every process or interprocess variable that is
  // not already typed by a form object. A second var of the same name
  // is compiler warning 520.19 (retyping) in 4D 21 R4.

#DECLARE()

var vSearch : Text
var <>allInvoices_selection : Collection
var <>invoice_count; <>tot_amount_invoiced; <>tot_amount_payed; <>amount_this_year; <>amount_next_year : Real
var <>isFrs : Boolean
var <>print_label; <>page; <>total : Text
var <>days_currentYear_title; <>days_nextYear_title : Text
var <>amount_currentYear_title; <>amount_nextYear_title : Text
var gError : Integer
var UT_failureCount : Integer
var FLabel_templateMissing : Boolean
var <>language_choice : Text
var <>menu_bar; <>menu_language : Text
var <>menu_texts; <>input_windows : Collection
var vInput_reopen : Boolean
