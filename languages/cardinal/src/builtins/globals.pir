## $Id$

=head1 NAME

src/builtins/globals.pir - initialize miscellaneous global variables

=cut

.namespace []

.sub 'onload' :anon :load :init
    .local pmc cardinalmeta
    cardinalmeta = get_hll_global ['CardinalObject'], '!CARDINALMETA'

    ##  set up $ENV
    $P0 = get_hll_global 'CardinalHash'
    cardinalmeta.'register'('Env', 'parent'=>$P0, 'protoobject'=>$P0)
    .local pmc env
    env = new 'Env'
    set_hll_global '$ENV', env

    ##  set up $:
    $S0 = env['RUBYLIB']
    $P0 = split ':', $S0
    push $P0, '.'
    $P0 = 'list'($P0)
    set_hll_global '$:', $P0

    ##  set up %*INC
    $P0 = new 'CardinalHash'
    set_hll_global '%INC', $P0

    #$P1 = new 'CardinalString'
    #$P1 = "\n"
    ## global input record separator
    $P1 = get_hll_global ['NilClass'], '!CARDINALMETA'
    set_hll_global '$/', $P1
    ## global output record separator
    $P4 = get_hll_global ['NilClass'], '!CARDINALMETA'
    set_hll_global '$\', $P4

    #getstdin $P5
    #set_hll_global '$stdin', $P5
    #set_hll_global '$>', $P5

    getstdout $P6
    set_hll_global '$stdout', $P6

    #getstderr $P7
    #set_hll_global 'stderr', $P7

    $P2 = new 'CardinalString'
    $P2 = "parrot"
    set_hll_global 'RUBY_PLATFORM', $P2

    $P3 = new 'CardinalString'
    $P3 = "1.9"
    set_hll_global 'RUBY_VERSION', $P3
.end

=over

=item
 Uses Parrot builtin Random type, doesnt seem to be working
=cut
.sub 'rand'
    $P0 = new 'Random'
    $I0 = $P0
    .return ($I0)
.end

=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
