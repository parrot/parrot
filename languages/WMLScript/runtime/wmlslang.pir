# Copyright (C) 2006, The Perl Foundation.
# $Id: wmlslang.pir 12840 2006-05-30 15:08:05Z coke $

=head1 NAME

runtime/wmlslang.pir - WMLScript Lang library

=head1 DESCRIPTION

This library contains a set of functions that are closely related to the
WMLScript language core.

See "WMLScript Standard Libraries Specification", section 7 "Lang".

=head1 FUNCTIONS

=cut

.HLL "WMLScript", "wmls_group"


.sub getLang
    new $P0, .Hash
    
    .const .Sub _lang_abs = "_lang_abs"
    $P0[0]  = _lang_abs
    .const .Sub _lang_min = "_lang_min"
    $P0[1]  = _lang_min
    .const .Sub _lang_max = "_lang_max"
    $P0[2]  = _lang_max
    .const .Sub _lang_parseInt = "_lang_parseInt"
    $P0[3]  = _lang_parseInt
    .const .Sub _lang_parseFloat = "_lang_parseFloat"
    $P0[4]  = _lang_parseFloat
    .const .Sub _lang_isInt = "_lang_isInt"
    $P0[5]  = _lang_isInt
    .const .Sub _lang_isFloat = "_lang_isFloat"
    $P0[6]  = _lang_isFloat
    .const .Sub _lang_maxInt = "_lang_maxInt"
    $P0[7]  = _lang_maxInt
    .const .Sub _lang_minInt = "_lang_minInt"
    $P0[8]  = _lang_minInt
    .const .Sub _lang_float = "_lang_float"
    $P0[9]  = _lang_float
    .const .Sub _lang_exit = "_lang_exit"
    $P0[10] = _lang_exit
    .const .Sub _lang_abort = "_lang_abort"
    $P0[11] = _lang_abort
    .const .Sub _lang_exit = "_lang_exit"
    $P0[12] = _lang_exit
    .const .Sub _lang_seed = "_lang_seed"
    $P0[13] = _lang_seed
    .const .Sub _lang_characterSet = "_lang_characterSet"
    $P0[14] = _lang_characterSet

    .return ($P0)
.end


=head2 C<abs(value)>

=head3 DESCRIPTION

Returns the absolute value of the given number. If the given number is of
type integer then an integer value is returned. If the given number is of type
floating-point then a floating-point value is returned.

=head3 PARAMETERS

value = Number

=head3 RETURN VALUE

Number or invalid.

=cut

.sub _lang_abs :anon
    .param pmc value
    .local pmc ret
    ret = abs value
    .return (ret)
.end


=head2 C<min(value1, value2)>

=head3 DESCRIPTION

Returns the minimum value of the given two numbers. The value and type
returned is the same as the value and type of the selected number. The
selection is done in the following way:

=over 4

=item *

WMLScript operator data type conversion rules for I<integers and
floating-points> (see [WMLScript]) must be used to specify the data
type (integer or floating-point ) for comparison.

=item *

Compare the numbers to select the smaller one.

=item *

If the values are equal then the first value is selected.
    
=back
    
NOT YET IMPLEMENTED.

=head3 PARAMETERS

value1 = Number

value2 = Number

=head3 RETURN VALUE

Number or invalid.

=cut

.sub _lang_min :anon
    .param pmc value1
    .param pmc value2
    not_implemented()
.end


=head2 C<max(value1, value2)>

=head3 DESCRIPTION

Returns the maximum value of the given two numbers. The value and type
returned is the same as the value and type of the selected number. The
selection is done in the following way:

=over 4

=item *

WMLScript operator data type conversion rules for I<integers and
floating-points> (see [WMLScript]) must be used to specify the data
type (integer or floating-point ) for comparison.

=item *

Compare the numbers to select the larger one.

=item *

If the values are equal then the first value is selected.

=back

NOT YET IMPLEMENTED.

=head3 PARAMETERS

value1 = Number

value2 = Number

=head3 RETURN VALUE

Number or invalid.

=cut

.sub _lang_max :anon
    .param pmc value1
    .param pmc value2
    not_implemented()
.end


=head2 C<parseInt(value)>

=head3 DESCRIPTION

Returns an integer value defined by the string value. The legal integer
syntax is specified by the WMLScript (see [WMLScript]) numeric string
grammar for I<decimal integer literals> with the following additional parsing
rule:

=over 4

=item *

Parsing ends when the first character is encountered that is not a
leading '+' or '-' or a decimal digit.

=back

The result is the parsed string converted to an integer value.

=head3 PARAMETERS

value = String

=head3 RETURN VALUE

Integer or invalid.

=head3 EXCEPTIONS

In case of a parsing error an C<invalid> value is returned.

=cut

.sub _lang_parseInt :anon
    .param pmc value
    .local pmc ret
    $I0 = isa value, "WmlsString"
    unless $I0 goto L1
    ret = value.parseInt()
    .return (ret)
L1:
    ret = value
    $I0 = isa value, "WmlsInteger"
    if $I0 goto L2
    new ret, .WmlsInvalid
L2:
    .return (ret)
.end


=head2 C<parseFloat(value)>

=head3 DESCRIPTION

Returns a floating-point value defined by the string value. The legal floatingpoint
syntax is specified by the WMLScript (see [WMLScript]) numeric
string grammar for I<decimal floating-point literals> with the following additional
parsing rule:

=over 4

=item *

Parsing ends when the first character is encountered that cannot
be parsed as being part of the floating-point representation.

=back

The result is the parsed string converted to a floating-point value.

=head3 PARAMETERS

value = String

=head3 RETURN VALUE

Floating-point or invalid.

=head3 EXCEPTIONS

In case of a parsing error an C<invalid> value is returned.

=cut

.sub _lang_parseFloat :anon
    .param pmc value
    .local pmc ret
    $I0 = isa value, "WmlsString"
    unless $I0 goto L1
    ret = value.parseFloat()
    .return (ret)
L1:
    ret = value
    $I0 = isa value, "WmlsFloat"
    if $I0 goto L2
    $I0 = isa value, "WmlsInteger"
    unless $I0 goto L3
    $I0 = value
    new ret, .WmlsFloat
    set ret, $I0
    goto L2
L3:    
    new ret, .WmlsInvalid
L2:
    .return (ret)
.end


=head2 C<isInt(value)>

=head3 DESCRIPTION

Returns a boolean value that is C<true> if the given value can be converted
into an integer number by using parseInt(value). Otherwise C<false> is
returned.

=head3 PARAMETERS

value = Any

=head3 RETURN VALUE

Boolean or invalid.

=cut

.sub _lang_isInt :anon
    .param pmc value
    .local pmc ret
    $I0 = isa value, "WmlsString"
    unless $I0 goto L1
    $P0 = value.parseInt()
    ret = $P0.isvalid()
    .return (ret)
L1:
    $I0 = isa value, "WmlsInvalid"
    unless $I0 goto L2
    new ret, .WmlsInvalid
    .return (ret) 
L2:                                             
    new ret, .WmlsBoolean
    $I0 = isa value, "WmlsInteger"
    set ret, $I0
    .return (ret)
.end


=head2 C<isFloat(value)>

=head3 DESCRIPTION

Returns a boolean value that is C<true> if the given value can be converted
into a floating-point number using parseFloat(value). Otherwise C<false> is
returned.

=head3 PARAMETERS

value = Any

=head3 RETURN VALUE

Boolean or invalid.

=cut

.sub _lang_isFloat :anon
    .param pmc value
    .local pmc ret
    $I0 = isa value, "WmlsString"
    unless $I0 goto L1
    $P0 = value.parseFloat()
    ret = $P0.isvalid()
    .return (ret)
L1:
    $I0 = isa value, "WmlsInvalid"
    unless $I0 goto L2
    new ret, .WmlsInvalid
    .return (ret)
L2:
    new ret, .WmlsBoolean
    $I0 = isa value, "WmlsFloat"
    set ret, $I0
    if $I0 goto L3
    $I0 = isa value, "WmlsInteger"
    set ret, $I0
L3:
    .return (ret)
.end


=head2 C<maxInt()>

=head3 DESCRIPTION

Returns the maximum integer value.

=head3 RETURN VALUE

Integer 2147483647.

=cut

.sub _lang_maxInt :anon
    .local pmc ret
    new ret, .WmlsInteger
    ret = 2147483647
    return (ret)
.end


=head2 C<minInt()>

=head3 DESCRIPTION

Returns the minimum integer value.

=head3 RETURN VALUE

Integer -2147483648.

=cut

.sub _lang_minInt :anon
    .local pmc ret
    new ret, .WmlsInteger
    ret = -2147483648
    return (ret)
.end


=head2 C<float()>

=head3 DESCRIPTION

Returns true if floating-points are supported and false if not.

=head3 RETURN VALUE

Boolean.

=cut

.sub _lang_float :anon
    .local pmc ret
    new ret, .WmlsBoolean
    ret = 1
    return (ret)
.end


=head2 C<exit(value)>

=head3 DESCRIPTION

Ends the interpretation of the WMLScript bytecode and returns the control
back to the caller of the WMLScript interpreter with the given return value.
This function can be used to perform a normal exit from a function in cases
where the execution of the WMLScript bytecode should be discontinued.

NOT YET IMPLEMENTED.

=head3 PARAMETERS

value = Any

=head3 RETURN VALUE

None (this function ends the interpretation).

=cut

.sub _lang_exit :anon
    .param pmc value
    not_implemented()
.end


=head2 C<abort(errorDescription)>

=head3 DESCRIPTION

Aborts the interpretation of the WMLScript bytecode and returns the control
back to the caller of the WMLScript interpreter with the return
errorDescription. This function can be used to perform an abnormal exit in
cases where the execution of the WMLScript should be discontinued due to
serious errors detected by the program. If the type of the errorDescription is
invalid, string "invalid" is used as the errorDescription instead.

NOT YET IMPLEMENTED.

=head3 PARAMETERS

errorDescription = String

=head3 RETURN VALUE

None (this function aborts the interpretation).

=cut

.sub _lang_abort :anon
    .param pmc value
    not_implemented()
.end


=head2 C<random(value)>

=head3 DESCRIPTION

Returns an integer value with positive sign that is greater than or equal to 0
but less than or equal to the given value. The return value is chosen
randomly or pseudo-randomly with approximately uniform distribution over
that range, using an implementation-dependent algorithm or strategy.

If the value is of type floating-point, Float.int() is first used to calculate the
actual integer value.

NOT YET IMPLEMENTED.

=head3 PARAMETERS

value = Number

=head3 RETURN VALUE

Integer or invalid.

=head3 EXCEPTIONS

If value is equal to zero (0), the function returns zero.

If value is less than zero (0), the function returns C<invalid>.

=cut

.sub _lang_exit :anon
    .param pmc value
    not_implemented()
.end


=head2 C<seed(value)>

=head3 DESCRIPTION

Initialises the pseudo-random number sequence and returns an empty
string. If the value is zero or a positive integer then the given value is used
for initialisation, otherwise a random, system dependent initialisation value
is used. A seed value of greater than or equal to zero results in a repeatable
sequence of pseudo-random numbers. A seed value of less than zero
results in a non-repeatable sequence of random numbers.

If the value is of type floating-point, Float.int() is first used to calculate the
actual integer value. . If the value is non-numeric, invalid is returned and the
current seed is unchanged.

NOT YET IMPLEMENTED.

=head3 PARAMETERS

value = Number

=head3 RETURN VALUE

String or invalid.

=cut

.sub _lang_seed :anon
    .param pmc value
    not_implemented()
.end


=head2 C<characterSet()>

=head3 DESCRIPTION

Returns the character set supported by the WMLScript Interpreter. The
return value is an integer that denotes a MIBEnum value assigned by the
IANA for all character sets (see [WSP] for more information).

=head3 RETURN VALUE

Integer.

=cut

.sub _lang_characterSet :anon
    .local pmc ret
    new ret, .WmlsInteger
    ret = 4     # latin1
    return (ret)
.end


=head1 AUTHORS

Francois Perrad.

=cut

