# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luaaux.pir - Lua Auxiliary PIR Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.HLL 'lua'
.loadlib 'lua_group'
.namespace []


=item C<lua_argerror (narg, extramsg, ...)>

Raises an error with the following message, where C<func> is retrieved from
the call stack:

    bad argument #<narg> to <func> (<extramsg>)

This function never returns.

CAUTION: don't used it in an exception handler, but lua_x_argerror & rethrow.

=cut

.sub 'lua_argerror'
    .param int narg
    .param pmc extramsg :slurpy
    $S0 = lua_x_argerror(narg, extramsg :flat)
    lua_error($S0)
.end

.sub 'lua_x_argerror'
    .param int narg
    .param pmc extramsg :slurpy
    $S1 = narg
    $S0 = caller()
    .tailcall lua_x_error("bad argument #", $S1, " to '", $S0, "' (", extramsg :flat, ")")
.end

.sub 'caller' :anon
    $P0 = getinterp
    $I0 = 0
  L1:
    inc $I0
    push_eh _handler
    $P1 = $P0['sub'; $I0]
    pop_eh
    $P2 = $P1.'getfenv'()
    unless $P2 goto L1
    $S0 = $P1.'get_name'()
    .return ($S0)
  _handler:
    .return ("?")
.end

=item C<lua_checkany (narg, arg)>

Checks whether the function has an argument of any type (including B<nil>)
at position C<narg>.

=cut

.sub 'lua_checkany'
    .param int narg
    .param pmc arg
    unless null arg goto L1
    lua_argerror(narg, "value expected")
  L1:
.end


=item C<lua_checknumber (narg, arg)>

Checks whether the function argument C<narg> is a number
and returns this number.

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

Checks whether the function argument C<narg> is a string
and returns this string.

This function uses C<tostring> to get its result,
so all conversions and caveats of that function apply here.

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


=item C<lua_checktype (narg, arg, t)>

Checks whether the function argument C<narg> has type C<t>.

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


=item C<lua_checkudata (narg, arg, tname)>

Checks whether the function argument C<narg> is a userdata of the type C<tname>.

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
    _lua__REGISTRY = get_hll_global '_REGISTRY'
    new key, 'LuaString'
    set key, type
    $P0 = _lua__REGISTRY[key]
    $P1 = arg.'get_metatable'()
    unless $P0 == $P1 goto L1
    .local pmc val
    val = getattribute arg, 'data'
    .return (val)
  L1:
    lua_typerror(narg, $S0, type)
.end


=item C<lua_error (message, ...)>

Raises an error.

This function never returns.

CAUTION: don't used it in an exception handler, but lua_x_error & rethrow.

=cut

.sub 'lua_error'
    .param pmc message :slurpy
    $S0 = lua_x_error(message :flat)
    die $S0
.end

.sub 'lua_x_error'
    .param pmc message :slurpy
    $S0 = join '', message
    .return ($S0)
.end

=item C<lua_findtable (t, fname)>

=cut

.sub 'lua_findtable'
    .param pmc t
    .param string fname
    new $P1, 'LuaString'
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
    new $P0, 'LuaTable'
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


=item C<lua_gc (what, data)>

Controls the garbage collector.

This function performs several tasks, according to the value of the parameter
C<what>:

=over 4

=item B<"stop">

stops the garbage collector.

=item B<"restart">

restarts the garbage collector.

=item B<"collect">

performs a full garbage-collection cycle.

=item B<"count">

returns the total memory in use by Lua (in Kbytes).

=item B<"step">

performs an incremental step of garbage collection The step C<"size">
is controlled by C<data> (larger values mean more steps) in a non-specified way.
If you want to control the step size you must tune experimentally the value
of C<data>. Returns B<true> if the step finished a garbage-collection cycle.

=item B<"steppause">

sets C<data>/100 as the new value for the I<pause> of the collector.
The function returns the previous value of the pause.

=item B<"setstepmul">

sets C<data>/100 as the new value for the I<step multiplier> of the collector.
The function returns the previous value of the step multiplier.

=back

STILL INCOMPLETE.

=cut

.include 'interpinfo.pasm'

.sub 'lua_gc'
    .param string what
    .param int data :optional
    .local num res
    res = 0
  L_stop:
    unless what == 'stop' goto L_restart
    sweepoff
    collectoff
    goto L_end
  L_restart:
    unless what == 'restart' goto L_collect
    sweepon
    collecton
    goto L_end
  L_collect:
    unless what == 'collect' goto L_count
    sweep 1
    collect
    goto L_end
  L_count:
    unless what == 'count' goto L_step
    interpinfo $I0, .INTERPINFO_TOTAL_MEM_ALLOC
    # GC values are expressed in Kbytes
    res = $I0 / 1024
    goto L_end
  L_step:
    unless what == 'step' goto L_setpause
    goto L_end
  L_setpause:
    unless what == 'setpause' goto L_setstepmul
    # not_implemented()
    goto L_end
  L_setstepmul:
    unless what == 'setstepmul' goto L_default
    goto L_end
  L_default:
    res = -1
  L_end:
    .return (res)
.end


=item C<lua_getfenv (o)>

Returns the environment table of the argument C<o>.

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
    new res, 'LuaNil'
    .return (res)
.end


=item C<lua_getmetatable (tname)>

Returns the metatable registered with the name C<tname>.

=cut

.sub 'lua_getmetatable'
    .param string tname
    .local pmc _lua__REGISTRY
    _lua__REGISTRY = get_hll_global '_REGISTRY'
    .local pmc key
    new key, 'LuaString'
    set key, tname
    .local pmc res
     res= _lua__REGISTRY[key]
    .return (res)
.end


=item C<lua_gsub (src, pat, repl)>

Returns a copy of string C<src> by replacing any occurrence of the string C<pat>
with the string C<rep>.

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


=item C<lua_isboolean (val)>

Returns 1 if the value has type boolean, and 0 otherwise.

=cut

.sub 'lua_isboolean'
    .param pmc val
    .local int res
    res = 0
    if null val goto L1
    res = isa val, 'LuaBoolean'
  L1:
    new $P0, 'LuaBoolean'
    set $P0, res
    .return ($P0)
.end


=item C<lua_isfunction (val)>

Returns 1 if the value is a function, and 0 otherwise.

=cut

.sub 'lua_isfunction'
    .param pmc val
    .local int res
    res = 0
    if null val goto L1
    res = isa val, 'LuaFunction'
  L1:
    new $P0, 'LuaBoolean'
    set $P0, res
    .return ($P0)
.end


=item C<lua_isnil (val)>

Returns 1 if the value is nil, and 0 otherwise.

=cut

.sub 'lua_isnil'
    .param pmc val
    .local int res
    res = 0
    if null val goto L1
    res = isa val, 'LuaNil'
  L1:
    new $P0, 'LuaBoolean'
    set $P0, res
    .return ($P0)
.end


=item C<lua_isnumber (val)>

Returns 1 if the value is a number or a string convertible to a number,
and 0 otherwise.

=cut

.sub 'lua_isnumber'
    .param pmc val
    .local int res
    res = 0
    if null val goto L1
    res = isa val, 'LuaNumber'
    if res goto L1
    $P0 = val.'tonumber'()
    res = isa $P0, 'LuaNumber'
  L1:
    new $P0, 'LuaBoolean'
    set $P0, res
    .return ($P0)
.end


=item C<lua_isstring (val)>

Returns 1 if the value is a string or a number (which is always convertible
to a string), and 0 otherwise.

=cut

.sub 'lua_isstring'
    .param pmc val
    .local int res
    res = 0
    if null val goto L1
    res = isa val, 'LuaString'
    if res goto L1
    res = isa val, 'LuaNumber'
  L1:
    new $P0, 'LuaBoolean'
    set $P0, res
    .return ($P0)
.end


=item C<lua_istable (val)>

Returns 1 if the value is a table, and 0 otherwise.

=cut

.sub 'lua_istable'
    .param pmc val
    .local int res
    res = 0
    if null val goto L1
    res = isa val, 'LuaTable'
  L1:
    new $P0, 'LuaBoolean'
    set $P0, res
    .return ($P0)
.end


=item C<lua_isuserdata (val)>

Returns 1 if the value is a userdata, and 0 otherwise.

=cut

.sub 'lua_isuserdata'
    .param pmc val
    .local int res
    res = 0
    if null val goto L1
    res = isa val, 'LuaUserdata'
  L1:
    new $P0, 'LuaBoolean'
    set $P0, res
    .return ($P0)
.end


=item C<lua_load (data, name)>

This function only loads a chunk; it does not run it.

C<lua_load> automatically detects whether the chunk is text or binary,
and loads it accordingly.

The C<chunkname> argument gives a name to the chunk, which is used for error
messages and in debug information.

=cut

.sub 'lua_load'
    .param string data
    .param string chunkname
    unless chunkname == '' goto L1
    chunkname = '?'
  L1:
    $S0 = substr data, 0, 4
    unless $S0 == "\033Lua" goto L2
    .tailcall undump(data, chunkname)
  L2:
    .tailcall parser(data, chunkname)
.end

.sub 'parser' :anon
    .param string data
    .param string chunkname
    .local pmc lua_comp
    lua_comp = compreg 'lua'
    push_eh _handler
    $P0 = lua_comp.'compile'(data)
    $P0 = $P0[1]
    .local pmc env
    env = get_hll_global '_G'
    $P0.'setfenv'(env)
    pop_eh
    .return ($P0)
  _handler:
    .get_results ($P0)
    $S0 = $P0
    null $P0
    .return ($P0, $S0)
.end

.sub 'undump' :anon
    .param string buff
    .param string chunkname
    push_eh _handler
    new $P0, 'LuaBytecode'
    $P1 = $P0.'undump'(buff)
    .local string pir
    pir = $P1.'translate'()
    .local pmc pir_comp
    pir_comp = compreg 'PIR'
    $P0 = pir_comp(pir)
    $P0 = $P0[1]
    .local pmc env
    env = get_hll_global '_G'
    $P0.'setfenv'(env)
    pop_eh
    .return ($P0)
  _handler:
    .get_results ($P0)
    $S0 = $P0
    null $P0
    .return ($P0, $S0)
.end


=item C<lua_loadbuffer (buff, name)>

Loads a buffer as a Lua chunk.

C<name> is the chunk name, used for debug information and error messages.

=cut

.sub 'lua_loadbuffer'
    .param string buff
    .param string chunkname
    .tailcall lua_load(buff, chunkname)
.end


=item C<lua_loadfile (filename)>

Loads a file as a Lua chunk.
If C<filename> is a empty string, then it loads from the standard input.
The first line in the file is ignored if it starts with a #.

This function only loads the chunk; it does not run it.

=cut

.sub 'lua_loadfile'
    .param string filename
    .local string chunkname
    .local pmc f
    unless filename == '' goto L1
    chunkname = '=stdin'
    f = getstdin
    goto L2
  L1:
    chunkname = filename
    f = new 'FileHandle'
    push_eh _handler
    f.'open'(filename, 'r')
    pop_eh
  L2:
    $S0 = f.'readall'()
    if filename == '' goto L4
    f.'close'()
  L4:
    .tailcall lua_load($S0, chunkname)
  _handler:
    $S0 = 'cannot open '
    $S0 .= filename
    $S0 .= ': '
    $S1 = err
    $S0 .= $S1
    null $P0
    .return ($P0, $S0)
.end


=item C<lua_newmetatable (tname)>

Unless the registry already has the key C<tname>, creates a new table to be
used as a metatable for userdata, adds it to the registry with key C<tname>.

In both cases returns the final value associated with C<tname> in the registry.

=cut

.sub 'lua_newmetatable'
    .param string tname
    .local pmc _lua__REGISTRY
    .local pmc res
    _lua__REGISTRY = get_hll_global '_REGISTRY'
    new $P1, 'LuaString'
    set $P1, tname
    res = _lua__REGISTRY[$P1]
    $I0 = isa res, 'LuaNil'
    unless $I0 goto L1
    new res, 'LuaTable'
    _lua__REGISTRY[$P1] = res
  L1:
    .return (res)
.end


=item C<lua_newuserdata (data, mt)>

=cut

.sub 'lua_newuserdata'
    .param pmc data
    .param pmc mt
    .local pmc res
    new res, 'LuaUserdata'
    setattribute res, 'data', data
    res.'set_metatable'(mt)
    .return (res)
.end


=item C<lua_openlibs ()>

Opens all standard Lua libraries.

=cut

.sub 'lua_openlibs'
    $P0 = get_hll_global ['basic'], 'luaopen_basic'
    $P0()
    $P0 = get_hll_global ['coroutine'], 'luaopen_coroutine'
    $P0()
    $P0 = get_hll_global ['package'], 'luaopen_package'
    $P0()
    $P0 = get_hll_global ['table'], 'luaopen_table'
    $P0()
    $P0 = get_hll_global ['io'], 'luaopen_io'
    $P0()
    $P0 = get_hll_global ['os'], 'luaopen_os'
    $P0()
    $P0 = get_hll_global ['string'], 'luaopen_string'
    $P0()
    $P0 = get_hll_global ['math'], 'luaopen_math'
    $P0()
    $P0 = get_hll_global ['debug'], 'luaopen_debug'
    $P0()
    sweepon
    sweep 1
.end


=item C<lua_optint (narg, arg, def)>

If the function argument C<narg> is a number, returns this number cast to an C<int>.
If this argument is absent or is B<nil>, returns C<def>. Otherwise, raises an error.

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


=item C<lua_optnumber (narg, arg, def)>

If the function argument C<narg> is a number, returns this number.
If this argument is absent or is B<nil>, returns C<def>. Otherwise, raises an error.

=cut

.sub 'lua_optnumber'
    .param int narg
    .param pmc arg
    .param num default
    if null arg goto L1
    unless arg goto L1
    .tailcall lua_checknumber(narg, arg)
  L1:
    .return (default)
.end


=item C<lua_optstring (narg, arg, def)>

If the function argument C<narg> is a string, returns this string.
If this argument is absent or is B<nil>, returns C<def>. Otherwise, raises an error.

=cut

.sub 'lua_optstring'
    .param int narg
    .param pmc arg
    .param string default :optional
    if null arg goto L1
    unless arg goto L1
    $S0 = arg
    .return ($S0)
  L1:
    .return (default)
.end


=item C<lua_register (libname, lib, names, env)>

=cut

.sub 'lua_register'
    .param pmc libname
    .param pmc lib
    .param pmc names
    .param pmc env :optional
    if null libname goto L1
    .const 'LuaString' _loaded = '_LOADED'
    .local pmc _lua__REGISTRY
    _lua__REGISTRY = get_hll_global '_REGISTRY'
    $P0 = _lua__REGISTRY[_loaded]
    $P0[libname] = lib
  L1:
    unless null env goto L2
    env = get_hll_global '_G'
  L2:
    .local pmc interp, ns
    interp = getinterp
    ns = interp['namespace'; 1]
    new $P1, 'LuaString'
  L3:
    unless names goto L4
    $S0 = shift names
    unless $S0 goto L3
    $P0 = ns[$S0]
    unless null $P0 goto L5
    lua_error("missing method ", $S0)
  L5:
    $P0.'setfenv'(env)
    set $P1, $S0
    lib[$P1] = $P0
    goto L3
  L4:
.end


=item C<lua_setfenv (o, table)>

Sets the table C<table> as the new environment for the value C<o>.
If the value C<o> is neither a function nor a thread nor a userdata,
returns 0. Otherwise it returns 1.

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

Generates an error with a message like the following:

    bad argument narg to 'func' (tname expected, got rt)

This function never returns.

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

=item C<argstolua (env, args)>

=cut

.sub 'argstolua'
    .param pmc env
    .param pmc args
    .local pmc res
    new res, 'FixedPMCArray'
    if null args goto L1
    $I1 = args
    set res, $I1
    $I0 = 0
  L2:
    unless $I0 < $I1 goto L1
    $S0 = shift args
    new $P0, 'LuaString'
    set $P0, $S0
    res[$I0] = $P0
    inc $I0
    goto L2
  L1:
    if null args goto L3
    # not interactive mode
    .local pmc iter, i
    new iter, 'Iterator', res
    new i, 'LuaNumber'
    set i, 0
    new $P0, 'LuaTable'
  L4:
    unless iter goto L5
    $P1 = shift iter
    $P0[i] = $P1
    inc i
    goto L4
  L5:
    .const 'LuaString' k_arg = 'arg'
    env.'rawset'(k_arg, $P0)
  L3:
    .return (res)
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
    ($P0 :slurpy) = f(vararg :flat)
    pop_eh
    .return (0, $P0)
  _handler:
    .local pmc ex
    .get_results (ex)
    $P0 = getattribute ex, 'severity'
    if null $P0 goto L1
    $I0 = $P0
    if $I0 == .EXCEPT_EXIT goto L2
  L1:
    .local pmc bt
    bt = ex.'backtrace'()
    $S0 = where()
    $S0 .= ' '
    $S1 = ex
    $S0 .= $S1
    $S0 .= "\n"
    $S1 = traceback(bt)
    $S0 .= $S1
    .return (1, $S0)
  L2:
    rethrow ex
.end

.sub 'where' :anon
    # dummy implementation
    .return ("_._:0:")
.end

.sub 'traceback' :anon
    .param pmc bt
    .local pmc iter, sub, outer, annos
    new iter, 'Iterator', bt
    .local string ret
    ret = "stack traceback:"
  L1:
    unless iter goto L2
    $P0 = shift iter
    sub = $P0['sub']
    if null sub goto L2
    $I0 = isa sub, 'LuaFunction'
    unless $I0 goto L5
    $S0 = sub.'get_name'()
    goto L6
  L5:
    $S0 = sub
  L6:
    outer = sub.'get_outer'()
    ret .= "\n\t"
    unless null outer goto L3
    ret .= "[PIR]:"
    goto L4
  L3:
    ret .= "_._:0:"
  L4:
    ret .= " in function '"
    ret .= $S0
    ret .= "'"
    annos = $P0['annotations']
    goto L1
  L2:
    .return (ret)
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
    die "not implemented"
.end


=item C<tconstruct (table, index, argv)>

end of table constructor with argv

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

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
