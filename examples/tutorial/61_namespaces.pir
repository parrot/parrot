# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's namespaces.

=head1 NAMESPACES

Subroutines all have a unique name, which is how the software recognizes
them. However, if we have many functions this can be difficult because
they all would need to be uniquely named. Namespaces are special constructs
that allow us to reuse subroutine and global variables names, and to keep
like code together.

Namespace PMCs are like Hash PMCs, so we can access different namespaces
with keys just like we would a hash. Namespaces can be nested to any
depth.

Using the C<set_global> and C<get_global> opcodes we can create, store,
and access variables in a different namespace.

=cut

.sub main :main

   $P0 = new ['String']
   $P0 = "Hello"
   set_global ["Different"; "Namespace"], "foo", $P0


   $P1 = get_global ["Different"; "Namespace"], "foo"
   say $P1

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

