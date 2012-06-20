# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's namespaces (continued.

=head1 SUBROUTINES IN A NAMESPACE

Subroutines created in one namespace can be accessed from another
using the C<get_global> opcode, just like global variables. In fact,
since subroutines are really just PMCs, they are variables themselves
and the two operations are actually the same.

Namespaces can be defined in code using the C<.namespace> directive,
followed by the name of the namespace as a hash key. The default root
namespace can be specified with an empty set of brackets such as
C<.namespace []>.


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

