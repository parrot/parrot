# beginn
#use strict;
#
#use warnings;

.sub main

.sym string _string
_string = "just another perl hacker"

$I0 = 0

loop0:
	.sym pmc _str
	.sym pmc _f
	split _str, "", _string

       # you can't shift from the type of array that split returns. Do a
       # two step.
       _f = _str[0]
       delete _str[0]

       # you can't push onto the type of array that split returns. Do a 
       # two step.
       $I1 = _str
       $I2 = $I1 + 1
       _str = $I2
       _str[$I1] = _f

       _string = join "", _str
	inc $I0
if  $I0 <= 99999 goto loop0

print $I0
print ";\n"

print _string
print "\n"

end
.end
