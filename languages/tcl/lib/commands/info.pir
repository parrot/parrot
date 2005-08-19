=head2 [incr]

 Provide introspection about the tcl interpreter. (And by extension, parrot.) 

=cut

.namespace [ "Tcl" ]

.sub "&info"
  .local pmc argv, retval
  argv = foldup

  unless I3 goto bad_args

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc
  null subcommand_proc
 
  push_eh catch
    subcommand_proc = find_global "_Tcl\0builtins\0info", subcommand_name
resume:
  clear_eh 
  if_null subcommand_proc, bad_subcommand
  .return subcommand_proc(argv)

catch:
  goto resume

bad_subcommand:
  retval = new String

  retval = "bad option \""
  retval .= subcommand_name
  retval .= "\": must be args, body, cmdcount, commands, complete, default, exists, functions, globals, hostname, level, library, loaded, locals, nameofexecutable, patchlevel, procs, script, sharedlibextension, tclversion, or vars"

  .return(TCL_ERROR,retval)

bad_args:
  retval = new String
  retval = "wrong # args: should be \"info option ?arg arg ...?\""
  .return(TCL_ERROR,retval)
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
  .return(TCL_OK,$P2)

no_args:
  retval = new String
  retval = "\""
  retval .= procname
  retval .= "\" isn't a procedure"
  .return (TCL_OK,retval)

bad_args:
  retval = new String
  retval = "wrong # args: should be \"info args procname\""
  .return (TCL_ERROR,retval) 
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
  .return(TCL_OK,$P2)

no_body:
  retval = new String
  retval = "\""
  retval .= procname
  retval .= "\" isn't a procedure"
  .return (TCL_ERROR,retval)
 
bad_args:
  retval = new String
  retval = "wrong # args: should be \"info body procname\""
  .return (TCL_ERROR,retval) 
.end

.sub "functions"
  .param pmc argv

  .local int argc
  argc = argv
  if argc > 1 goto bad_args

  .local pmc math_funcs,iterator,retval

  math_funcs = find_global "_Tcl", "functions"
  iterator = new Iterator, math_funcs
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
  $P0 = new TclString
  $P0 = $S0
  push retval, $P0
pattern_next:
  if iterator goto pattern_loop
  .return(TCL_OK,retval) 

loop:
  $S0 = shift iterator
  $P0 = new TclString
  $P0 = $S0
  push retval, $P0
  if iterator goto loop
  .return(TCL_OK,retval) 

bad_args:
  retval = new String
  retval = "wrong # args: should be \"info functions ?pattern?\""
  .return (TCL_ERROR,retval) 
.end

.sub "exists"
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local string varname
  varname = argv[0]

  .local pmc value,retval
  null value

  push_eh global_catch
    value = find_global "Tcl", varname
global_resume:
  clear_eh 
  if_null value, lex
found_global:
  retval = new TclInt
  retval = 1
  .return(TCL_OK,retval)

global_catch:
  goto global_resume

lex:
  $P1 = find_global "_Tcl", "call_level"
  $I1 = $P1
  push_eh lex_catch
    value = find_lex $I1, varname
lex_resume:
  clear_eh 
  if_null value, nope
found_lex:
  retval = new TclInt
  retval = 1
  .return(TCL_OK,retval)

lex_catch:
  goto lex_resume

nope:
  retval = new TclInt
  retval = 0
  .return(TCL_OK,retval)

bad_args:
  retval = new String
  retval = "wrong # args: should be \"info exists varName\""
  .return (TCL_ERROR,retval) 
.end

.sub "tclversion"
  .param pmc argv
 
  .local int argc
  argc = argv

  if argc != 0 goto bad_args

  $P1 = find_global "Tcl", "$tcl_version"
  .return(TCL_OK,$P1) 

bad_args:
  $P1 = new String
  $P1 = "wrong # args: should be \"info tclversion\""
  .return (TCL_ERROR, $P1)

.end
