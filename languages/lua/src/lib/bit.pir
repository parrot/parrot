# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/bit.pir - bitwise operations library

=head1 DESCRIPTION

bit is a library for Lua 5.1 that provides bitwise operations on number.

See original on L<http://bitop.luajit.org/>

=over 4

=cut

.HLL 'Lua'
.loadlib 'lua_group'
.namespace [ 'bit' ]

.sub '__onload' :anon :load
#    print "__onload bit\n"
    .const 'Sub' entry = 'luaopen_bit'
    set_hll_global 'luaopen_bit', entry
.end

.const string MYNAME = 'bit'

.sub 'luaopen_bit'

#    print "luaopen_bit\n"

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    .local pmc _bit
    new _bit, 'LuaTable'

    new $P1, 'LuaString'
    set $P1, MYNAME
    _lua__GLOBAL[$P1] = _bit

    $P2 = split "\n", <<'LIST'
tobit
bnot
band
bor
bxor
lshift
rshift
arshift
rol
ror
bswap
LIST
    lua_register($P1, _bit, $P2)

    .return (_bit)
.end


.macro BRET(b)
    .local pmc res
    new res, 'LuaNumber'
    set res, .b
    .return (res)
.endm

.macro BIT_OP(op, x, vararg)
    $I1 = lua_checknumber(1, .x)
    .local int i
    i = 2
  L1:
    unless .vararg goto L2
    $P0 = shift .vararg
    $I0 = lua_checknumber(i, $P0)
    .op $I1, $I0
    inc i
    goto L1
  L2:
    .BRET($I1)
.endm

.macro BIT_SH(op, x, n)
    $I1 = lua_checknumber(1, .x)
    $I2 = lua_checknumber(2, .n)
    band $I2, 31
    .op $I0, $I1, $I2
    .BRET($I0)
.endm


=item C<bit.tobit (x)>

Normalizes a number to the numeric range for bit operations and returns it.
This function is usually not needed since all bit operations already normalize
all of their input arguments.

=cut

.sub 'tobit'
    .param pmc x :optional
    .param pmc extra :slurpy
    $I1 = lua_checknumber(1, x)
    .BRET($I1)
.end


=item C<bit.bnot (x)>

Returns the bitwise B<not> of its argument.

=cut

.sub 'bnot'
    .param pmc x :optional
    .param pmc extra :slurpy
    $I1 = lua_checknumber(1, x)
    $I0 = bnot $I1
    .BRET($I0)
.end


=item C<bit.band (x1 [,x2...])>

=item C<bit.bor (x1 [,x2...])>

=item C<bit.bxor (x1 [,x2...])>

Returns either the bitwise B<or>, bitwise B<and>, or bitwise B<xor> of all of
its arguments. Note that more than two arguments are allowed.

=cut

.sub 'band'
    .param pmc x :optional
    .param pmc vararg :slurpy
    .BIT_OP(band, x, vararg)
.end

.sub 'bor'
    .param pmc x :optional
    .param pmc vararg :slurpy
    .BIT_OP(bor, x, vararg)
.end

.sub 'bxor'
    .param pmc x :optional
    .param pmc vararg :slurpy
    .BIT_OP(bxor, x, vararg)
.end


=item C<bit.lshift (x, n)>

=item C<bit.rshift (x, n)>

=item C<bit.arshift (x, n)>

Returns either the bitwise B<logical left-shift>, bitwise B<logical right-shift>,
or bitwise B<arithmetic right-shift> of its first argument by the number of
bits given by the second argument.

Logical shifts treat the first argument as an unsigned number and shift in 0-bits.
Arithmetic right-shift treats the most-significant bit as a sign bit and
replicates it.

Only the lower 5 bits of the shift count are used (reduces to the range [0..31]).

=cut

.sub 'lshift'
    .param pmc x :optional
    .param pmc n :optional
    .param pmc extra :slurpy
    .BIT_SH(shl, x, n)
.end

.sub 'rshift'
    .param pmc x :optional
    .param pmc n :optional
    .param pmc extra :slurpy
    .BIT_SH(lsr, x, n)
.end

.sub 'arshift'
    .param pmc x :optional
    .param pmc n :optional
    .param pmc extra :slurpy
    .BIT_SH(shr, x, n)
.end


=item C<bit.rol (x, n)>

=item C<bit.ror (x, n)>

Returns either the bitwise B<left rotation>, or bitwise B<right rotation> of its
first argument by the number of bits given by the second argument. Bits shifted
out on one side are shifted back in on the other side.

Only the lower 5 bits of the rotate count are used (reduces to the range [0..31]).

=cut

.sub 'rol'
    .param pmc x :optional
    .param pmc n :optional
    .param pmc extra :slurpy
    $I1 = lua_checknumber(1, x)
    $I2 = lua_checknumber(2, n)
    band $I2, 31
    neg $I2
    rot $I0, $I1, $I2, 32
    .BRET($I0)
.end

.sub 'ror'
    .param pmc x :optional
    .param pmc n :optional
    .param pmc extra :slurpy
    $I1 = lua_checknumber(1, x)
    $I2 = lua_checknumber(2, n)
    band $I2, 31
    rot $I0, $I1, $I2, 32
    .BRET($I0)
.end


=item C<bit.bswap (x)>

Swaps the bytes of its argument and returns it. This can be used to convert
little-endian 32 bit numbers to big-endian 32 bit numbers or vice versa.

=cut

.sub 'bswap'
    .param pmc x :optional
    .param pmc extra :slurpy
    $I1 = lua_checknumber(1, x)
    $I0 = $I1 >> 24
    $I2 = $I1 >> 8
    $I2 &= 0x0000ff00
    $I0 |= $I2
    $I3 = $I1 & 0x0000ff00
    $I3 <<= 8
    $I0 |= $I3
    $I4 = $I1 << 24
    $I0 |= $I4
    .BRET($I0)
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
