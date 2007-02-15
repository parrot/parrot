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

