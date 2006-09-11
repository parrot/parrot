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

  .local int max_elems
  max_elems = 0
  .local pmc iter
  iter = new .Iterator, argv
arg_loop:
  unless iter goto arg_done

  $P0 = shift iter
  $P0 = __list($P0)
  $I0 = elements $P0
  if $I0 == 0 goto bad_varlist
  push varLists, $P0

  $P0 = shift iter
  $P0 = __list($P0)
  push lists, $P0

  $I0 = elements $P0
  if max_elems >= $I0 goto arg_loop
  max_elems = $I0
  goto arg_loop
arg_done:

  .local int iteration
  iteration = -1
next_iteration:
  inc iteration
  if iteration >= max_elems goto done
  
  .local int counter, elems
  counter = -1
  elems   = elements varLists
next_variable:
  inc counter
  if counter >= elems goto execute_command

  .local string varname
  .local pmc value

  varname = varLists[counter]
  $P0 = lists[counter]
  $I1 = elements $P0
  if $I1 <= iteration goto empty_var
  value = $P0[iteration]
  value = clone value
  __set(varname, value)
  goto next_variable

empty_var:
  $P0 = new .TclString
  $P0 = ''
  __set(varname, $P0)
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

bad_args:
  tcl_error 'wrong # args: should be "foreach varList list ?varList list ...? command"'

bad_varlist:
  tcl_error 'foreach varlist is empty'
.end
