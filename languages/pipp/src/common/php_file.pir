# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_file.pir - PHP file Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.const string STREAM_PMC = 'FileHandle'

.const int SEEK_SET = 0
.const int SEEK_CUR = 1
.const int SEEK_END = 2

.sub '__init' :anon :load :init
    .local pmc cst
    .GET_CONSTANTS(cst)
    .REGISTER_LONG_CONSTANT(cst, 'SEEK_SET', SEEK_SET)
    .REGISTER_LONG_CONSTANT(cst, 'SEEK_CUR', SEEK_CUR)
    .REGISTER_LONG_CONSTANT(cst, 'SEEK_END', SEEK_END)
.end

=item C<string basename(string path [, string suffix])>

Returns the filename component of the path

=cut

.include 'sysinfo.pasm'

.sub 'basename'
    .param pmc args :slurpy
    .local string path
    .local string suffix
    .local string separator

    ($I0, path, suffix) = parse_parameters('s|s', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    $S0 = sysinfo .SYSINFO_PARROT_OS
    if $S0 == 'MSWin32' goto L2
    if $S0 == 'netware' goto L2
    separator = '/'
    goto L3
  L2:
    separator = '/\'
  L3:
    $I1 = 0
    $P0 = split '', path
  L4:
    unless $P0 goto L5
    $S1 = pop $P0
    $I0 = index separator, $S1
    inc $I1
    if $I0 == -1 goto L4
    dec $I1
  L5:
    .local int len_path
    .local int len_suffix
    .local int pos1
    .local int pos2

    len_path = length path
    len_suffix = length suffix

    pos1 = len_path - $I1
    pos2 = len_path - len_suffix
    $S3  = substr path, pos2
    unless $S3 == suffix goto L6

    $I2  = pos2 - pos1
    $S4 = substr path, pos1, $I2
    .RETURN_STRING($S4)
  L6:
    $S2 = substr path, pos1
    .RETURN_STRING($S2)
.end

=item C<bool copy(string source_file, string destination_file)>

Copy a file

NOT IMPLEMENTED.

=cut

.sub 'copy'
    not_implemented()
.end

=item C<string dirname(string path)>

Returns the directory name component of the path

NOT IMPLEMENTED.

=cut

.sub 'dirname'
    not_implemented()
.end

=item C<bool fclose(resource fp)>

Close an open file pointer

=cut

.sub 'fclose'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    .local pmc stream
    push_eh L3
    stream = fetch_resource($P1, STREAM_PMC)
    pop_eh
  L2:
    close stream
    .RETURN_TRUE()
  L3:
    .RETURN_FALSE()
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

STILL INCOMPLETE.

=cut

.sub 'file_get_contents'
    .param pmc args :slurpy

    .local string filename
    .local int use_include_path
    .local pmc context
    .local int offset
    .local int maxlen
    use_include_path = 0
    offset = -1
    maxlen = PHP_STREAM_COPY_ALL
    ($I0, filename, use_include_path, context, offset, maxlen) = parse_parameters('s|br!ll', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    $I0 = args
    unless $I0 == 5 goto L2
    unless maxlen < 0 goto L2
    error(E_WARNING, "length must be greater than or equal to zero")
    .RETURN_FALSE()
  L2:
    .local pmc stream
    $I0 = ENFORCE_SAFE_MODE | REPORT_ERRORS
    unless use_include_path goto L3
    $I0 |= USE_PATH
  L3:
    stream = stream_open(filename, 'r', $I0, context)
  L4:
    # for now ignore failures
    push_eh catch

    $S0 = stream.'readall'()
    close stream

    pop_eh

    .RETURN_STRING($S0)

catch:
    .RETURN_FALSE()

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

STILL INCOMPLETE (see _getmode)

=cut

.sub 'fopen'
    .param pmc args :slurpy
    .local string filename
    .local string mode
    .local int use_include_path
    .local pmc context
    use_include_path = 0
    ($I0, filename, mode, use_include_path, context) = parse_parameters('ss|br', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    .local pmc stream
    $I0 = ENFORCE_SAFE_MODE | REPORT_ERRORS
    unless use_include_path goto L2
    $I0 |= USE_PATH
  L2:
    $S0 = _getmode(mode)
    push_eh L4
    stream = stream_open(filename, $S0, $I0, context)
    pop_eh
  L3:
    .RETURN_RESOURCE(stream)
  L4:
    .RETURN_FALSE()
.end

.sub '_getmode' :anon
    .param string mode
    .local string res
    unless mode == 'r' goto L1
    res = '<'
    goto L9
  L1:
    unless mode == 'w' goto L2
    res = '>'
    goto L9
  L2:
    unless mode == 'a' goto L3
    res = '>>'
    goto L9
  L3:
    unless mode == 'r+' goto L4
    res = '+<'
    goto L9
  L4:
    unless mode == 'w+' goto L5
    res = '+>'
    goto L9
  L5:
    unless mode == 'a+' goto L6
    res = '+>>'
    goto L9
  L6:
    res = ''
  L9:
    .return (res)
.end

=item C<int fpassthru(resource fp)>

Output all remaining data from a file pointer

=cut

.sub 'fpassthru'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    .local pmc stream
    stream = fetch_resource($P1, STREAM_PMC)
    unless null stream goto L2
    .RETURN_FALSE()
  L2:
    $I0 = stream_passthru(stream)
    .RETURN_LONG($I0)
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

=item C<array pathinfo(string path[, int options])>

Returns information about a certain string

NOT IMPLEMENTED.

=cut

.sub 'pathinfo'
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

STILL INCOMPLETE (see stream_open)

=cut

.sub 'readfile'
    .param pmc args :slurpy
    .local string filename
    .local int use_include_path
    .local pmc context
    use_include_path = 0
    ($I0, filename, use_include_path, context) = parse_parameters('s|br!', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    .local pmc stream
    $I0 = ENFORCE_SAFE_MODE | REPORT_ERRORS
    unless use_include_path goto L2
    $I0 |= USE_PATH
  L2:
    stream = stream_open(filename, 'r', $I0, context)
    unless stream goto L3
    $I0 = stream_passthru(stream)
    close stream
    .RETURN_LONG($I0)
  L3:
    .RETURN_FALSE()
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
