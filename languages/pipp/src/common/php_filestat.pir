# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_filestat.pir - PHP filestat Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool chgrp(string filename, mixed group)>

Change file group

NOT IMPLEMENTED.

=cut

.sub 'chgrp'
    not_implemented()
.end

=item C<bool chmod(string filename, int mode)>

Change file mode

NOT IMPLEMENTED.

=cut

.sub 'chmod'
    not_implemented()
.end

=item C<bool chown(string filename, mixed user)>

Change file owner

NOT IMPLEMENTED.

=cut

.sub 'chown'
    not_implemented()
.end

=item C<bool chown(string filename, mixed user)>

Change file owner

NOT IMPLEMENTED.

=cut

.sub 'chown'
    not_implemented()
.end

=item C<void clearstatcache(void)>

Clear file stat cache

NOT IMPLEMENTED.

=cut

.sub 'clearstatcache'
    not_implemented()
.end

=item C<float disk_free_space(string path)>

Get free disk space for filesystem that path is on

NOT IMPLEMENTED.

=cut

.sub 'disk_free_space'
    not_implemented()
.end

=item C<float disk_total_space(string path)>

Get total disk space for filesystem that path is on

NOT IMPLEMENTED.

=cut

.sub 'disk_total_space'
    not_implemented()
.end

=item C<bool file_exists(string filename)>

Returns true if filename exists

NOT IMPLEMENTED.

=cut

.sub 'file_exists'
    not_implemented()
.end

=item C<int fileatime(string filename)>

Get last access time of file

NOT IMPLEMENTED.

=cut

.sub 'fileatime'
    not_implemented()
.end

=item C<int filectime(string filename)>

Get inode modification time of file

NOT IMPLEMENTED.

=cut

.sub 'filectime'
    not_implemented()
.end

=item C<int filegroup(string filename)>

Get file group

NOT IMPLEMENTED.

=cut

.sub 'filegroup'
    not_implemented()
.end

=item C<int fileinode(string filename)>

Get file inode

NOT IMPLEMENTED.

=cut

.sub 'fileinode'
    not_implemented()
.end

=item C<int filemtime(string filename)>

Get last modification time of file

NOT IMPLEMENTED.

=cut

.sub 'filemtime'
    not_implemented()
.end

=item C<int fileowner(string filename)>

Get file owner

NOT IMPLEMENTED.

=cut

.sub 'fileowner'
    not_implemented()
.end

=item C<int fileperms(string filename)>

Get file permissions

NOT IMPLEMENTED.

=cut

.sub 'fileperms'
    not_implemented()
.end

=item C<int filesize(string filename)>

Get file size

NOT IMPLEMENTED.

=cut

.sub 'filesize'
    not_implemented()
.end

=item C<string filetype(string filename)>

Get file type

NOT IMPLEMENTED.

=cut

.sub 'filetype'
    not_implemented()
.end

=item C<bool is_dir(string filename)>

Returns true if file is directory

NOT IMPLEMENTED.

=cut

.sub 'is_dir'
    not_implemented()
.end

=item C<bool is_executable(string filename)>

Returns true if file is executable

NOT IMPLEMENTED.

=cut

.sub 'is_executable'
    not_implemented()
.end

=item C<bool is_file(string filename)>

Returns true if file is a regular file

NOT IMPLEMENTED.

=cut

.sub 'is_file'
    not_implemented()
.end

=item C<bool is_link(string filename)>

Returns true if file is symbolic link

NOT IMPLEMENTED.

=cut

.sub 'is_link'
    not_implemented()
.end

=item C<bool is_readable(string filename)>

Returns true if file can be read

NOT IMPLEMENTED.

=cut

.sub 'is_readable'
    not_implemented()
.end

=item C<bool is_writable(string filename)>

Returns true if file can be written

NOT IMPLEMENTED.

=cut

.sub 'is_writable'
    not_implemented()
.end

=item C<bool lchgrp(string filename, mixed group)>

Change symlink group

NOT IMPLEMENTED.

=cut

.sub 'lchgrp'
    not_implemented()
.end

=item C<array lstat(string filename)>

Give information about a file or symbolic link

NOT IMPLEMENTED.

=cut

.sub 'lstat'
    not_implemented()
.end

=item C<array stat(string filename)>

Give information about a file

NOT IMPLEMENTED.

=cut

.sub 'stat'
    not_implemented()
.end

=item C<bool touch(string filename [, int time [, int atime]])>

Set modification time of file

NOT IMPLEMENTED.

=cut

.sub 'touch'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
