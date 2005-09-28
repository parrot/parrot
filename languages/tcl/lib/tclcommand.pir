.namespace [ "TclCommand" ]

.HLL "Tcl", "tcl_group"

.include "languages/tcl/lib/returncodes.pir"

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
 
  .local string name
  $P0 = getattribute self, "TclCommand\x00name"
  retval = $P0."interpret"()

  name = retval
  
  .local pmc args
  args = new TclList
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
  .local pmc word
loop:
  if i == elems goto loop_done
  
  word   = self[i]
  retval = word."interpret"()
  
  push args, retval
  inc i
  goto loop
  
loop_done:
  .return cmd(args :flat)

no_command:
  $P1 = find_global "Tcl", "$tcl_interactive"
  unless $P1 goto no_command_non_interactive

  # XXX Should probably make sure this wasn't redefined on us.
  cmd = find_global "Tcl", "&unknown"
  
  # Add the command into the unknown handler, and fix our bookkeeping
  unshift args, name
  goto execute

no_command_non_interactive:
  $S0 = "invalid command name \""
  $S0 .= name
  $S0 .= "\""
  .throw($S0)
.end
