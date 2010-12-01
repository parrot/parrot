# Copyright (C) 2004-2009, Parrot Foundation.

.sub bench :main
.include "pmctypes.pasm"
   .local int i
   .local pmc r
   .local pmc a
   .local pmc b
   a = new 'Integer'
   b = new 'Integer'
   r = new 'Integer'
   a = 7
   b = 6
   i = 1
loop:
   r = a * b
   inc i
   if i <= 50000 goto loop
   print r
   print "\n"
   end
.end


.sub my_mul :multi(Integer, Integer, Integer)
   .param pmc left
   .param pmc right
   .param pmc dest
   $I0 = left
   $I1 = right
   $I2 = $I0 * $I1
   dest = $I2
   .return (dest)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
