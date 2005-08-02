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
  
  .local pmc backslashes
  find_global backslashes, "_Tcl", "backslashes"
  
  .local int pos
  pos = 0
loop:
  pos = index value, "\\", pos
  if pos == -1 goto done
  
  $I0 = pos + 1
  $I0 = ord value, $I0
  if $I0 == 111 goto octal # \o
  $I1 = exists backslashes[$I0]
  if $I1 goto special
  
  substr value, pos, 1, ""
  inc pos
  goto loop

octal:
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