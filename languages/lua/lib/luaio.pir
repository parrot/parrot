# Copyright (C) 2005-2006, The Perl Foundation.
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

Unless otherwise stated, all I/O functions return B<nil> on failure (plus an
error message as a second result) and some value different from B<nil> on
success.

See "Lua 5.1 Reference Manual", section 5.7 "Input and Ouput Facilities".

=head2 Functions

=over 4

=cut

.HLL 'Lua', 'lua_group'

.sub 'init_io' :load :anon

    load_bytecode 'languages/lua/type/table.pbc'
    load_bytecode 'languages/lua/type/userdata.pbc'
    load_bytecode 'languages/lua/lib/luabasic.pbc'

#    print "init Lua I/O\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = global '_G'
    $P1 = new .LuaString

    find_type $I0, 'table'
    .local pmc _io
    _io = new $I0
    $P1 = 'io'
    _lua__GLOBAL[$P1] = _io

    .const .Sub _io_close = '_io_close'
    $P1 = 'close'
    _io[$P1] = _io_close

    .const .Sub _io_flush = '_io_flush'
    $P1 = 'flush'
    _io[$P1] = _io_flush

    .const .Sub _io_input = '_io_input'
    $P1 = 'input'
    _io[$P1] = _io_input

    .const .Sub _io_lines = '_io_lines'
    $P1 = 'lines'
    _io[$P1] = _io_lines

    .const .Sub _io_open = '_io_open'
    $P1 = 'open'
    _io[$P1] = _io_open

    .const .Sub _io_output = '_io_output'
    $P1 = 'output'
    _io[$P1] = _io_output

    .const .Sub _io_popen = '_io_popen'
    $P1 = 'popen'
    _io[$P1] = _io_popen

    .const .Sub _io_read = '_io_read'
    $P1 = 'read'
    _io[$P1] = _io_read

    .const .Sub _io_tmpfile = '_io_tmpfile'
    $P1 = 'tmpfile'
    _io[$P1] = _io_tmpfile

    .const .Sub _io_type = '_io_type'
    $P1 = 'type'
    _io[$P1] = _io_type

    .const .Sub _io_write = '_io_write'
    $P1 = 'write'
    _io[$P1] = _io_write

    #
    #    File
    #

    .local pmc _file
    _file = new $I0

    .const .Sub _file_close = '_io_close'
    $P1 = 'close'
    _file[$P1] = _file_close

    .const .Sub _file_flush = '_file_flush'
    $P1 = 'flush'
    _file[$P1] = _file_flush

    .const .Sub _file_lines = '_file_lines'
    $P1 = 'lines'
    _file[$P1] = _file_lines

    .const .Sub _file_read = '_file_read'
    $P1 = 'read'
    _file[$P1] = _file_read

    .const .Sub _file_seek = '_file_seek'
    $P1 = 'seek'
    _file[$P1] = _file_seek

    .const .Sub _file_setvbuf = '_file_setvbuf'
    $P1 = 'setvbuf'
    _file[$P1] = _file_setvbuf

    .const .Sub _file_write = '_file_write'
    $P1 = 'write'
    _file[$P1] = _file_write

#    .const .Sub _file__tostring = '_file__tostring'
#    $P1 = '__tostring'
#    _file[$P1] = _file__tostring

    .local pmc _lua_mt_file
    _lua_mt_file = new $I0
    $P1 = '__index'
    _lua_mt_file[$P1] = _file

    .const .Sub _file__tostring = '_file__tostring'
    $P1 = '__tostring'
    _lua_mt_file[$P1] = _file__tostring


    .local pmc _lua__REGISTRY
    _lua__REGISTRY = global '_REGISTRY'
    $P1 = 'file'
    _lua__REGISTRY[$P1] = _lua_mt_file


    #
    #    Standard Files
    #

    .local pmc _lua__ENVIRON
    _lua__ENVIRON = global '_ENVIRON'
    $P3 = new .LuaNumber

    find_type $I0, 'userdata'
    $P1 = 'stdin'
    $P2 = getstdin
    $P0 = new $I0
    setattribute $P0, 0, $P2
    $P0.'set_metatable'(_lua_mt_file)
    _io[$P1] = $P0
    $P3 = 0
    _lua__ENVIRON[$P3] = $P0

    $P1 = 'stdout'
    $P2 = getstdout
    $P0 = new $I0
    setattribute $P0, 0, $P2
    $P0.'set_metatable'(_lua_mt_file)
    _io[$P1] = $P0
    $P3 = 1
    _lua__ENVIRON[$P3] = $P0

    $P1 = 'stderr'
    $P2 = getstderr
    $P0 = new $I0
    setattribute $P0, 0, $P2
    $P0.'set_metatable'(_lua_mt_file)
    _io[$P1] = $P0
    $P3 = 2
    _lua__ENVIRON[$P3] = $P0

.end


.sub 'getiofile' :anon
    .param int findex
    .local pmc _lua__ENVIRON
    .local pmc io
    .local pmc file
    _lua__ENVIRON = global '_ENVIRON'
    new io, .LuaNumber
    io = findex
    file = _lua__ENVIRON[io]
    .return (file)
.end


.sub 'getmode' :anon
    .param string mode
    .local string ret
    unless mode == 'r' goto L1
    ret = '<'
    goto L0
L1:
    unless mode == 'w' goto L2
    ret = '>'
    goto L0
L2:
    unless mode == 'a' goto L3
    ret = '>>'
    goto L0
L3:
    unless mode == 'r+' goto L4
    ret = '+<'
    goto L0
L4:
    unless mode == 'w+' goto L5
    ret = '+>'
    goto L0
L5:
    unless mode == 'a+' goto L6
    ret = '+>>'
    goto L0
L6:
    ret = ''
L0:
    .return (ret)
.end


.sub 'newfile' :anon
    .local pmc file
    .local pmc _lua__REGISTRY
    .local pmc mt
    _lua__REGISTRY = global '_REGISTRY'
    .const .LuaString key = 'file'
    mt = _lua__REGISTRY[key]
    find_type $I0, 'userdata'
    new file, $I0
    file.'set_metatable'(mt)
    .return (file)
.end


.sub 'read_chars' :anon
    .param pmc f
    .param int n
    .local pmc ret
    $S0 = read f, n
    unless $S0 == '' goto L1
    new ret, .LuaNil
    goto L2
L1:
    new ret, .LuaString
    ret = $S0
L2:
    .return (ret)
.end


.sub 'read_line' :anon
    .param pmc f
    .local pmc ret
    $S0 = readline f
    unless $S0 == '' goto L1
    new ret, .LuaNil
    goto L2
L1:
    chopn $S0, 1
    new ret, .LuaString
    ret = $S0
L2:
    .return (ret)
.end


.sub 'setiofile' :anon
    .param int findex
    .param pmc file
    .local pmc _lua__ENVIRON
    .local pmc io
    _lua__ENVIRON = global '_ENVIRON'
    new io, .LuaNumber
    io = findex
    _lua__ENVIRON[io] = file
.end


.sub 'test_eof' :anon
    .param pmc f
    .local pmc ret
    $I1 = isfalse f
    unless $I1 goto L1
    new ret, .LuaNil
    goto L2
L1:
    new ret, .LuaString
    ret = ''
L2:
    .return (ret)
.end


.sub 'tofile' :anon
    .param pmc file
    .local pmc mt
    .local pmc mt_file
    .local pmc ret
    $I0 = isa file, 'userdata'
    $S0 = typeof file
    unless $I0 goto L1
    mt = file.'get_metatable'()
    .local pmc _lua__REGISTRY
    _lua__REGISTRY = global '_REGISTRY'
    .const .LuaString key = 'file'
    mt_file = _lua__REGISTRY[key]
    unless mt == mt_file goto L1
    ret = getattribute file, 0
    if_null ret, L2
    .return (ret)
L2:
    error("attempt to use a closed file")
L1:
    tag_error($S0, 'file')
.end


=item C<io.close ([file])>

Equivalent to C<file:close()>. Without a C<file>, closes the default output
file.

=cut

.sub '_io_close' :anon
    .param pmc file
    .local pmc ret
    unless_null file, L1
    file = getiofile(1)
L1:
    .local pmc f
    f = tofile(file)
    close f
    null f
    setattribute file, 0, f
    new ret, .LuaBoolean
    ret = 1
    .return (ret)
.end


=item C<io.flush ()>

Equivalent to C<file:flush> over the default output file.

=cut

.sub '_io_flush' :anon
    .local pmc file
    .local pmc ret
    .const .LuaString key = 'flush'
    file = getiofile(1)
    $P0 = file[key]
    ret = $P0(file)
    .return (ret)
.end


=item C<io.input ([file])>

When called with a file name, it opens the named file (in text mode), and
sets its handle as the default input file. When called with a file handle, it
simply sets that file handle as the default input file. When called without
parameters, it returns the current default input file.

In case of errors this function raises the error, instead of returning an
error code.

=cut

.sub '_io_input' :anon
    .param pmc file :optional
    .local pmc ret
    .local pmc f
    if_null file, L1
    unless file goto L1
    $I1 = isa file, 'LuaString'
    unless $I1 goto L2
    $S1 = file
    f = open $S1, '<'
    unless_null f, L3
    argerror(file)
L3:
    ret = newfile()
    setattribute ret, 0, f
    setiofile(0, ret)
    goto L1
L2:
    tofile(file)
    setiofile(0, file)
    goto L1
L1:
    ret = getiofile(0)
    .return (ret)
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
input file. In this case it does not close the file when the loop ends.

NOT YET IMPLEMENTED (see file:lines).

=cut

.sub '_io_lines' :anon
    .param pmc filename
    .local pmc file
    .local pmc f
    .local pmc ret
    .const .LuaString key = 'lines'
    unless_null filename, L1
    file = getiofile(0)
    goto L3
L1:
    $S1 = checkstring(filename)
    f = open $S1, '<'
    unless_null f, L2
    argerror($S1)
L2:
    file = newfile()
    setattribute file, 0, f
L3:
    $P0 = file[key]
    ret = $P0(file)
    .return (ret)
.end


=item C<io.open (filename [, mode])>

This function opens a file, in the mode specified in the string C<mode>. It
returns a new file handle, or, in case of errors, B<nil> plus an error message.

The C<mode> string can be any of the following:

=over 4

=item B<"r">

read mode (the default);

=item B<"w">

write mode;

=item B<"a">

append mode;

=item B<"r+">

update mode, all previous data is preserved;

=item B<"w+">

update mode, all previous data is erased;

=item B<"a+">

append update mode, previous data is preserved, writing is
only allowed at the end of file.

=back

The C<mode> string may also have a C<b> at the end, which is needed in some
systems to open the file in binary mode. This string is exactly what is used
in the standard C function C<fopen>.

=cut

.sub '_io_open' :anon
    .param pmc filename :optional
    .param pmc mode :optional
    .local pmc f
    .local pmc ret
    $S1 = checkstring(filename)
    $S2 = optstring(mode, 'r')
    $S3 = getmode($S2)
    if $S3 == '' goto L1
    f = open $S1, $S3
    unless f goto L1
    ret = newfile()
    setattribute ret, 0, f
    .return (ret)
L1:
    new ret, .LuaNil
    .local pmc msg
    new msg, .LuaString
    $S0 = err
    concat $S1, ': '
    concat $S1, $S0
    msg = $S1
    .return (ret, msg)
.end


=item C<io.output ([file])>

Similar to C<io.input>, but operates over the default output file.

=cut

.sub '_io_output' :anon
    .param pmc file :optional
    .local pmc ret
    .local pmc f
    if_null file, L1
    unless file goto L1
    $I1 = isa file, 'LuaString'
    unless $I1 goto L2
    $S1 = file
    f = open $S1, '>'
    unless_null f, L3
    argerror(file)
L3:
    ret = newfile()
    setattribute ret, 0, f
    setiofile(1, ret)
    goto L1
L2:
    tofile(file)
    setiofile(1, file)
L1:
    ret = getiofile(1)
    .return (ret)
.end


=item C<io.popen ([prog [, mode]])>

Starts program C<prog> in a separated process and returns a file handle that
you can use to read data from this program (if C<mode> is C<"r">, the default)
or to write data to this program (if C<mode> is C<"w">).

This function is system dependent and is not available on all platforms.

NOT YET IMPLEMENTED.

=cut

.sub '_io_popen' :anon
    not_implemented()
.end


=item C<io.read (format1, ...)>

Equivalent to C<io.input():read>.

STILL INCOMPLETE (see file:read).

=cut

.sub '_io_read' :anon
    .param pmc argv :slurpy
    .local pmc file
    .local pmc ret
    .const .LuaString key = 'read'
    file = getiofile(0)
    $P0 = file[key]
    ret = $P0(file, argv :flat)
    .return (ret)
.end


=item C<io.tmpfile ()>

Returns a handle for a temporary file. This file is open in update mode and
it is automatically removed when the program ends.

NOT YET IMPLEMENTED.

=cut

.sub '_io_tmpfile' :anon
    not_implemented()
.end


=item C<io.type (obj)>

Checks whether C<obj> is a valid file handle. Returns the string C<"file"> if
C<obj> is an open file handle, C<"closed file"> if C<obj> is a closed file
handle, and B<nil> if C<obj> is not a file handle.

=cut

.sub '_io_type' :anon
    .param pmc obj :optional
    .local pmc mt
    .local pmc mt_file
    .local pmc f
    .local pmc ret
    checkany(obj)
    mt = obj.'get_metatable'()
    .local pmc _lua__REGISTRY
    _lua__REGISTRY = global '_REGISTRY'
    .const .LuaString key = 'file'
    mt_file = _lua__REGISTRY[key]
    if mt == mt_file goto L1
    ret = new .LuaNil
    goto L3
L1:
    ret = new .LuaString
    f = getattribute obj, 0
    unless_null f, L2
    ret = "closed file"
    goto L3
L2:
    ret = 'file'
L3:
    .return (ret)
.end


=item C<io.write (value1, ...)>

Equivalent to C<io.output():write>.

=cut

.sub '_io_write' :anon
    .param pmc argv :slurpy
    .local pmc file
    .local pmc ret
    .const .LuaString key = 'write'
    file = getiofile(1)
    $P0 = file[key]
    ret = $P0(file, argv :flat)
    .return (ret)
.end


=item C<file:close ()>

Closes C<file>. Note that files are automatically closed when their handles
are garbage collected, but that takes an unpredictable amount of time to happen.

=cut


=item C<file:flush ()>

Saves any written data to C<file>.

=cut

.sub '_file_flush' :anon
    .param pmc self
    .local pmc f
    .local pmc ret
    f = tofile(self)
    f.'flush'()
    new ret, .LuaBoolean
    ret = 1
    .return (ret)
.end


=item C<file:lines ()>

Returns an iterator function that, each time it is called, returns a new line
from the file. Therefore, the construction

    for line in file:lines() do ... end

will iterate over all lines of the file. (Unlike C<io.lines>, this function
does not close the file when the loop ends.)

NOT YET IMPLEMENTED.

=cut

.sub '_file_lines' :anon
    not_implemented()
.end


=item C<file:read (format1, ...)>

Reads the file C<file>, according to the given formats, which specify what to
read. For each format, the function returns a string (or a number) with the
characters read, or B<nil> if it cannot read data with the specified format.
When called without formats, it uses a default format that reads the entire
next line (see below).

The available formats are

=over 4

=item B<"*n">

reads a number; this is the only format that returns a number
instead of a string.

=item B<"*a">

reads the whole file, starting at the current position. On end
of file, it returns the empty string.

=item B<"*l">

reads the next line (skipping the end of line), returning B<nil>
on end of file. This is the default format.

=item B<number>

reads a string with up to that number of characters, returning
B<nil> on end of file. If number is zero, it reads nothing and returns an
empty string, or B<nil> on end of file.

=back

STILL INCOMPLETE.

=cut

.sub '_file_read' :anon
    .param pmc self
    .param pmc formats :slurpy
    .local pmc ret
    .local pmc f
    tofile(self)
    f = getattribute self, 0
    if formats, L1
    ret = read_line(f)
    .return (ret)
L1:
    .local int narg
    .local int i
    .local pmc format
    narg = formats
    new ret, .Array
    ret = narg
    i = 0
L2:
    unless i < narg goto L3
    format = formats[i]
    $I0 = isa format, 'LuaNumber'
    unless $I0 goto L4
    .local int l
    l = format
    unless l == 0 goto L5
    $P0 = test_eof(f)
    ret[i] = $P0
    goto L6
L5:
    $P0 = read_chars(f, l)
    ret[i] = $P0
    goto L6
L4:
    $S0 = checkstring(format)
    unless $S0 == '*n' goto L7
    not_implemented()
    goto L6
L7:
    unless $S0 == '*l' goto L8
    $P0 = read_line(f)
    ret[i] = $P0
    goto L6
L8:
    unless $S0 == '*a' goto L9
    $P0 = read_chars(f, 65535)
    ret[i] = $P0
    goto L6
L9:
    argerror("invalid format")
L6:
    inc i
    goto L2
L3:
    .return (ret :flat)
.end


=item C<file:seek ([whence] [, offset])>

Sets and gets the file position, measured from the beginning of the file, to
the position given by C<offset> plus a base specified by the string C<whence>,
as follows:

=over 4

=item B<"set">

base is position 0 (beginning of the file);

=item B<"cur">

base is current position;

=item B<"end">

base is end of file;

=back

In case of success, function C<seek> returns the final file position, measured
in bytes from the beginning of the file. If this function fails, it returns
B<nil>, plus a string describing the error.

The default value for C<whence> is C<"cur">, and for C<offset> is 0.
Therefore, the call C<file:seek()> returns the current file position, without
changing it; the call C<file:seek("set")> sets the position to the beginning
of the file (and returns 0); and the call C<file:seek("end")> sets the
position to the end of the file, and returns its size.

=cut

.sub '_file_seek' :anon
    .param pmc self
    .param pmc whence :optional
    .param pmc offset :optional
    .local pmc options
    .local pmc f
    .local pmc ret
    tofile(self)
    new options, .Array
    options = 3
    options[0] = 'set'
    options[1] = 'cur'
    options[2] = 'end'
    $S1 = optstring(whence, 'cur')
    $I1 = checkoption($S1, options)
    $I2 = optint(offset, 0)
    f = getattribute self, 0
    seek f, $I2, $I1
    $I3 = tell f
    new ret, .LuaNumber
    ret = $I3
    .return (ret)
.end


=item C<file:setvbuf (mode [, size])>

Sets the buffering mode for an output file. There are three available modes:

=over 4

=item B<"no">

no buffering; the result of any output operation appears immediately.

=item B<"full">

full buffering; output operation is performed only when the
buffer is full (or when you explicitly flush the file).

=item B<"line">

line buffering; output is buffered until a newline is output
or there is any input from some special files (such as a terminal device).

=back

For the last two cases, sizes specifies the size of the buffer, in bytes.
The default is an appropriate size.

NOT YET IMPLEMENTED.

=cut

.sub '_file_setvbuf' :anon
    .param pmc self
    .param pmc mode :optional
    .param pmc size :optional
    .local pmc options
    .local pmc f
    .local pmc ret
    tofile(self)
    new options, .Array
    options = 3
    options[0] = 'no'
    options[1] = 'full'
    options[2] = 'line'
    $S1 = checkstring(mode)
    $I1 = checkoption($S1, options)
    $I2 = optint(size, 512)
    f = getattribute self, 0
    not_implemented()
    .return (ret)
.end


=item C<file:write (value1, ...)>

Writes the value of each of its arguments to the filehandle C<file>. The
arguments must be strings or numbers. To write other values, use C<tostring>
or C<string.format> before write.

=cut

.sub '_file_write' :anon
    .param pmc self
    .param pmc argv :slurpy
    .local pmc ret
    .local int argc
    .local int i
    .local pmc f
    tofile(self)
    f = getattribute self, 0
    argc = argv
    i = 0
L1:
    if i >= argc goto L2
    $P0 = argv[i]
    $I0 = isa $P0, 'LuaNumber'
    unless $I0 goto L3
    print f, $P0
    goto L4
L3:
    $S0 = checkstring($P0)
    print f, $S0
L4:
    inc i
    goto L1
L2:
    new ret, .LuaBoolean
    ret = 1
    .return (ret)
.end


.sub '_file__tostring' :anon
    .param pmc self
    .local pmc f
    .local pmc ret
    new ret, .LuaString
    f = getattribute self, 0
    unless f goto L1
    $S0 = "file ("
    $S1 = self
    $S1 = substr $S1, 10, 8
    concat $S0, $S1
    concat $S0, ")"
    goto L2
L1:
    $S0 = "file (closed)"
L2:
    ret = $S0
    .return (ret)
.end

=back

=head1 AUTHORS

Francois Perrad.

=cut

