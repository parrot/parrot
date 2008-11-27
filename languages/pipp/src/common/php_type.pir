# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_type.pir - PHP type Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

.macro IS_TYPE(type, args)
    .local int argc
    argc = .args
    unless argc != 1 goto L1
    error(E_WARNING, 'Only one argument expected')
    .RETURN_FALSE()
  L1:
    $P1 = shift .args
    $I0 = isa $P1, .type
    .RETURN_BOOL($I0)
.endm

=item C<float floatval(mixed var)>

Get the float value of a variable

=cut

.sub 'floatval'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $N0 = $P1
    .RETURN_DOUBLE($N0)
.end

=item C<string gettype(mixed var)>

Returns the type of the variable

=cut

.sub 'gettype'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S0 = typeof $P1
    .RETURN_STRING($S0)
.end

=item C<int intval(mixed var [, int base])>

Get the integer value of a variable using the optional base for the conversion

=cut

.sub 'intval'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $I0 = $P1
    .RETURN_LONG($I0)
.end

=item C<bool is_array(mixed var)>

Returns true if variable is an array

NOT IMPLEMENTED.

=cut

.sub 'is_array'
    not_implemented()
.end

=item C<bool is_bool(mixed var)>

Returns true if variable is a boolean

=cut

.sub 'is_bool'
    .param pmc args :slurpy
    .IS_TYPE('PhpBoolean', args)
.end

=item C<bool is_callable(mixed var [, bool syntax_only [, string callable_name]])>

Returns true if var is callable.

NOT IMPLEMENTED.

=cut

.sub 'is_callable'
    not_implemented()
.end

=item C<bool is_float(mixed var)>

Returns true if variable is float point

=cut

.sub 'is_float'
    .param pmc args :slurpy
    .IS_TYPE('PhpFloat', args)
.end

=item C<bool is_long(mixed var)>

Returns true if variable is a long (integer)

=cut

.sub 'is_long'
    .param pmc args :slurpy
    .IS_TYPE('PhpInteger', args)
.end

=item C<bool is_null(mixed var)>

Returns true if variable is null

=cut

.sub 'is_null'
    .param pmc args :slurpy
    .IS_TYPE('PhpNull', args)
.end

=item C<bool is_numeric(mixed value)>

Returns true if value is a number or a numeric string

=cut

.sub 'is_numeric'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $I0 = isa $P1, 'PhpFloat'
    if $I0 goto L2
    $I0 = isa $P1, 'PhpInteger'
    if $I0 goto L2
    $I0 = isa $P1, 'PhpString'
    unless $I0 goto L3
    $I0 = $P1.'is_numeric'(0)
    .RETURN_BOOL($I0)
  L3:
    .RETURN_FALSE()
  L2:
    .RETURN_TRUE()
.end

=item C<bool is_object(mixed var)>

Returns true if variable is an object

NOT IMPLEMENTED.

=cut

.sub 'is_object'
    not_implemented()
.end

=item C<bool is_resource(mixed var)>

Returns true if variable is a resource

NOT IMPLEMENTED.

=cut

.sub 'is_resource'
    not_implemented()
.end

=item C<bool is_scalar(mixed value)>

Returns true if value is a scalar

=cut

.sub 'is_scalar'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $I0 = isa $P1, 'PhpBoolean'
    if $I0 goto L2
    $I0 = isa $P1, 'PhpFloat'
    if $I0 goto L2
    $I0 = isa $P1, 'PhpInteger'
    if $I0 goto L2
    $I0 = isa $P1, 'PhpString'
    if $I0 goto L2
    .RETURN_FALSE()
  L2:
    .RETURN_TRUE()
.end

=item C<bool is_string(mixed var)>

Returns true if variable is a string

=cut

.sub 'is_string'
    .param pmc args :slurpy
    .IS_TYPE('PhpString', args)
.end

=item C<bool settype(mixed var, string type)>

Set the type of the variable

NOT IMPLEMENTED.

=cut

.sub 'settype'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 2 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $P2 = shift args
    $S2 = $P2
    not_implemented()
.end

=item C<string strval(mixed var)>

Get the string value of a variable

=cut

.sub 'strval'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P1 = shift args
    $S0 = $P1
    .RETURN_STRING($S0)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
