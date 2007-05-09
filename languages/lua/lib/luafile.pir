# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

lib/luafile.pir - Lua Input/Output Library

=head1 DESCRIPTION

See F<languages/lua/lib/luaio.pir>.

=head2 Functions

=over 4

=cut

.HLL 'Lua', 'lua_group'

.sub 'createmeta'
    .param pmc env
    .local pmc _file
    _file = lua_newmetatable('ParrotIO')

    new $P1, .LuaString
    set $P1, '__index'
    _file[$P1] = _file

    .const .Sub _file_close = 'close'
    _file_close.'setfenv'(env)
    set $P1, 'close'
    _file[$P1] = _file_close

    .const .Sub _file_flush = 'flush'
    _file_flush.'setfenv'(env)
    set $P1, 'flush'
    _file[$P1] = _file_flush

    .const .Sub _file_lines = 'lines'
    _file_lines.'setfenv'(env)
    set $P1, 'lines'
    _file[$P1] = _file_lines

    .const .Sub _file_read = 'read'
    _file_read.'setfenv'(env)
    set $P1, 'read'
    _file[$P1] = _file_read

    .const .Sub _file_seek = 'seek'
    _file_seek.'setfenv'(env)
    set $P1, 'seek'
    _file[$P1] = _file_seek

    .const .Sub _file_setvbuf = 'setvbuf'
    _file_setvbuf.'setfenv'(env)
    set $P1, 'setvbuf'
    _file[$P1] = _file_setvbuf

    .const .Sub _file_write = 'write'
    _file_write.'setfenv'(env)
    set $P1, 'write'
    _file[$P1] = _file_write

    .const .Sub _file__gc = '__gc'
    _file__gc.'setfenv'(env)
    set $P1, '__gc'
    _file[$P1] = _file__gc

    .const .Sub _file__tostring = '__tostring'
    _file__tostring.'setfenv'(env)
    set $P1, '__tostring'
    _file[$P1] = _file__tostring

    .return (_file)
.end


=item C<file:close ()>

Closes C<file>. Note that files are automatically closed when their handles
are garbage collected, but that takes an unpredictable amount of time to happen.

=cut

.sub 'close' :method :anon
    .local pmc ret
    tofile(self)
    ret = aux_close(self)
    .return (ret)
.end


=item C<file:flush ()>

Saves any written data to C<file>.

=cut

.sub 'flush' :method :anon
    .local pmc f
    .local pmc ret
    f = tofile(self)
    f.'flush'()
    new ret, .LuaBoolean
    set ret, 1
    .return (ret)
.end


=item C<file:lines ()>

Returns an iterator function that, each time it is called, returns a new line
from the file. Therefore, the construction

    for line in file:lines() do ... end

will iterate over all lines of the file. (Unlike C<io.lines>, this function
does not close the file when the loop ends.)

=cut

.sub 'lines' :method :anon
    tofile(self)
    .return aux_lines(self, 0)
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

=cut

.sub 'read' :method :anon
    .param pmc formats :slurpy
    .local pmc ret
    .local pmc f
    tofile(self)
    f = getattribute self, 'data'
    if formats, L1
    .return read_line(f)
L1:
    .local int narg
    .local int i
    .local pmc format
    narg = formats
    new ret, .FixedPMCArray
    set ret, narg
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
    $S0 = lua_checkstring(i, format)
    $I0 = index $S0, '*n'
    unless $I0 == 0 goto L7
    # number
    $P0 = read_number(f)
    ret[i] = $P0
    goto L6
L7:
    $I0 = index $S0, '*l'
    unless $I0 == 0 goto L8
    # line
    $P0 = read_line(f)
    ret[i] = $P0
    goto L6
L8:
    $I0 = index $S0, '*a'
    unless $I0 == 0 goto L9
    # file
    $P0 = read_chars(f, 65535)
    ret[i] = $P0
    goto L6
L9:
    inc i
    lua_argerror(i, "invalid format")
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

.sub 'seek' :method :anon
    .param pmc whence :optional
    .param pmc offset :optional
    .local pmc f
    .local pmc ret
    tofile(self)
    $S1 = lua_optstring(1, whence, 'cur')
    $I1 = lua_checkoption(1, $S1, 'set cur end')
    $I2 = lua_optint(2, offset, 0)
    f = getattribute self, 'data'
    seek f, $I2, $I1
    $I0 = tell f
    new ret, .LuaNumber
    set ret, $I0
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

.sub 'setvbuf' :method :anon
    .param pmc mode :optional
    .param pmc size :optional
    .local pmc mode
    .local pmc f
    .local pmc ret
    tofile(self)
    $S1 = lua_checkstring(1, mode)
    $I1 = lua_checkoption(1, $S1, 'no full line')
    $I2 = lua_optint(2, size, 512)     # LUAL_BUFFERSIZE
    new mode, .FixedIntegerArray
    set mode, 3
    mode[0] = 0     # PIO_NONBUF
    mode[1] = 2     # PIO_FULLBUF
    mode[2] = 1     # PIO_LINEBUF
    f = getattribute self, 'data'
    $I0 = mode[$I1]
    # not_implemented
    f.'buffer_type'($I0)
    if $I1 == 0 goto L1
    f.'buffer_size'($I2)
L1:
    new ret, .LuaBoolean
    set ret, 1
    .return (ret)
.end


=item C<file:write (value1, ...)>

Writes the value of each of its arguments to the filehandle C<file>. The
arguments must be strings or numbers. To write other values, use C<tostring>
or C<string.format> before write.

=cut

.sub 'write' :method :anon
    .param pmc argv :slurpy
    .local pmc ret
    .local int argc
    .local int i
    .local pmc f
    tofile(self)
    f = getattribute self, 'data'
    argc = argv
    i = 0
L1:
    if i >= argc goto L2
    $P0 = argv[i]
    inc i
    $I0 = isa $P0, 'LuaNumber'
    unless $I0 goto L3
    print f, $P0
    goto L1
L3:
    $S0 = lua_checkstring(i, $P0)
    print f, $S0
    goto L1
L2:
    new ret, .LuaBoolean
    set ret, 1
    .return (ret)
.end


.sub '__gc' :method :anon
    .local pmc f
    f = topfile(self)
    # ignore closed files and standard files
    if null f goto L1
    $P0 = getstdin
    $I0 = issame $P0, f
    if $I0 goto L1
    $P0 = getstdout
    $I0 = issame $P0, f
    if $I0 goto L1
    $P0 = getstderr
    $I0 = issame $P0, f
    if $I0 goto L1
    print "closing file for you.\n"
    aux_close(self)
L1:
    .return ()
.end


.sub '__tostring' :method :anon
    .local pmc f
    .local pmc ret
    f = topfile(self)
    new ret, .LuaString
    if f goto L1
    $S0 = "file (closed)"
    goto L2
L1:
    $S0 = "file ("
    $S1 = self
    $S1 = substr $S1, 10, 8
    concat $S0, $S1
    concat $S0, ")"
L2:
    set ret, $S0
    .return (ret)
.end

=back

=head1 AUTHORS

Francois Perrad.

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
