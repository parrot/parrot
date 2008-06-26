# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_file.pir - PHP file Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<bool copy(string source_file, string destination_file)>

Copy a file

NOT IMPLEMENTED.

=cut

.sub 'copy'
    not_implemented()
.end

=item C<bool fclose(resource fp)>

Close an open file pointer

NOT IMPLEMENTED.

=cut

.sub 'fclose'
    not_implemented()
.end

=item C<bool feof(resource fp)>

Test for end-of-file on a file pointer

NOT IMPLEMENTED.

=cut

.sub 'feof'
    not_implemented()
.end

=item C<bool fflush(resource fp)>

Flushes output

NOT IMPLEMENTED.

=cut

.sub 'fflush'
    not_implemented()
.end

=item C<string fgetc(resource fp)>

Get a character from file pointer

NOT IMPLEMENTED.

=cut

.sub 'fgetc'
    not_implemented()
.end

=item C<array fgetcsv(resource fp [,int length [, string delimiter [, string enclosure]]])>

Get line from file pointer and parse for CSV fields

NOT IMPLEMENTED.

=cut

.sub 'fgetcsv'
    not_implemented()
.end

=item C<string fgets(resource fp[, int length])>

Get a line from file pointer

NOT IMPLEMENTED.

=cut

.sub 'fgets'
    not_implemented()
.end

=item C<string fgetss(resource fp [, int length, string allowable_tags])>

Get a line from file pointer and strip HTML tags

NOT IMPLEMENTED.

=cut

.sub 'fgetss'
    not_implemented()
.end

=item C<array file(string filename [, int flags[, resource context]])>

Read entire file into an array

NOT IMPLEMENTED.

=cut

.sub 'file'
    not_implemented()
.end

=item C<string file_get_contents(string filename [, bool use_include_path [, resource context [, long offset [, long maxlen]]]])>

Read the entire file into a string

NOT IMPLEMENTED.

=cut

.sub 'file_get_contents'
    not_implemented()
.end

=item C<int file_put_contents(string file, mixed data [, int flags [, resource context]])>

Write/Create a file with contents data and return the number of bytes written

NOT IMPLEMENTED.

=cut

.sub 'file_put_contents'
    not_implemented()
.end

=item C<bool flock(resource fp, int operation [, int &wouldblock])>

Portable file locking

NOT IMPLEMENTED.

=cut

.sub 'flock'
    not_implemented()
.end

=item C<bool fnmatch(string pattern, string filename [, int flags])>

Match filename against pattern

NOT IMPLEMENTED.

=cut

.sub 'fnmatch'
    not_implemented()
.end

=item C<resource fopen(string filename, string mode [, bool use_include_path [, resource context]])>

Open a file or a URL and return a file pointer

NOT IMPLEMENTED.

=cut

.sub 'fopen'
    not_implemented()
.end

=item C<int fpassthru(resource fp)>

Output all remaining data from a file pointer

NOT IMPLEMENTED.

=cut

.sub 'fpassthru'
    not_implemented()
.end

=item C<int fputcsv(resource fp, array fields [, string delimiter [, string enclosure]])>

Format line as CSV and write to file pointer

NOT IMPLEMENTED.

=cut

.sub 'fputcsv'
    not_implemented()
.end

=item C<string fread(resource fp, int length)>

Binary-safe file read

NOT IMPLEMENTED.

=cut

.sub 'fread'
    not_implemented()
.end

=item C<mixed fscanf(resource stream, string format [, string ...])>

Implements a mostly ANSI compatible fscanf()

NOT IMPLEMENTED.

=cut

.sub 'fscanf'
    not_implemented()
.end

=item C<int fseek(resource fp, int offset [, int whence])>

Seek on a file pointer

NOT IMPLEMENTED.

=cut

.sub 'fseek'
    not_implemented()
.end

=item C<array fstat(resource fp)>

Stat() on a filehandle

NOT IMPLEMENTED.

=cut

.sub 'fstat'
    not_implemented()
.end

=item C<int ftell(resource fp)>

Get file pointer's read/write position

NOT IMPLEMENTED.

=cut

.sub 'ftell'
    not_implemented()
.end

=item C<bool ftruncate(resource fp, int size)>

Truncate file to 'size' length

NOT IMPLEMENTED.

=cut

.sub 'ftruncate'
    not_implemented()
.end

=item C<int fwrite(resource fp, string str [, int length])>

Binary-safe file write

NOT IMPLEMENTED.

=cut

.sub 'fwrite'
    not_implemented()
.end

=item C<array get_meta_tags(string filename [, bool use_include_path])>

Extracts all meta tag content attributes from a file and returns an array

NOT IMPLEMENTED.

=cut

.sub 'get_meta_tags'
    not_implemented()
.end

=item C<bool mkdir(string pathname [, int mode [, bool recursive [, resource context]]])>

Create a directory

NOT IMPLEMENTED.

=cut

.sub 'mkdir'
    not_implemented()
.end

=item C<int pclose(resource fp)>

Close a file pointer opened by popen()

NOT IMPLEMENTED.

=cut

.sub 'pclose'
    not_implemented()
.end

=item C<resource popen(string command, string mode)>

Execute a command and open either a read or a write pipe to it

NOT IMPLEMENTED.

=cut

.sub 'popen'
    not_implemented()
.end

=item C<int readfile(string filename [, bool use_include_path[, resource context]])>

Output a file or a URL

NOT IMPLEMENTED.

=cut

.sub 'readfile'
    not_implemented()
.end

=item C<string realpath(string path)>

Return the resolved path

NOT IMPLEMENTED.

=cut

.sub 'realpath'
    not_implemented()
.end

=item C<bool rename(string old_name, string new_name[, resource context])>

Rename a file

NOT IMPLEMENTED.

=cut

.sub 'rename'
    not_implemented()
.end

=item C<bool rewind(resource fp)>

Rewind the position of a file pointer

NOT IMPLEMENTED.

=cut

.sub 'rewind'
    not_implemented()
.end

=item C<bool rmdir(string dirname[, resource context])>

Remove a directory

NOT IMPLEMENTED.

=cut

.sub 'rmdir'
    not_implemented()
.end

=item C<string sys_get_temp_dir()>

Returns directory path used for temporary files

NOT IMPLEMENTED.

=cut

.sub 'sys_get_temp_dir'
    not_implemented()
.end

=item C<string tempnam(string dir, string prefix)>

Create a unique filename in a directory

NOT IMPLEMENTED.

=cut

.sub 'tempnam'
    not_implemented()
.end

=item C<resource tmpfile(void)>

Create a temporary file that will be deleted automatically after use

NOT IMPLEMENTED.

=cut

.sub 'tmpfile'
    not_implemented()
.end

=item C<int umask([int mask])>

Return or change the umask

NOT IMPLEMENTED.

=cut

.sub 'umask'
    not_implemented()
.end

=item C<bool unlink(string filename[, context context])>

Delete a file

NOT IMPLEMENTED.

=cut

.sub 'unlink'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
