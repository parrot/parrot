.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&scan'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv

  if argc < 2 goto bad_args

  .local pmc results
  results = new .TclList

  .local pmc __integer, __number
  __integer = get_root_global [ '_tcl' ], '__integer'
  __number  = get_root_global [ '_tcl' ], '__number'
  .local pmc decimal
  decimal = get_root_global ['parrot'; 'TclExpr::Grammar'], 'decimal'

  .local pmc rule, match

  .local string input, format 
  input = shift argv
  format = shift argv

  argc = elements argv # reset for later use.

  .local int using_xpg3
  using_xpg3 = -1

  .local int input_pos, format_pos, format_len, input_len
  input_pos = 0
  format_pos = 0 
  format_len = length format 
  input_len = length input

loop:
  # is there any format left to process?
  if format_pos >= format_len goto done

  # is there any string left to process?
  # if input_pos >= input_len goto done

  # Get the next thing in the format.
  $S0 = substr format, format_pos, 1
  if $S0 == '%' goto handle_percent
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
  if argc == 0 goto return_list
  if argc < num_matches goto not_enough_vars
  if argc > num_matches goto too_many_vars
  goto assign_results


assign_results:
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
  inc format_pos
  .local int xpg3, width
  xpg3  = 0
  width = 0

  # is it the special xpg3?
  $S0 = substr format, format_pos, 1
  if $S0 != '*' goto check_xpg3
  xpg3 = -1
  goto get_width

check_xpg3:
  .local pmc match
  match = decimal(format, 'pos'=>format_pos, 'grammar'=>'TclExpr::Grammar')
  unless match goto got_width # not a number, can't be width either

  $I0 = match.'from'()
  $I1 = match.'to'()
  $I0 = $I1 - $I0
  format_pos += $I0

  $S0 = substr format, format_pos, 1  

  if $S0 == '$' goto got_xpg3
  # We got a number, but it was the width.
  $S0 = match
  width = __integer($S0)
  goto got_width

got_xpg3:
  $S0 = match
  xpg3 = __integer($S0)

get_width:
  inc format_pos
  match = decimal(format, 'pos'=>format_pos, 'grammar'=>'TclExpr::Grammar')
  unless match goto got_width  
  $S0 = match
  width = __integer($S0)

  $I0 = match.'from'()
  $I1 = match.'to'()
  $I0 = $I1 - $I0
  format_pos += $I0
  
got_width:

  .local int size_modifier # XXX we parse it, but ignore it for now
  bsr get_size_modifier  

  # conversion character
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
  .local int negated
  .local pmc class
  class = new .Hash

  negated = 0
  $S0 = substr format, format_pos, 1
  if $S0 != '^' goto skip_negated
  negated = 1
  inc format_pos
  $S0 = substr format, format_pos, 1

skip_negated:
  if $S0 != ']' goto normal 
  class[']'] = 1
  inc format_pos
  #$S0 = substr format, format_pos, 1

normal: # Now at beginning of class. Find the end marker..
  $I0 = index format, ']', format_pos
  if $I0 == -1 goto bad_class
  .local string class_fmt
  $I1 = $I0 - format_pos
  class_fmt = substr format, format_pos, $I1
  inc format_pos

  $S0 = substr class_fmt, 0, 1
  if $S0 != '-' goto handle_end
  class['-'] = 1 
  $S0 = substr class_fmt, 0, 1, ''

handle_end:
  $S0 = substr class_fmt, -1, 1
  if $S0 != '-' goto loop_dash
  class['-'] = 1 
  $S0 = substr class_fmt, -1, 1, ''

loop_dash:
  $I0 = index class_fmt, '-'
  if $I0 == -1 goto just_chars
  $I1 = $I0 - 1
  bsr add_range
  $S0 = substr class_fmt, $I1, 3, ''
  goto loop_dash

just_chars:
  $I0 = 0
  $I1 = length class_fmt
loop_chars:
  if $I0 >= $I1 goto have_class
  $S0 = substr class_fmt, $I0, 1
  class[$S0] = 1 
  inc $I0
  goto loop_chars

have_class:
  $I1 = input_pos 
  if negated goto neg_do_loop

do_loop:
  if $I1 >= input_len goto done_loop
  $S0 = substr input, $I1, 1
  $P0 = class[$S0]
  if_null $P0, done_loop

  inc $I1
  goto do_loop

neg_do_loop:
  if $I1 >= input_len goto done_loop
  $S0 = substr input, $I1, 1
  $P0 = class[$S0]
  unless_null $P0, done_loop

  inc $I1
  goto neg_do_loop

done_loop:
  $I2 = $I1 - input_pos
  $S0 = substr input, input_pos, $I2
  $P0 = new .TclString
  $P0 = $S0
  bsr set_val
  goto next

add_range:
  # $I1 has the lower position
  $I2 = $I1 + 2
  $S1 = substr class_fmt, $I1, 1
  $S2 = substr class_fmt, $I2, 1

  $I10 = ord $S1
  $I11 = ord $S2
  if $I10 <= $I11 goto range_loop
  # otherwise swap the order
  $I12 = $I10
  $I10 = $I11
  $I11 = $I12

range_loop:
  if $I10 > $I11 goto range_loop_done 
  $S0 = chr $I10
  class[$S0] = 1
  inc $I10
  goto range_loop

range_loop_done:  
  ret

bad_class:
  tcl_error 'unmatched [ in format string'

handle_percent_literal:
  $S1 = substr input, input_pos, 1
  if $S1 != '%' goto done
  inc input_pos
  goto next

handle_character:
  if size_modifier goto bad_character_size
  if width         goto bad_character_width
  if input_pos >= input_len goto bad_match
  $S1 = substr input, input_pos, 1
  inc input_pos
  $I0 = ord $S1
  $P0 = new .TclInt
  $P0 = $I0
  bsr set_val
  goto next

bad_character_size:
  tcl_error 'field size modifier may not be specified in %c conversion'
bad_character_width:
  tcl_error 'field width may not be specified in %c conversion'

handle_numchars:
  $P0 = new .TclInt
  $P0 = input_pos
  bsr set_val
  goto next

handle_decimal:
  rule = decimal
  goto do_integer

handle_octal:
  rule = get_root_global ['parrot'; 'TclExpr::Grammar'], 'octal'
  goto do_integer

handle_hex:
  rule = get_root_global ['parrot'; 'TclExpr::Grammar'], 'raw_hex'
  match = rule(input, 'pos'=>input_pos, 'grammar'=>'TclExpr::Grammar')
  unless match goto bad_match
  $I0 = match.'to'()
  $I1 = match.'from'()
  $I2 = $I0 - $I1
  $S0 = match
  if width == 0 goto hex_width
  if width >= $I2 goto hex_width
  $S0 = substr $S0, 0, width
  $I2 = width

hex_width:
  input_pos += $I2 
  $P0 = __integer($S0, 'rawhex'=>1)
  bsr set_val 
  goto next

handle_integer:
  rule = get_root_global ['parrot'; 'TclExpr::Grammar'], 'integer'
do_integer:
  match = rule(input, 'pos'=>input_pos, 'grammar'=>'TclExpr::Grammar')
  unless match goto bad_match
  $I0 = match.'to'()
  $I1 = match.'from'()
  $I2 = $I0 - $I1
  $S0 = match
  if width == 0 goto integer_width
  if width >= $I2 goto integer_width
  $S0 = substr $S0, 0, width
  $I2 = width

integer_width:
  input_pos += $I2 
  $P0 = __integer($S0)
  bsr set_val 
  goto next

handle_float:
  rule = get_root_global ['parrot'; 'TclExpr::Grammar'], 'number'
  match = rule(input, 'pos'=>input_pos, 'grammar'=>'TclExpr::Grammar')
  unless match goto bad_match
  $I0 = match.'to'()
  $I1 = match.'from'()
  $I2 = $I0 - $I1
  input_pos += $I2     
  $S0 = match
  $P0 = __number($S0)
  $S1 = typeof $P0
  if $S1 == 'TclFloat' goto done_float
  $S0 = $S0 . '.0'
  $P0 = $P1($S0)

done_float:
  bsr set_val
  goto next

handle_string:
  $I1 = find_cclass .CCLASS_WHITESPACE, input, input_pos, input_len
  $I2 = $I1 - input_pos
  if width == 0 goto string_width
  if width >= $I2 goto string_width
  $I2 = width
  $I1 = input_pos + width 
 
string_width: 
  $S1 = substr input, input_pos, $I2
  input_pos = $I1
  $P0 = new .TclString
  $P0 = $S1
  bsr set_val 
  goto next
 
bad_match:
  $P0 = new .TclString
  $P0 = ''
  bsr set_val
  goto next

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

set_val:
  if xpg3 != 0 goto set_xpg3
  if using_xpg3 == 1 goto cant_mix
  using_xpg3 = 0  
  push results, $P0
  ret

set_xpg3:
  if using_xpg3 == 0 goto cant_mix
  using_xpg3 = 1 
  if xpg3 == -1 goto done_xpg3
  dec xpg3 # zero based assignment.
  $P1 = results[xpg3]
  $I0 = defined $P1
  if $I0 == 0 goto set_xpg3_ok
  tcl_error 'variable is assigned by multiple "%n$" conversion specifiers'
set_xpg3_ok:
  results[xpg3] = $P0
done_xpg3:
  ret

cant_mix:
  tcl_error 'cannot mix "%" and "%n$" conversion specifiers'

bad_conversion:
  $S1 = 'bad scan conversion character "'
  $S1 .= $S0
  $S1 .= '"'
  tcl_error $S1

bad_args:
  tcl_error 'wrong # args: should be "scan string format ?varName varName ...?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
