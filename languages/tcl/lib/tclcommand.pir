.namespace [ "TclCommand" ]

.HLL "Tcl", "tcl_group"

# return codes
 .const int TCL_OK = 0
 .const int TCL_ERROR = 1
 .const int TCL_RETURN = 2
 .const int TCL_BREAK = 3
 .const int TCL_CONTINUE = 4
 
=head2 __class_init

Define the attributes required for the class.

=cut

.sub __class_init @LOAD
  $P0 = getclass "TclList"
  $P1 = subclass $P0, "TclCommand"
  addattribute $P1, "name"
.end

=head2 __init

Initialize the attributes for an instance of the class

=cut

.sub __init method
  $P0 = new TclString
  setattribute self, "TclCommand\x00name", $P0
.end

=head2 interpret

Execute the command.

=cut

.sub interpret method
  .local pmc retval
  .local int return_type
  return_type = TCL_OK
  
  .local string name
  $P0 = getattribute self, "TclCommand\x00name"
  (return_type, retval) = $P0.interpret()
  if return_type != TCL_OK goto done
  name = retval

  .local int elems, i
  elems = self
  i     = 0
  
  .local pmc cmd
  push_eh no_command
    $S0 = "&" . name
    cmd = find_global "Tcl", $S0
  clear_eh
  
  # we can't delete commands, so we store deleted commands
  # as null PMCs
  if_null cmd, no_command

execute:
  .local pmc args
  args = new TclList
  .local pmc word
loop:
  if i == elems goto loop_done
  
  word   = self[i]
  (return_type, retval) = word.interpret()
  if return_type != TCL_OK goto done
  
  push args, retval
  inc i
  goto loop
  
loop_done:
  (return_type, retval) = cmd(args :flat)

done: 
  .return(return_type, retval)

no_command:
  $P1 = find_global "Tcl", "$tcl_interactive"
  unless $P1 goto no_command_non_interactive

  # XXX Should probably make sure this wasn't redefined on us.
  cmd = find_global "Tcl", "&unknown"
  
  # Add the command into the unknown handler, and fix our bookkeeping
  unshift self, name
  inc elems
  goto execute

no_command_non_interactive:
  return_type = TCL_ERROR
  $S0 = "invalid command name \""
  $S0 .= name
  $S0 .= "\""
  retval = $S0
  goto done
.end
