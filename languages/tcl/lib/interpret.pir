=head1 interpret.imc

Given a pre-parsed chunk of Tcl, interpret it.

=cut

.namespace [ "_Tcl" ]

.sub __interpret
  .param pmc commands

  # our running return value, type
  .local int return_type
  return_type = TCL_OK
  .local pmc retval

  .local int elems, i
  elems = commands
  i     = 0

  .local pmc command
next_command:
  if i == elems goto done
  if return_type != TCL_OK goto done
  command = commands[i]
  (return_type, retval) = command.interpret()
  inc i
  goto next_command 

done:
  .return(return_type,retval)
.end
