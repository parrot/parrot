# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luafile.pir - Lua Input/Output Library

=head1 DESCRIPTION

See F<languages/lua/lib/luaio.pir>.

=head2 Functions

=over 4

=cut

.HLL 'Lua'
.loadlib 'lua_group'
.namespace [ 'io'; 'file' ]

.sub 'createmeta'
    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    .local pmc _file
    _file = lua_newmetatable('FileHandle')

    new $P1, 'LuaString'
    set $P1, '__index'
    _file[$P1] = _file

    $P2 = split "\n", <<'LIST'
close
flush
lines
read
seek
setvbuf
write
__gc
__tostring
LIST
    null $P0
    lua_register($P0, _file, $P2)

    $P0 = get_hll_namespace ['io']
    $P1 = get_namespace
    $P2 = split ' ', 'aux_close aux_lines read_chars read_number read_line test_eof tofile tofilep'
    $P0.'export_to'($P1, $P2)

    .return (_file)
.end


=item C<file:close ()>

Closes C<file>. Note that files are automatically closed when their handles
are garbage collected, but that takes an unpredictable amount of time to happen.

=cut

.sub 'close' :method
    .param pmc extra :slurpy
    .local pmc res
    tofile(self)
    (res :slurpy) = aux_close(self)
    .return (res :flat)
.end


=item C<file:flush ()>

Saves any written data to C<file>.

=cut

.sub 'flush' :method
    .param pmc extra :slurpy
    .local pmc f
    .local pmc res
    f = tofile(self)
    f.'flush'()
    new res, 'LuaBoolean'
    set res, 1
    .return (res)
.end


=item C<file:lines ()>

Returns an iterator function that, each time it is called, returns a new line
from the file. Therefore, the construction

    for line in file:lines() do ... end

will iterate over all lines of the file. (Unlike C<io.lines>, this function
does not close the file when the loop ends.)

=cut

.sub 'lines' :method
    .param pmc extra :slurpy
    tofile(self)
    .tailcall aux_lines(self, 0)
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

.sub 'read' :method
    .param pmc formats :slurpy
    .local pmc res
    .local pmc f
    tofile(self)
    f = getattribute self, 'data'
    if formats goto L1
    .tailcall read_line(f)
  L1:
    .local int narg
    .local int i
    .local pmc format
    narg = formats
    new res, 'FixedPMCArray'
    set res, narg
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
    res[i] = $P0
    goto L6
  L5:
    $P0 = read_chars(f, l)
    res[i] = $P0
    goto L6
  L4:
    $S0 = lua_checkstring(i, format)
    $I0 = index $S0, '*n'
    unless $I0 == 0 goto L7
    # number
    $P0 = read_number(f)
    res[i] = $P0
    goto L6
  L7:
    $I0 = index $S0, '*l'
    unless $I0 == 0 goto L8
    # line
    $P0 = read_line(f)
    res[i] = $P0
    goto L6
  L8:
    $I0 = index $S0, '*a'
    unless $I0 == 0 goto L9
    # file
    $P0 = read_chars(f, 65535)
    res[i] = $P0
    goto L6
  L9:
    inc i
    lua_argerror(i, "invalid format")
  L6:
    inc i
    goto L2
  L3:
    .return (res :flat)
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

.sub 'seek' :method
    .param pmc whence :optional
    .param pmc offset :optional
    .param pmc extra :slurpy
    .local pmc f
    .local pmc res
    tofile(self)
    $S1 = lua_optstring(1, whence, 'cur')
    $I1 = lua_checkoption(1, $S1, 'set cur end')
    $I2 = lua_optint(2, offset, 0)
    f = getattribute self, 'data'
    seek f, $I2, $I1
    $I0 = tell f
    new res, 'LuaNumber'
    set res, $I0
    .return (res)
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

=cut

.sub 'setvbuf' :method
    .param pmc mode :optional
    .param pmc size :optional
    .param pmc extra :slurpy
    .local pmc mode
    .local pmc f
    .local pmc res
    tofile(self)
    $S1 = lua_checkstring(1, mode)
    $I1 = lua_checkoption(1, $S1, 'no full line')
    $I2 = lua_optint(2, size, 512)     # LUAL_BUFFERSIZE
    mode = split ' ', 'unbuffered full-buffered line-buffered'
    $S0 = mode[$I1]
    f = getattribute self, 'data'
    f.'buffer_type'($S0)
    if $I1 == 0 goto L1
    f.'buffer_size'($I2)
  L1:
    new res, 'LuaBoolean'
    set res, 1
    .return (res)
.end


=item C<file:write (value1, ...)>

Writes the value of each of its arguments to the filehandle C<file>. The
arguments must be strings or numbers. To write other values, use C<tostring>
or C<string.format> before write.

=cut

.sub 'write' :method
    .param pmc argv :slurpy
    .local pmc res
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
    new res, 'LuaBoolean'
    set res, 1
    .return (res)
.end


.sub '__gc' :method
    .local pmc f
    f = tofilep(self)
    # ignore closed files
    if null f goto L1
    aux_close(self)
  L1:
    .return ()
.end


.sub '__tostring' :method
    .local pmc f
    .local pmc res
    f = tofilep(self)
    new res, 'LuaString'
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
    set res, $S0
    .return (res)
.end

=back

=head1 AUTHORS

Francois Perrad.

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
