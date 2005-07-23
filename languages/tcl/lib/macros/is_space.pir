###
# is_space (MACRO)
#
# Given a character (read: int), 
#
# determine if the char represents a space char or not.
#
# TODO
#   actually make this the canonical list....

.macro is_space(CHAR,RETVAL)

  # For the purposes of this conversation, newline doesn't 
  # count as whitespace.

  if .CHAR == 10 goto .$FALSE
   
  # this is a bit of wonkery
  if .CHAR < 33 goto .$TRUE

.local $FALSE:
  .RETVAL = 0  
  goto .$DONE

.local $TRUE:
  .RETVAL = 1  

.local $DONE:
.endm
