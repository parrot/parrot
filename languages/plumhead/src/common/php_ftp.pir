# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_ftp.pir - PHP ftp  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool ftp_alloc(resource stream, int size[, &response])>

Attempt to allocate space on the remote FTP server

NOT IMPLEMENTED.

=cut

.sub 'ftp_alloc'
    not_implemented()
.end

=item C<bool ftp_cdup(resource stream)>

Changes to the parent directory

NOT IMPLEMENTED.

=cut

.sub 'ftp_cdup'
    not_implemented()
.end

=item C<bool ftp_chdir(resource stream, string directory)>

Changes directories

NOT IMPLEMENTED.

=cut

.sub 'ftp_chdir'
    not_implemented()
.end

=item C<int ftp_chmod(resource stream, int mode, string filename)>

Sets permissions on a file

NOT IMPLEMENTED.

=cut

.sub 'ftp_chmod'
    not_implemented()
.end

=item C<bool ftp_close(resource stream)>

Closes the FTP stream

NOT IMPLEMENTED.

=cut

.sub 'ftp_close'
    not_implemented()
.end

=item C<resource ftp_connect(string host [, int port [, int timeout]])>

Opens a FTP stream

NOT IMPLEMENTED.

=cut

.sub 'ftp_connect'
    not_implemented()
.end

=item C<bool ftp_delete(resource stream, string file)>

Deletes a file

NOT IMPLEMENTED.

=cut

.sub 'ftp_delete'
    not_implemented()
.end

=item C<bool ftp_exec(resource stream, string command)>

Requests execution of a program on the FTP server

NOT IMPLEMENTED.

=cut

.sub 'ftp_exec'
    not_implemented()
.end

=item C<bool ftp_fget(resource stream, resource fp, string remote_file, int mode[, int resumepos])>

Retrieves a file from the FTP server and writes it to an open file

NOT IMPLEMENTED.

=cut

.sub 'ftp_fget'
    not_implemented()
.end

=item C<bool ftp_fput(resource stream, string remote_file, resource fp, int mode[, int startpos])>

Stores a file from an open file to the FTP server

NOT IMPLEMENTED.

=cut

.sub 'ftp_fput'
    not_implemented()
.end

=item C<bool ftp_get(resource stream, string local_file, string remote_file, int mode[, int resume_pos])>

Retrieves a file from the FTP server and writes it to a local file

NOT IMPLEMENTED.

=cut

.sub 'ftp_get'
    not_implemented()
.end

=item C<mixed ftp_get_option(resource stream, int option)>

Gets an FTP option

NOT IMPLEMENTED.

=cut

.sub 'ftp_get_option'
    not_implemented()
.end

=item C<bool ftp_login(resource stream, string username, string password)>

Logs into the FTP server

NOT IMPLEMENTED.

=cut

.sub 'ftp_login'
    not_implemented()
.end

=item C<int ftp_mdtm(resource stream, string filename)>

Returns the last modification time of the file, or -1 on error

NOT IMPLEMENTED.

=cut

.sub 'ftp_mdtm'
    not_implemented()
.end

=item C<string ftp_mkdir(resource stream, string directory)>

Creates a directory and returns the absolute path for the new directory or false on error

NOT IMPLEMENTED.

=cut

.sub 'ftp_mkdir'
    not_implemented()
.end

=item C<int ftp_nb_continue(resource stream)>

Continues retrieving/sending a file nbronously

NOT IMPLEMENTED.

=cut

.sub 'ftp_nb_continue'
    not_implemented()
.end

=item C<int ftp_nb_fget(resource stream, resource fp, string remote_file, int mode[, int resumepos])>

Retrieves a file from the FTP server asynchronly and writes it to an open file

NOT IMPLEMENTED.

=cut

.sub 'ftp_nb_fget'
    not_implemented()
.end

=item C<int ftp_nb_fput(resource stream, string remote_file, resource fp, int mode[, int startpos])>

Stores a file from an open file to the FTP server nbronly

NOT IMPLEMENTED.

=cut

.sub 'ftp_nb_fput'
    not_implemented()
.end

=item C<int ftp_nb_get(resource stream, string local_file, string remote_file, int mode[, int resume_pos])>

Retrieves a file from the FTP server nbhronly and writes it to a local file

NOT IMPLEMENTED.

=cut

.sub 'ftp_nb_get'
    not_implemented()
.end

=item C<int ftp_nb_put(resource stream, string remote_file, string local_file, int mode[, int startpos])>

Stores a file on the FTP server

NOT IMPLEMENTED.

=cut

.sub 'ftp_nb_put'
    not_implemented()
.end

=item C<array ftp_nlist(resource stream, string directory)>

Returns an array of filenames in the given directory

NOT IMPLEMENTED.

=cut

.sub 'ftp_nlist'
    not_implemented()
.end

=item C<bool ftp_pasv(resource stream, bool pasv)>

Turns passive mode on or off

NOT IMPLEMENTED.

=cut

.sub 'ftp_pasv'
    not_implemented()
.end

=item C<bool ftp_put(resource stream, string remote_file, string local_file, int mode[, int startpos])>

Stores a file on the FTP server

NOT IMPLEMENTED.

=cut

.sub 'ftp_put'
    not_implemented()
.end

=item C<string ftp_pwd(resource stream)>

Returns the present working directory

NOT IMPLEMENTED.

=cut

.sub 'ftp_pwd'
    not_implemented()
.end

=item C<array ftp_raw(resource stream, string command)>

Sends a literal command to the FTP server

NOT IMPLEMENTED.

=cut

.sub 'ftp_raw'
    not_implemented()
.end

=item C<array ftp_rawlist(resource stream, string directory [, bool recursive])>

Returns a detailed listing of a directory as an array of output lines

NOT IMPLEMENTED.

=cut

.sub 'ftp_rawlist'
    not_implemented()
.end

=item C<bool ftp_rename(resource stream, string src, string dest)>

Renames the given file to a new path

NOT IMPLEMENTED.

=cut

.sub 'ftp_rename'
    not_implemented()
.end

=item C<bool ftp_rmdir(resource stream, string directory)>

Removes a directory

NOT IMPLEMENTED.

=cut

.sub 'ftp_rmdir'
    not_implemented()
.end

=item C<bool ftp_set_option(resource stream, int option, mixed value)>

Sets an FTP option

NOT IMPLEMENTED.

=cut

.sub 'ftp_set_option'
    not_implemented()
.end

=item C<bool ftp_site(resource stream, string cmd)>

Sends a SITE command to the server

NOT IMPLEMENTED.

=cut

.sub 'ftp_site'
    not_implemented()
.end

=item C<int ftp_size(resource stream, string filename)>

Returns the size of the file, or -1 on error

NOT IMPLEMENTED.

=cut

.sub 'ftp_size'
    not_implemented()
.end

=item C<resource ftp_ssl_connect(string host [, int port [, int timeout]])>

Opens a FTP-SSL stream

NOT IMPLEMENTED.

=cut

.sub 'ftp_ssl_connect'
    not_implemented()
.end

=item C<string ftp_systype(resource stream)>

Returns the system type identifier

NOT IMPLEMENTED.

=cut

.sub 'ftp_systype'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
