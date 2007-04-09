.HLL '_Tcl', ''
.namespace

.sub __stringToList
  .param string str

  .local pmc retval
  retval = new .TclList

  .local int pos, len
  # we're going to increment before we use it, so set it to 0-1
  pos = -1
  len = length str

eat_space:
  inc pos
  $I0 = is_cclass .CCLASS_WHITESPACE, str, pos
  if $I0 == 1 goto eat_space

loop:
  if pos >= len goto done
  
  # check if the first char is a { or a "
  $I0 = ord str, pos
  if $I0 == 123 goto list
  if $I0 == 34  goto quote

  $I0 = pos
not_list:
  if $I0 >= len goto extract
  
  $I1 = ord str, $I0
  if $I1 == 92 goto not_list_backslash
  $I1 = is_cclass .CCLASS_WHITESPACE, str, $I0
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
  $I1 = find_type 'TclConst'
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
  $P0 = new .String
  $P0 = $S0
  push retval, $P0
  goto done

  # find the closing '"'
quote:
  inc pos
  $I1 = pos
quote_loop:
  if $I1 >= len goto missing_quote
  $I0 = ord str, $I1
  if $I0 == 92 goto quote_backslash
  if $I0 == 34 goto found_quote
  inc $I1
  goto quote_loop
quote_backslash:
  $I1 += 2
  goto quote_loop
found_quote:
  $I0 = $I1 + 1
  if $I0 >= len goto found_close_quote
  $I0 = is_cclass .CCLASS_WHITESPACE, str, $I0
  unless $I0 goto elem_in_quotes_followed

found_close_quote:
  $I0 = $I1 - pos
  $S0 = substr str, pos, $I0
  
  $P0 = new 'TclConst'
  $P0 = $S0
  push retval, $P0
  
  pos = $I1
  inc pos
  goto eat_space

elem_in_quotes_followed:
  inc $I1
  $I0 = len - $I1
  $I0 = find_cclass .CCLASS_WHITESPACE, str, $I1, $I0
  $I0 = $I0 - $I1
  $S0 = substr str, $I1, $I0
  $S0 = 'list element in quotes followed by "' . $S0
  $S0 = $S0 . '" instead of space'
  tcl_error $S0

missing_quote:
  tcl_error "unmatched open quote in list" 

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
  unless depth == 0 goto find_close_bracket

  $I0 = $I1 + 1
  if $I0 >= len goto found_close_bracket
  $I0 = is_cclass .CCLASS_WHITESPACE, str, $I0
  unless $I0 goto elem_in_braces_followed

found_close_bracket:
  # length -- if we have "{ }", pos and $I0 should both be 1
  $I0 = $I1 - pos
  $I0 -= 1
  inc pos
  $S0 = substr str, pos, $I0
  pos += $I0
  pos += 1

  # Now add that list as another element:
  push retval, $S0
  
  goto eat_space

elem_in_braces_followed:
  inc $I1
  $I0 = len - $I1
  $I0 = find_cclass .CCLASS_WHITESPACE, str, $I1, $I0
  $I0 = $I0 - $I1
  $S0 = substr str, $I1, $I0
  $S0 = 'list element in braces followed by "' . $S0
  $S0 = $S0 . '" instead of space'
  tcl_error $S0

unmatched_open_brace:
  tcl_error 'unmatched open brace in list'

done:
  .return(retval)
.end

.sub __listToDict
  .param pmc list

  .local int sizeof_list
  sizeof_list = elements list
  
  $I0 = mod sizeof_list, 2
  if $I0 == 1 goto odd_args

  .local pmc result
  result = new .TclDict 

  .local int pos
  pos = 0
  
loop:
  if pos >= sizeof_list goto done
  $S1 = list[pos]
  inc pos
  $P2 = list[pos]
  inc pos
  $S0 = typeof $P2
  if $S0 == 'TclConst'  goto is_string
  if $S0 == 'TclString'  goto is_string
  if $S0 == 'String'  goto is_string
is_list:
  $P2 = __listToDict($P2)
  result[$S1] = $P2
  goto loop
  
is_string:
  # Can we listify the value here? If so, make it into a dictionary.
  $P3 = __list($P2)
  $I0 = elements $P3
  if $I0 <= 1 goto only_string
  push_eh only_string
    $P3 = __listToDict($P3)
  clear_eh
  result[$S1] = $P3
  goto loop

only_string:
  result[$S1] = $P2
  goto loop

done:
  .return (result)

odd_args:
  tcl_error 'missing value to go with key'
.end

.sub __stringToDict
  .param string str

  .local pmc list
  list = __stringToList(str)
  .return __listToDict(list)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
