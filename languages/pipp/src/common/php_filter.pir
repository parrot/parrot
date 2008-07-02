# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

php_filter.pir - PHP filter  Library

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

=item C<mixed filter_has_var(constant type, string variable_name)>

* Returns true if the variable with the name 'name' exists in source.


NOT IMPLEMENTED.

=cut

.sub 'filter_has_var'
    not_implemented()
.end

=item C< filter_id(string filtername)>

* Returns the filter ID belonging to a named filter

NOT IMPLEMENTED.

=cut

.sub 'filter_id'
    not_implemented()
.end

=item C<mixed filter_input(constant type, string variable_name [, long filter [, mixed options]])>

* Returns the filtered variable 'name'* from source `type`.


NOT IMPLEMENTED.

=cut

.sub 'filter_input'
    not_implemented()
.end

=item C<mixed filter_input_array(constant type, [, mixed options]])>

* Returns an array with all arguments defined in 'definition'.


NOT IMPLEMENTED.

=cut

.sub 'filter_input_array'
    not_implemented()
.end

=item C< filter_list()>

* Returns a list of all supported filters

NOT IMPLEMENTED.

=cut

.sub 'filter_list'
    not_implemented()
.end

=item C<mixed filter_var(mixed variable [, long filter [, mixed options]])>

* Returns the filtered version of the vriable.


NOT IMPLEMENTED.

=cut

.sub 'filter_var'
    not_implemented()
.end

=item C<mixed filter_var_array(array data, [, mixed options]])>

* Returns an array with all arguments defined in 'definition'.


NOT IMPLEMENTED.

=cut

.sub 'filter_var_array'
    not_implemented()
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
