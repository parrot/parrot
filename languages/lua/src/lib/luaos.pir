# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/luaos.pir - Lua Operating System Library

=head1 DESCRIPTION

This library is implemented through table C<os>.

See "Lua 5.1 Reference Manual", section 5.8 "Operating System Facilities",
L<http://www.lua.org/manual/5.1/manual.html#5.8>.

=head2 Functions

=over 4

=cut

.HLL 'lua'
.loadlib 'lua_group'
.namespace [ 'os' ]

.sub 'luaopen_os'
#    print "init Lua OS\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'
    new $P1, 'LuaString'

    .local pmc _os
    new _os, 'LuaTable'
    set $P1, 'os'
    _lua__GLOBAL[$P1] = _os

    $P2 = split "\n", <<'LIST'
clock
date
difftime
execute
exit
getenv
remove
rename
setlocale
time
tmpname
LIST
    lua_register($P1, _os, $P2)

.end


=item C<os.clock ()>

Returns an approximation of the amount in seconds of CPU time used by the
program.

=cut

.sub 'clock'
    .param pmc extra :slurpy
    .local pmc res
    new $P0, 'Lua'
    res = $P0.'clock'()
    .return (res)
.end


=item C<os.date ([format [, time]])>

Returns a string or a table containing date and time, formatted according to
the given string C<format>.

If the C<time> argument is present, this is the time to be formatted (see
the C<os.time> function for a description of this value). Otherwise, C<date>
formats the current time.

If C<format> starts with C<‘!’>, then the date is formatted in Coordinated
Universal Time. After that optional character, if C<format> is C<*t>, then
C<date> returns a table with the following fields: C<year> (four digits),
C<month> (1-12), C<day> (1-31), C<hour> (0-23), C<min> (0-59), C<sec> (0-61),
C<wday> (weekday, Sunday is 1), C<yday> (day of the year), and C<isdst>
(daylight saving flag, a boolean).

If C<format> is not C<*t>, then C<date> returns the date as a string,
formatted according with the same rules as the C function C<strftime>.

When called without arguments, C<date> returns a reasonable date and time
representation that depends on the host system and on the current locale
(that is, C<os.date()> is equivalent to C<os.date("%c")>).

=cut

.include 'tm.pasm'

.sub 'date'
    .param pmc format :optional
    .param pmc time_ :optional
    .param pmc extra :slurpy
    .local pmc res
    .local int t
    $S1 = lua_optstring(1, format, '%c')
    $I0 = time
    t = lua_optint(2, time_, $I0)
    $S0 = substr $S1, 0, 1
    unless $S0 == '!' goto L1
    $P0 = decodetime t
    $S1 = substr $S1, 1
    goto L2
  L1:
    $P0 = decodelocaltime t
  L2:
    unless null $P0 goto L3
    new res, 'LuaNil'
    .return (res)
  L3:
    unless $S1 == '*t' goto L4
    new res, 'LuaTable'
    new $P1, 'LuaString'
    new $P2, 'LuaNumber'
    set $P1, 'sec'
    $I0 = $P0[.TM_SEC]
    set $P2, $I0
    res[$P1] = $P2
    set $P1, 'min'
    $I0 = $P0[.TM_MIN]
    set $P2, $I0
    res[$P1] = $P2
    set $P1, 'hour'
    $I0 = $P0[.TM_HOUR]
    set $P2, $I0
    res[$P1] = $P2
    set $P1, 'day'
    $I0 = $P0[.TM_MDAY]
    set $P2, $I0
    res[$P1] = $P2
    set $P1, 'month'
    $I0 = $P0[.TM_MON]
    set $P2, $I0
    res[$P1] = $P2
    set $P1, 'year'
    $I0 = $P0[.TM_YEAR]
    set $P2, $I0
    res[$P1] = $P2
    set $P1, 'wday'
    $I0 = $P0[.TM_WDAY]
    inc $I0
    set $P2, $I0
    res[$P1] = $P2
    set $P1, 'yday'
    $I0 = $P0[.TM_YDAY]
    inc $I0
    set $P2, $I0
    res[$P1] = $P2
    new $P2, 'LuaBoolean'
    set $P1, 'isdst'
    $I0 = $P0[.TM_ISDST]
    set $P2, $I0
    res[$P1] = $P2
    .return (res)
  L4:
    .local string b
    .local int idx
    b = ''
    idx = 0
    $I1 = length $S1
    new $P1, 'Lua'
  L5:
    unless idx < $I1 goto L6
    $S0 = substr $S1, idx, 1
    if $S0 != '%' goto L7
    inc idx
    if idx == $I1 goto L7
    $S0 = substr $S1, idx, 1
    $S2 = '%' . $S0
    $S0 = $P1.'strftime'($S2, $P0)
  L7:
    b .= $S0
    inc idx
    goto L5
  L6:
    new res, 'LuaString'
    set res, b
    .return (res)
.end


=item C<os.difftime (t2, t1)>

Returns the number of seconds from time C<t1> to time C<t2>. In Posix,
Windows, and some other systems, this value is exactly C<t2-t1>.

=cut

.sub 'difftime'
    .param pmc t2 :optional
    .param pmc t1 :optional
    .param pmc extra :slurpy
    .local pmc res
    $I2 = lua_checknumber(1, t2)
    $I1 = lua_optint(2, t1, 0)
    $I0 = $I2 - $I1
    new res, 'LuaNumber'
    set res, $I0
    .return (res)
.end


=item C<os.execute ([command])>

This function is equivalent to the C function C<system>. It passes C<command>
to be executed by an operating system shell. It returns a status code, which
is system-dependent.

This function is equivalent to the C function C<system>. It passes C<command>
to be executed by an operating system shell. It returns a status code, which
is system-dependent. If C<command> is absent, then it returns nonzero if a
shell is available and zero otherwise.

=cut

.sub 'execute'
    .param pmc command :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_optstring(1, command, '')
    unless $S1 == '' goto L1
    $I0 = 1
    goto L2
  L1:
    $I0 = spawnw $S1
    $I0 = $I0 / 256
  L2:
    new res, 'LuaNumber'
    res = $I0
    .return (res)
.end


=item C<os.exit ([code])>

Calls the C function C<exit>, with an optional C<code>, to terminate the host
program. The default value for C<code> is the success code.

=cut

.sub 'exit'
    .param pmc code :optional
    .param pmc extra :slurpy
    $I1 = lua_optint(1, code, 0)
    exit $I1
.end


=item C<os.getenv (varname)>

Returns the value of the process environment variable C<varname>, or B<nil>
if the variable is not defined.

=cut

.sub 'getenv'
    .param pmc varname :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, varname)
    new $P0, 'Env'
    $S0 = $P0[$S1]
    if $S0 goto L1
    new res, 'LuaNil'
    .return (res)
  L1:
    new res, 'LuaString'
    set res, $S0
    .return (res)
.end


=item C<os.remove (filename)>

Deletes the file or directory with the given name. Directories must be empty
to be removed. If this function fails, it returns B<nil>, plus a string
describing the error.

=cut

.sub 'remove'
    .param pmc filename :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, filename)
    $S0 = $S1
    new $P0, 'OS'
    push_eh _handler
    $P0.'rm'($S1)
    pop_eh
    new res, 'LuaBoolean'
    set res, 1
    .return (res)
  _handler:
    .local pmc nil
    .local pmc msg
    .local pmc e
    .local string s
    .get_results (e)
    s = e
    concat $S0, ': '
    concat $S0, s
    new nil, 'LuaNil'
    new msg, 'LuaString'
    set msg, $S0
    .return (nil, msg)
.end


=item C<os.rename (oldname, newname)>

Renames file or directory named C<oldname> to C<newname>. If this function
fails, it returns B<nil>, plus a string describing the error.

=cut

.sub 'rename'
    .param pmc oldname :optional
    .param pmc newname :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_checkstring(1, oldname)
    $S0 = $S1
    $S2 = lua_checkstring(2, newname)
    new $P0, 'OS'
    push_eh _handler
    $P0.'rename'($S1, $S2)
    pop_eh
    new res, 'LuaBoolean'
    set res, 1
    .return (res)
  _handler:
    .local pmc nil
    .local pmc msg
    .local pmc e
    .local string s
    .get_results (e)
    s = e
    concat $S0, ': '
    concat $S0, s
    new nil, 'LuaNil'
    new msg, 'LuaString'
    set msg, $S0
    .return (nil, msg)
.end


=item C<os.setlocale (locale [, category])>

Sets the current locale of the program. C<locale> is a string specifying a
locale; C<category> is an optional string describing which category to change:
C<"all">, C<"collate">, C<"ctype">, C<"monetary">, C<"numeric">, or C<"time">;
the default category is C<"all">. The function returns the name of the new
locale, or B<nil> if the request cannot be honored.

=cut

.sub 'setlocale'
    .param pmc locale :optional
    .param pmc category :optional
    .param pmc extra :slurpy
    .local pmc res
    $S1 = lua_optstring(1, locale)
    $S2 = lua_optstring(2, category, 'all')
    $I2 = lua_checkoption(2, $S2, 'all collate ctype monetary numeric time')
    new $P0, 'Lua'
    res = $P0.'setlocale'($I2, $S1)
    .return (res)
.end


=item C<os.time ([table])>

Returns the current time when called without arguments, or a time representing
the date and time specified by the given table. This table must have fields
C<year>, C<month>, and C<day>, and may have fields C<hour>, C<min>, C<sec>,
and C<isdst> (for a description of these fields, see the C<os.date> function).

The returned value is a number, whose meaning depends on your system. In
Posix, Windows, and some other systems, this number counts the number of
seconds since some given start time (the "epoch"). In other systems, the
meaning is not specified, and the number returned by C<time> can be used only
as an argument to C<date> and C<difftime>.

=cut

.sub 'time'
    .param pmc table :optional
    .param pmc extra :slurpy
    .local pmc res
    if null table goto L1
    $I0 = isa table, 'LuaNil'
    unless $I0 goto L2
  L1:
    $N0 = time
    new res, 'LuaNumber'
    set res, $N0
    .return (res)
  L2:
    lua_checktype(1, table, 'table')
    new $P0, 'FixedIntegerArray'
    set $P0, 9
    $I0 = getfield(table, 'sec', 0)
    set $P0[.TM_SEC], $I0
    $I0 = getfield(table, 'min', 0)
    set $P0[.TM_MIN], $I0
    $I0 = getfield(table, 'hour', 12)
    set $P0[.TM_HOUR], $I0
    $I0 = getfield(table, 'day', -1)
    set $P0[.TM_MDAY], $I0
    $I0 = getfield(table, 'month', -1)
    $I0 -= 1
    set $P0[.TM_MON], $I0
    $I0 = getfield(table, 'year', -1)
    $I0 -= 1900
    set $P0[.TM_YEAR], $I0
    $I0 = getboolfield(table, 'isdst')
    set $P0[.TM_ISDST], $I0
    new $P1, 'Lua'
    res = $P1.'mktime'($P0)
    .return (res)
.end

.sub 'getfield' :anon
    .param pmc t
    .param string key
    .param int d
    .local int res
    new $P1, 'LuaString'
    set $P1, key
    $P0 = t[$P1]
    $P0 = $P0.'tonumber'()
    $I0 = isa $P0, 'LuaNumber'
    unless $I0 goto L1
    res = $P0
    goto L2
  L1:
    unless d < 0 goto L3
    lua_error("field '", key, "' missing in date table")
  L3:
    res = d
  L2:
    .return (res)
.end

.sub 'getboolfield' :anon
    .param pmc t
    .param string key
    .local int res
    new $P1, 'LuaString'
    set $P1, key
    $P0 = t[$P1]
    $I0 = isa $P0, 'LuaNil'
    unless $I0 goto L1
    res = -1
    goto L2
  L1:
    res = istrue $P0
  L2:
    .return (res)
.end


=item C<os.tmpname ()>

Returns a string with a file name that can be used for a temporary file.
The file must be explicitly opened before its use and explicitly removed
when no longer needed.

=cut

.sub 'tmpname'
    .param pmc extra :slurpy
    .local pmc res
    new $P0, 'Lua'
    $S0 = $P0.'tmpname'()
    new res, 'LuaString'
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
