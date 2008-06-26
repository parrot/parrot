# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_bcmath.pir - PHP bcmath  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<string bcadd(string left_operand, string right_operand [, int scale])>

Returns the sum of two arbitrary precision numbers

NOT IMPLEMENTED.

=cut

.sub 'bcadd'
    not_implemented()
.end

=item C<int bccomp(string left_operand, string right_operand [, int scale])>

Compares two arbitrary precision numbers

NOT IMPLEMENTED.

=cut

.sub 'bccomp'
    not_implemented()
.end

=item C<string bcdiv(string left_operand, string right_operand [, int scale])>

Returns the quotient of two arbitrary precision numbers (division)

NOT IMPLEMENTED.

=cut

.sub 'bcdiv'
    not_implemented()
.end

=item C<string bcmod(string left_operand, string right_operand)>

Returns the modulus of the two arbitrary precision operands

NOT IMPLEMENTED.

=cut

.sub 'bcmod'
    not_implemented()
.end

=item C<string bcmul(string left_operand, string right_operand [, int scale])>

Returns the multiplication of two arbitrary precision numbers

NOT IMPLEMENTED.

=cut

.sub 'bcmul'
    not_implemented()
.end

=item C<string bcpow(string x, string y [, int scale])>

Returns the value of an arbitrary precision number raised to the power of another

NOT IMPLEMENTED.

=cut

.sub 'bcpow'
    not_implemented()
.end

=item C<string bcpowmod(string x, string y, string mod [, int scale])>

Returns the value of an arbitrary precision number raised to the power of another reduced by a modulous

NOT IMPLEMENTED.

=cut

.sub 'bcpowmod'
    not_implemented()
.end

=item C<bool bcscale(int scale)>

Sets default scale parameter for all bc math functions

NOT IMPLEMENTED.

=cut

.sub 'bcscale'
    not_implemented()
.end

=item C<string bcsqrt(string operand [, int scale])>

Returns the square root of an arbitray precision number

NOT IMPLEMENTED.

=cut

.sub 'bcsqrt'
    not_implemented()
.end

=item C<string bcsub(string left_operand, string right_operand [, int scale])>

Returns the difference between two arbitrary precision numbers

NOT IMPLEMENTED.

=cut

.sub 'bcsub'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
