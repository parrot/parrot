# Copyright (C) 2007-2009, Parrot Foundation.
# $Id$

=head1 String Operations (continued)

We can pick apart a string and pull substrings out of it using the
C<substr> command. C<substr> takes a string, a starting position and
optionally an ending position. It returns all the characters in
the string between the starting and ending positions. If the ending
position is left out, C<substr> returns all the characters until the
end of the string.

=cut

.sub main :main

    $S0 = substr "abcde", 1, 2    # "bc"
    say $S0

    set $S1, "abcde"
    $S0 = substr $S1, 1, 2
    say $S0                   # "bc"
    say $S1                   # "abcde"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

