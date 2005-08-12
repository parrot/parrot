#
# list-related utility methods.
#

# This is very similar to _Tcl::__string_index, and perhaps they could be refactored.

.namespace [ "_Tcl" ]

.sub _list_index
  .param pmc the_list
  .param pmc pmc_position
  
  .local string position
  position = pmc_position

  .local int is_end
  is_end = 1

  .local pmc retval
  .local int return_type
  return_type = TCL_OK

  .local int index_length,number_length,number_type
  .local pmc number_result

  if position == "end" goto my_end
  
  $S0 = substr position, 0, 4
  if $S0 == "end-" goto has_end
  index_length = length position
  (number_length,number_type,retval) = __expr_get_number(position,0)
  if number_type != INTEGER goto bad_arg 
  if number_length != index_length goto bad_arg
  
  # if the number is greater than the number of elements
  # in the list, we want the end
  $I0 = the_list
  if retval > $I0 goto my_end
  
  is_end = 0
  goto done

bad_arg:
  # XXX We shouldn't need this String declaration here.
  retval = new TclString
  $S9  = "bad index \""
  $S9 .= position
  $S9 .= "\": must be integer?[+-]integer? or end?[+-]integer?"
  retval = $S9
  return_type=TCL_ERROR
  goto done

has_end:
    # is this an int? if so, subtract it from -1 to get our parrot-style index.
  index_length = length position
  index_length -= 4  # ignore "end-"
  # is this an int?
  (number_length,number_type,number_result) = __expr_get_number(position,4)
  if number_type != INTEGER goto bad_arg
  if number_length != index_length goto bad_arg
  # say, 1 if -1
  $I0 = number_result
  # say, 2 if -2
  inc $I0

  # say, length is 6
  .local int index_1
  index_1 = the_list
  # so, if we had end-1, then we'd be at position 4. (end is 5, -1)
  index_1 = index_1 - $I0
  retval = new TclInt
  retval = index_1

  goto done

my_end:
  $I0 = the_list
  dec $I0
  retval = new TclInt 
  retval = $I0

done:
  .return(return_type,retval,is_end)
  
.end
