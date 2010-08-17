#!./parrot
# Copyright (C) 2005-2008, Parrot Foundation.
# $Id$

.sub _main :main
   load_bytecode 'Test/Builder/Tester.pbc'

   .local pmc tb_args
   tb_args = new 'Hash'

   .local pmc test
   test = new [ 'Test'; 'Builder' ], tb_args

   .local pmc plan
   .local pmc test_pass
   .local pmc test_fail
   .local pmc test_out
   .local pmc test_diag
   .local pmc test_test
   plan      = get_global [ 'Test'; 'Builder'; 'Tester' ], 'plan'
   test_pass = get_global [ 'Test'; 'Builder'; 'Tester' ], 'test_pass'
   test_fail = get_global [ 'Test'; 'Builder'; 'Tester' ], 'test_fail'
   test_out  = get_global [ 'Test'; 'Builder'; 'Tester' ], 'test_out'
   test_diag = get_global [ 'Test'; 'Builder'; 'Tester' ], 'test_diag'
   test_test = get_global [ 'Test'; 'Builder'; 'Tester' ], 'test_test'

   plan( 4 )

   test_out( 'ok 1 - hi' )
   test.'ok'( 1, 'hi' )
   test_test( 'passing test')

   test_out( 'not ok 2 - bye' )
   test.'ok'( 0, 'bye' )
   test_test( 'failing test')

   test_out( "\n1..2" )
   test.'done_testing'()
   test_test( 'Simple done_testing works' )

   test_out( "1..3" )
   test_out( "Expected 3 but ran 2" )
   test.'done_testing'(3)
   test_test( 'done_testing with bad plan works' )

   test.'finish'()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
