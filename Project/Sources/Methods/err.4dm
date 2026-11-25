//%attributes = {}
  // err ()
  //
  // Error method installed by ON ERR CALL in print_selection_cb.
  // Copies the Error system variable so the caller can read it after
  // the command that failed. Execution then resumes on the next line.
  // This method does not call ABORT, so 4D does not show the error dialog.
  // Error is a system variable, not a command.
  // https://developer.4d.com/docs/21-R4/commands/on-err-call

#DECLARE()

gError:=Error
