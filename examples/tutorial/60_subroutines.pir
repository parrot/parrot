# Copyright (C) 2007-2012, Parrot Foundation.

=pod

=head1 DESCRIPTION

A tutorial lesson about Parrot's subroutines.

=head1 SUBROUTINES

PIR is a subroutine-based or "procedural" programming language.
Subroutines are used to break large tasks into smaller chunks. These
chunks can be used and reused throughout the program. Subroutines
are defined with the C<.sub> directive and continue until the C<.end>
directive.

Subroutines can take any number of input parameters, and can return
any number of output parameters. In practice, we recommend you don't
go overboard with creating huge argument lists because it gets very
messy and difficult to deal with very quickly.

=cut

.sub main :main

   $S0 = foo("Zaphod")
   say $S0

.end

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

