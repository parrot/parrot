#! perl -w

use Parrot::Test tests => 1;
use Test::More;

# Test calling convention operations
output_is(<<'CODE', <<OUTPUT, "foldup");
set P16,P1
new P19,36
new P18,36
new P17,36
new P16,36
new P21,36
new P20,36
new P22,36
new P24,36
new P28,36
new P29,36
new P30,36
new P27,36
new P26,36
new P25,36
new P23,36
set P20,"Foobar!"
set P23,"Baxman!"
newsub P0,45,74
set P5,P19
set P6,P18
set P7,P17
set P8,P16
set P9,P21
set P10,P20
set P11,P22
set P12,P24
set P13,P28
set P14,P29
set P15,P30
new P3,42
set P3,15
push P3,P27
push P3,P26
push P3,P25
push P3,P23
set P0,P0
set I0,1
set I1,4
set I2,11
set I3,0
savetop 
invokecc 
restoretop 
end 
foldup P17
set P16,P17[5]
print P16
print "\n"
set P16,P17[14]
print P16
print "\n"
set I0,1
set I1,0
set I2,0
set I3,0
set I4,0
invoke P1
end
CODE
Foobar!
Baxman!
OUTPUT
