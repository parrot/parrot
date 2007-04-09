.sub main :main

  .local pmc a, b, c, x, y, z
  .pcc_begin
  .arg a :flat :named('a')  
  .pcc_call x
  .result y :slurpy :optional
  .pcc_end
  
  (y :slurpy :optional) = x(a :flat :named('a'))

.end


.sub a 
  .local pmc a, b, c, x, y, z
  
  .pcc_begin   
  .pcc_call x
  .pcc_end
.end

.sub b
  .local pmc a, b, c, x, y, z
  
  .pcc_begin
  .arg 1 :named('x')
  .pcc_call x
  .pcc_end
.end

.sub c 
  .local pmc a, b, c, x, y, z, g
  
  .pcc_begin
  .arg 1 :flat
  .pcc_call g
  .pcc_end
.end

.sub d 
  .local pmc a, b, c, x, y, z
  
  .pcc_begin
  .pcc_call x
  .result a :named
  .pcc_end
.end

.sub e 
  .local pmc a, b, c, x, y, z
  
  .pcc_begin
  .pcc_call x
  .pcc_end
.end

.sub f
  .local pmc a, b, c, x, y, z
  
  .pcc_begin
  .pcc_call x
  .pcc_end
.end

.sub Z :immediate
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
