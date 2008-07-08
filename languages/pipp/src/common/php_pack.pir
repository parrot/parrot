# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_pack.pir - PHP pack Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string pack(string format, mixed arg1 [, mixed arg2 [, mixed ...]])>

Takes one or more arguments and packs them into a binary string according to the format argument

NOT IMPLEMENTED.

=cut

.sub 'pack'
    not_implemented()
.end

=item C<array unpack(string format, string input)>

Unpack binary string into named array elements according to format argument

NOT IMPLEMENTED.

=cut

.sub 'unpack'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
