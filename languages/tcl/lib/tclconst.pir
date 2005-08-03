.namespace [ "TclConst" ]

.HLL "Tcl", "tcl_group"

# return codes
 .const int TCL_OK = 0
 .const int TCL_ERROR = 1
 .const int TCL_RETURN = 2
 .const int TCL_BREAK = 3
 .const int TCL_CONTINUE = 4

=head2 __class_init

Define the attributes required for the class.

=cut

.sub __class_init @LOAD
  $P0 = getclass "TclString"
  $P1 = subclass $P0, "TclConst"
  
  $P0 = new Hash
  $P0[ 97] = "\a"
  $P0[ 98] = "\x8" # \b
  $P0[102] = "\f"
  $P0[110] = "\n"
  $P0[114] = "\r"
  $P0[116] = "\t"
  $P0[118] = "\v"
  
  store_global "_Tcl", "backslashes", $P0
.end

.sub __clone method
  .local pmc obj
  $I0 = typeof self
  obj = new $I0
  obj = self
  .return(obj)
.end

.sub __set_string_native method
  .param string value

  .local int value_length
  value_length = length value

  .local pmc backslashes
  find_global backslashes, "_Tcl", "backslashes"
  
  .local int pos
  pos = 0
loop:
  pos = index value, "\\", pos
  if pos == -1 goto done
 
  $I0 = pos + 1
  $I0 = ord value, $I0
  if $I0 == 120 goto hexidecimal # x
  if $I0 == 117 goto unicode     # u
  if $I0 <   48 goto simple      # < 0
  if $I0 <=  55 goto octal       # 0..7  
                                 # > 7
simple:
  $I1 = exists backslashes[$I0]
  if $I1 goto special
  
  substr value, pos, 1, ""
  inc pos
  goto loop

=for comment

Octal escapes consist of one, two, or three octal digits

=cut

  .local int octal_value
  .local int digit
  .local int octal_pos
octal:
  # at this point, $I0 contains the value of the first digit,
  # but pos is still at the backslash.
  octal_pos = pos + 1
  digit = $I0 - 48 # ascii value of 0.
  octal_value = digit

  $I0 = octal_pos + 1
  if $I0 >= value_length goto octal_only1

  $I0 = ord value, $I0

  if $I0 <   48 goto octal_only1 # < 0
  if $I0 <=  55 goto octal2      # 0..7  
                                 # > 7
octal_only1:
  $S0 = chr octal_value
  substr value, pos, 2, $S0 

  pos += 2 # skip \ and 1 char.
  goto loop 

octal2:
  # at this point, $I0 contains the value of the second digit,
  # but octal_pos is still at the first digit.
  inc octal_pos # skip first digit
  digit = $I0 - 48 # ascii value of 0.

  octal_value *= 8
  octal_value += digit

  $I0 = octal_pos + 1
  if $I0 >= value_length goto octal_only2
  $I0 = ord value, $I0

  if $I0 <   48 goto octal_only2 # < 0
  if $I0 <=  55 goto octal3      # 0..7  

octal_only2:
  $S0 = chr octal_value
  substr value, pos, 3, $S0 

  pos += 3 # skip \ and 2 characters
  goto loop 

octal3:
  # at this point, $I0 contains the value of the third digit
  digit = $I0 - 48 # ascii value of 0.

  octal_value *= 8
  octal_value += digit
  
  $S0 = chr octal_value
  substr value, pos, 4, $S0 

  pos += 4 # skip \ and 3 characters

  goto loop # can't have four digits, stop now.

=for comment

Hexidecimal escapes consist of an C<x>, followed by any number of hexidecimal
digits. However, only the last two are used.

=cut

hexidecimal:
  inc pos
  goto loop

=for comment

Unicode escapes consist of an C<u>, followed by one to four hexadecimal digits.

=cut

unicode:
  inc pos
  goto loop

special:
  $S0 = backslashes[$I0]
  substr value, pos, 2, $S0
  inc pos
  goto loop
  
done:
  $I0 = classoffset self, "TclConst"
  $P0 = getattribute self, $I0
  $P0 = value
.end

=head2 interpret

Get the value of the const.

=cut

.sub interpret method
    .return(TCL_OK, self)
.end
