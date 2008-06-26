# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_link.pir - PHP link Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int link(string target, string link)>

Create a hard link

NOT IMPLEMENTED.

=cut

.sub 'link'
    not_implemented()
.end

=item C<int linkinfo(string filename)>

Returns the st_dev field of the UNIX C stat structure describing the link

NOT IMPLEMENTED.

=cut

.sub 'linkinfo'
    not_implemented()
.end

=item C<string readlink(string filename)>

Return the target of a symbolic link

NOT IMPLEMENTED.

=cut

.sub 'readlink'
    not_implemented()
.end

=item C<int symlink(string target, string link)>

Create a symbolic link

NOT IMPLEMENTED.

=cut

.sub 'symlink'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
