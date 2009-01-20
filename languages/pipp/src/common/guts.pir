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

=item return

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


=item pipp_add_attribute(class, attr_name, attr_value)

Adds an attribute with the given name to the class or role.
See C<!keyword_has> in Rakudo.

=cut

.sub 'pipp_add_attribute'
    .param pmc class
    .param string attr_name

    addattribute class, attr_name

    .return ()
.end

=item !ADD_TO_WHENCE

Adds a key/value mapping to what will become the WHENCE on a proto-object (we
don't have a proto-object to stick them on yet, so we put a property on the
class temporarily, then attach it as the WHENCE clause later).

=cut

.sub '!ADD_TO_WHENCE'
    .param pmc class
    .param pmc attr_name
    .param pmc value

    # Get hash if we have it, if not make it.
    .local pmc whence_hash
    whence_hash = getprop '%!WHENCE', class
    unless null whence_hash goto have_hash
    whence_hash = new 'PhpArray'
    setprop class, '%!WHENCE', whence_hash

    # Make entry.
  have_hash:
    whence_hash[attr_name] = value
.end


=item !PROTOINIT

Called after a new proto-object has been made for a new class or grammar. It
finds any WHENCE data that we may need to add.

=cut

.sub '!PROTOINIT'
    .param pmc proto

    # See if there's any attribute initializers.
    .local pmc p6meta, WHENCE
    p6meta = get_hll_global ['PippObject'], '$!P6META'
    $P0 = p6meta.'get_parrotclass'(proto)
    WHENCE = getprop '%!WHENCE', $P0
    if null WHENCE goto no_whence

    setprop proto, '%!WHENCE', WHENCE
  no_whence:
    .return (proto)
.end


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
