#! perl -w
# test WRT JIT register allocation
use Parrot::Test tests => 28;

output_is(<<'CODE', <<'OUTPUT', "add_i_i_i 1,2,3 mapped");
set I0,0
set I1,1
set I2,2
add I0,I1,I2
print I0
print I1
print I2
print "\n"
end
CODE
312
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "add_i_i_i 1,2 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
add I0,I1,I4
print I0
print I1
print I4
print "\n"
end
CODE
514
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "add_i_i_i 1,3 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
add I0,I4,I1
print I0
print I4
print I1
print "\n"
end
CODE
541
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "add_i_i_i 2,3 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
add I4,I0,I1
print I4
print I0
print I1
print "\n"
end
CODE
211
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "add_i_i_i 1 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
add I1,I5,I4
print I1
print I5
print I4
print "\n"
end
CODE
404
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "add_i_i_i 2 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
add I5,I1,I4
print I5
print I1
print I4
print "\n"
end
CODE
514
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "add_i_i_i 3 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
add I5,I4,I1
print I5
print I1
print I4
print "\n"
end
CODE
514
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "add_i_i_i 0 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
add I5,I6,I4
print I5
print I6
print I4
print "\n"
end
CODE
404
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub_i_i_i 1,2,3 mapped");
set I0,0
set I1,1
set I2,2
sub I0,I1,I2
print I0
print I1
print I2
print "\n"
end
CODE
-112
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub_i_i_i 1,2 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
sub I0,I1,I4
print I0
print I1
print I4
print "\n"
end
CODE
-314
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub_i_i_i 1,3 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
sub I0,I4,I1
print I0
print I4
print I1
print "\n"
end
CODE
341
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub_i_i_i 2,3 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
sub I4,I0,I1
print I4
print I0
print I1
print "\n"
end
CODE
011
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub_i_i_i 1 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
sub I1,I5,I4
print I1
print I5
print I4
print "\n"
end
CODE
-404
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub_i_i_i 2 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
sub I5,I1,I4
print I5
print I1
print I4
print "\n"
end
CODE
-314
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub_i_i_i 3 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
sub I5,I4,I1
print I5
print I1
print I4
print "\n"
end
CODE
314
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "sub_i_i_i 0 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
sub I5,I6,I4
print I5
print I6
print I4
print "\n"
end
CODE
-404
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mul_i_i_i 1,2,3 mapped");
set I0,0
set I1,1
set I2,2
mul I0,I1,I2
print I0
print I1
print I2
print "\n"
end
CODE
212
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mul_i_i_i 1,2 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
mul I0,I1,I4
print I0
print I1
print I4
print "\n"
end
CODE
414
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mul_i_i_i 1,3 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
mul I0,I4,I1
print I0
print I4
print I1
print "\n"
end
CODE
441
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mul_i_i_i 2,3 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
mul I4,I1,I3
print I4
print I1
print I3
print "\n"
end
CODE
313
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mul_i_i_i 1 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
mul I1,I5,I4
print I1
print I5
print I4
print "\n"
end
CODE
004
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mul_i_i_i 2 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
mul I5,I1,I4
print I5
print I1
print I4
print "\n"
end
CODE
414
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mul_i_i_i 3 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
mul I5,I4,I1
print I5
print I1
print I4
print "\n"
end
CODE
414
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mul_i_i_i 0 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
mul I5,I6,I4
print I5
print I6
print I4
print "\n"
end
CODE
004
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mul_i_i 1,2 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
mul I2, I3
print I2
print I3
print "\n"
end
CODE
93
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mul_i_i 1 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
mul I2, I4
print I2
print I4
print "\n"
end
CODE
124
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mul_i_i 2 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
mul I4, I2
print I4
print I2
print "\n"
end
CODE
123
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "mul_i_i 0 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
mul I4, I5
print I4
print I5
print "\n"
end
CODE
00
OUTPUT

