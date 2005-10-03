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
  .local int count
  .local int chars
  chars = length $S0
  if chars == 0 goto empty
  count = 0
  $I0   = 0
check_list_loop:
  if $I0 >= chars goto check_list_done
  $I1 = ord $S0, $I0
  if $I1 == 123 goto left_brace
  if $I1 == 125 goto right_brace
check_list_next:
  inc $I0
  goto check_list_loop
left_brace:
  inc count
  goto check_list_next
right_brace:
  dec count
  if count < 0 goto escape
  goto check_list_next
check_list_done:
  if count != 0 goto escape

  # {}'d constructs
check_spaces:
  $I0 = find_cclass .CCLASS_WHITESPACE, $S0, 0, chars
  # Unlike any other "find a character" opcode, this returns
  # length instead of -1 upon failure.
  if $I0 != chars goto quote

check_left_bracket:
  $I0 = index $S0, "["
  if $I0 != -1 goto quote

check_dollar_sign:
  $I0 = index $S0, "$"
  if $I0 != -1 goto quote

check_semi_colon:
  $I0 = index $S0, ";"
  if $I0 != -1 goto quote

  # \'d constructs
check_right_bracket:
  $I0 = index $S0, "]"
  if $I0 != -1 goto escape

check_backslash:
  $I0 = index $S0, "\\"
  if $I0 != -1 goto escape

check_quotes:
  $I0 = index $S0, "\""
  if $I0 != -1 goto escape

  goto append_elem

escape:
  $P0 = new String
  $P0 = $S0
  
  $P0."replace"("\\", "\\\\")
  $P0."replace"("}", "\\}")
  $P0."replace"("{", "\\{")
  $P0."replace"(" ", "\\ ")
  $P0."replace"("]", "\\]")
  $P0."replace"("\"", "\\\"")
  
  $S0 = $P0 
  goto append_elem

empty:
  $S0 = "{}"
  goto append_elem

quote:
  $S0 = "{" . $S0
  $S0 = $S0 . "}"

append_elem:
  retval .= $S0
  retval .= " "
  inc i
  goto loop

done:
  $I0 = length retval
  unless $I0 goto goback
  # remove the extra space at the end
  substr retval, -1, 1, ""

goback:
  .return(retval)
.end
