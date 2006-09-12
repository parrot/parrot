.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&foreach'
  .param pmc argv :slurpy
  # Requires multiple of 3 args.

  .local int argc
  argc = elements argv

  # Were we passed the right # of arguments? (2n+1)
  if argc < 2 goto bad_args
  $I0 = argc % 2
  if $I0 != 1 goto bad_args

  .local pmc __list, __script, __set
  __list   = get_root_global ['_tcl'], '__list'
  __script = get_root_global ['_tcl'], '__script'
  __set    = get_root_global ['_tcl'], '__set'

  .local pmc varLists, lists, command
  varLists = new .TclList
  lists    = new .TclList
  command  = pop argv
  command  = __script(command)

  .local int iterations
  iterations = 0
  .local pmc iter
  iter = new .Iterator, argv
arg_loop:
  unless iter goto arg_done

  .local pmc varList, list
  varList = shift iter
  varList = __list(varList)
  list    = shift iter
  list    = __list(list)

  $I0 = elements varList
  if $I0 == 0 goto bad_varlist

  $I1 = elements list
  $N0 = $I0
  $N1 = $I1
  $N0 = $N1 / $N0
  $I0 = ceil $N0

  list = new .Iterator, list
  push varLists, varList
  push lists, list
  
  if $I0 <= iterations goto arg_loop
  iterations = $I0
  goto arg_loop
arg_done:

 .local int iteration
  iteration = -1
next_iteration:
  inc iteration
  if iteration >= iterations goto done
  
  .local int counter, elems
  counter = -1
  elems   = elements varLists
next_varList:
  inc counter
  if counter >= elems goto execute_command

  .local pmc varList, list
  varList = varLists[counter]
  list    = lists[counter]

  $I0 = -1
  $I1 = elements varList
next_variable:
  inc $I0
  if $I0 >= $I1 goto next_varList

  .local string varname
  varname = varList[$I0]

  .local pmc value
  unless list goto empty_var
  value = shift list
  value = clone value
  push_eh couldnt_set
    __set(varname, value)
  clear_eh
  goto next_variable

empty_var:
  value = new .TclString
  value = ''
  push_eh couldnt_set
    __set(varname, value)
  clear_eh
  goto next_variable
 
  # Loop until all elements are consumed. If any of the lists that were
  # provided are already consumed, then simply assign the empty string.
  # create a new pad in which our variables will run.
  # XXX This should probably not create a new pad, exactly
  # Handle [break] and [continue]
execute_command:
  push_eh handle_continue
    command()
  clear_eh
  goto next_iteration

handle_continue:
  .catch()
  .local int return_type
  .get_return_code(return_type)
  if return_type == TCL_BREAK goto done
  if return_type == TCL_CONTINUE goto next_iteration
  .rethrow()
 
done:
  .return('')

couldnt_set:
  $S0 =  "couldn't set loop variable: \""
  $S0 .= varname
  $S0 .= "\""
  tcl_error $S0

bad_args:
  tcl_error 'wrong # args: should be "foreach varList list ?varList list ...? command"'

bad_varlist:
  tcl_error 'foreach varlist is empty'
.end
