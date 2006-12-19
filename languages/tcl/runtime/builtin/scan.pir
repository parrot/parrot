.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&scan'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv

  if argc < 2 goto bad_args

  .local pmc results
  results = new .TclList

  .local string input, format 
  input = shift argv
  format = shift argv

  .local int input_pos, format_pos, format_len, input_len
  input_pos = 0
  format_pos = 0 
  format_len = length format 
  input_len = length input

loop:
  # is there any format left to process?
  if format_pos >= format_len goto done

  # is there any string left to process?
  if input_pos >= input_len goto done

  # Get the next thing in the format.
  $S0 = substr format, format_pos, 1
  if $S0 == "%" goto handle_percent
  $I0 = is_cclass .CCLASS_WHITESPACE, format, format_pos
  unless $I0 goto handle_other

  bsr eat_whitespace
  inc format_pos
  goto next

handle_other:
  $S1 = substr input, input_pos, 1
  if $S0 != $S1 goto done

  inc format_pos
  inc input_pos

next:
  goto loop

done:
  .local int num_matches
  num_matches = elements results
  if num_matches == 0 goto aborted
  argc = elements argv
  if argc == 0 goto return_list
  if argc < num_matches goto not_enough_vars
  if argc > num_matches goto too_many_vars
  # assign results

  .local pmc __set
  __set = get_root_global ['_tcl'], '__set'
  $I0 = 0
var_loop:
  if $I0 >= argc goto var_loop_done
  $S0 = argv[$I0]
  $P0 = results[$I0]
  push_eh bad_var
    __set($S0, $P0)
  clear_eh
  inc $I0
  goto var_loop
var_loop_done:
  .return(num_matches)

bad_var:
  $S1 = "couldn't set variable \""
  $S1 .= $S0
  $S1 .= '"'
  tcl_error $S1

return_list:
  .return(results)

aborted:
  .return('')

too_many_vars:
  tcl_error 'variable is not assigned by any conversion specifiers'
not_enough_vars:
  tcl_error 'different numbers of variable names and field specifiers'

handle_percent:
  # XXX get XPG3 position specifier (* or a decimal)
  # XXX maximum substring width     

  .local int size_modifier # XXX we parse it, but ignore it for now
  bsr get_size_modifier  

  # conversion character
  inc format_pos
  $S0 = substr format, format_pos, 1
  inc format_pos 

  if $S0 == 'c' goto handle_character
  if $S0 == '[' goto handle_charclass
  bsr eat_whitespace

  if $S0 == 'n' goto handle_numchars
  if $S0 == 'd' goto handle_decimal
  if $S0 == 'o' goto handle_octal
  if $S0 == 'x' goto handle_hex
  if $S0 == 'i' goto handle_integer
  if $S0 == 'u' goto handle_integer # XXX a cheat
  if $S0 == 'e' goto handle_float
  if $S0 == 'f' goto handle_float
  if $S0 == 'g' goto handle_float
  if $S0 == 's' goto handle_string
  if $S0 == '%' goto handle_percent_literal
  goto bad_conversion  

handle_charclass:
  tcl_error "XXX handle charclasses"

handle_percent_literal:
  $S1 = substr input, input_pos, 1
  if $S1 != '%' goto done
  inc input_pos
  goto next

handle_character:
  $S1 = substr input, input_pos, 1
  inc input_pos
  $I0 = ord $S1
  push results, $I0
  goto next

handle_numchars:
  push results, input_pos
  goto next

handle_decimal:
  .local pmc rule, match
  rule = get_root_global ['parrot'; 'TclExpr::Grammar'], 'decimal'
  match = rule(input, 'pos'=>input_pos, 'grammar'=>'TclExpr::Grammar')
  unless match goto bad_match
  $I0 = match.'to'()
  $I1 = match.'from'()
  $I2 = $I0 - $I1
  input_pos += $I2     
  $S0 = match
  $P1 = get_root_global [ '_tcl' ], '__integer'
  $P0 = $P1($S0)
  push results, $P0
  goto next

handle_octal:
  .local pmc rule, match
  rule = get_root_global ['parrot'; 'TclExpr::Grammar'], 'octal'
  match = rule(input, 'pos'=>input_pos, 'grammar'=>'TclExpr::Grammar')
  unless match goto bad_match
  $I0 = match.'to'()
  $I1 = match.'from'()
  $I2 = $I0 - $I1
  input_pos += $I2     
  $S0 = match
  $P1 = get_root_global [ '_tcl' ], '__integer'
  $P0 = $P1($S0)
  push results, $P0
  goto next

handle_hex:
  .local pmc rule, match
  rule = get_root_global ['parrot'; 'TclExpr::Grammar'], 'hex'
  match = rule(input, 'pos'=>input_pos, 'grammar'=>'TclExpr::Grammar')
  unless match goto bad_match
  $I0 = match.'to'()
  $I1 = match.'from'()
  $I2 = $I0 - $I1
  input_pos += $I2     
  $S0 = match
  $P1 = get_root_global [ '_tcl' ], '__integer'
  $P0 = $P1($S0)
  push results, $P0
  goto next

handle_integer:
  .local pmc rule, match
  rule = get_root_global ['parrot'; 'TclExpr::Grammar'], 'integer'
  match = rule(input, 'pos'=>input_pos, 'grammar'=>'TclExpr::Grammar')
  unless match goto bad_match
  $I0 = match.'to'()
  $I1 = match.'from'()
  $I2 = $I0 - $I1
  input_pos += $I2     
  $S0 = match
  $P1 = get_root_global [ '_tcl' ], '__integer'
  $P0 = $P1($S0)
  push results, $P0
  goto next

handle_float:
  .local pmc rule, match
  rule = get_root_global ['parrot'; 'TclExpr::Grammar'], 'number'
  match = rule(input, 'pos'=>input_pos, 'grammar'=>'TclExpr::Grammar')
  unless match goto bad_match
  $I0 = match.'to'()
  $I1 = match.'from'()
  $I2 = $I0 - $I1
  input_pos += $I2     
  $S0 = match
  $P1 = get_root_global [ '_tcl' ], '__number'
  $P0 = $P1($S0)
  $S1 = typeof $P0
  if $S1 == 'TclFloat' goto done_float
  $S0 = $S0 . ".0"
  $P0 = $P1($S0)

done_float:
  push results, $P0
  goto next

handle_string:
  $I1 = find_cclass .CCLASS_WHITESPACE, input, input_pos, input_len
  $I2 = $I1 - input_pos
  $S1 = substr input, input_pos, $I2
  input_pos = $I1
  push results, $S1
  goto next
 
bad_match:
  tcl_error "XXX need to handle this error"

# consume as much whitespace as possible from the input string
eat_whitespace: 
  input_pos = find_not_cclass .CCLASS_WHITESPACE, input, input_pos, input_len
  ret

get_size_modifier:
  size_modifier = 0
  inc format_pos
  $S0 = substr format, format_pos, 2
  if $S0 == 'll' goto set_size_ll
  $S0 = substr format, format_pos, 1
  if $S0 == 'h' goto set_size_h
  if $S0 == 'l' goto set_size_l
  if $S0 == 'L' goto set_size_l
  dec format_pos
  ret
 
set_size_h:
  size_modifier = 1
  ret
set_size_l:
  size_modifier = 2
  ret
set_size_ll:
  size_modifier = 3
  inc format_pos # for the extra char
  ret

bad_conversion:
  $S1 = 'bad scan conversion character "'
  $S1 .= $S0
  $S1 .= '"'
  tcl_error $S1

bad_args:
  tcl_error 'wrong # args: should be "scan string format ?varName varName ...?"'
.end
