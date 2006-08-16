.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&foreach'
  .param pmc argv :slurpy
  # Requires multiple of 3 args.

  .local pmc retval

  .local int argc
  argc = elements argv

  # Were we passed the right # of arguments? (2n+1)
  if argc == 0 goto bad_args
  $I0 = argc % 2
  if $I0 != 1 goto bad_args

  .local pmc __list, __script, __set
  __list   = get_root_global ['_tcl'], '__list'
  __script = get_root_global ['_tcl'], '__script'
  __set    = get_root_global ['_tcl'], '__set'

  # Compartmentalize our arguments
  .local pmc varnames, arglists
  .local string body
  varnames = new .TclList
  arglists = new .TclList
  varnames = argc
  arglists = argc
  .local pmc arg_num,arg_max,index_num
  arg_num = new .Integer
  arg_max = new .Integer
  index_num = new .Integer
  arg_num = 0 
  index_num = 0

  arg_max = argc
  dec arg_max
  body = argv[arg_max]
  dec arg_max
  .local pmc max_size
  max_size = new .Integer
  max_size = 0
arg_loop:
  if arg_num >= arg_max goto arg_done

  $P0 = argv[arg_num]
  varnames[index_num] = $P0
  inc arg_num
  $P0 = argv[arg_num]
  $P0 = __list($P0)

got_list:
  arglists[index_num] = $P0

  .local int size_of
  size_of = $P0

  inc arg_num
  inc index_num

  if max_size >= size_of goto arg_loop
  max_size = size_of
  goto arg_loop
arg_done: 
  .local pmc parsed
  parsed = __script(body)
  register parsed

  .local pmc iterator
  iterator = new .Integer
  iterator = 0
loop_outer:
  if iterator >= max_size goto done
  
  .local int counter,end_counter
  counter = -1
  end_counter = index_num
  .local pmc got_one
  got_one = new .Integer
  got_one = 0
loop_inner:
  inc counter
  if counter >= end_counter goto loop_inner_done_good

  .local string varname
  .local pmc value

  $I0 = varnames
  if counter >= $I0 goto loop_inner_done_good

  varname = varnames[counter]
  $P0 = arglists[counter]
  $I1 = $P0
  $I2 = iterator
  if $I1 <= $I2 goto empty_var
  value = $P0[$I2]
  __set(varname, value)

  got_one = 1
  goto loop_inner
empty_var:
  $P0 = new .TclString
  $P0 = ''
  __set(varname, $P0)
  goto loop_inner
loop_inner_done_good:
  got_one = 1
loop_inner_done:
  if got_one == 1 goto loop_outer_continue
  # there was nothing in this set of iterators. 
###   goto loop_outer_done  XXX no such label

 
  # Loop until all elements are consumed. If any of the lists that were
  # provided are already consumed, then simply assign the empty string.
  # create a new pad in which our variables will run.
  # XXX This should probably not create a new pad, exactly
  # Handle [break] and [continue]
loop_outer_continue:
  push_eh handle_continue
    retval = parsed()
  clear_eh

do_next:
  inc iterator
  goto loop_outer

handle_continue:
  .catch()
  .local int return_type
  .get_return_code(return_type)
  if return_type == TCL_BREAK goto done
  if return_type == TCL_CONTINUE goto do_next
  .rethrow()
 
done:
  .return(retval)

bad_args:
  tcl_error 'wrong # args: should be "foreach varList list ?varList list ...? command"'
.end
