=head2 [incr]

 Provide introspection about the tcl interpreter. (And by extension, parrot.)

=cut

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&info'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  unless argc goto bad_args

  .local string subcommand_name
  subcommand_name = shift argv

  .local pmc options
  options = new .ResizablePMCArray
  push options, 'args'
  push options, 'body'
  push options, 'cmdcount'
  push options, 'commands'
  push options, 'complete'
  push options, 'default'
  push options, 'exists'
  push options, 'frame'
  push options, 'functions'
  push options, 'globals'
  push options, 'hostname'
  push options, 'level'
  push options, 'library'
  push options, 'loaded'
  push options, 'locals'
  push options, 'nameofexecutable'
  push options, 'patchlevel'
  push options, 'procs'
  push options, 'script'
  push options, 'sharedlibextension'
  push options, 'tclversion'
  push options, 'vars'

  .local pmc select_option
  select_option  = get_root_global ['_tcl'], 'select_option'
  .local string canonical_subcommand
  canonical_subcommand = select_option(options, subcommand_name)

  .local pmc subcommand_proc
  null subcommand_proc

  subcommand_proc = get_root_global ['_tcl';'helpers';'info'], canonical_subcommand
  if null subcommand_proc goto bad_subcommand

  .return subcommand_proc(argv)

bad_subcommand:
  .return ('') # once all commands are implemented, remove this...

 bad_args:
  tcl_error 'wrong # args: should be "info option ?arg arg ...?"'
.end

.HLL '_Tcl', ''
.namespace [ 'helpers'; 'info' ]

.sub 'args'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc != 1 goto bad_args

  .local pmc retval

  .local string procname
  procname = shift argv

  .local pmc __namespace
  __namespace = get_root_global ['_tcl'], '__namespace'

  .local pmc    ns
  .local string name
  ns   = __namespace(procname)
  name = pop ns
  name = '&' . name

  unshift ns, 'tcl'
  $P1 = get_root_global ns, name
  if null $P1 goto no_args

  $P2 = getattribute $P1, 'args'
  if null $P2 goto no_args
  .return($P2)

  .return($P2)

no_args:
  $S0 = '"'
  $S0 .= procname
  $S0 .= "\" isn't a procedure"
  tcl_error $S0

bad_args:
  tcl_error 'wrong # args: should be "info args procname"'
.end

.sub 'body'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc != 1 goto bad_args

  .local string procname
  procname = argv[0]

  .local pmc __namespace
  __namespace = get_root_global ['_tcl'], '__namespace'

  .local pmc    ns
  .local string name
  ns   = __namespace(procname)
  name = pop ns
  name = '&' . name

  unshift ns, 'tcl'
  $P1 = get_root_global ns, name
  if null $P1 goto no_body
  $P2 = getattribute $P1, 'HLL_source'
  if null $P2 goto no_body
  .return($P2)

no_body:
  $S0 = '"'
  $S0 .= procname
  $S0 .= "\" isn't a procedure"
  tcl_error $S0

bad_args:
  tcl_error 'wrong # args: should be "info body procname"'
.end

.sub 'complete'
  .param pmc argv
  .local int argc
  argc = elements argv
  if argc != 1 goto bad_args

  .local pmc body
  body = argv[0]
  push_eh nope
    $P1 = __script(body)
  clear_eh
  .return(1)
 
nope:
  get_results '(0,0)', $P0, $S0
  if $S0 == 'missing close-brace'   goto fail
  if $S0 == 'missing close-bracket' goto fail
  if $S0 == 'missing "'             goto fail
  rethrow $P0

fail:
  .return(0)
 
bad_args:
  tcl_error 'wrong # args: should be "info complete command"'
.end

.sub 'default'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc != 3 goto bad_args

  .local pmc retval

  .local string procname, argname, varname
  procname = argv[0]
  argname  = argv[1]
  varname  = argv[2]

  .local pmc __set
  __set = get_root_global ['_tcl'], '__set'

  .local pmc __namespace
  __namespace = get_root_global ['_tcl'], '__namespace'

  .local pmc    ns
  .local string name
  ns   = __namespace(procname)
  name = pop ns
  name = '&' . name

  unshift ns, 'tcl'
  $P1 = get_root_global ns, name
  if null $P1 goto not_proc

  $P2 = getattribute $P1, 'defaults'
  $P9 = getattribute $P1, 'args'
  if null $P2 goto check_arg

  $P3 = $P2[argname]
  if_null $P3, check_arg
  push_eh error_on_set
    __set(varname, $P3) 
  clear_eh

  # store in variable
  .return (1)

check_arg:
  # there's no default. is there even an arg?
  $P3 = __list($P9)
  $P4 = new .Iterator, $P3
loop:
  unless $P4 goto not_argument 
  $S1 = shift $P4
  if $S1==argname goto no_default 
  goto loop

not_argument:
  $S0 = 'procedure "'
  $S0 .= procname
  $S0 .= "\" doesn't have an argument \""
  $S0 .= argname
  $S0 .= '"' 
  tcl_error $S0

no_default:
  push_eh error_on_set
    __set(varname, '') 
  clear_eh
  .return (0)

error_on_set:
  $S0 = "couldn't store default value in variable \""
  $S0 .= varname
  $S0 .= '"'
  tcl_error $S0

not_proc:
  $S0 = '"'
  $S0 .= procname
  $S0 .= "\" isn't a procedure"
  tcl_error $S0


bad_args:
  tcl_error 'wrong # args: should be "info default procname arg varname"'
.end


.sub 'functions'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc > 1 goto bad_args

  .local pmc mathfunc,iterator,retval

  mathfunc = get_root_namespace ['tcl'; 'tcl'; 'mathfunc']
  iterator = new .Iterator, mathfunc
  iterator = 0
  retval = new .TclList

  .local pmc globber,rule,match
  globber = compreg 'PGE::Glob'
  if argc == 1 goto got_glob
  $S1 = '&*'
  goto compile
got_glob:
  $S1 = argv[0]
  $S1 = '&' . $S1
compile:
  rule = globber.'compile'($S1)
loop:
  unless iterator goto end
  $S0 = shift iterator
  $P0 = mathfunc[$S0]
  match = rule($S0)
  unless match goto loop
  $S1 = substr $S0, 1
  push retval, $S1
  goto loop
end:
  .return(retval)

bad_args:
  tcl_error 'wrong # args: should be "info functions ?pattern?"'
.end

.sub 'commands'
    .param pmc argv

    .local int argc
    argc = elements argv
    if argc > 1 goto bad_args
    .local pmc matching 
    null matching
    if argc ==0 goto done_setup

    $P1 = compreg 'PGE::Glob'
    .local string pattern
    pattern = argv[0]

    # cheat and just remove a leading "::" for now
    $S0 = substr pattern, 0, 2
    if $S0 != "::" goto create_glob
    $S0 = substr pattern, 0, 2, ''

  create_glob:
    matching = $P1.'compile'(pattern)

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
    tcl_error 'wrong # args: should be "info commands ?pattern?"'

.end

.sub 'exists'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc != 1 goto bad_args

  .local string varname
  varname = argv[0]

  .local pmc __read, found_var
  __read  = get_root_global ['_tcl'], '__read'
  push_eh not_found
    found_var = __read(varname)
  clear_eh
  .return (1)

not_found:
  .return (0)

bad_args:
  tcl_error 'wrong # args: should be "info exists varName"'
.end

.sub 'tclversion'
  .param pmc argv

  .local int argc
  argc = elements argv

  if argc != 0 goto bad_args

  $P1 = get_root_global ['tcl'], '$tcl_version'
  .return($P1)

bad_args:
  tcl_error 'wrong # args: should be "info tclversion"'

.end

.sub 'patchlevel'
  .param pmc argv

  .local int argc
  argc = elements argv

  if argc != 0 goto bad_args

  $P1 = get_root_global ['tcl'], '$tcl_patchLevel'
  .return($P1)

bad_args:
  tcl_error 'wrong # args: should be "info patchlevel"'

.end

.sub 'library'
  .param pmc argv

  .local int argc
  argc = elements argv

  if argc != 0 goto bad_args

  $P1 = get_root_global ['tcl'], '$tcl_library'
  .return($P1)

bad_args:
  tcl_error 'wrong # args: should be "info library"'

.end

.sub 'vars'
  .param pmc argv

  .local int argc
  argc = elements argv

  if argc == 0 goto iterate
  if argc > 1  goto bad_args

iterate:
  .local pmc call_chain, lexpad
  call_chain = get_root_global ['_tcl'], 'call_chain'
  $I1 = elements call_chain
  if $I1 == 0 goto get_globals 

  lexpad     = call_chain[-1]

  .local pmc    iter, retval
  .local string elem
  iter   = new .Iterator, lexpad
  retval = new .TclList
loop:
  unless iter goto end
  elem = shift iter
  $S0 = substr elem, 0, 1, ''
  unless $S0 == '$' goto loop
  push retval, elem
  goto loop
end:
  .return(retval)

bad_args:
  tcl_error 'wrong # args: should be "info vars ?pattern?"'

get_globals:
  .return 'globals'(argv)
.end

.sub 'level'
  .param pmc argv

  .local int argc
  argc = elements argv

  if argc == 0 goto current_level
  if argc == 1 goto find_level

  tcl_error 'wrong # args: should be "info level ?number?"'

current_level:
  .local pmc call_chain
  call_chain = get_root_global ['_tcl'], 'call_chain'
  $I0 = elements call_chain
  .return($I0)

find_level:
  .local pmc __integer, __call_level
  __integer    = get_root_global ['_tcl'], '__integer'
  __call_level = get_root_global ['_tcl'], '__call_level'
  
  .local pmc level
  level = shift argv
  level = __integer(level)
  if level >= 0 goto find_info_level
  level = __call_level(level)
  .return(level)

find_info_level:
  .local pmc info_level
  info_level = get_root_global ['_tcl'], 'info_level'
  $P0 = info_level[level]
  .return($P0)
.end

.sub 'globals'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc > 1 goto bad_args

  .local pmc ns,iterator,retval

  ns = get_root_namespace ['tcl']
  iterator = new .Iterator, ns
  iterator = 0
  retval = new .TclList

  .local pmc globber,rule,match
  globber = compreg 'PGE::Glob'
  if argc == 1 goto got_glob
  $S1 = "$*"
  goto compile
got_glob:
  $S1 = argv[0]
  $S1 = '$' . $S1
compile:
  rule = globber.'compile'($S1)
loop:
  unless iterator goto end
  $S0 = shift iterator
  $P0 = ns[$S0]
  match = rule($S0)
  unless match goto loop
  $S1 = substr $S0, 1
  push retval, $S1
  goto loop
end:
  .return(retval)

bad_args:
  tcl_error 'wrong # args: should be "info globals ?pattern?"'
.end

# RT#40739: stub
.sub 'script'
  .param pmc argv
  .return(0)
.end

# RT#40740: stub
# sharedlibextension - should be able to pull this from parrot config.
.sub 'sharedlibextension'
  .param pmc argv
  .return(0)
.end

# RT#40741: stub
.sub 'nameofexecutable'
  .param pmc argv
  .local int argc
  argc = argv
  if argc goto bad_args
  $P1 = get_root_global ['_tcl'], 'nameofexecutable'
  .return($P1)
bad_args:
  tcl_error 'wrong # args: should be "info nameofexecutable"'
.end

# RT#40742: stub
.sub 'loaded'
  .param pmc argv
  .return(0)
.end

# RT#40744: stub
.sub 'cmdcount'
  .param pmc argv
  .return(0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
