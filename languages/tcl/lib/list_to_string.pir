.namespace [ "_Tcl" ]

.sub __listToString
  .param pmc list
  
  .local string retval
  retval = ""
  
  .local int elems
  elems = list

  .local int i
  i = 0

loop:
  if i >= elems goto done
  $P0 = list[i]
  $S0 = $P0

check_list:
  # check to see if this is a list
  # (then we don't need to escape the braces)
  push_eh escape_left_brace
  $P0 = __stringToList($S0)
  clear_eh

check_spaces:
  $I0 = find_whitespace $S0, 0
  if $I0 == -1 goto append_elem
  $S0 = "{" . $S0
  $S0 = $S0 . "}"

append_elem:
  retval .= $S0
  retval .= " "
  inc i
  goto loop

escape_left_brace:
  $I0 = 0
escape_left_loop:
  $I0 = index $S0, "{"
  if $I0 == -1 goto escape_right_brace
  substr $S0, $I0, 1, "\\{"
  $I0 += 2
  goto escape_left_loop

escape_right_brace:
  $I0 = 0
escape_right_loop:
  $I0 = index $S0, "}"
  if $I0 == -1 goto check_spaces
  substr $S0, $I0, 1, "\\}"
  $I0 += 2
  goto escape_right_loop

done:
  $I0 = length retval
  unless $I0 goto goback
  # remove the extra space at the end
  substr retval, -1, 1, ""

goback:
  .return(retval)
.end
