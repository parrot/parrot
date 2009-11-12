#! nqp

# Test PIR::op pseudo-functions.

plan(3);

say( pir::join__SsP('', ('o', 'k', ' ', 1) ) );

say( 'ok ', pir::div(6,3) );

say( 'ok ', pir::chr__Si(51) );
