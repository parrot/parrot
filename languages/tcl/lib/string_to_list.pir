.namespace [ "_Tcl" ]

.sub __stringToList
  .param string str

  .local int return_type
  return_type = TCL_OK
  
  .local pmc retval
  retval = new TclList

  .local int pos, len
  # we're going to increment before we use it, so set it to 0-1
  pos = -1
  len = length str

eat_space:
  inc pos
  $I0 = is_whitespace str, pos
  if $I0 == 1 goto eat_space

loop:
  if pos >= len goto done
  
  # check if the first char is a {
  $I0 = ord str, pos
  if $I0 == 123 goto list
  if $I0 == 34  goto quote

  $I0 = pos
not_list:
  if $I0 >= len goto extract
  
  $I1 = ord str, $I0
  if $I1 == 92 goto not_list_backslash
  $I1 = is_whitespace str, $I0
  if $I1 == 1 goto extract
  
  inc $I0
  goto not_list

not_list_backslash:
  $I0 += 2
  goto not_list
  
extract:
  # extract the element
  $I1 = $I0 - pos
  $S0 = substr str, pos, $I1
  
  # add it to the list
  $I1 = find_type "TclConst"
  $P0 = new $I1
  $P0 = $S0
  push retval, $P0
  
  # find the next pos
  pos = $I0
  goto eat_space

loop_done:
  # grab the rest of the string
  $I1 = len - pos
  $S0 = substr str, pos, $I1
  $P0 = new String
  $P0 = $S0
  push retval, $P0
  goto done

  # find the closing '"'
quote:
  inc pos
  $I1 = pos
quote_loop:
  $I0 = ord str, $I1
  if $I0 == 92 goto quote_backslash
  if $I0 == 34 goto found_quote
  inc $I1
  goto quote_loop
quote_backslash:
  $I1 += 2
  goto quote_loop
found_quote:
  $I0 = $I1 - pos
  $S0 = substr str, pos, $I0
  
  $P0 = new String
  $P0 = $S0
  push retval, $P0
  
  pos = $I1
  inc pos
  goto eat_space

list:
  .local int depth
  depth = 1
  $I1 = pos
find_close_bracket:
  inc $I1
  if $I1 >= len goto unmatched_open_brace
  $I0 = ord str, $I1
  if $I0 == 123 goto left_bracket
  if $I0 == 125 goto right_bracket
  if $I0 == 92  goto backslash
  goto find_close_bracket
backslash:
  inc $I1
  goto find_close_bracket
left_bracket:
  inc depth
  goto find_close_bracket
right_bracket:
  dec depth
  if depth == 0 goto found_close_bracket
  goto find_close_bracket

found_close_bracket:
  # length -- if we have "{ }", pos and $I0 should both be 1
  $I0 = $I1 - pos
  $I0 -= 1
  inc pos
  $S0 = substr str, pos, $I0
  pos += $I0
  pos += 1
  
  $I0 = find_type "TclConst"
  $P0 = new $I0
  $P0 = $S0
  push retval, $P0
  
  goto eat_space

unmatched_open_brace:
  return_type = TCL_ERROR
  retval = new String
  retval = "unmatched open brace in list"
  # goto done

done:
  .return(return_type, retval)
.end
