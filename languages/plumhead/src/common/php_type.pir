# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_type.pir - PHP type Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<float floatval(mixed var)>

Get the float value of a variable

=cut

.sub 'floatval'
    not_implemented()
.end

=item C<string gettype(mixed var)>

Returns the type of the variable

=cut

.sub 'gettype'
    .param pmc args :slurpy
    .local int argc
    argc = args
    unless argc != 1 goto L1
    printerr argc
    printerr "\n"
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
    not_implemented()
.end

=item C<bool is_array(mixed var)>

Returns true if variable is an array

=cut

.sub 'is_array'
    not_implemented()
.end

=item C<bool is_bool(mixed var)>

Returns true if variable is a boolean

=cut

.sub 'is_bool'
    not_implemented()
.end

=item C<bool is_callable(mixed var [, bool syntax_only [, string callable_name]])>

Returns true if var is callable.

=cut

.sub 'is_callable'
    not_implemented()
.end

=item C<bool is_float(mixed var)>

Returns true if variable is float point

=cut

.sub 'is_float'
    not_implemented()
.end

=item C<bool is_long(mixed var)>

Returns true if variable is a long (integer)

=cut

.sub 'is_long'
    not_implemented()
.end

=item C<bool is_null(mixed var)>

Returns true if variable is null

=cut

.sub 'is_null'
    not_implemented()
.end

=item C<bool is_numeric(mixed value)>

Returns true if value is a number or a numeric string

=cut

.sub 'is_numeric'
    not_implemented()
.end

=item C<bool is_object(mixed var)>

Returns true if variable is an object

=cut

.sub 'is_object'
    not_implemented()
.end

=item C<bool is_resource(mixed var)>

Returns true if variable is a resource

=cut

.sub 'is_resource'
    not_implemented()
.end

=item C<bool is_scalar(mixed value)>

Returns true if value is a scalar

=cut

.sub 'is_scalar'
    not_implemented()
.end

=item C<bool is_string(mixed var)>

Returns true if variable is a string

=cut

.sub 'is_string'
    not_implemented()
.end

=item C<bool settype(mixed var, string type)>

Set the type of the variable

=cut

.sub 'settype'
    not_implemented()
.end

=item C<string strval(mixed var)>

Get the string value of a variable

=cut

.sub 'strval'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
