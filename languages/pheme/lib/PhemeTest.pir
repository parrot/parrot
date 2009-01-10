.namespace [ 'Test'; 'More' ]

.sub is :multi( [ 'Pheme'; 'Cons' ], [ 'Pheme'; 'Cons' ] )
    .param pmc    l_cons
    .param pmc    r_cons
    .param string description :optional

    .local pmc eqlist
    eqlist = get_hll_global ['Pheme'], 'eqlist?'

    .local int equal
    equal = eqlist( l_cons, r_cons )

    .local pmc test
    test = get_hll_global [ 'Test'; 'More' ], '_test'

    test.'ok'( equal, description )
    .return( equal )
.end

.sub is_deeply :multi( [ 'Pheme'; 'Cons' ], [ 'Pheme'; 'Cons' ] )
    .param pmc    l_cons
    .param pmc    r_cons
    .param string description :optional

    .local pmc eqlist
    eqlist = get_hll_global ['Pheme'], 'eqlist?'

    .local int equal
    equal = eqlist( l_cons, r_cons )

    .local pmc test
    test = get_hll_global [ 'Test'; 'More' ], '_test'

    test.'ok'( equal, description )
    .return( equal )
.end

.namespace [ 'Pheme' ]

.sub _load :load
    load_bytecode 'library/Test/More.pir'
    _export( 'is', 'ok', 'nok', 'diag', 'is_deeply', 'plan' )
.end

.sub _export
    .param pmc exports :slurpy

    .local pmc iter
    iter = new 'Iterator', exports

    .local string name
    .local pmc    sub
  iter_loop:
    unless iter goto iter_end
    name = shift iter
    sub  = get_hll_global [ 'Test'; 'More' ], name
    set_global name, sub
    goto iter_loop
  iter_end:

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
