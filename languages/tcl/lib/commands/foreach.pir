.namespace [ "Tcl" ]

.sub "&foreach"
  # Requires multiple of 3 args.

  .local pmc argv
  argv = foldup

  .local int return_type
  .local pmc parser,interpret,retval
  retval = new TclString
  retval = ""

  .local int call_level
  $P0 = find_global "_Tcl", "call_level"
  call_level = $P0

  # Were we passed the right # of arguments? (2n+1)
  if argcP == 0 goto error
  $I0 = argcP % 2
  if $I0 != 1 goto error

  .local pmc __list
  __list = find_global "_Tcl", "__list"

  parser = find_global "_Tcl", "parser"
  interpret = find_global "_Tcl", "__interpret"
  return_type = TCL_OK

  .local int argc
  argc = argv

  # Compartmentalize our arguments
  .local pmc varnames, arglists
  .local string body
  varnames = new TclList
  arglists  = new TclList
  varnames = argc
  arglists = argc
  .local pmc arg_num,arg_max,index_num
  arg_num = new Integer
  arg_max = new Integer
  index_num = new Integer
  arg_num = 0 
  index_num = 0

  arg_max = argc
  dec arg_max
  body = argv[arg_max]
  dec arg_max
  .local pmc max_size
  max_size = new Integer
  max_size = 0
arg_loop:
  if arg_num >= arg_max goto arg_done

  $P0 = argv[arg_num]
  varnames[index_num] = $P0
  inc arg_num
  $P0 = argv[arg_num]
  (return_type, retval) = __list($P0)
  if return_type == TCL_ERROR goto done
  $P0 = retval

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
  parsed = parser."parse"(body,0,0)
  register parsed

  .local pmc iterator
  iterator = new Integer
  iterator = 0
loop_outer:
  if iterator >= max_size goto loop_outer_done
  new_pad 0
  
  .local int counter,end_counter
  counter = -1
  end_counter = index_num
  .local pmc got_one
  got_one = new Integer
  got_one = 0
loop_inner:
  inc counter
  if counter >= end_counter goto loop_inner_done_good

  .local string varname,sigil_varname
  .local pmc value
  varname = varnames[counter]
  sigil_varname = "$" . varname
  $P0 = arglists[counter]
  $I1 = $P0
  $I2 = iterator
  if $I1 <= $I2 goto empty_var
  value = $P0[$I2]

  if call_level goto store_lex
    store_global "Tcl", sigil_varname, value
    goto store_done
store_lex:
    store_lex -1, sigil_varname, value
store_done:

  got_one = 1
  goto loop_inner
empty_var:
  $P0 = new TclString
  $P0 = ""
  if call_level goto store_lex2
    store_global "Tcl", sigil_varname, $P0
    goto loop_inner
store_lex2:
    store_lex -1, sigil_varname, $P0
  goto loop_inner
loop_inner_done_good:
  got_one = 1
loop_inner_done:
  if got_one == 1 goto loop_outer_continue
  # there was nothing in this set of iterators. 
  pop_pad
  goto loop_outer_done 
 
  # Loop until all elements are consumed. If any of the lists that were
  # provided are already consumed, then simply assign the empty string.
  # create a new pad in which our variables will run.
  # XXX This should probably not create a new pad, exactly
  # Handle [break] and [continue]
loop_outer_continue:
  (return_type,retval) = interpret(parsed)
  pop_pad 
  if return_type == TCL_BREAK goto done
  if return_type == TCL_ERROR goto done

  inc iterator
  goto loop_outer
 
loop_outer_done:
  
  goto done

error:
  return_type = TCL_ERROR
  retval = "wrong # args: should be \"foreach varList list ?varList list ...? command\""
  goto done

done:
  .return(return_type,retval)
.end
