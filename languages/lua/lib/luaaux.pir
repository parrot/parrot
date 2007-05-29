# Copyright (C) 2005-2007, The Perl Foundation.
# $Id$

=head1 NAME

lib/luaaux.pir - Lua Auxiliary PIR Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.HLL 'Lua', 'lua_group'


=item C<lua_argerror (narg, extramsg, ...)>

=cut

.sub 'lua_argerror'
    .param int narg
    .param pmc extramsg :slurpy
    $S1 = narg
    new $P0, .Lua
    $S0 = $P0.'caller'()
    lua_error("bad argument #", $S1, " to '", $S0, "' (", extramsg :flat, ")")
.end


=item C<lua_checkany (narg, arg)>

=cut

.sub 'lua_checkany'
    .param int narg
    .param pmc arg
    unless null arg goto L1
    lua_argerror(narg, "value expected")
L1:
.end


=item C<lua_checknumber (narg, arg)>

=cut

.sub 'lua_checknumber'
    .param int narg
    .param pmc arg
    $S0 = "no value"
    if null arg goto L1
    $S1 = typeof arg
    if $S1 == 'Undef' goto L1
    $S0 = $S1
    $I0 = isa arg, 'LuaNumber'
    unless $I0 goto L2
    .return (arg)
L2:
    $I0 = isa arg, 'LuaString'
    unless $I0 goto L1
    $P0 = arg.'tonumber'()
    $I0 = isa $P0, 'LuaNumber'
    unless $I0 goto L1
    .return ($P0)
L1:
    lua_typerror(narg, $S0, "number")
.end


=item C<lua_checkoption (narg, val, options)>

=cut

.sub 'lua_checkoption'
    .param int narg
    .param string name
    .param string options
    .local int i
    i = 0
    $P1 = split ' ', options
L1:
    unless $P1 goto L2
    $S0 = shift $P1
    unless $S0 == name goto L3
    .return (i)
L3:
    inc i
    goto L1
L2:
    lua_argerror(narg, "invalid option '", name, "'")
.end


=item C<lua_checkstring (narg, arg)>

=cut

.sub 'lua_checkstring'
    .param int narg
    .param pmc arg
    .local pmc val
    $S0 = "no value"
    if null arg goto L1
    $S1 = typeof arg
    if $S1 == 'Undef' goto L1
    $S0 = $S1
    $I0 = isa arg, 'LuaString'
    unless $I0 goto L2
    val = arg
    .return (val)
L2:
    $I0 = isa arg, 'LuaNumber'
    unless $I0 goto L1
    val = arg.'tostring'()
    .return (val)
L1:
    lua_typerror(narg, $S0, "string")
.end


=item C<lua_checktype (narg, arg, type)>

=cut

.sub 'lua_checktype'
    .param int narg
    .param pmc arg
    .param string type
    $S0 = "no value"
    if null arg goto L1
    $S0 = typeof arg
    if $S0 != type goto L1
    .return ()
L1:
    lua_typerror(narg, $S0, type)
.end


=item C<lua_checkudata (narg, arg, type)>

=cut

.sub 'lua_checkudata'
    .param int narg
    .param pmc arg
    .param string type
    $S0 = "no value"
    if null arg goto L1
    $S0 = typeof arg
    $I0 = isa arg, 'LuaUserdata'
    unless $I0 goto L1
    .local pmc _lua__REGISTRY
    .local pmc key
    _lua__REGISTRY = global '_REGISTRY'
    new key, .LuaString
    set key, type
    $P0 = _lua__REGISTRY[key]
    $P1 = arg.'get_metatable'()
    unless $P0 == $P1 goto L1
    .return ()
L1:
    lua_typerror(narg, $S0, type)
.end


=item C<lua_error (message, ...)>

=cut

.sub 'lua_error'
    .param pmc message :slurpy
    $S0 = join '', message
    .local pmc ex
    ex = new .Exception
    ex['_message'] =  $S0
    throw ex
.end


=item C<lua_findtable (t, fname)>

=cut

.sub 'lua_findtable'
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


=item C<lua_getfenv (o)>

=cut

.sub 'lua_getfenv'
    .param pmc o
    .local pmc res
    if null o goto L1
    $I0 = can o, 'getfenv'
    unless $I0 goto L1
    res = o.'getfenv'()
    .return (res)
L1:
    new res, .LuaNil
    .return (res)
.end


=item C<lua_gsub (src, pat, repl)>

=cut

.sub 'lua_gsub'
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


=item C<lua_loadbuffer (buff, name)>

=cut

.sub 'lua_loadbuffer'
    .param string buff
    .param string chunkname
    .local pmc lua_comp
    lua_comp = compreg 'Lua'
    push_eh _handler
    $P0 = lua_comp.'compile'(buff)
    .local pmc env
    env = get_global '_G'
    $P0.'setfenv'(env)
    .return ($P0)
_handler:
    .get_results ($P0, $S0)
    null $P0
    .return ($P0, $S0)
.end


=item C<lua_loadfile (filename)>

=cut

.sub 'lua_loadfile'
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
    .local pmc env
    env = get_global '_G'
    $P0.'setfenv'(env)
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


=item C<lua_newmetatable (tname)>

=cut

.sub 'lua_newmetatable'
    .param string tname
    .local pmc _lua__REGISTRY
    .local pmc res
    _lua__REGISTRY = global '_REGISTRY'
    new $P1, .LuaString
    set $P1, tname
    res = _lua__REGISTRY[$P1]
    $I0 = isa res, 'LuaNil'
    unless $I0 goto L1
    new res, .LuaTable
    _lua__REGISTRY[$P1] = res
L1:
    .return (res)
.end


=item C<lua_optint (narg, arg)>

=cut

.sub 'lua_optint'
    .param int narg
    .param pmc arg
    .param int default
    if null arg goto L1
    unless arg goto L1
    $I1 = lua_checknumber(narg, arg)
    .return ($I1)
L1:
    .return (default)
.end


=item C<lua_optstring (narg, arg)>

=cut

.sub 'lua_optstring'
    .param int narg
    .param pmc arg
    .param string default
    if null arg goto L1
    unless arg goto L1
    $S0 = arg
    .return ($S0)
L1:
    .return (default)
.end


=item C<lua_register (libname, lib)>

=cut

.sub 'lua_register'
    .param pmc libname
    .param pmc lib
    .const .LuaString _loaded = '_LOADED'
    .local pmc _lua__REGISTRY
    _lua__REGISTRY = global '_REGISTRY'
    $P0 = _lua__REGISTRY[_loaded]
    $P0[libname] = lib
.end


=item C<lua_setfenv (o, table)>

=cut

.sub 'lua_setfenv'
    .param pmc o
    .param pmc table
    if null o goto L1
    $I0 = can o, 'setfenv'
    unless $I0 goto L1
    o.'setfenv'(table)
    .return (1)
L1:
    .return (0)
.end


=item C<lua_typerror (narg, got, expec)>

=cut

.sub 'lua_typerror'
    .param int narg
    .param string got
    .param string expec
    lua_argerror(narg, expec, " expected, got ", got)
.end


=back

=head2 Others functions

=over 4

=item C<checkforloop (start, limit, step)>

=cut

.sub 'checkforloop'
    .param pmc start
    .param pmc limit
    .param pmc step
    .local pmc ret_start
    ret_start = start.'tonumber'()
    if ret_start goto L1
    lua_error("'for' initial value must be a number")
L1:
    .local pmc ret_limit
    ret_limit = limit.'tonumber'()
    if ret_limit goto L2
    lua_error("'for' limit must be a number")
L2:
    .local pmc ret_step
    ret_step = step.'tonumber'()
    if ret_step goto L3
    lua_error("'for' step must be a number")
L3:
    .return (ret_start, ret_limit, ret_step)
.end


=item C<docall (f, arg)>

=cut

.include 'except_severity.pasm'

.sub 'docall'
    .param pmc f
    .param pmc vararg :slurpy
    push_eh _handler
    .const .Sub _traceback = 'traceback'
    $P0 = newclosure _traceback
    pushaction $P0
    .local pmc traceback
    .lex 'traceback', traceback
    new traceback, .LuaString
    .local pmc where
    .lex 'where', where
    new where, .LuaString
    f(vararg :flat)
    .return ()
_handler:
    .local pmc ex
    .local string msg
    .get_results (ex, msg)
    .local int severity
    severity = ex[2]
    if severity == .EXCEPT_EXIT goto L1
    .local int lineno
    $S0 = 'lua: '
    $S1 = where
    $S0 .= $S1
    $S0 .= ' '
    $S0 .= msg
    $S0 .= "\n"
    printerr $S0
    printerr traceback
    .return ()
L1:
    rethrow ex
.end

.sub 'traceback' :anon :outer(docall)
    .param int flag
    unless flag == 1 goto L1
    $P0 = new .Lua
    $S0 = $P0.'traceback'(1)
    $P1 = find_lex 'traceback'
    set $P1, $S0
    $S0 = $P0.'where'()
    $P1 = find_lex 'where'
    set $P1, $S0
L1:
.end


=item C<mkarg (argv)>

Support variable number of arguments function call.

=cut

.sub 'mkarg'
    .param pmc argv
    .return (argv :flat)
.end


=item C<not_implemented ()>

=cut

.sub 'not_implemented'
    .local pmc ex
    ex = new .Exception
    ex['_message'] =  "not implemented"
    throw ex
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


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
