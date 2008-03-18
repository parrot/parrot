=head1 Subroutines in a Namespace

This example demonstrates defining a subroutine in another namespace, and
retrieving it from the namespace. Also demonstrates the .namespace directive.

=cut

.sub main :main

   $P0 = get_global ["Different"; "Namespace"], "foo"

   $S0 = $P0("Zaphod")
   say $S0

.end

.namespace ["Different"; "Namespace"]

.sub foo
    .param string name

    .local string greeting
    greeting = "Hello, " . name

    .return (greeting)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

