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

  .local pmc retval
  .local int index_length
  .local int pos
  .local pmc number_result

  .local int index_1

  if position == "end" goto my_end

  $S0 = substr position, 0, 4
  if $S0 == "end-" goto has_end

  push_eh bad_arg
    retval = __number(position)
  clear_eh
  $I0 = typeof retval
  if $I0 != .TclInt goto bad_arg
  .return(retval)
  
bad_arg:
  $S9  = "bad index \""
  $S9 .= position
  $S9 .= "\": must be integer or end?-integer?"
  .throw($S9)
 
has_end:
  $S1 = substr position, 4

  push_eh bad_arg
    retval = __number($S1)
  clear_eh

  $I0 = typeof retval
  if $I0 != .TclInt goto bad_arg

  # say, length is 6
  index_1 = length the_string
  dec index_1 # last position is 5.
  # so, if we had end-1, then we'd be at position 4. (end is 5, -1)
  $I1 = retval
  index_1 = index_1 - $I1

 .return(index_1)

my_end:
  $I0 = length the_string
  dec $I0
  .return($I0)

.end
