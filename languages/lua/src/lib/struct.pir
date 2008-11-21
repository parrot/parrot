# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/struct.pir - struct library

=head1 DESCRIPTION

See original on L<http://www.inf.puc-rio.br/~roberto/struct/>

NOT UNDER TEST

This library offers basic facilities to convert Lua values to and from C structs.
Its main functions are C<struct.pack>, which packs multiple Lua values into
a struct-like string; and C<struct.unpack>, which unpacks multiple Lua values
from a given struct-like string.

The fist argument to both functions is a I<format string>, which describes the
layout of the structure. The format string has the following syntax:

* First, it may contain a endianness flag, which governs all conversions for
that structure. C<"<"> means little-endian; C<">"> means big-endian. When no
endian flag is given, the functions use the machine's native endianness.

* The next optional item is a alignment flag, in the form C<"!n">, where I<n>
is the maximum required alignment (necessarily a power of 2). An absent I<n>
means the machine's native alignment. An absent alignment flag means no
alignment at all (which is the same as C<!1>).

* After those optional flags, the format string contains a sequence of zero
or more of the following conversion elements:

=over 4

=item C<"x">

a padding byte with no corresponding Lua value.

=item C<"b">

a C<signed char>.

=item C<"B">

an C<unsigned char>.

=item C<"h">

a C<signed short> (native size).

=item C<"H">

an C<unsigned short> (native size).

=item C<"l">

a C<signed long> (native size).

=item C<"L">

an C<unsigned long> (native size).

=item C<"in">

a signed integer with I<n> bytes (where I<n> must be a power of 2).
An absent I<n> means the native size of an C<int>.

=item C<"In">

like C<"in"> but unsigned.

=item C<"f">

a C<float> (native size).

=item C<"d">

a C<double> (native size).

=item C<"s">

a zero-terminated string.

=item C<"cn">

a sequence of exactly I<n> chars corresponding to a single Lua string.
An absent I<n> means 1. When packing, the given string must have at least
I<n> characters (extra characters are discarded).

=item C<"c0">

this is like C<"cn">, except that the I<n> is given by other means.
When packing, I<n> is the length of the given string. When unpacking,
I<n> is the value of the previous unpacked value (which must be a number).
In that case, this previous value is not returned.

=back

=head2 Functions

All functions are registered inside a table C<struct>.

=over 4

=cut

.HLL 'Lua'
.loadlib 'lua_group'
.namespace [ 'struct' ]

.sub '__onload' :anon :load
#    print "__onload struct\n"
    .const 'Sub' entry = 'luaopen_struct'
    set_hll_global 'luaopen_struct', entry
.end

.sub 'luaopen_struct'

#    print "luaopen_struct\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    new $P1, 'LuaString'

    .local pmc _struct
    new _struct, 'LuaTable'
    set $P1, 'struct'
    _lua__GLOBAL[$P1] = _struct

    $P2 = split "\n", <<'LIST'
pack
unpack
size
LIST
    lua_register($P1, _struct, $P2)

    .return (_struct)
.end


.include 'sysinfo.pasm'
.include 'cclass.pasm'

.sub 'getmaxalign' :anon
    sysinfo $I0, .SYSINFO_PARROT_INTSIZE
    .return ($I0)
.end

.sub 'getendianess' :anon
    .param string fmt
    .local int native, endian
    native = 0 ### TODO : real endianess
    $S0 = substr fmt, 0, 1
    unless $S0 == '>' goto L1
    endian = 1 # big
    fmt = substr fmt, 1
    goto L2
  L1:
    unless $S0 == '<' goto L3
    endian = 0 # little
    fmt = substr fmt, 1
    goto L2
  L3:
    endian = native
  L2:
    .return (endian, fmt, native)
.end

.sub 'getnum' :anon
    .param string fmt
    .param int default
    $I0 = is_cclass .CCLASS_NUMERIC, fmt, 0
    if $I0 goto L1
    .return (default, fmt)
  L1:
    .local int a
    a = 0
  L2:
    $I0 = is_cclass .CCLASS_NUMERIC, fmt, 0
    unless $I0 goto L3
    $S0 = substr fmt, 0, 1
    $I0 = ord $S0
    $I1 = ord '0'
    $I0 -= $I1
    a *= 10
    a += $I0
    fmt = substr fmt, 1
    goto L2
  L3:
    .return (a, fmt)
.end

.sub 'optsize' :anon
    .param string opt
    .param string fmt
    $S0 = downcase opt
    unless $S0 == 'b' goto L1
    .return (1, fmt)
  L1:
    unless $S0 == 'h' goto L2
    .return (2, fmt)
  L2:
    unless $S0 == 'l' goto L3
    .return (4, fmt)
  L3:
    unless $S0 == 'f' goto L4
    sysinfo $I0, .SYSINFO_PARROT_FLOATSIZE
    .return ($I0, fmt)
  L4:
    unless $S0 == 'd' goto L5
    sysinfo $I0, .SYSINFO_PARROT_FLOATSIZE
    .return ($I0, fmt)
  L5:
    unless $S0 == 'x' goto L6
    .return (1, fmt)
  L6:
    unless $S0 == 'i' goto L7
    sysinfo $I0, .SYSINFO_PARROT_INTSIZE
    .tailcall getnum(fmt, $I0)
  L7:
    unless $S0 == 'c' goto L8
    .tailcall getnum(fmt, 1)
  L8:
    unless $S0 == 's' goto L9
    .return (0, fmt)
  L9:
    # invalid code
    .return (1, fmt)
.end

.sub 'getalign' :anon
    .param string fmt
    $S0 = substr fmt, 0, 1
    unless $S0 != '!' goto L1
    # no alignment
    .return (1, fmt)
  L1:
    fmt = substr fmt, 1
    $I0 = getmaxalign()
    .tailcall getnum(fmt, $I0)
.end

.sub 'gettoalign' :anon
    .param int align
    .param string opt
    .param int size
    .local int toalign
    if opt == 'c' goto L1
    if opt == 's' goto L1
    toalign = size
    goto L2
  L1:
    toalign = 1
  L2:
    unless toalign > align goto L3
    toalign = align
  L3:
    if toalign == 0 goto L4
    $I0 = toalign - 1
    $I0 &= toalign
    unless $I0 != 0 goto L5
  L4:
    lua_error("alignment must be power of 2")
  L5:
    .return (toalign)
.end

.sub 'putinteger' :anon
    .param string b
    .param int narg
    .param pmc arg
    .param int endian
    .param int size
    $I1 = lua_checknumber(narg, arg)
    not_implemented()
    .return (b)
.end

.sub 'getinteger' :anon
    .param string buff
    .param int endian
    .param int withsign
    .param int size
    not_implemented()
    new $P0, 'LuaNumber'
    .return ($P0)
.end


=item C<struct.pack (fmt, d1, d2, ...)>

Returns a string containing the values C<d1>, C<d2>, ect. packed according
to the format string C<fmt>.

STILL INCOMPLETE.

=cut

.sub 'pack'
    .param pmc fmt :optional
    .param pmc vararg :slurpy
    $S1 = lua_checkstring(1, fmt)
    .local int endian
    (endian, $S1) = getendianess($S1)
    .local int align
    (align, $S1) = getalign($S1)
    .local int narg
    narg = 2
    .local int totalsize
    totalsize = 0
    .local string b
    b = ''
  L1:
    unless $S1 != '' goto L2
    .local string opt
    opt = substr $S1, 0, 1
    $S1 = substr $S1, 1
    .local int size
    (size, $S1) = optsize(opt, $S1)
    .local int toalign
    toalign = gettoalign(align, opt, size)
  L3:
    $I0 = toalign - 1
    $I0 &= totalsize
    unless $I0 != 0 goto L4
    $S0 = chr 0
    b .= $S0
    inc totalsize
    goto L3
  L4:
    if opt == ' ' goto L5 # ignore white spaces
    $I0 = index 'bBhHlLiI', opt
    if $I0 < 0 goto L6
    $P2 = shift vararg
    b = putinteger(b, narg, $P2, endian, size)
    goto L5
  L6:
    unless opt == 'x' goto L7
    dec narg # undo increment
    $S0 = chr 0
    b .= $S0
    goto L5
  L7:
    $I0 = index 'fd', opt
    if $I0 < 0 goto L8
    not_implemented()
    goto L5
  L8:
    $I0 = index 'cs', opt
    if $I0 < 0 goto L9
    $P2 = shift vararg
    $S2 = lua_checkstring(narg, $P2)
    $I2 = length $S2
    unless size == 0 goto L10
    size = $I2
  L10:
    if $I2 >= size goto L11
    lua_argerror(narg, "string too short")
  L11:
    b .= $S2
    unless opt == 's' goto L12
    $S0 = chr 0
    b .= $S0
    inc size
  L12:
    goto L5
  L9:
    lua_argerror(1, "invalid format option[", opt, "]")
  L5:
    totalsize += size
    inc narg
    goto L1
  L2:
    new $P0, 'LuaString'
    set $P0, b
    .return ($P0)
.end


=item C<struct.unpack (fmt, s, [i])>

Returns the values packed in string C<s>according to the format string C<fmt>.
An optional C<i> marks where in C<s> to start reading (default is 1). After
the read values, this function also returns the index in C<s> where it stopped
reading, which is also where you should start to read the rest of the string.

STILL INCOMPLETE.

=cut

.sub 'unpack'
    .param pmc fmt :optional
    .param pmc data :optional
    .param pmc pos :optional
    .param pmc extra :slurpy
    $S1 = lua_checkstring(1, fmt)
    $S2 = lua_checkstring(2, data)
    $I2 = length $S2
    $I3 = lua_optint(3, pos, 1)
    .local int endian, native
    (endian, $S1, native) = getendianess($S1)
    .local int align
    (align, $S1) = getalign($S1)
    .local pmc res
    new res, 'ResizablePMCArray'
  L1:
    unless $S1 != '' goto L2
    .local string opt
    opt = substr $S1, 0, 1
    $S1 = substr $S1, 1
    .local int size
    (size, $S1) = optsize(opt, $S1)
    .local int toalign
    toalign = gettoalign(align, opt, size)
    $I0 = toalign - 1
    $I3 += $I0
    $I0 &= $I3
    $I3 -= $I0
    $I0 = $I3 + size
    if $I0 <= $I2 goto L3
    lua_argerror(2, "data string too short")
  L3:
    if opt == ' ' goto L4 # ignore white spaces
    $I0 = index 'bBhHlLiI', opt
    if $I0 < 0 goto L5
    .local int withsign
    withsign = is_cclass .CCLASS_LOWERCASE, opt, 0
    $S0 = substr $S2, $I3
    $P0 = getinteger($S0, endian, withsign, size)
    push res, $P0
    goto L4
  L5:
    if opt == 'x' goto L4
    $I0 = index 'fd', opt
    if $I0 < 0 goto L6
    not_implemented()
    goto L4
  L6:
    unless opt == 'c' goto L7
    unless size == 0 goto L8

  L8:
    $S0 = substr $S2, $I3, size
    new $P0, 'LuaString'
    set $P0, $S0
    push res, $P0
    goto L4
  L7:
    unless opt == 's' goto L9
    not_implemented()
    goto L4
  L9:
    lua_argerror(1, "invalid format option[", opt, "]")
  L4:
    $I3 += size
    goto L1
  L2:
    inc $I3
    new $P3, 'LuaNumber'
    set $P3, $I3
    .return (res :flat, $P3)
.end


=item C<struct.size (fmt)>

Returns the size of a string formatted according to the format string C<fmt>.
For obvious reasons, the format string cannot contains neither the option C<s>
nor the option C<c0>.

=cut

.sub 'size'
    .param pmc fmt :optional
    .param pmc extra :slurpy
    $S1 = lua_checkstring(1, fmt)
    .local int totalsize
    totalsize = 0
    ($I0, $S1) = getendianess($S1)
    .local int align
    (align, $S1) = getalign($S1)
  L1:
    unless $S1 != '' goto L2
    .local string opt
    opt = substr $S1, 0, 1
    $S1 = substr $S1, 1
    .local int size
    (size, $S1) = optsize(opt, $S1)
    .local int toalign
    toalign = gettoalign(align, opt, size)
    unless size == 0 goto L3
    lua_error("options `c0' - `s' have undefined sizes")
  L3:
    $I0 = toalign - 1
    totalsize += $I0
    $I0 &= totalsize
    totalsize -= $I0
    totalsize += size
    goto L1
  L2:
    new $P0, 'LuaNumber'
    set $P0, totalsize
    .return ($P0)
.end


=back

=head1 AUTHORS

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
