# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_var.pir - PHP var Standard Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<void debug_zval_dump(mixed var)>

Dumps a string representation of an internal zend value to output.

NOT IMPLEMENTED.

=cut

.sub 'debug_zval_dump'
    not_implemented()
.end

=item C<int memory_get_peak_usage([real_usage])>

Returns the peak allocated by PHP memory

NOT IMPLEMENTED.

=cut

.sub 'memory_get_peak_usage'
    not_implemented()
.end

=item C<int memory_get_usage([real_usage])>

Returns the allocated by PHP memory

NOT IMPLEMENTED.

=cut

.sub 'memory_get_usage'
    not_implemented()
.end

=item C<string serialize(mixed variable)>

Returns a string representation of variable (which can later be unserialized)

NOT IMPLEMENTED.

=cut

.sub 'serialize'
    not_implemented()
.end

=item C<mixed unserialize(string variable_representation)>

Takes a string representation of variable and recreates it

NOT IMPLEMENTED.

=cut

.sub 'unserialize'
    not_implemented()
.end

=item C<void var_dump(mixed var)>

Dumps a string representation of variable to output

=cut

.include "library/dumper.pir"
.include "cclass.pasm"

# TODO: pass in indent_level, proper escaping
.sub var_dump
    .param pmc args :slurpy
    .local int argc

    argc = args
    unless argc != 1 goto L0
    wrong_param_count()
    .return()
  L0:
    .local pmc a
    a = shift args
    if null a goto set_null_type

    .local string type_of_pmc
    type_of_pmc = typeof a
    unless type_of_pmc == 'string' goto L1
    .local int string_len

    string_len = elements a
    print 'string('
    print string_len
    print ') "'
    print a
    print '"'
    say ''

    .return()

  L1:
    unless type_of_pmc == 'array' goto L2
    .local int num_elements
    num_elements = elements a
    string_len = elements a
    print 'array('
    print num_elements
    say ') {'

    .local pmc    it, val, key
    .local string indent, key_str
    .local int    key_starts_with_digit
    indent = '  '
    it = iter a
  iter_loop:
    unless it goto iter_end
    shift key, it
    key_str = key
    key_starts_with_digit = is_cclass .CCLASS_NUMERIC, key_str, 0
    print indent
    print '['
    if key_starts_with_digit goto key_is_an_integer_1
    print '"'
  key_is_an_integer_1:
    print key
    if key_starts_with_digit goto key_is_an_integer_2
    print '"'
  key_is_an_integer_2:
    say ']=>'
    print indent
    val = a[key]
    var_dump(val)

    branch iter_loop
  iter_end:
    say '}'
    .return()
  L2:
    unless type_of_pmc == 'integer' goto L3
    print 'int('
    print a
    say ')'

    .return()
  L3:
    unless type_of_pmc == 'boolean' goto L4
    print 'bool('
    if a goto a_is_true
    print 'false'
    say ')'

    .return()
  a_is_true:
    print 'true'
    say ')'

    .return()
  set_null_type:
    type_of_pmc = 'NULL'
  L4:
    unless type_of_pmc == 'NULL' goto L5
    say type_of_pmc

    .return()
  L5:
    # this should never happen
    print 'unexpectedly encountered a '
    print type_of_pmc
    print " PMC\n"
    _dumper(a)

    .return()
.end

=item C<mixed var_export(mixed var [, bool return])>

Outputs or returns a string representation of a variable

NOT IMPLEMENTED.

=cut

.sub 'var_export'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
