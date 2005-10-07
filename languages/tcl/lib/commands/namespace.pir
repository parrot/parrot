=head2 [namespace]

Parrot has its own namespaces which Tcl is only a part of. So, in the top
level parrot namespace, C<Tcl> refers to the top of the Tcl namespace.

To refer back to something in another parrot namespace, use the special
C<parrot> namespace inside Tcl - this should be an alias back to parrot's
real top level namespace.

=cut

.namespace [ "Tcl" ]

.sub "&namespace"
   .param pmc argv :slurpy

  .local pmc retval

  $I3 = argv
  unless $I3 goto no_args

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc
  null subcommand_proc

  push_eh catch
    subcommand_proc = find_global "_Tcl\0builtins\0namespace", subcommand_name
  clear_eh
resume:
  if_null subcommand_proc, bad_args
  .return subcommand_proc(argv)

catch:
  goto resume

bad_args:
  $S0 = "bad option \""
  $S0 .= subcommand_name
  $S0 .= "\": must be children, code, current, delete, eval, exists, export, forget, import, inscope, origin, parent, qualifiers, tail, or which"
  .throw ($S0)

no_args:
  .throw ("wrong # args: should be \"namespace subcommand ?arg ...?\"")

.end

.namespace [ "_Tcl\0builtins\0namespace" ]

# TODO: hey, this is cheating!
.sub "current"
  .param pmc argv

  .local int argc
  argc = argv
  if argc goto bad_args

  .return("::")

bad_args:
  .throw ("wrong # args: should be \"namespace current\"")

.end

.sub "delete"
  .param pmc argv

  .local int argc
  argc = argv
  if argc !=0  goto not_done

  # No arg delete does nothing.
  .return("")

not_done:
  .throw ("XXX")
.end

.sub "exists" # XXX
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_args
  # canonicalize namespace.
  .return(0)

bad_args:
  .throw("wrong # args: should be \"namespace exists name\"" )
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
  $P1 = new .String
  $P1 = "0"  

  $P2 = $P0."__get_pmc_keyed"($P1)
  
  $S1 = $P2
  .return ($S1)

WHOLE:
  $P0 = argv[0]
  .return($P0)

  bad_args:
  .throw ("wrong # args: should be \"namespace qualifiers string\"")

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
  $P1 = new .String
  $P1 = "0"  

  $P2 = $P0."__get_pmc_keyed"($P1)
  
  $S1 = $P2
  .return ($S1)

WHOLE:
  $P0 = argv[0]
  .return($P0)

  bad_args:
  .throw ("wrong # args: should be \"namespace tail string\"")

.end
