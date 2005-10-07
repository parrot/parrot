=head2 [incr]

 Provide introspection about the tcl interpreter. (And by extension, parrot.)

=cut

.namespace [ "Tcl" ]

.sub "&info"
  .param pmc argv :slurpy

  .local int argc
  argc = argv
  unless argc goto bad_args

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc
  null subcommand_proc

  push_eh catch
    subcommand_proc = find_global "_Tcl\0builtins\0info", subcommand_name
  clear_eh
resume:
  if_null subcommand_proc, bad_subcommand
  .return subcommand_proc(argv)

catch:
  goto resume

bad_subcommand:
  $S0  = "bad option \""
  $S0 .= subcommand_name
  $S0 .= "\": must be args, body, cmdcount, commands, complete, default, exists, functions, globals, hostname, level, library, loaded, locals, nameofexecutable, patchlevel, procs, script, sharedlibextension, tclversion, or vars"

  .throw ($S0)

bad_args:
  .throw("wrong # args: should be \"info option ?arg arg ...?\"")
.end

.namespace [ "_Tcl\0builtins\0info" ]

.sub "args"
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local pmc retval

  .local string procname
  procname = shift argv
  $P1 = find_global "_Tcl", "proc_args"
  $P2 = $P1[procname]
  if_null $P2, no_args
  .return($P2)

no_args:
  $S0 = "\""
  $S0 .= procname
  $S0 .= "\" isn't a procedure"
  .throw ($S0)

bad_args:
  .throw ("wrong # args: should be \"info args procname\"")
.end

.sub "body"
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local pmc retval

  .local string procname
  procname = argv[0]
  $P1 = find_global "_Tcl", "proc_body"
  $P2 = $P1[procname]
  if_null $P2, no_body
  .return($P2)

no_body:
  $S0 = "\""
  $S0 .= procname
  $S0 .= "\" isn't a procedure"
  .throw ($S0)

bad_args:
  .throw ("wrong # args: should be \"info body procname\"")
.end

.sub "functions"
  .param pmc argv

  .local int argc
  argc = argv
  if argc > 1 goto bad_args

  .local pmc math_funcs,iterator,retval

  math_funcs = find_global "_Tcl", "functions"
  iterator = new .Iterator, math_funcs
  iterator = 0
  retval = new .TclList

  if argc == 0 goto loop
  .local pmc globber,rule,match
  globber = find_global "PGE", "glob"
  $S1 = argv[0]
  rule = globber($S1)
pattern_loop:
  $S0 = shift iterator
  match = rule($S0)
  unless match goto pattern_next
  $P0 = new .TclString
  $P0 = $S0
  push retval, $P0
pattern_next:
  if iterator goto pattern_loop
  .return(retval)

loop:
  $S0 = shift iterator
  $P0 = new .TclString
  $P0 = $S0
  push retval, $P0
  if iterator goto loop
  .return(retval)

bad_args:
  .throw ("wrong # args: should be \"info functions ?pattern?\"")
.end

.sub "exists"
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local string varname
  varname = argv[0]

  .local pmc find_var
  find_var = find_global "_Tcl", "__find_var"
  .local pmc found_var
  found_var = find_var(varname)
  if_null found_var, not_found

  .return (1)
not_found:
  .return (0)

bad_args:
  .throw ("wrong # args: should be \"info exists varName\"")
.end

.sub "tclversion"
  .param pmc argv

  .local int argc
  argc = argv

  if argc != 0 goto bad_args

  $P1 = find_global "Tcl", "$tcl_version"
  .return($P1)

bad_args:
  .throw ("wrong # args: should be \"info tclversion\"")

.end

#XXX sharedlibextension - should be able to pull this from parrot config.
#XXX level - just return call level. (optional level is hard.)
#XXX globals - should be doable. - just walk the "Tcl" namespace.
#XXX default - watch out for return value and default value.
#XXX cmdcount - not being tracked. :(
