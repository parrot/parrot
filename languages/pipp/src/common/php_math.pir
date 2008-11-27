# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_math.pir - PHP math Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.const num PI = 3.14159265358979323846

.sub 'longtobase' :anon
    .param int value
    .param int base
    .const string digits = '0123456789abcdefghijklmnopqrstuvwxyz'
    $S0 = ''
  L1:
    $I0 = value % base
    $S1 = substr digits, $I0, 1
    $S0 = concat $S1, $S0
    value = value / base
    if value goto L1
    .return ($S0)
.end

.macro ROUND_WITH_FUZZ(val, places)
    .local num tmp
    tmp = .val
    .local num f
    f = pow 10.0, .places
    tmp *= f
    unless tmp >= 0.0 goto L11
    tmp += 0.5
    tmp = floor tmp
    goto L12
  L11:
    tmp -= 0.5
    tmp =ceil tmp
  L12:
    .val = tmp / f
.endm

.macro TRIG1(args, func)
    .local int argc
    argc = .args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift .args
    $I0 = isa $P1, 'PhpFloat'
    if $I0 goto L2
    $N1 = $P1
    new $P1, 'PhpFloat'
    set $P1, $N1
  L2:
    $P0 = $P1. .func ()
    .return ($P0)
.endm


=item C<int abs(int number)>

Return the absolute value of the number

=cut

.sub 'abs'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $I0 = isa $P1, 'PhpFloat'
    unless $I0 goto L2
    $N1 = $P1
    $N0 = abs $N1
    .RETURN_DOUBLE($N0)
  L2:
    $I0 = isa $P1, 'PhpInteger'
    unless $I0 goto L3
    $I1 = $P1
    $I0 = abs $I1
    .RETURN_LONG($I0)
  L3:
    $S0 = typeof $P1
    unless $S0 == 'array' goto L4
    .RETURN_FALSE()
  L4:
    $N1 = $P1
    $N0 = abs $N1
    .RETURN_DOUBLE($N0)
.end

=item C<float acos(float number)>

Return the arc cosine of the number in radians

=cut

.sub 'acos'
    .param pmc args :slurpy
    .TRIG1(args, 'acos')
.end

=item C<float acosh(float number)>

Returns the inverse hyperbolic cosine of the number, i.e. the value whose hyperbolic cosine is number

=cut

.sub 'acosh'
    .param pmc args :slurpy
    .TRIG1(args, 'acosh')
.end

=item C<float asin(float number)>

Returns the arc sine of the number in radians

=cut

.sub 'asin'
    .param pmc args :slurpy
    .TRIG1(args, 'asin')
.end

=item C<float asinh(float number)>

Returns the inverse hyperbolic sine of the number, i.e. the value whose hyperbolic sine is number

=cut

.sub 'asinh'
    .param pmc args :slurpy
    .TRIG1(args, 'asinh')
.end

=item C<float atan(float number)>

Returns the arc tangent of the number in radians

=cut

.sub 'atan'
    .param pmc args :slurpy
    .TRIG1(args, 'atan')
.end

=item C<float atan2(float y, float x)>

Returns the arc tangent of y/x, with the resulting quadrant determined by the signs of y and x

=cut

.sub 'atan2'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $N1 = $P1
    $P2 = shift args
    $N2 = $P2
    $N0 = atan $N1, $N2
    .RETURN_DOUBLE($N0)
.end

=item C<float atanh(float number)>

Returns the inverse hyperbolic tangent of the number, i.e. the value whose hyperbolic tangent is number

=cut

.sub 'atanh'
    .param pmc args :slurpy
    .TRIG1(args, 'atanh')
.end

=item C<string base_convert(string number, int frombase, int tobase)>

Converts a number in a string from any base <= 36 to any base <= 36

=cut

.sub 'base_convert'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 3 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S1 = $P1
    new $P1, 'PhpString'
    set $P1, $S1
    $P2 = shift args
    $I2 = $P2
    $P3 = shift args
    $I3 = $P3
    if $I2 < 2 goto L2
    if $I2 > 36 goto L2
    goto L3
  L2:
    error(E_WARNING, "Invalid `from base' (", $I2, ")")
    .RETURN_FALSE()
  L3:
    if $I3 < 2 goto L4
    if $I3 > 36 goto L4
    goto L5
  L4:
    error(E_WARNING, "Invalid `to base' (", $I3, ")")
    .RETURN_FALSE()
  L5:
    $P0 = $P1.'to_base'($I2)
    $I0 = isa $P0, 'PhpInteger'
    unless $I0 goto L6
    $I0 = $P0
    $S0 = longtobase($I0, $I3)
    .RETURN_STRING($S0)
  L6:
    .RETURN_FALSE()
.end

=item C<int bindec(string binary_number)>

Returns the decimal equivalent of the binary number

=cut

.sub 'bindec'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S1 = $P1
    new $P1, 'PhpString'
    set $P1, $S1
    $P0 = $P1.'to_base'(2)
    .return ($P0)
.end

=item C<float ceil(float number)>

Returns the next highest integer value of the number

=cut

.sub 'ceil'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $P1 = $P1.'to_number'()
    $I0 = isa $P1, 'PhpFloat'
    unless $I0 goto L2
    $N1 = $P1
    $N0 = ceil $N1
    .RETURN_DOUBLE($N0)
  L2:
    $I0 = isa $P1, 'PhpInteger'
    unless $I0 goto L3
    $N0 = $P1
    .RETURN_DOUBLE($N0)
  L3:
    .RETURN_FALSE()
.end

=item C<float cos(float number)>

Returns the cosine of the number in radians

=cut

.sub 'cos'
    .param pmc args :slurpy
    .TRIG1(args, 'cos')
.end

=item C<float cosh(float number)>

Returns the hyperbolic cosine of the number, defined as (exp(number) + exp(-number))/2

=cut

.sub 'cosh'
    .param pmc args :slurpy
    .TRIG1(args, 'cosh')
.end

=item C<string decbin(int decimal_number)>

Returns a string containing a binary representation of the number

=cut

.sub 'decbin'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $I1 = $P1
    $S0 = longtobase($I1, 2)
    .RETURN_STRING($S0)
.end

=item C<string dechex(int decimal_number)>

Returns a string containing a hexadecimal representation of the given number

=cut

.sub 'dechex'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $I1 = $P1
    $S0 = longtobase($I1, 16)
    .RETURN_STRING($S0)
.end

=item C<string decoct(int decimal_number)>

Returns a string containing an octal representation of the given number

=cut

.sub 'decoct'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $I1 = $P1
    $S0 = longtobase($I1, 8)
    .RETURN_STRING($S0)
.end

=item C<float deg2rad(float number)>

Converts the number in degrees to the radian equivalent

=cut

.sub 'deg2rad'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $N1 = $P1
    $N0 = $N1 / 180.0
    $N0 *= PI
    .RETURN_DOUBLE($N0)
.end

=item C<float exp(float number)>

Returns e raised to the power of the number

=cut

.sub 'exp'
    .param pmc args :slurpy
    .local num number
    ($I0, number) = parse_parameters('d', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    $N0 = exp number
    .RETURN_DOUBLE($N0)
.end

=item C<float expm1(float number)>

Returns exp(number) - 1, computed in a way that accurate even when the value of number is close to zero

NOT IMPLEMENTED. WARNING: this function is experimental.

=cut

.sub 'expm1'
    not_implemented()
.end

=item C<float floor(float number)>

Returns the next lowest integer value from the number

=cut

.sub 'floor'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $P1 = $P1.'to_number'()
    $I0 = isa $P1, 'PhpFloat'
    unless $I0 goto L2
    $N1 = $P1
    $N0 = floor $N1
    .RETURN_DOUBLE($N0)
  L2:
    $I0 = isa $P1, 'PhpInteger'
    unless $I0 goto L3
    $N0 = $P1
    .RETURN_DOUBLE($N0)
  L3:
    .RETURN_FALSE()
.end

=item C<float fmod(float x, float y)>

Returns the remainder of dividing x by y as a float

=cut

.sub 'fmod'
    .param pmc args :slurpy
    .local num x
    .local num y
    ($I0, x, y) = parse_parameters('dd', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    $N0 = cmod x, y
    .RETURN_DOUBLE($N0)
.end

=item C<int hexdec(string hexadecimal_number)>

Returns the decimal equivalent of the hexadecimal number

=cut

.sub 'hexdec'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S1 = $P1
    new $P1, 'PhpString'
    set $P1, $S1
    $P0 = $P1.'to_base'(16)
    .return ($P0)
.end

=item C<float hypot(float num1, float num2)>

Returns sqrt(num1*num1 + num2*num2)

=cut

.sub 'hypot'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $N1 = $P1
    $P2 = shift args
    $N2 = $P2
    $N1 *= $N1
    $N2 *= $N2
    $N1 += $N2
    $N0 = sqrt $N1
    .RETURN_DOUBLE($N0)
.end

=item C<bool is_finite(float val)>

Returns whether argument is finite

=cut

.sub 'is_finite'
    .param pmc args :slurpy
    .local pmc val
    ($I0, val) = parse_parameters('d', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    $P0 = val.'is_finite'()
    .return ($P0)
.end

=item C<bool is_infinite(float val)>

Returns whether argument is infinite

=cut

.sub 'is_infinite'
    .param pmc args :slurpy
    .local pmc val
    ($I0, val) = parse_parameters('d', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    $P0 = val.'is_infinite'()
    .return ($P0)
.end

=item C<bool is_nan(float val)>

Returns whether argument is not a number

=cut

.sub 'is_nan'
    .param pmc args :slurpy
    .local pmc val
    ($I0, val) = parse_parameters('d', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    $P0 = val.'is_nan'()
    .return ($P0)
.end

=item C<float log(float number, [float base])>

Returns the natural logarithm of the number, or the base log if base is specified

=cut

.sub 'log'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc == 1 goto L1
    $P1 = shift args
    $N1 = $P1
    $N0 = ln $N1
    .RETURN_DOUBLE($N0)
  L1:
    unless argc == 2 goto L2
    $P1 = shift args
    $N1 = $P1
    $P2 = shift args
    $N2 = $P2
    unless $N2 <= 0.0 goto L3
    error(E_WARNING, "base must be greater than 0")
    .RETURN_FALSE()
  L3:
    $N1 = ln $N1
    $N2 = ln $N2
    $N0 = $N1 / $N2
    .RETURN_DOUBLE($N0)
  L2:
    wrong_param_count()
    .RETURN_NULL()
.end

=item C<float log10(float number)>

Returns the base-10 logarithm of the number

=cut

.sub 'log10'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $N1 = $P1
    $N0 = log10 $N1
    .RETURN_DOUBLE($N0)
.end

=item C<float log1p(float number)>

Returns log(1 + number), computed in a way that accurate even when the value of number is close to zero

NOT IMPLEMENTED. WARNING: this function is experimental.

=cut

.sub 'log1p'
    not_implemented()
.end

=item C<string number_format(float number [, int num_decimal_places [, string dec_seperator, string thousands_seperator]])>

Formats a number with grouped thousands

=cut

.sub 'number_format'
    .param pmc args :slurpy
    .local int argc
    argc = args
    .local string thousand_sep, dec_point
    thousand_sep = ','
    dec_point = '.'
    unless argc == 1 goto L1
    $P1 = shift args
    $N1 = $P1
    .tailcall _number_format($N1, 0, dec_point, thousand_sep)
  L1:
    unless argc == 2 goto L2
    $P1 = shift args
    $P1 = $P1.'to_number'()
    $N1 = $P1
    $P2 = shift args
    $I2 = $P2
    .tailcall _number_format($N1, $I2, dec_point, thousand_sep)
  L2:
    unless argc == 4 goto L3
    $P1 = shift args
    $P1 = $P1.'to_number'()
    $N1 = $P1
    $P2 = shift args
    $I2 = $P2
    $P3 = shift args
    $I0 = isa $P3, 'PhpNull'
    if $I0 goto L4
    dec_point = $P3
    $I3 = length dec_point
    unless $I3 goto L4
    dec_point =substr dec_point, 0, 1
  L4:
    $P4 = shift args
    $I0 = isa $P4, 'PhpNull'
    if $I0 goto L5
    thousand_sep = $P4
    $I4 = length thousand_sep
    unless $I4 goto L5
    thousand_sep =substr thousand_sep, 0, 1
  L5:
    .tailcall _number_format($N1, $I2, dec_point, thousand_sep)
  L3:
    wrong_param_count()
    .RETURN_NULL()
.end

.sub '_number_format' :anon
    .param num d
    .param int dec
    .param string dec_point
    .param string thousand_sep
    .local int is_negative
    is_negative = 0
    unless d < 0 goto L1
    is_negative = 1
    neg d
  L1:
    unless dec < 0 goto L2
    dec = 0
  L2:
    .ROUND_WITH_FUZZ(d, dec)
    $S1 = dec
    $S0 = concat '%.', $S1
    $S0 = concat 'f'
    new $P0, 'FixedFloatArray'
    set $P0, 1
    $P0[0] = d
    .local string tmpbuf
    tmpbuf = sprintf $S0, $P0
    $S0 = ''
    $I0 = index tmpbuf, '.'
    unless $I0 < 0 goto L3
    $I0 = length tmpbuf
    goto L4
  L3:
    unless dec goto L4
    $I1 = $I0 + 1
    $S0 = substr tmpbuf, $I1
    unless dec_point goto L4
    $S0 = concat dec_point, $S0
  L4:
    $I1 = $I0 - 3
    $I2 = 3
    unless $I1 < 0 goto L5
    $I1 = 0
    $I2 = $I0
  L5:
    $S1 = substr tmpbuf, $I1, $I2
    $S0 = concat $S1, $S0
    $I0 -= 3
    unless $I0 > 0 goto L6
    unless thousand_sep goto L4
    $S0 = concat thousand_sep, $S0
    goto L4
  L6:
    unless is_negative goto L7
    $S0 = concat '-', $S0
  L7:
    .RETURN_STRING($S0)
.end

=item C<int octdec(string octal_number)>

Returns the decimal equivalent of an octal string

=cut

.sub 'octdec'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S1 = $P1
    new $P1, 'PhpString'
    set $P1, $S1
    $P0 = $P1.'to_base'(8)
    .return ($P0)
.end

=item C<float pi(void)>

Returns an approximation of pi

=cut

.sub 'pi'
    .param pmc args :slurpy
    .RETURN_DOUBLE(PI)
.end

=item C<number pow(number base, number exponent)>

Returns base raised to the power of exponent. Returns integer result when possible

=cut

.sub 'pow'
    .param pmc args :slurpy
    .local pmc base
    .local pmc exponent
    ($I0, base, exponent) = parse_parameters('z/z/', args :flat)
    if $I0 goto L1
    .RETURN_NULL()
  L1:
    base = base.'to_number'()
    exponent = exponent.'to_number'()
    $I0 = isa base, 'PhpInteger'
    unless $I0 goto L2
    $I0 = isa exponent, 'PhpInteger'
    unless $I0 goto L2
    $N1 = base
    $N2 = exponent
    $N0 = pow $N1, $N2
    $I0 = $N0
    .RETURN_LONG($I0)
  L2:
    $N1 = base
    $N2 = exponent
    $N0 = pow $N1, $N2
    .RETURN_DOUBLE($N0)
.end

=item C<float rad2deg(float number)>

Converts the radian number to the equivalent number in degrees

=cut

.sub 'rad2deg'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $N1 = $P1
    $N0 = $N1 / PI
    $N0 *= 180.0
    .RETURN_DOUBLE($N0)
.end

=item C<float round(float number [, int precision])>

Returns the number rounded to specified precision

=cut

.sub 'round'
    .param pmc args :slurpy
    .local int argc
    argc = args
    if argc < 1 goto L1
    if argc > 2 goto L1
    goto L2
  L1:
    wrong_param_count()
    .RETURN_NULL()
  L2:
    $P1 = shift args
    $I2 = 0
    unless argc == 2 goto L3
    $P2 = shift args
    $I2 = $P2
  L3:
    $I0 = isa $P1, 'PhpInteger'
    unless $I0 goto L4
    unless $I2 >= 0 goto L5
    $N0 = $P1
    .RETURN_DOUBLE($N0)
  L4:
    $I0 = isa $P1, 'PhpFloat'
    unless $I0 goto L6
  L5:
    $N0 = $P1
    $N2 = $I2
    .ROUND_WITH_FUZZ($N0, $N2)
    .RETURN_DOUBLE($N0)
  L6:
    .RETURN_FALSE()
.end

=item C<float sin(float number)>

Returns the sine of the number in radians

=cut

.sub 'sin'
    .param pmc args :slurpy
    .TRIG1(args, 'sin')
.end

=item C<float sinh(float number)>

Returns the hyperbolic sine of the number, defined as (exp(number) - exp(-number))/2

=cut

.sub 'sinh'
    .param pmc args :slurpy
    .TRIG1(args, 'sinh')
.end

=item C<float sqrt(float number)>

Returns the square root of the number

=cut

.sub 'sqrt'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $N1 = $P1
    $N0 = sqrt $N1
    .RETURN_DOUBLE($N0)
.end

=item C<float tan(float number)>

Returns the tangent of the number in radians

=cut

.sub 'tan'
    .param pmc args :slurpy
    .TRIG1(args, 'tan')
.end

=item C<float tanh(float number)>

Returns the hyperbolic tangent of the number, defined as sinh(number)/cosh(number)

=cut

.sub 'tanh'
    .param pmc args :slurpy
    .TRIG1(args, 'tanh')
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
