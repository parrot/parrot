# Copyright (C) 2005-2007, The Perl Foundation.
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
descriptor (see F<languages/lua/lib/luafile.pir>).

The table C<io> also provides three predefined file descriptors with their
usual meanings from C: C<io.stdin>, C<io.stdout>, and C<io.stderr>.

Unless otherwise stated, all I/O functions return B<nil> on failure (plus an
error message as a second result) and some value different from B<nil> on
success.

See "Lua 5.1 Reference Manual", section 5.7 "Input and Ouput Facilities",
L<http://www.lua.org/manual/5.1/manual.html#5.7>.

=head2 Functions

=over 4

=cut

.HLL 'Lua', 'lua_group'

.sub 'luaopen_io'
#    print "init Lua I/O\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_global '_G'
    new $P1, .LuaString

    .local pmc _io_env
    new _io_env, .LuaTable

    .local pmc _popen_env
    new _popen_env, .LuaTable

    .local pmc _file
    _file = createmeta(_io_env)

    .local pmc _io
    new _io, .LuaTable
    set $P1, 'io'
    _lua__GLOBAL[$P1] = _io

    lua_register($P1, _io)

    .const .Sub _io_close = 'close'
    _io_close.'setfenv'(_io_env)
    set $P1, 'close'
    _io[$P1] = _io_close

    .const .Sub _io_flush = 'flush'
    _io_flush.'setfenv'(_io_env)
    set $P1, 'flush'
    _io[$P1] = _io_flush

    .const .Sub _io_input = 'input'
    _io_input.'setfenv'(_io_env)
    set $P1, 'input'
    _io[$P1] = _io_input

    .const .Sub _io_lines = 'lines'
    _io_lines.'setfenv'(_io_env)
    set $P1, 'lines'
    _io[$P1] = _io_lines

    .const .Sub _io_open = 'open'
    _io_open.'setfenv'(_io_env)
    set $P1, 'open'
    _io[$P1] = _io_open

    .const .Sub _io_output = 'output'
    _io_output.'setfenv'(_io_env)
    set $P1, 'output'
    _io[$P1] = _io_output

    .const .Sub _io_popen = 'popen'
    _io_popen.'setfenv'(_popen_env)
    set $P1, 'popen'
    _io[$P1] = _io_popen

    .const .Sub _io_read = 'read'
    _io_read.'setfenv'(_io_env)
    set $P1, 'read'
    _io[$P1] = _io_read

    .const .Sub _io_tmpfile = 'tmpfile'
    _io_tmpfile.'setfenv'(_io_env)
    set $P1, 'tmpfile'
    _io[$P1] = _io_tmpfile

    .const .Sub _io_type = 'type'
    _io_type.'setfenv'(_io_env)
    set $P1, 'type'
    _io[$P1] = _io_type

    .const .Sub _io_write = 'write'
    _io_write.'setfenv'(_io_env)
    set $P1, 'write'
    _io[$P1] = _io_write

    .const .Sub _readline = 'readline'
    _readline.'setfenv'(_io_env)


    # set default close function
    .const .Sub _io_fclose = 'fclose'
    _io_fclose.'setfenv'(_io_env)
    set $P1, '__close'
    _io_env[$P1] = _io_fclose

    # create (and set) default files
    createstdfiles(_file, _io, _io_env)

    # environment for 'popen'
    .const .Sub _io_pclose = 'pclose'
    _io_pclose.'setfenv'(_io_env)
    set $P1, '__close'
    _popen_env[$P1] = _io_pclose

.end


.const int IO_INPUT = 1
.const int IO_OUTPUT = 2


.sub 'createstdfiles' :anon
    .param pmc mt
    .param pmc io
    .param pmc env
    new $P1, .LuaString
    new $P3, .LuaNumber

    set $P1, 'stdin'
    $P2 = getstdin
    new $P0, .LuaUserdata
    setattribute $P0, 'data', $P2
    $P0.'set_metatable'(mt)
    io[$P1] = $P0
    set $P3, IO_INPUT
    env[$P3] = $P0

    set $P1, 'stdout'
    $P2 = getstdout
    new $P0, .LuaUserdata
    setattribute $P0, 'data', $P2
    $P0.'set_metatable'(mt)
    io[$P1] = $P0
    set $P3, IO_OUTPUT
    env[$P3] = $P0

    set $P1, 'stderr'
    $P2 = getstderr
    new $P0, .LuaUserdata
    setattribute $P0, 'data', $P2
    $P0.'set_metatable'(mt)
    io[$P1] = $P0
.end


.sub 'getiofile' :anon
    .param int findex
    .local pmc env
    .local pmc io
    .local pmc file
    $P0 = getinterp
    $P1 = $P0['sub'; 1]
    env = lua_getfenv($P1)
    new io, .LuaNumber
    set io, findex
    file = env[io]
    .return (file)
.end


.sub 'getmode' :anon
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


.sub 'newfile' :anon
    .local pmc file
    .local pmc _lua__REGISTRY
    .local pmc mt
    _lua__REGISTRY = get_global '_REGISTRY'
    .const .LuaString key = 'ParrotIO'
    mt = _lua__REGISTRY[key]
    new file, .LuaUserdata
    file.'set_metatable'(mt)
    .return (file)
.end


.sub 'read_chars'
    .param pmc f
    .param int n
    .local pmc res
    $S0 = read f, n
    unless $S0 == '' goto L1
    new res, .LuaNil
    goto L2
  L1:
    new res, .LuaString
    set res, $S0
  L2:
    .return (res)
.end


.sub 'read_line'
    .param pmc f
    .local pmc res
    $S0 = readline f
    unless $S0 == '' goto L1
    new res, .LuaNil
    goto L2
  L1:
    chopn $S0, 1
    new res, .LuaString
    set res, $S0
  L2:
    .return (res)
.end

.include 'cclass.pasm'

.sub 'read_number'
    .param pmc f
    .local pmc res
  L1:
    $S0 = peek f
    $I0 = is_cclass .CCLASS_WHITESPACE, $S0, 0
    unless $I0 goto L2
    $S0 = read f, 1
    goto L1
  L2:
    $S1 = ''
  L3:
    $S0 = peek f
    if $S0 == '' goto L4
    $I0 = is_cclass .CCLASS_WHITESPACE, $S0, 0
    if $I0 goto L4
    $S0 = read f, 1
    $S1 .= $S0
    goto L3
  L4:
    new $P1, .LuaString
    set $P1, $S1
    res = $P1.'tonumber'()
    .return (res)
.end


.sub 'setiofile' :anon
    .param int findex
    .param pmc file
    .local pmc env
    .local pmc io
    $P0 = getinterp
    $P1 = $P0['sub'; 1]
    env = lua_getfenv($P1)
    new io, .LuaNumber
    set io, findex
    env[io] = file
.end


.sub 'test_eof'
    .param pmc f
    .local pmc res
    $I1 = isfalse f
    unless $I1 goto L1
    new res, .LuaNil
    goto L2
  L1:
    new res, .LuaString
    set res, ''
  L2:
    .return (res)
.end


.sub 'topfile'
    .param pmc file
    .local pmc mt
    .local pmc mt_file
    .local pmc res
    $I0 = isa file, 'LuaUserdata'
    $S0 = typeof file
    unless $I0 goto L1
    mt = file.'get_metatable'()
    .local pmc _lua__REGISTRY
    _lua__REGISTRY = get_global '_REGISTRY'
    .const .LuaString key = 'ParrotIO'
    mt_file = _lua__REGISTRY[key]
    unless mt == mt_file goto L1
    res = getattribute file, 'data'
    .return (res)
  L1:
    lua_typerror(1, $S0, 'file')
.end

.sub 'tofile'
    .param pmc file
    .local pmc f
    f = topfile(file)
    if null f goto L1
    .return (f)
  L1:
    lua_error("attempt to use a closed file")
.end

.sub 'aux_close'
    .param pmc file
    .local pmc env
    $P0 = getinterp
    $P1 = $P0['sub'; 1]
    env = lua_getfenv($P1)
    new $P1, .LuaString
    set $P1, '__close'
    $P0 = env[$P1]
    .return $P0(file)
.end

.sub 'aux_lines' :lex
    .param pmc file
    .param pmc toclose
    .local pmc res
    .lex 'upvar_file', file
    .lex 'upvar_toclose', toclose
    .const .Sub readline = 'readline'
    res = newclosure readline
    .return (res)
.end

.sub 'readline' :anon :lex :outer(aux_lines)
    .local pmc file
    .local pmc f
    .local pmc res
    file = find_lex 'upvar_file'
    f = getattribute file, 'data'
    res = read_line(f)
    $I0 = isa res, 'LuaNil'
    unless $I0 goto L1
    .local pmc toclose
    toclose = find_lex 'upvar_toclose'
    unless toclose goto L1
    aux_close(file)
  L1:
    .return (res)
.end

=item C<io.close ([file])>

Equivalent to C<file:close()>. Without a C<file>, closes the default output
file.

=cut

.sub 'close' :anon
    .param pmc file
    .local pmc res
    unless null file goto L1
    file = getiofile(IO_OUTPUT)
  L1:
    tofile(file)
    res = aux_close(file)
    .return (res)
.end


=item C<io.flush ()>

Equivalent to C<file:flush> over the default output file.

=cut

.sub 'flush' :anon
    .local pmc file
    .const .LuaString key = 'flush'
    file = getiofile(IO_OUTPUT)
    $P0 = file[key]
    .return $P0(file)
.end


=item C<io.input ([file])>

When called with a file name, it opens the named file (in text mode), and
sets its handle as the default input file. When called with a file handle, it
simply sets that file handle as the default input file. When called without
parameters, it returns the current default input file.

In case of errors this function raises the error, instead of returning an
error code.

=cut

.sub 'input' :anon
    .param pmc file :optional
    .local pmc f
    .local pmc res
    if null file goto L1
    unless file goto L1
    $I1 = isa file, 'LuaString'
    unless $I1 goto L2
    $S1 = file
    f = open $S1, '<'
    unless null f goto L3
    lua_argerror(1, file)
  L3:
    $P0 = newfile()
    setattribute $P0, 'data', f
    setiofile(IO_INPUT, $P0)
    goto L1
  L2:
    tofile(file)
    setiofile(IO_INPUT, file)
    goto L1
  L1:
    res = getiofile(IO_INPUT)
    .return (res)
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

=cut

.sub 'lines' :anon
    .param pmc filename :optional
    .local pmc file
    .local pmc f
    unless null filename goto L1
    .const .LuaString key = 'lines'
    file = getiofile(IO_INPUT)
    $P0 = file[key]
    .return $P0(file)
  L1:
    $S1 = lua_checkstring(1, filename)
    f = open $S1, '<'
    unless null f goto L2
    lua_argerror(1, $S1)
  L2:
    file = newfile()
    setattribute file, 'data', f
    .return aux_lines(file, 1)
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

.sub 'open' :anon
    .param pmc filename :optional
    .param pmc mode :optional
    .local pmc f
    .local pmc res
    $S1 = lua_checkstring(1, filename)
    $S2 = lua_optstring(2, mode, 'r')
    $S0 = getmode($S2)
    if $S0 == '' goto L1
    f = open $S1, $S0
    unless f goto L1
    res = newfile()
    setattribute res, 'data', f
    .return (res)
  L1:
    new res, .LuaNil
    .local pmc msg
    new msg, .LuaString
    $S0 = err
    concat $S1, ': '
    concat $S1, $S0
    set msg, $S1
    .return (res, msg)
.end


=item C<io.output ([file])>

Similar to C<io.input>, but operates over the default output file.

=cut

.sub 'output' :anon
    .param pmc file :optional
    .local pmc f
    .local pmc res
    if null file goto L1
    unless file goto L1
    $I1 = isa file, 'LuaString'
    unless $I1 goto L2
    $S1 = file
    f = open $S1, '>'
    unless null f goto L3
    lua_argerror(1, file)
  L3:
    $P0 = newfile()
    setattribute $P0, 'data', f
    setiofile(IO_OUTPUT, $P0)
    goto L1
  L2:
    tofile(file)
    setiofile(IO_OUTPUT, file)
  L1:
    res = getiofile(IO_OUTPUT)
    .return (res)
.end


=item C<io.popen ([prog [, mode]])>

Starts program C<prog> in a separated process and returns a file handle that
you can use to read data from this program (if C<mode> is C<"r">, the default)
or to write data to this program (if C<mode> is C<"w">).

This function is system dependent and is not available on all platforms.

NOT YET IMPLEMENTED.

=cut

.sub 'popen' :anon
    .param pmc prog :optional
    .param pmc mode :optional
    $S1 = lua_checkstring(1, prog)
    $S2 = lua_optstring(2, mode, 'r')
    not_implemented()
.end

.sub 'pclose' :anon
    .param pmc file
    not_implemented()
.end


=item C<io.read (format1, ...)>

Equivalent to C<io.input():read>.

=cut

.sub 'read' :anon
    .param pmc argv :slurpy
    .local pmc file
    .const .LuaString key = 'read'
    file = getiofile(IO_INPUT)
    $P0 = file[key]
    .return $P0(file, argv :flat)
.end


=item C<io.tmpfile ()>

Returns a handle for a temporary file. This file is open in update mode and
it is automatically removed when the program ends.

NOT YET IMPLEMENTED.

=cut

.sub 'tmpfile' :anon
    not_implemented()
.end


=item C<io.type (obj)>

Checks whether C<obj> is a valid file handle. Returns the string C<"file"> if
C<obj> is an open file handle, C<"closed file"> if C<obj> is a closed file
handle, and B<nil> if C<obj> is not a file handle.

=cut

.sub 'type' :anon
    .param pmc obj :optional
    .local pmc mt
    .local pmc mt_file
    .local pmc f
    .local pmc res
    lua_checkany(1, obj)
    mt = obj.'get_metatable'()
    .local pmc _lua__REGISTRY
    _lua__REGISTRY = get_global '_REGISTRY'
    .const .LuaString key = 'ParrotIO'
    mt_file = _lua__REGISTRY[key]
    if mt == mt_file goto L1
    res = new .LuaNil
    goto L3
  L1:
    res = new .LuaString
    f = getattribute obj, 'data'
    unless null f goto L2
    set res, 'closed file'
    goto L3
  L2:
    set res, 'file'
  L3:
    .return (res)
.end


=item C<io.write (value1, ...)>

Equivalent to C<io.output():write>.

=cut

.sub 'write' :anon
    .param pmc argv :slurpy
    .local pmc file
    .const .LuaString key = 'write'
    file = getiofile(IO_OUTPUT)
    $P0 = file[key]
    .return $P0(file, argv :flat)
.end


.sub 'fclose' :anon
    .param pmc file
    .local pmc f
    .local pmc res
    f = topfile(file)
    close f
    null f
    setattribute file, 'data', f
    new res, .LuaBoolean
    set res, 1
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
# vim: expandtab shiftwidth=4:
