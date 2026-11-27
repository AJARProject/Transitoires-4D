//%attributes = {}
  // Menu_addItem ( menu ; key {; subMenu} )
  //
  // Appends an item whose text is the XLIFF key in the current language and
  // records (menu, item, key) so that Menu_applyTexts can translate it again.
  // The * parameter turns off metacharacters ( ; ( ! / < ) in the translated text.
  // https://developer.4d.com/docs/21-R4/commands/append-menu-item

#DECLARE($menu : Text; $key : Text; $subMenu : Text)

APPEND MENU ITEM($menu; L10n($key); $subMenu; 0; *)
<>menu_texts.push({menu: $menu; item: Count menu items($menu); key: $key})
