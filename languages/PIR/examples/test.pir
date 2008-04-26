.include 'HELLO'


.sub 'main' :main

    .include 'include/test_more.pir'

    'plan'(TESTS)

    'issame'()
    'isntsame'()
    'istrue'()
    'isfalse'()
    'isnull'()
    'isgt'()
    'isge'()
    'isle'()
    'islt'()
    'iseq'()
    'isne'()
    'cmp'()
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
