#!./parrot

# checking basic operands and circumfix:( )

plan(13);

##Additive operators
ok(      1+2  == 3, 'Checking addition 1+2');
ok(     10-9  == 1, 'Checking subtraction 10-9');
ok(   10-3+2  == 9, 'Checking compound statements 10-3+2');
ok(  10-(3+2) == 5, 'Checking parenthesized statement 10-(3+2)');

##Multiplicative operators
ok(      6*7  == 42, 'Checking multiplication 6*7');
ok(     36/6  ==  6, 'Checking division 36/6');
ok(    4*3+5  == 17, 'Checking compound statements 4*3+5');
ok(   4*(3+5) == 32, 'Checking parenthesized statements 4*(3+5)');
ok(   12/4*3  ==  9, 'Checking compound statements 12/4*3');
ok( 12/(4*3)  ==  1, 'Checking compound statements 12/(4*3)');

##Modulo operator
ok(      8%3  == 2, 'Checking modulo 8%3');
ok(    8%3+2  == 4, 'Checking compound statement 8%3+2');
ok(  8%(3+2)  == 3, 'Checking compound statement 8%(3+2)');

