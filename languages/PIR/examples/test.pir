.include 'HELLO'


.sub 'main' :main
    #load_bytecode 'Test/More.pir'

    .local pmc import_sub
    
    .IMPORT ( 'Test::More', 'pln' )
    
   #.local string res, exp, desc
    
    
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
# vim: expandtab shiftwidth=4:
