//%attributes = {}
  // Menu_build ()
  //
  // Builds the menu bar in memory (replaces "Barre #1" of the Menu editor at run
  // time): File, Edit, Language, Mode. A menu created with Create menu is shared:
  // any change is carried over at once to every process, which lets the
  // Language menu retranslate the menus in place.
  // Standard action names are those 4D writes in menus.json for Barre #1.
  // https://developer.4d.com/docs/21-R4/commands/create-menu
  // https://developer.4d.com/docs/21-R4/commands/set-menu-item-property
  // https://developer.4d.com/docs/21-R4/commands/set-menu-item-shortcut

#DECLARE()

var $file; $edit; $language; $mode : Text

<>menu_texts:=[]

$file:=Create menu
Menu_addItem($file; "trMenuTransitoires")
SET MENU ITEM METHOD($file; -1; "Input_call")
Menu_addItem($file; "trMenuTestData")
SET MENU ITEM METHOD($file; -1; "DEV_seedFakeData")
APPEND MENU ITEM($file; "-")
Menu_addItem($file; "trMenuItemQuit")
SET MENU ITEM PROPERTY($file; -1; Associated standard action; "quit")
SET MENU ITEM SHORTCUT($file; -1; "Q"; 0)

$edit:=Create menu
Menu_addItem($edit; "trMenuItemUndo")
SET MENU ITEM PROPERTY($edit; -1; Associated standard action; "undo")
SET MENU ITEM SHORTCUT($edit; -1; "Z"; 0)
APPEND MENU ITEM($edit; "-")
Menu_addItem($edit; "trMenuItemCut")
SET MENU ITEM PROPERTY($edit; -1; Associated standard action; "cut")
SET MENU ITEM SHORTCUT($edit; -1; "X"; 0)
Menu_addItem($edit; "trMenuItemCopy")
SET MENU ITEM PROPERTY($edit; -1; Associated standard action; "copy")
SET MENU ITEM SHORTCUT($edit; -1; "C"; 0)
Menu_addItem($edit; "trMenuItemPaste")
SET MENU ITEM PROPERTY($edit; -1; Associated standard action; "paste")
SET MENU ITEM SHORTCUT($edit; -1; "V"; 0)
Menu_addItem($edit; "trMenuItemClear")
SET MENU ITEM PROPERTY($edit; -1; Associated standard action; "clear")
Menu_addItem($edit; "trMenuItemSelectAll")
SET MENU ITEM PROPERTY($edit; -1; Associated standard action; "selectAll")
SET MENU ITEM SHORTCUT($edit; -1; "A"; 0)
APPEND MENU ITEM($edit; "-")
Menu_addItem($edit; "trMenuItemShowClipboard")
SET MENU ITEM PROPERTY($edit; -1; Associated standard action; "showClipboard")

  // Language: Automatic, then each language named in its own language.
  // The item parameter is the choice read by Language_menu.
$language:=Create menu
Menu_addItem($language; "trMenuLanguageAuto")
SET MENU ITEM METHOD($language; -1; "Language_menu")
SET MENU ITEM PARAMETER($language; -1; "auto")
APPEND MENU ITEM($language; "-")
Menu_addItem($language; "trLanguageNameFr")
SET MENU ITEM METHOD($language; -1; "Language_menu")
SET MENU ITEM PARAMETER($language; -1; "fr")
Menu_addItem($language; "trLanguageNameDe")
SET MENU ITEM METHOD($language; -1; "Language_menu")
SET MENU ITEM PARAMETER($language; -1; "de")
Menu_addItem($language; "trLanguageNameIt")
SET MENU ITEM METHOD($language; -1; "Language_menu")
SET MENU ITEM PARAMETER($language; -1; "it")
Menu_addItem($language; "trLanguageNameEn")
SET MENU ITEM METHOD($language; -1; "Language_menu")
SET MENU ITEM PARAMETER($language; -1; "en")

$mode:=Create menu
Menu_addItem($mode; "trMenuItemDesign")
SET MENU ITEM PROPERTY($mode; -1; Associated standard action; "design")

<>menu_language:=$language
<>menu_bar:=Create menu
Menu_addItem(<>menu_bar; "trMenuFile"; $file)
Menu_addItem(<>menu_bar; "trMenuEdit"; $edit)
Menu_addItem(<>menu_bar; "trMenuLanguage"; $language)
Menu_addItem(<>menu_bar; "trMenuMode"; $mode)
