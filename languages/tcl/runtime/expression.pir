.HLL '_Tcl', ''
.namespace

=head1 NAME

Tcl Expressions

=head1 DESCRIPTION

Helper functions for dealing with parts of expressions.

XXX - rewrite using the PGE/TGE tools.

=head1 FUNCTIONS

=over 4

=item (PMC val, INT pos) get_number(STRING expr, INT pos)

Given a string, starting at position, return a PMC
for the number and the position after the last character used.

=cut

.sub get_number
  .param string expr
  .param int pos

  .local int len
  len = length expr
  .local int char, start
  .local pmc value
  null value

  start = pos
###  if pos >= len goto failure XXX no such label

integer:
  if pos >= len goto integer_done
  char = ord expr, pos
  if char > 57 goto integer_done # > "9"
  if char < 48 goto integer_done # < "0"
  inc pos
  goto integer
integer_done:
  if char ==  46 goto floating # "."
  if pos  ==   0 goto done     # failure

  $I0 = pos - start
  $S0 = substr expr, start, $I0
  if char == 101 goto e
  
  # At this point, if there's no e, we're definitely an integer, 
  # check for octal.
  $S1 = substr $S0, 0, 1
  if $S1 != '0' goto integer_return

  # XXX This octal code is now dup'd in TGE...

  .local int octal_value
  .local int octal_digit
  .local int octal_counter
  .local int octal_length
  octal_length = length $S0
  octal_counter = 1 #skip the first 0
  dec octal_counter
  octal_value = 0
  # at this point, string should consist only of digits 0-9
octal_loop:
  if octal_counter == octal_length goto octal_done # skip first 0
  octal_digit = ord $S0, octal_counter
  octal_digit -= 48 # ascii value of 0
  if octal_digit >= 8 goto bad_octal
  octal_value *= 8
  octal_value += octal_digit
  inc octal_counter
  goto octal_loop

octal_done:
  value = new .TclInt
  value = octal_value
  .return(value, pos)

bad_octal:
  .local string msg
  msg  = 'expected integer but got "'
  msg .= $S0
  msg .= '" (looks like invalid octal number)'
  .throw (msg)

integer_return:
  $I0 = $S0
  value = new .TclInt
  value = $I0
  goto done

floating:
  inc pos
float_loop:
  if pos >= len goto float_done
  char = ord expr, pos
  if char > 57 goto float_done # > "9"
  if char < 48 goto float_done # < "0"
  inc pos
  goto float_loop
float_done:
  $I0 = pos - start
  $S0 = substr expr, start, $I0
  if $S0  == '.' goto failure
  if char == 101 goto e
  # XXX Can't we just assign this string directly to the the TclFloat - WJC
  $N0 = $S0
  value = new .TclFloat
  value = $N0
  goto done

e:
  $N0 = $S0
  value = new .TclFloat
  value = $N0
  inc pos
  start = pos
  char = ord expr, pos
  if char == 43 goto e_sign
  if char == 45 goto e_sign
  goto e_loop
e_sign:
  inc pos
e_loop:
  if pos >= len goto e_done
  char = ord expr, pos
  if char > 57 goto e_done # > "9"
  if char < 48 goto e_done # < "0"
  inc pos
  goto e_loop
e_done:
  $I0 = pos - start
  $S0 = substr expr, start, $I0
  $N0 = $S0
  $N0 = 10.0**$N0
  value *= $N0
  goto done

failure:
  pos = 0

done:
  .return(value, pos)
.end

=back

=cut
