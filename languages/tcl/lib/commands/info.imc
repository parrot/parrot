=head2 [incr]

 Provide introspection about the tcl interpreter. (And by extension, parrot.) 

=cut

.namespace [ "Tcl" ]

.sub "info"
  .local pmc argv, retval
  argv = foldup

  unless I3 goto bad_subcommand

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc
  null subcommand_proc
 
  push_eh catch
    subcommand_proc = find_global "_Tcl\0builtins\0info", subcommand_name
resume:
  clear_eh 
  isnull subcommand_proc, bad_args
  .return subcommand_proc(argv)

catch:
  goto resume

bad_args:
  retval = new String

  retval = "bad option \""
  retval .= subcommand_name
  retval .= "\": must be args, body, cmdcount, commands, complete, default, exists, functions, globals, hostname, level, library, loaded, locals, nameofexecutable, patchlevel, procs, script, sharedlibextension, tclversion, or vars\n"

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
  isnull $P2, no_args
  .return(TCL_OK,$P2)

no_args:
  retval = new String
  retval = "\""
  retval .= procname
  retval .= "\" isn't a procedure"
  .return (TCL_OK,retval)

bad_args:
  retval = new String
  retval = "wrong # args: should be \"info args procname\"\n"
  .return (TCL_ERROR,retval) 

.end

.sub "body"
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local pmc retval

  .local string procname
  procname = shift argv
  $P1 = find_global "_Tcl", "proc_body"
  $P2 = $P1[procname]
  isnull $P2, no_body
  .return(TCL_OK,$P2)

no_body:
  retval = new String
  retval = "\""
  retval .= procname
  retval .= "\" isn't a procedure"
  .return (TCL_OK,retval)
 
bad_args:
  retval = new String
  retval = "wrong # args: should be \"info body procname\"\n"
  .return (TCL_ERROR,retval) 
.end

# XXX not dealing with ?pattern? right now..
.sub "functions"
  .param pmc argv

  .local pmc math_funcs,iterator,retval
  .local int argc
  argc = argv
  if argc != 0 goto bad_args

  math_funcs = find_global "_Tcl", "functions"
  iterator = new Iterator, math_funcs
  iterator = 0
  retval = new TclList

loop:
  $S0 = shift iterator
  push retval, $S0
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
  varname = shift argv
  .local pmc value,retval
  null value
  retval = new TclInt
  push_eh global_catch
    $P1 = find_global "Tcl", varname
global_resume:
  clear_eh 
  isnull $P1, lex
  retval = 1
  .return(TCL_OK,retval)

global_catch:
  goto global_resume

lex:
  $P1 = find_global "_Tcl", "call_level"
  $I1 = $P1
  push_eh lex_catch
    $P1 = find_lex $I1, varname
lex_resume:
  clear_eh 
  isnull $P1, nope
  retval = 1
  .return(TCL_OK,retval)

lex_catch:
  goto lex_resume

nope:
  retval = 0
  .return(TCL_OK,retval)

bad_args:
  retval = new String
  retval = "wrong # args: should be \"info exists varName\"\n"
  .return (TCL_ERROR,retval) 
.end

#XXX no error handling yet.
.sub "tclversion"
  $P1 = find_global "Tcl", "tcl_version"
  .return(TCL_OK,$P1) 
.end
