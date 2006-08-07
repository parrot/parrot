=head2 [incr]

 Provide introspection about the tcl interpreter. (And by extension, parrot.)

=cut

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&info'
  .param pmc argv :slurpy

  .local int argc
  argc = argv
  unless argc goto bad_args

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc
  null subcommand_proc

  push_eh bad_subcommand
    subcommand_proc = get_root_global ['_tcl';'helpers';'info'], subcommand_name
  clear_eh

  .return subcommand_proc(argv)

bad_subcommand:
  $S0  = 'bad option "'
  $S0 .= subcommand_name
  $S0 .= '": must be args, body, cmdcount, commands, complete, default, exists, functions, globals, hostname, level, library, loaded, locals, nameofexecutable, patchlevel, procs, script, sharedlibextension, tclversion, or vars'

  .throw ($S0)

bad_args:
  .throw('wrong # args: should be "info option ?arg arg ...?"')
.end

.HLL '_Tcl', ''
.namespace [ 'helpers'; 'info' ]

.sub 'args'
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local pmc retval

  .local string procname
  procname = shift argv
  $P1 = get_root_global ['_tcl'], 'proc_args'
  $P2 = $P1[procname]
  if_null $P2, no_args
  .return($P2)

no_args:
  $S0 = '"'
  $S0 .= procname
  $S0 .= "\" isn't a procedure"
  .throw ($S0)

bad_args:
  .throw ('wrong # args: should be "info args procname"')
.end

.sub 'body'
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local pmc retval

  .local string procname
  procname = argv[0]
  $P1 = get_root_global ['_tcl'], 'proc_body'
  $P2 = $P1[procname]
  if_null $P2, no_body
  .return($P2)

no_body:
  $S0 = '"'
  $S0 .= procname
  $S0 .= "\" isn't a procedure"
  .throw ($S0)

bad_args:
  .throw ('wrong # args: should be "info body procname"')
.end

.sub 'functions'
  .param pmc argv

  .local int argc
  argc = argv
  if argc > 1 goto bad_args

  .local pmc mathfunc,iterator,retval

  mathfunc = get_root_namespace ['tcl'; 'tcl'; 'mathfunc']
  iterator = new .Iterator, mathfunc
  iterator = 0
  retval = new .TclList

  if argc == 0 goto loop
  .local pmc globber,rule,match
  globber = compreg 'PGE::Glob'
  $S1 = argv[0]
  $S1 = '&' . $S1
  rule = globber($S1)
pattern_loop:
  unless iterator goto pattern_end
  $S0 = shift iterator
  $P0 = mathfunc[$S0]
  $I0 = isa $P0, 'Sub'
  unless $I0 goto pattern_loop
  match = rule($S0)
  unless match goto pattern_loop
  $P0 = new .TclString
  $S1 = substr $S0, 1
  $P0 = $S1
  push retval, $P0
pattern_end:
  .return(retval)

loop:
  $S0 = shift iterator
  $P0 = new .TclString
  $S1 = substr $S0, 1
  $P0 = $S1
  push retval, $P0
  if iterator goto loop
  .return(retval)

bad_args:
  .throw ('wrong # args: should be "info functions ?pattern?"')
.end

.sub 'commands'
    .param pmc argv

    .local int argc
    argc = argv
    if argc > 1 goto bad_args
    .local pmc matching 
    null matching
    if argc ==0 goto done_setup

    $P1 = compreg 'PGE::Glob'
    .local string pattern
    pattern = argv[0]
    matching = $P1(pattern)

  done_setup:
    .local pmc result
    result = new 'TclList'

    .local pmc ns
    ns = get_root_global 'tcl'
  
    .local pmc iter
    iter = new 'Iterator', ns
  iter_loop:
     unless iter goto iter_loop_end
     $S1 = shift iter
     $S2 = substr $S1, 0, 1
     unless $S2 == '&' goto iter_loop
     $S1 = substr $S1, 1
     if_null matching, add_result
     $P2 = matching($S1)
     unless $P2 goto iter_loop
  add_result: 
     push result, $S1
     goto iter_loop 
  iter_loop_end:

    .return(result)

  bad_args:
    .throw('wrong # args: should be "info commands ?pattern?"')

.end

.sub 'exists'
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local string varname
  varname = argv[0]

  .local pmc find_var, found_var
  find_var  = get_root_global ['_tcl'], '__find_var'
  found_var = find_var(varname)
  if null found_var goto not_found

  .return (1)
not_found:
  .return (0)

bad_args:
  .throw ('wrong # args: should be "info exists varName"')
.end

.sub 'tclversion'
  .param pmc argv

  .local int argc
  argc = argv

  if argc != 0 goto bad_args

  $P1 = get_root_global ['tcl'], '$tcl_version'
  .return($P1)

bad_args:
  .throw ('wrong # args: should be "info tclversion"')

.end

#XXX sharedlibextension - should be able to pull this from parrot config.
#XXX level - just return call level. (optional level is hard.)
#XXX globals - should be doable. - just walk the "Tcl" namespace.
#XXX default - watch out for return value and default value.
#XXX cmdcount - not being tracked. :(
