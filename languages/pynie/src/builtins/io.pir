=head1 NAME

src/builtins/inplace.pir - Inplace assignments

=head1 Functions

=over 4

=cut

.namespace []

.include 'cclass.pasm'

.sub 'onload' :load :init
    $P0 = new 'Integer'
    $P0 = 1
    set_global '$isbol', $P0
    .return ()
.end


.sub 'print'
    .param pmc args            :slurpy

    .local pmc isbol
    isbol = get_global '$isbol'
    .local pmc iter
    iter = new 'Iterator', args
  iter_loop:
    unless iter goto iter_end
    $S0 = shift iter
    if isbol goto skip_space
    print " "
  skip_space:
    print $S0
    $I0 = is_cclass .CCLASS_NEWLINE, $S0, -1
    isbol = $I0
    goto iter_loop
  iter_end:
    .return ()
.end


.sub 'printnl'
    .param pmc args            :slurpy
    'print'(args :flat)
    print "\n"
    .local pmc isbol
    isbol = get_global '$isbol'
    isbol = 1
    .return ()
.end

=back

=head1 AUTHOR

Patrick Michaud <pmichaud@pobox.com> is the current author and
maintainer.  Patches and suggestions can be sent to
<parrot-porters@perl.org> or <perl-compiler@perl.org> .

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
