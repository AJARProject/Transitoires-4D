//%attributes = {}
  // Language_prefsFile () -> file
  //
  // Per-user preference file, outside the structure and the data:
  // <user preferences folder of 4D>/Transitoires/preferences.json
  // (on macOS ~/Library/Application Support/4D/Transitoires/preferences.json).
  // https://developer.4d.com/docs/21-R4/commands/folder (fk user preferences folder)

#DECLARE() -> $file : 4D.File

$file:=Folder(fk user preferences folder).folder("Transitoires").file("preferences.json")
