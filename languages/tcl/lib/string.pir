#
# - string related helper subs.
#

# Given an index and a string, return an index 
# or an error
#
# (given an int or "end-1" style string, and a string,
# return the actual index position)

.namespace [ "_Tcl" ]

.sub __string_index 
  .param string position
  .param string the_string

  .local int return_type
  return_type = TCL_OK

  .local pmc retval
  .local int index_length
  .local int number_length
  .local int number_type
  .local pmc number_result

  .local int index_1

  if position == "end" goto my_end

  $S0 = substr position, 0, 4
  if $S0 == "end-" goto has_end
  index_length = length $S0
  # is this an int?
  (number_length,number_type,retval) = __expr_get_number(position,0)
  if number_type != INTEGER goto bad_arg
  if number_length != index_length goto bad_arg
  goto done

  #if not, fail.
bad_arg:
  $S9  = "bad index \""
  $S9 .= position
  $S9 .= "\": must be integer or end?-integer?"
  retval = new String
  retval = $S9
  .return (TCL_ERROR, retval)
 
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
  index_1 = length the_string
  # so, if we had end-1, then we'd be at position 4. (end is 5, -1)
  index_1 = index_1 - $I0
  retval = new Integer
  retval = index_1

  goto done


my_end:
  $I0 = length the_string
  dec $I0
  retval = new Integer
  retval = $I0

done:
 .return(return_type,retval)
.end
