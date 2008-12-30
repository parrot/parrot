## $Id$

=head1 NAME

src/common/guts.pir - subs that are part of the internals, not for users

=head1 HISTORY

Stolen from Rakudo.

=head1 SUBS

=over 4

=item C<bool pipp_defined(string constant_name)>

Check whether a Parrot register is defined.

=cut

.sub 'pipp_defined'
    .param pmc args :slurpy
    .local int argc

    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .RETURN_NULL()
  L1:
    $P0 = shift args
    $I0 = defined $P0
    .return ($I0)
.end

=item C<void pipp_var_dump(mixed var)>

Dump a PMC

=cut

.sub 'pipp_var_dump'
    .param pmc args :slurpy
    .local int argc

    argc = args
    unless argc != 1 goto L1
    wrong_param_count()
    .return()
  L1:
    $P0 = shift args
    _dumper($P0)

    .return ()
.end


.include 'except_types.pasm'
.include 'except_severity.pasm'

=head2 return

For returning a value from a function.

=cut

.sub 'return'
    .param pmc value           :optional
    .param int has_value       :opt_flag

    if has_value goto have_value
    value = 'list'()
  have_value:
    $P0         = new 'Exception'
    $P0['type'] = .CONTROL_RETURN
    setattribute $P0, 'payload', value
    throw $P0
    .return (value)
.end

=item pipp_create_class(name)

Internal helper method to create a class.
See C<!keyword_class> in Rakudo.

=cut

.sub 'pipp_create_class'
    .param string name

    .local pmc class
    class = newclass name

    .return (class)
.end


=item tipp_add_attribute(class, attr_name, attr_value)

Adds an attribute with the given name to the class or role.
See C<!keyword_has> in Rakudo.

=cut

.sub 'pipp_add_attribute'
    .param pmc class
    .param string attr_name

    addattribute class, attr_name

    .return ()
.end



=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
