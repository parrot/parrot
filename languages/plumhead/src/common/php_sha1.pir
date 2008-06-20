# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_sha1.pir - PHP sha1 Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string sha1(string str [, bool raw_output])>

Calculate the sha1 hash of a string

=cut

.sub 'sha1'
    not_implemented()
.end

=item C<string sha1_file(string filename [, bool raw_output])>

Calculate the sha1 hash of given filename

=cut

.sub 'sha1_file'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
