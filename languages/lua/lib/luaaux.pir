# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

=head1 NAME

lib/luaaux.pir - Lua Auxiliary PIR Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.HLL 'Lua', 'lua_group'


=item C<argerror (extramsg)>

=cut

.sub 'argerror'
    .param string extramsg
    error(extramsg)
.end


=item C<checkany (arg)>

=cut

.sub 'checkany'
    .param pmc arg
    unless null arg goto L1
    argerror("value expected")
L1:
.end


=item C<checkforloop (start, limit, step)>

=cut

.sub 'checkforloop'
    .param pmc start
    .param pmc limit
    .param pmc step
    .local pmc ret_start
    ret_start = start.'tonumber'()
    if ret_start goto L1
    error("'for' initial value must be a number")
L1:
    .local pmc ret_limit
    ret_limit = limit.'tonumber'()
    if ret_limit goto L2
    error("'for' limit must be a number")
L2:
    .local pmc ret_step
    ret_step = step.'tonumber'()
    if ret_step goto L3
    error("'for' step must be a number")
L3:
    .return (ret_start, ret_limit, ret_step)
.end


=item C<checknumber (arg)>

=cut

.sub 'checknumber'
    .param pmc arg
    $S0 = "no value"
    if null arg goto L0
    $S1 = typeof arg
    if $S1 == 'Undef' goto L0
    $S0 = $S1
    $I0 = isa arg, 'LuaNumber'
    unless $I0 goto L1
    .return (arg)
L1:
    $I0 = isa arg, 'LuaString'
    unless $I0 goto L0
    $P0 = arg.'tonumber'()
    $I0 = isa $P0, 'LuaNumber'
    unless $I0 goto L0
    .return ($P0)
L0:
    tag_error($S0, "number")
.end


=item C<checkoption (val, options)>

=cut

.sub 'checkoption'
    .param string name
    .param pmc options
    .local int i
    .local int n
    i = 0
    n = options
L1:
    unless i < n goto L2
    $S0 = options[i]
    unless $S0 == name goto L3
    .return (i)
L3:
    inc i
    goto L1
L2:
    $S1 = "invalid option '"
    concat $S1, name
    concat $S1, "'"
    argerror($S1)
.end


=item C<checkstring (arg)>

=cut

.sub 'checkstring'
    .param pmc arg
    .local pmc val
    $S0 = "no value"
    if null arg goto L0
    $S1 = typeof arg
    if $S1 == 'Undef' goto L0
    $S0 = $S1
    $I0 = isa arg, 'LuaString'
    unless $I0 goto L1
    val = arg
    .return (val)
L1:
    $I0 = isa arg, 'LuaNumber'
    unless $I0 goto L0
    val = arg.'tostring'()
    .return (val)
L0:
    tag_error($S0, "string")
.end


=item C<checktype (arg, type)>

=cut

.sub 'checktype'
    .param pmc arg
    .param string type
    $S0 = "no value"
    if null arg goto L0
    $S0 = typeof arg
    if $S0 != type goto L0
    .return ()
L0:
    tag_error($S0, type)
.end


=item C<error (message)>

=cut

.sub 'error'
    .param string message
    .local pmc ex
    ex = new .Exception
    ex['_message'] =  message
    throw ex
.end


=item C<findtable (t, fname)>

=cut

.sub 'findtable'
    .param pmc t
    .param string fname
    new $P1, .LuaString
L1:
    $I1 = index fname, '.'
    $I2 = $I2
    unless $I1 < 0 goto L2
    $I2 = length fname
L2:
    $S1 = substr fname, 0, $I2
    set $P1, $S1
    $P0 = t[$P1]
    $I0 = isa $P0, 'LuaNil'
    unless $I0 goto L3
    new $P0, .LuaTable
    t[$P1] = $P0
    goto L4
L3:
    $I0 = isa $P0, 'LuaTable'
    unless $I0 goto L4
    null $P0
    .return ($P0, fname)
L4:
    if $I1 < 0 goto L5
    inc $I1
    fname = substr fname, $I1
    goto L1
L5:
    .return ($P0)
.end


=item C<gsub (src, pat, repl)>

=cut

.sub 'gsub'
    .param string src
    .param string pat
    .param string repl
    $I2 = length pat
    .local string b
    b = ''
L1:
    $I0 = index src, pat
    if $I0 < 0 goto L2
    $S0 = substr src, 0, $I0
    b .= $S0
    b .= repl
    $I0 += $I2
    src = substr src, $I0
    goto L1
L2:
    b .= src
    .return (b)
.end


=item C<loadbuffer (buff, name)>

=cut

.sub 'loadbuffer'
    .param string buff
    .param string chunkname
    .local pmc lua_comp
    lua_comp = compreg 'Lua'
    push_eh _handler
    $P0 = lua_comp.'compile'(buff)
    .return ($P0)
_handler:
    .get_results ($P0, $S0)
    null $P0
    .return ($P0, $S0)
.end


=item C<loadfile (filename)>

=cut

.sub 'loadfile'
    .param string filename
    .local pmc f
    unless filename == '' goto L1
    f = getstdin
    goto L2
L1:
    f = open filename, '<'
    unless f goto L3
L2:
    $S0 = f.'slurp'('')
    if filename == '' goto L4
    close f
L4:
    .local pmc lua_comp
    lua_comp = compreg 'Lua'
    push_eh _handler
    $P0 = lua_comp.'compile'($S0)
    .return ($P0)
_handler:
    .get_results ($P0, $S0)
    goto L5
L3:
    $S0 = 'cannot open '
    $S0 .= filename
    $S0 .= ': '
    $S1 = err
    $S0 .= $S1
L5:
    null $P0
    .return ($P0, $S0)
.end


=item C<mkarg (argv)>

Support variable number of arguments function call.

=cut

.sub 'mkarg'
    .param pmc argv
    .return (argv :flat)
.end


=item C<newmetatable (tname)>

=cut

.sub 'newmetatable'
    .param string tname
    .local pmc _lua__REGISTRY
    .local pmc ret
    _lua__REGISTRY = global '_REGISTRY'
    new $P1, .LuaString
    set $P1, tname
    ret = _lua__REGISTRY[$P1]
    $I0 = isa ret, 'LuaNil'
    unless $I0 goto L1
    new ret, .LuaTable
    _lua__REGISTRY[$P1] = ret
L1:
    .return (ret)
.end


=item C<not_implemented ()>

=cut

.sub 'not_implemented'
    .local pmc ex
    ex = new .Exception
    ex['_message'] =  "not implemented"
    throw ex
.end


=item C<optint (arg)>

=cut

.sub 'optint'
    .param pmc arg
    .param int default
    if null arg goto L0
    unless arg goto L0
    $I1 = checknumber(arg)
    .return ($I1)
L0:
    .return (default)
.end


=item C<optstring (arg)>

=cut

.sub 'optstring'
    .param pmc arg
    .param string default
    if null arg goto L0
    unless arg goto L0
    $S0 = arg
    .return ($S0)
L0:
    .return (default)
.end


=item C<_register (libname, lib)>

=cut

.sub '_register'
    .param pmc libname
    .param pmc lib
    .const .LuaString _loaded = '_LOADED'
    .local pmc _lua__REGISTRY
    _lua__REGISTRY = global '_REGISTRY'
    $P0 = _lua__REGISTRY[_loaded]
    $P0[libname] = lib
.end


=item C<tag_error (got, expec)>

=cut

.sub 'tag_error'
    .param string got
    .param string expec
    $S0 = expec
    concat $S0, " expected, got "
    concat $S0, got
    argerror($S0)
.end


=item C<tconstruct (table, index, argv)>

=cut

.sub 'tconstruct'
    .param pmc table
    .param pmc index
    .param pmc argv :slurpy
    .local int argc
    .local int i
    argc = argv
    i = 0
L1:
    if i >= argc goto L2
    $P0 = argv[i]
    table[index] = $P0
    inc index
    inc i
    goto L1
L2:
    .return (table)
.end


=back

=head1 AUTHORS

Francois Perrad

=cut

