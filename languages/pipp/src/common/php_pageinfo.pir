# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_pageinfo.pir - PHP pageinfo Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<int getlastmod(void)>

Get time of last page modification

NOT IMPLEMENTED.

=cut

.sub 'getlastmod'
    not_implemented()
.end

=item C<int getmygid(void)>

Get PHP script owner's GID

NOT IMPLEMENTED.

=cut

.sub 'getmygid'
    not_implemented()
.end

=item C<int getmyinode(void)>

Get the inode of the current script being parsed

NOT IMPLEMENTED.

=cut

.sub 'getmyinode'
    not_implemented()
.end

=item C<int getmypid(void)>

Get current process ID

NOT IMPLEMENTED.

=cut

.sub 'getmypid'
    not_implemented()
.end

=item C<int getmyuid(void)>

Get PHP script owner's UID

NOT IMPLEMENTED.

=cut

.sub 'getmyuid'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
