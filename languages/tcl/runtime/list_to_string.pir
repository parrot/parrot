.HLL '_Tcl', ''
.namespace

.sub __listToString
  .param pmc list
  
  .local string retval
  retval = ''
  
  .local int elems
  elems = list

  .local int i
  i = 0

  .local string str
loop:
  if i >= elems goto done
  $P0 = list[i]
  str = $P0

check_list:
  .local int count
  .local int chars
  chars = length str
  if chars == 0 goto empty
  count = 0
  $I0   = 0
check_list_loop:
  if $I0 >= chars goto check_list_done
  $I1 = ord str, $I0
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

check_left_bracket:
  $I0 = index str, '['
  if $I0 != -1 goto quote

check_dollar_sign:
  $I0 = index str, '$'
  if $I0 != -1 goto quote

check_semi_colon:
  $I0 = index str, ';'
  if $I0 != -1 goto quote

  # \'d constructs
check_right_bracket:
  $I0 = index str, ']'
  if $I0 != -1 goto escape

check_backslash:
  $I0 = index str, '\'
  if $I0 != -1 goto escape

check_quotes:
  $I0 = index str, '"'
  if $I0 != -1 goto escape

  # {}'d constructs
check_spaces:
  $I0 = find_cclass .CCLASS_WHITESPACE, str, 0, chars
  # Unlike any other 'find a character' opcode, this returns
  # length instead of -1 upon failure.
  if $I0 != chars goto quote

  goto append_elem

escape:
  $P0 = new .String
  $P0 = str
  
  $P0.'replace'('\', '\\')
  $P0.'replace'("\t", '\t')
  $P0.'replace'("\f", '\f')
  $P0.'replace'("\n", '\n')
  $P0.'replace'("\r", '\r')
  $P0.'replace'("\v", '\v')
  $P0.'replace'(';', '\:')
  $P0.'replace'('$', '\$')
  $P0.'replace'('}', '\}')
  $P0.'replace'('{', '\{')
  $P0.'replace'(' ', '\ ')
  $P0.'replace'('[', '\[')
  $P0.'replace'(']', '\]')
  $P0.'replace'('"', '\"')
  
  str = $P0 
  goto append_elem

empty:
  str = '{}'
  goto append_elem

quote:
  str = '{' . str
  str = str . '}'

append_elem:
  retval .= str
  retval .= ' '
  inc i
  goto loop

done:
  $I0 = length retval
  unless $I0 goto goback
  # remove the extra space at the end
  substr retval, -1, 1, ''

goback:
  .return(retval)
.end
