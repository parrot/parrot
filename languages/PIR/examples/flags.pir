.sub main :main

  .local pmc a, b, c, x, y, z
  .begin_call
  .set_arg a :flat :named('a')
  .call x
  .result y :slurpy :optional
  .end_call

  (y :slurpy :optional) = x(a :flat :named('a'))

.end


.sub a
  .local pmc a, b, c, x, y, z

  .begin_call
  .call x
  .end_call
.end

.sub b
  .local pmc a, b, c, x, y, z

  .begin_call
  .set_arg 1 :named('x')
  .call x
  .end_call
.end

.sub c
  .local pmc a, b, c, x, y, z, g

  .begin_call
  .set_arg 1 :flat
  .call g
  .end_call
.end

.sub d
  .local pmc a, b, c, x, y, z

  .begin_call
  .call x
  .result a :named
  .end_call
.end

.sub e
  .local pmc a, b, c, x, y, z

  .begin_call
  .call x
  .end_call
.end

.sub f
  .local pmc a, b, c, x, y, z

  .begin_call
  .call x
  .end_call
.end

.sub Z :immediate
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
