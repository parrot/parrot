.sub main :main

   $P0 = new 'String'
   $P0 = "Hello"
   set_global ["Different"; "Namespace"], "foo", $P0


   $P1 = get_global ["Different"; "Namespace"], "foo"
   say $P1

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

