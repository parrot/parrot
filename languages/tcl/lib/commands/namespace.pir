=head2 [namespace]

Parrot has its own namespaces which Tcl is only a part of. So, in the top
level parrot namespace, C<Tcl> refers to the top of the Tcl namespace.

To refer back to something in another parrot namespace, use the special
C<parrot> namespace inside Tcl - this should be an alias back to parrot's
real top level namespace.

=cut

.namespace [ "Tcl" ]

.sub "&namespace"
  .local pmc argv, retval
  argv = foldup

  unless I3 goto no_args

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc
  null subcommand_proc

  push_eh catch
    subcommand_proc = find_global "_Tcl\0builtins\0namespace", subcommand_name
resume:
  clear_eh
  if_null subcommand_proc, bad_args
  .return subcommand_proc(argv)

catch:
  goto resume

bad_args:
  retval = new String

  retval = "bad option \""
  retval .= subcommand_name
  retval .= "\": must be children, code, current, delete, eval, exists, export, forget, import, inscope, origin, parent, qualifiers, tail, or which"
  .return(TCL_ERROR,retval)

no_args:
  retval = new String
  retval = "wrong # args: should be \"namespace subcommand ?arg ...?\""
  .return (TCL_ERROR, retval)

.end

.namespace [ "_Tcl\0builtins\0namespace" ]

# TODO: hey, this is cheating!
.sub "current"
  .param pmc argv

  .local int argc
  argc = argv
  if argc goto bad_args

  $P1 = new TclString
  $P1 = "::"
  .return(TCL_OK,$P1)

bad_args:
  $P1 = new TclString
  $P1 = "wrong # args: should be \"namespace current\"" 
  .return(TCL_ERROR, $P1)

.end

.sub "delete"
  .param pmc argv
  
  .local int argc
  argc = argv
  if argc !=0  goto not_done
 
  # No arg delete does nothing.
  $P1 = new String
  $P1 = ""
  .return(TCL_OK,$P1)

not_done:
  $P1 = new String
  $P1 = "XXX: eek"
  .return (TCL_ERROR,$P1)
.end

.sub "exists" # XXX 
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_args
  # canonicalize namespace.
  $P1 = new TclInt
  $P1 = 0
  .return(TCL_OK,$P1)

bad_args:
  $P1 = new TclString
  $P1 = "wrong # args: should be \"namespace exists name\"" 
  .return(TCL_ERROR, $P1)
.end

.sub "qualifiers"
  .param pmc argv
  
  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local pmc p6r,match
  p6r = find_global "PGE", "p6rule"
  match = p6r("(.*)\:\:+<-[:]>*$$")

  $S0 = argv[0]
  $P0 = match($S0)
  unless $P0 goto WHOLE

  # XXX pre leo-ctx5 this requires a PMC arg, but we can switch later
  $P1 = new String
  $P1 = "0"  

  $P2 = $P0."__get_pmc_keyed"($P1)
  
  $S1 = $P2
  $P3 = new String
  $P3 = $S1
  .return (TCL_OK,$P3)

WHOLE:
  $P0 = argv[0]
  .return(TCL_OK,$P0)

  bad_args:
  $P1 = new String
  $P1 = "wrong # args: should be \"namespace qualifiers string\""
  .return (TCL_ERROR,$P1)

.end

.sub "tail"
  .param pmc argv
  
  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local pmc p6r,match
  p6r = find_global "PGE", "p6rule"
  match = p6r("\:\:+(<-[:]>)$$")

  $S0 = argv[0]
  $P0 = match($S0)
  unless $P0 goto WHOLE

  # XXX pre leo-ctx5 this requires a PMC arg, but we can switch later
  $P1 = new String
  $P1 = "0"  

  $P2 = $P0."__get_pmc_keyed"($P1)
  
  $S1 = $P2
  $P3 = new String
  $P3 = $S1
  .return (TCL_OK,$P3)

WHOLE:
  $P0 = argv[0]
  .return(TCL_OK,$P0)

  bad_args:
  $P1 = new String
  $P1 = "wrong # args: should be \"namespace tail string\""
  .return (TCL_ERROR,$P1)

.end
