#!/usr/bin/perl

use lib qw(APL . lib ../lib ../../lib ../../../lib);
use t::APL tests => 98;

diag "need more tests to test int <op> int, float <op> float, etc.";

run_apl_is();

__DATA__

=== plus scalar (int/int)
--- APL: 2+2
--- out: 4

=== plus scalar (int/float)
--- APL: 2+3.14
--- out: 5.14

=== plus vector, float
--- APL: 1 2 3 4+3.14 
--- out: 4.14 5.14 6.14 7.14

=== plus float, vector
--- APL: 3.14+1 2 3 4 
--- out: 4.14 5.14 6.14 7.14

=== plus vector
--- APL: 1 2 3 4+1.1 2.2 3.3 4.4
--- out: 2.1 4.2 6.3 8.4

=== plus domain
--- APL: 1+'TEA'
--- out: DOMAIN ERROR

=== minus scalar (int/int)
--- APL: 2−3
--- out: ⁻1

=== minus scalar
--- APL: 2−3.14
--- out: ⁻1.14

=== minus vector, float
--- APL: 1 2 3 4−3.14 
--- out: ⁻2.14 ⁻1.14 ⁻0.14 0.86
--- todo

=== minus float, vector
--- APL: 3.14−1 2 3 4 
--- out: 2.14 1.14 0.14 ⁻0.86
--- todo

=== minus vector
--- APL: 1 2 3 4−1.1 2.2 3.3 4.4
--- out: ⁻0.1 ⁻0.2 ⁻0.3 ⁻0.4
--- todo

=== minus domain
--- APL: 2−'TEA'
--- out: DOMAIN ERROR
--- todo

=== times scalar (int/int)
--- APL: 2×2
--- out: 4

=== times scalar
--- APL: 2×3.14
--- out: 6.28

=== times vector, float
--- APL: 1 2 3 4×3.14 
--- out: 3.14 6.28 9.42 12.56
--- todo

=== times float, vector
--- APL: 3.14×1 2 3 4
--- out: 3.14 6.28 9.42 12.56
--- todo

=== times vector
--- APL: 1 2 3 4×1.1 2.2 3.3 4.4
--- out: 1.1 4.4 9.9 17.6
--- todo

=== times domain
--- APL: 2×'TEA'
--- out: DOMAIN ERROR
--- todo

=== divide scalar
--- APL: 2.1÷64
--- out: 0.0328125

=== divide vector, float
--- APL: 1.1 2.2 3.3 4.4÷64
--- out: 0.0171875 0.034375 0.0515625 0.06875
--- todo

=== divide float, vector
--- APL: 24÷1 2 3 4 6
--- out: 24 12 8 6 4
--- todo

=== divide vector
--- APL: 1.1 2.2 3.3 4.4÷1 2 3 4
--- out: 1.1 1.1 1.1 1.1
--- todo

=== divide domain
--- APL: 2÷'TEA'
--- out: DOMAIN ERROR
--- todo

=== maximum scalar
--- APL: 2.1⌈2
--- out: 2.1

=== maximum vector, float
--- APL: 1.1 2.2 3.3 4.4⌈3.1
--- out: 3.1 3.1 3.3 4.4
--- todo

=== maximum float, vector
--- APL: 3.1⌈1.1 2.2 3.3 4.4
--- out: 3.1 3.1 3.3 4.4
--- todo

=== maximum vector
--- APL: 1.1 2.2 3.3 4.4⌈1.5 2 3.5 4
--- out: 1.5 2.2 3.5 4.4
--- todo

=== maximum domain
--- APL: 2⌈'TEA'
--- out: DOMAIN ERROR
--- todo

=== minimum scalar
--- APL: 2.1⌊2
--- out: 2

=== minimum vector, float
--- APL: 1.1 2.2 3.3 4.4⌊3.1
--- out: 1.1 2.2 3.1 3.1
--- todo

=== minimum float, vector
--- APL: 3.1⌊1.1 2.2 3.3 4.4
--- out: 1.1 2.2 3.1 3.1
--- todo

=== minimum vector
--- APL: 1.1 2.2 3.3 4.4⌊1.5 2 3.5 4
--- out: 1.1 2 3.3 4
--- todo

=== minimum domain
--- APL: 2⌊'TEA'
--- out: DOMAIN ERROR
--- todo

=== power scalar
--- APL: 2*3
--- out: 8

=== power vector, float
--- APL: 1.1 2.2 3.3 4.4*2
--- out: 1.21 4.84 10.89 19.36
--- todo

=== power float, vector
--- APL: 2*0 1 2 3 4 5
--- out: 1 2 4 8 16 32
--- todo

=== power vector
--- APL: 1.1 2.2 3.3 4.4*1 2 1 2
--- out: 1.1 4.84 3.3 19.36
--- todo

=== power domain (character)
--- APL: 2*'TEA'
--- out: DOMAIN ERROR
--- todo

=== power domain (negative sqrt)
--- APL: ⁻9*.5
--- out: DOMAIN ERROR

=== logarithm scalar
--- APL: 1000⍟10
--- out: 3

=== residue 1
--- APL: 0|0
--- out: 0

=== residue 2
--- APL: 0|2.2
--- out: 2.2

=== residue 3
--- APL: 3|10
--- out: 1

=== residue 4
--- APL: ⁻3|10
--- out: 1

=== residue 4
--- APL: ⁻3|⁻10
--- out: 2

=== residue N
--- APL: 0|⁻9
--- out: DOMAIN ERROR

=== binomial coefficient 1
--- APL: 2!5
--- out: 10

=== binomial coefficient 2
--- APL: 3!5
--- out: 10

=== circular 0
--- APL: 0○.75
--- out: 0.661438 

=== circular 1
--- APL: 1○.75
--- out: 0.681639

=== circular 2
--- APL: 2○.75
--- out: 0.731689

=== circular 3
--- APL: 3○.75
--- out: 0.931596

=== circular 4
--- APL: 4○.75
--- out: 1.25

=== circular 5
--- APL: 5○.75
--- out: 0.822317

=== circular 6
--- APL: 6○.75
--- out: 1.29468

=== circular 7
--- APL: 7○.75
--- out: 0.635149

=== circular ⁻1
--- APL: ⁻1○.75
--- out: 0.848062

=== circular ⁻2
--- APL: ⁻2○.75
--- out: 0.722734

=== circular ⁻3
--- APL: ⁻3○.75
--- out: 0.643501

=== circular ⁻4
--- APL: ⁻4○.75
--- out: 0.661438

=== circular ⁻5
--- APL: ⁻5○.75
--- out: 0.693147

=== circular ⁻6
--- APL: ⁻6○3
--- out: 1.76275

=== circular ⁻7
--- APL: ⁻7○.75
--- out: 0.972955

=== and 0
--- APL: 0∧0
--- out: 0

=== and 1
--- APL: 0∧1
--- out: 0

=== and 2
--- APL: 1∧0
--- out: 0 

=== and 3
--- APL: 1∧1
--- out: 1

=== or 0
--- APL: 0∨0
--- out: 0

=== or 1
--- APL: 0∨1
--- out: 1

=== or 2
--- APL: 1∨0
--- out: 1

=== or 3
--- APL: 1∨1
--- out: 1

=== nand 0
--- APL: 0⍲0
--- out: 1

=== nand 1
--- APL: 0⍲1
--- out: 1

=== nand 2
--- APL: 1⍲0
--- out: 1 

=== nand 3
--- APL: 1⍲1
--- out: 0

=== nor 0
--- APL: 0⍱0
--- out: 1

=== nor 1
--- APL: 0⍱1
--- out: 0

=== nor 2
--- APL: 1⍱0
--- out: 0 

=== nor 3
--- APL: 1⍱1
--- out: 0

=== less 0
--- APL: 1<2
--- out: 1

=== less 1
--- APL: 2<1
--- out: 0

=== less 2
--- APL: 1<1
--- out: 0

=== not greater 0
--- APL: 1≤2
--- out: 1

=== not greater 1
--- APL: 2≤1
--- out: 0

=== not greater 2
--- APL: 1≤1
--- out: 1

=== equal 0
--- APL: 1=2
--- out: 0

=== equal 1
--- APL: 2=1
--- out: 0

=== equal 2
--- APL: 1=1
--- out: 1

=== not less than 0
--- APL: 1≥2
--- out: 0

=== not less than 1
--- APL: 2≥1
--- out: 1

=== not less than 2
--- APL: 1≥1
--- out: 1

=== greater 0
--- APL: 1>2
--- out: 0

=== greater 1
--- APL: 2>1
--- out: 1

=== greater 2
--- APL: 1>1
--- out: 0

=== not equal 0
--- APL: 1≠2
--- out: 1

=== not equal 1
--- APL: 2≠1
--- out: 1

=== not equal 2
--- APL: 1≠1
--- out: 0


=== deal, and, or, nand, nor, less, not greater, equal, not less, greater, not equal
--- excuse: need tests
--- todo
