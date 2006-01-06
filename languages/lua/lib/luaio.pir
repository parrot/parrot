# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

lib/luaio.pir - Lua Input/Output Library

=head1 DESCRIPTION

The I/O library provides two different styles for file manipulation. The first
one uses implicit file descriptors, that is, there are operations to set a
default input file and a default output file, and all input/output operations
are over those default files. The second style uses explicit file descriptors.

When using implicit file descriptors, all operations are supplied by table
C<io>. When using explicit file descriptors, the operation C<io.open> returns
a file descriptor and then all operations are supplied as methods by the file
descriptor.

The table C<io> also provides three predefined file descriptors with their
usual meanings from C: C<io.stdin>, C<io.stdout>, and C<io.stderr>.

A file handle is a userdata containing the file stream (FILE*), with a
distinctive metatable created by the I/O library.

Unless otherwise stated, all I/O functions return B<nil> on failure (plus an
error message as a second result) and some value different from B<nil> on
success.

See "Lua 5.0 Reference Manual", section 5.6 "Input and Ouput Facilities".

=head2 Functions

=over 4

=cut

.namespace [ "Lua" ]
.HLL "Lua", "lua_group"


.sub init :load, :anon

    load_bytecode "languages/lua/lib/luapir.pbc"
    load_bytecode "languages/lua/lib/luabasic.pbc"

#    print "init Lua I/O\n"

    .local pmc _lua__G
    _lua__G = global "_G"
    $P1 = new .LuaString

    .local pmc _io
    _io = new .LuaTable
    $P1 = "io"
    _lua__G[$P1] = _io

    .const .Sub _io_close = "_io_close"
    $P0 = _io_close
    $P1 = "close"
    _io[$P1] = $P0

    .const .Sub _io_flush = "_io_flush"
    $P0 = _io_flush
    $P1 = "flush"
    _io[$P1] = $P0

    .const .Sub _io_input = "_io_input"
    $P0 = _io_input
    $P1 = "input"
    _io[$P1] = $P0

    .const .Sub _io_lines = "_io_lines"
    $P0 = _io_lines
    $P1 = "lines"
    _io[$P1] = $P0

    .const .Sub _io_open = "_io_open"
    $P0 = _io_open
    $P1 = "open"
    _io[$P1] = $P0

    .const .Sub _io_output = "_io_output"
    $P0 = _io_output
    $P1 = "output"
    _io[$P1] = $P0

    .const .Sub _io_read = "_io_read"
    $P0 = _io_read
    $P1 = "read"
    _io[$P1] = $P0

    .const .Sub _io_tmpfile = "_io_tmpfile"
    $P0 = _io_tmpfile
    $P1 = "tmpfile"
    _io[$P1] = $P0

    .const .Sub _io_type = "_io_type"
    $P0 = _io_type
    $P1 = "type"
    _io[$P1] = $P0

    .const .Sub _io_write = "_io_write"
    $P0 = _io_write
    $P1 = "write"
    _io[$P1] = $P0

    #
    #    File
    #

    .local pmc _file
    _file = new .LuaTable

    .const .Sub _file_close = "_file_close"
    $P0 = _file_close
    $P1 = "close"
    _io[$P1] = $P0

    .const .Sub _file_flush = "_file_flush"
    $P0 = _file_flush
    $P1 = "flush"
    _io[$P1] = $P0

    .const .Sub _file_lines = "_file_lines"
    $P0 = _file_lines
    $P1 = "lines"
    _io[$P1] = $P0

    .const .Sub _file_read = "_file_read"
    $P0 = _file_read
    $P1 = "read"
    _io[$P1] = $P0

    .const .Sub _file_seek = "_file_seek"
    $P0 = _file_seek
    $P1 = "seek"
    _io[$P1] = $P0

    .const .Sub _file_write = "_file_write"
    $P0 = _file_write
    $P1 = "write"
    _io[$P1] = $P0


#    $P1 = "stdin"
#    _io[$P1] = $P0
#
#    $P1 = "stdout"
#    _io[$P1] = $P0
#
#    $P1 = "stderr"
#    _io[$P1] = $P0

.end

=item C<io.close ([file])>

Equivalent to C<file:close()>. Without a C<file>, closes the default output
file.

NOT YET IMPLEMENTED.

=cut

.sub _io_close :anon
    not_implemented()
.end

=item C<io.flush ()>

Equivalent to C<file:flush> over the default output file.

NOT YET IMPLEMENTED.

=cut

.sub _io_flush :anon
    not_implemented()
.end

=item C<io.input ([file])>

When called with a file name, it opens the named file (in text mode), and
sets its handle as the default input file. When called with a file handle, it
simply sets that file handle as the default input file. When called without
parameters, it returns the current default input file.

In case of errors this function raises the error, instead of returning an
error code.

NOT YET IMPLEMENTED.

=cut

.sub _io_input :anon
    not_implemented()
.end

=item C<io.lines ([filename])>

Opens the given file name in read mode and returns an iterator function that,
each time it is called, returns a new line from the file. Therefore, the
construction

    for line in io.lines(filename) do ... end

will iterate over all lines of the file. When the iterator function detects
the end of file, it returns B<nil> (to finish the loop) and automatically
closes the file.

The call C<io.lines()> (without a file name) is equivalent to
C<io.input():lines()>, that is, it iterates over the lines of the default
input file.

NOT YET IMPLEMENTED.

=cut

.sub _io_lines :anon
    not_implemented()
.end

=item C<io.open (filename [, mode])>

This function opens a file, in the mode specified in the string C<mode>. It
returns a new file handle, or, in case of errors, B<nil> plus an error message.

The C<mode> string can be any of the following:

C<"r"> read mode (the default);

C<"w"> write mode;

C<"a"> append mode;

C<"r+"> update mode, all previous data is preserved;

C<"w+"> update mode, all previous data is erased;

C<"a+"> append update mode, previous data is preserved, writing is only
allowed at the end of file.

The C<mode> string may also have a C<b> at the end, which is needed in some
systems to open the file in binary mode. This string is exactly what is used
in the standard C function C<fopen>.

NOT YET IMPLEMENTED.

=cut

.sub _io_open :anon
    not_implemented()
.end

=item C<io.output ([file])>

Similar to C<io.input>, but operates over the default output file.

NOT YET IMPLEMENTED.

=cut

.sub _io_output :anon
    not_implemented()
.end

=item C<io.read (format1, ...)>

Equivalent to C<io.input():read>.

NOT YET IMPLEMENTED.

=cut

.sub _io_read :anon
    not_implemented()
.end

=item C<io.tmpfile ()>

Returns a handle for a temporary file. This file is open in update mode and
it is automatically removed when the program ends.

NOT YET IMPLEMENTED.

=cut

.sub _io_tmpfile :anon
    not_implemented()
.end

=item C<io.type (obj)>

Checks whether C<obj> is a valid file handle. Returns the string C<"file"> if
C<obj> is an open file handle, C<"closed file"> if C<obj> is a closed file
handle, and B<nil> if C<obj> is not a file handle.

NOT YET IMPLEMENTED.

=cut

.sub _io_type :anon
    not_implemented()
.end

=item C<io.write (value1, ...)>

Equivalent to C<io.output():write>.

NOT YET IMPLEMENTED.

=cut

.sub _io_write :anon
    not_implemented()
.end

=item C<file:close ()>

Closes C<file>.

NOT YET IMPLEMENTED.

=cut

.sub _file_close :anon
    not_implemented()
.end

=item C<file:flush ()>

Saves any written data to C<file>.

NOT YET IMPLEMENTED.

=cut

.sub _file_flush :anon
    not_implemented()
.end

=item C<file:lines ()>

Returns an iterator function that, each time it is called, returns a new line
from the file. Therefore, the construction

    for line in file:lines() do ... end

will iterate over all lines of the file. (Unlike C<io.lines>, this function
does not close the file when the loop ends.)

NOT YET IMPLEMENTED.

=cut

.sub _file_lines :anon
    not_implemented()
.end

=item C<file:read (format1, ...)>

Reads the file C<file>, according to the given formats, which specify what to
read. For each format, the function returns a string (or a number) with the
characters read, or B<nil> if it cannot read data with the specified format.
When called without formats, it uses a default format that reads the entire
next line (see below).

The available formats are

C<"*n"> reads a number; this is the only format that returns a number instead
of a string.

C<"*a"> reads the whole file, starting at the current position. On end of
file, it returns the empty string.

C<"*l"> reads the next line (skipping the end of line), returning B<nil> on
end of file. This is the default format.

I<number> reads a string with up to that number of characters, returning
B<nil> on end of file. If number is zero, it reads nothing and returns an
empty string, or B<nil> on end of file.

NOT YET IMPLEMENTED.

=cut

.sub _file_read :anon
    not_implemented()
.end

=item C<file:seek ([whence] [, offset])>

Sets and gets the file position, measured from the beginning of the file, to
the position given by C<offset> plus a base specified by the string C<whence>,
as follows:

C<"set"> base is position 0 (beginning of the file);

C<"cur"> base is current position;

C<"end"> base is end of file;

In case of success, function C<seek> returns the final file position, measured
in bytes from the beginning of the file. If this function fails, it returns
B<nil>, plus a string describing the error.

The default value for C<whence> is C<"cur">, and for C<offset> is 0.
Therefore, the call C<file:seek()> returns the current file position, without
changing it; the call C<file:seek("set")> sets the position to the beginning
of the file (and returns 0); and the call C<file:seek("end")> sets the
position to the end of the file, and returns its size.

NOT YET IMPLEMENTED.

=cut

.sub _file_seek :anon
    not_implemented()
.end

=item C<file:write (value1, ...)>

Writes the value of each of its arguments to the filehandle C<file>. The
arguments must be strings or numbers. To write other values, use C<tostring>
or C<string.format> before write.

NOT YET IMPLEMENTED.

=cut

.sub _file_write :anon
    not_implemented()
.end

=back

=head1 AUTHORS


=cut

