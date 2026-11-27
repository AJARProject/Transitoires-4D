//%attributes = {}
  // Language_startup ()
  //
  // Called at the very start of On Startup, before any form or menu bar is
  // loaded: applies the language saved by the user (Language menu), or the
  // automatic choice when nothing is saved.
  // SET DATABASE LOCALIZATION only affects what is displayed after the call:
  // https://developer.4d.com/docs/21-R4/commands/set-database-localization

#DECLARE()

Language_apply(Language_getChoice)
