# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_assert.pir - PHP assert Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int assert(string|bool assertion)>

Checks if assertion is false

NOT IMPLEMENTED.

=cut

.sub 'assert'
    not_implemented()
.end

=item C<mixed assert_options(int what [, mixed value])>

Set/get the various assert flags

NOT IMPLEMENTED.

=cut

.sub 'assert_options'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
