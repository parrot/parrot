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
  index_length = length $S0
  # is this an int?
  (retval, pos) = get_number(position,0)
  if pos != index_length goto bad_arg
  $I0 = isa retval, "Integer"
  if $I0 == 0 goto bad_arg
  .return(retval)

  #if not, fail.
bad_arg:
  $S9  = "bad index \""
  $S9 .= position
  $S9 .= "\": must be integer or end?-integer?"
  .throw($S9)
 
has_end:
  # is this an int? if so, subtract it from -1 to get our parrot-style index.
  index_length = length position
  # is this an int?
  (number_result,pos) = get_number(position,4)
  if pos != index_length goto bad_arg
  $I0 = isa number_result, "Integer"
  if $I0 == 0 goto bad_arg
  # say, 1 if -1
  $I0 = number_result
  # say, 2 if -2
  inc $I0
 
  # say, length is 6
  index_1 = length the_string
  # so, if we had end-1, then we'd be at position 4. (end is 5, -1)
  index_1 = index_1 - $I0

 .return(index_1)

my_end:
  $I0 = length the_string
  dec $I0
  .return($I0)

.end
