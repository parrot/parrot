# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

=head1 String Operations (continued)

We can pick apart a string and pull substrings out of it using the
C<substr> command. C<substr> takes a string, a starting position and
optionally an ending position. It returns all the characters in
the string between the starting and ending positions. If the ending
position is left out, C<substr> returns all the characters until the
end of the string.

C<substr> no longer provides an in-place replace, however there is a
C<replace> operator that allows this type of operation to be performed,
although not in-place.  The C<replace> operator assigns a new_srting,
taking as arguments, the old_string, a start and end position, and a
string to be inserted in between the start and end positions.

=cut

.sub main :main

    $S0 = substr "abcde", 1, 2
    say $S0                         # "bc"

    set $S1, "abcde"
    $S0 = substr $S1, 1, 2
    say $S0                         # "bc"
    say $S1                         # "abcde"

    set $S1, "abcde"
    $S0 = replace $S1, 1, 2, "XYZ"
    say $S0                         # "aXYZde"
    say $S1                         # "abcde"

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
