# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_dir.pir - PHP dir Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool chdir(string directory)>

Change the current directory

NOT IMPLEMENTED.

=cut

.sub 'chdir'
    not_implemented()
.end

=item C<bool chroot(string directory)>

Change root directory

NOT IMPLEMENTED.

=cut

.sub 'chroot'
    not_implemented()
.end

=item C<void closedir([resource dir_handle])>

Close directory connection identified by the dir_handle

NOT IMPLEMENTED.

=cut

.sub 'closedir'
    not_implemented()
.end

=item C<object dir(string directory[, resource context])>

Directory class with properties, handle and class and methods read, rewind and close

NOT IMPLEMENTED.

=cut

.sub 'dir'
    not_implemented()
.end

=item C<mixed getcwd(void)>

Gets the current directory

NOT IMPLEMENTED.

=cut

.sub 'getcwd'
    not_implemented()
.end

=item C<array glob(string pattern [, int flags])>

Find pathnames matching a pattern

NOT IMPLEMENTED.

=cut

.sub 'glob'
    not_implemented()
.end

=item C<mixed opendir(string path[, resource context])>

Open a directory and return a dir_handle

NOT IMPLEMENTED.

=cut

.sub 'opendir'
    not_implemented()
.end

=item C<string readdir([resource dir_handle])>

Read directory entry from dir_handle

NOT IMPLEMENTED.

=cut

.sub 'readdir'
    not_implemented()
.end

=item C<void rewinddir([resource dir_handle])>

Rewind dir_handle back to the start

NOT IMPLEMENTED.

=cut

.sub 'rewinddir'
    not_implemented()
.end

=item C<array scandir(string dir [, int sorting_order [, resource context]])>

List files & directories inside the specified path

NOT IMPLEMENTED.

=cut

.sub 'scandir'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
