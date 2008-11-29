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

=item !EXPORT(symbols, from :named('from') [, to :named('to')] )

Export symbols in namespace C<from> to the namespace given by C<to>.
If C<to> isn't given, then exports into the HLL global namespace.
This function differs somewhat from Parrot's C<Exporter> PMC in that
it understands how to properly merge C<MultiSub> PMCs.

=cut

.namespace []
.sub '!EXPORT'
    .param string symbols
    .param pmc from            :named('from')
    .param pmc to              :named('to') :optional
    .param int has_to          :opt_flag

    if has_to goto have_to
    to = get_hll_namespace
  have_to:

    .local pmc list
    list = split ' ', symbols
  list_loop:
    unless list goto list_end
    .local string symbol
    .local pmc value
    symbol = shift list
    value = from[symbol]
    $I0 = isa value, 'MultiSub'
    unless $I0 goto store_value
    $P0 = to[symbol]
    if null $P0 goto store_value
    $I0 = isa $P0, 'MultiSub'
    unless $I0 goto err_type_conflict
    $I0 = elements $P0
    splice $P0, value, $I0, 0
    goto list_loop
  store_value:
    to[symbol] = value
    goto list_loop
  list_end:
    .return ()

  err_type_conflict:
    $S0 = concat "Unable to add Multisub '", symbol
    $S0 .= "' to existing value"
    die $S0
.end


.include 'except_types.pasm'
.include 'except_severity.pasm'

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


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
