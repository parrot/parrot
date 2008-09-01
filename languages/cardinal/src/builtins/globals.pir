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
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
