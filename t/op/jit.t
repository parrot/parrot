#! perl -w
# test WRT JIT register allocation
use Parrot::Test tests => 58;

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

output_is(<<'CODE', <<'OUTPUT', "div_i_i_i 1,2,3 mapped");
set I0,0
set I1,6
set I2,2
div I0,I1,I2
print I0
print I1
print I2
print "\n"
end
CODE
362
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "div_i_i_i 1,2 mapped");
set I0,0
set I1,8
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
div I0,I1,I4
print I0
print I1
print I4
print "\n"
end
CODE
284
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "div_i_i_i 1,3 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
div I0,I4,I1
print I0
print I4
print I1
print "\n"
end
CODE
441
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "div_i_i_i 2,3 mapped");
set I0,0
set I1,9
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
div I4,I1,I3
print I4
print I1
print I3
print "\n"
end
CODE
393
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "div_i_i_i 1 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
div I1,I5,I4
print I1
print I5
print I4
print "\n"
end
CODE
004
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "div_i_i_i 2 mapped");
set I0,0
set I1,8
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
div I5,I1,I4
print I5
print I1
print I4
print "\n"
end
CODE
284
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "div_i_i_i 3 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
div I5,I4,I1
print I5
print I1
print I4
print "\n"
end
CODE
414
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "div_i_i_i 0 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
div I5,I6,I4
print I5
print I6
print I4
print "\n"
end
CODE
004
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "div_i_i 1,2 mapped");
set I0,0
set I1,1
set I2,9
set I3,9
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
div I2, I3
print I2
print I3
print "\n"
end
CODE
19
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "div_i_i 1 mapped");
set I0,0
set I1,1
set I2,8
set I3,8
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
div I2, I4
print I2
print I4
print "\n"
end
CODE
24
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "div_i_i 2 mapped");
set I0,0
set I1,1
set I2,2
set I3,2
set I4,4
set I0,I1
set I2,I3
set I0,I1
set I2,I3
div I4, I2
print I4
print I2
print "\n"
end
CODE
22
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "div_i_i 0 mapped");
set I0,0
set I1,1
set I2,2
set I3,3
set I4,4
set I5,1
set I0,I1
set I2,I3
set I0,I1
set I2,I3
div I4, I5
print I4
print I5
print "\n"
end
CODE
41
OUTPUT

# tests for JIT CGP
output_is(<<'CODE', <<'OUTPUT', "1 non jit");
	set I0, 16
	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "2 non jit");
	print "ok 1\n"
	print "ok 2\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "2 non jit");
	set I0, 16
	print "ok 1\n"
	print "ok 2\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "2 non jit, JITed branch to JIT");
	set I0, 42
	print I0
	print "\n"
	eq I0, 42, sub
ret:
	end
sub:
	set I0, 43
	print I0
	print "\n"
	branch ret
CODE
42
43
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "2 non jit, non JITed branch to JIT");
	set I0, 42
	print I0
	print "\n"
	bsr sub
	end
sub:
	set I0, 43
	print I0
	print "\n"
	ret
CODE
42
43
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "2 non jit, JITed branch to non JIT");
	set I0, 42
	print I0
	print "\n"
	eq I0, 42, sub
ret:
	end
sub:
	print "ok\n"
	branch ret
CODE
42
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "2 non jit, non JITed branch to non JIT");
	set I0, 42
	print I0
	print "\n"
	bsr sub
	end
sub:
	print "ok\n"
	ret
CODE
42
ok
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set_addr");
       set_addr I1, FOO
       jump I1
       print "Jump failed\n"
       end

FOO:   print "Jump succeeded\n"
       end
CODE
Jump succeeded
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "jsr");
     set_addr I1, FOO
     jsr I1
     print "and back again\n"
     end

FOO: print "There "
     ret

CODE
There and back again
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "last is branch");
    print "ok 1\n"
    branch l2
l1:
    print "ok 3\n"
    end
l2:
    print "ok 2\n"
    branch l1
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "last is branch");
    print "ok 1\n"
    branch l2
l1:
    print "ok 4\n"
    end
l2:
    print "ok 2\n"
    print "ok 3\n"
    branch l1
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "last is JIT branch");
    print "ok 1\n"
    branch l2
l1:
    print "ok 3\n"
    end
l2:
    print "ok 2\n"
    eq I0, 0, l1
CODE
ok 1
ok 2
ok 3
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "last is JIT branch");
    print "ok 1\n"
    branch l2
l1:
    print "ok 4\n"
    end
l2:
    print "ok 2\n"
    print "ok 3\n"
    eq I0, 0, l1
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "t/op/arithmetic_26: non jit seq w. branch");
new P0, .PerlInt
set N0, 4000
set P0, 123
div P0, P0, N0

save	N0
save	N1
save	N2

set	N0, P0
set	N1, 0.03074969250307496925
sub	N2, N1,N0
abs	N2, N2
gt	N2, 0.000001, local__fp_eq__FPEQNOK__1

restore N2
restore	N1
restore	N0
branch	EQ1
local__fp_eq__FPEQNOK__1:
restore N2
restore	N1
restore	N0
print P0
print "not "
EQ1:	print "ok 1"
print "\n"
end
CODE
ok 1
OUTPUT

# multiply optimization tests

output_is(<<'CODE', <<'OUTPUT', "mul power of 2");
   set I0, 5
   mul I1, I0, 0
   eq I1, 0, ok_1
   print "nok mul 0 "
ok_1:
   print "ok 1\n"

   mul I1, I0, 1
   eq I1, 5, ok_2
   print "nok mul 1 "
ok_2:
   print "ok 2\n"

   mul I1, I0, 2
   eq I1, 10, ok_3
   print "nok mul 2 "
ok_3:
   print "ok 3\n"

   mul I1, I0, 4
   eq I1, 20, ok_4
   print "nok mul 4 "
ok_4:
   print "ok 4\n"

   mul I1, I0, 8
   eq I1, 40, ok_5
   print "nok mul 8 "
ok_5:
   print "ok 5\n"

   mul I1, I0, 1024
   eq I1, 5120, ok_6
   print "nok mul 1024 "
ok_6:
   print "ok 6\n"
   end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "small imm");
   set I0, 5
   mul I1, I0, 3
   eq I1, 15, ok_1
   print "nok mul 3 "
ok_1:
   print "ok 1\n"

   mul I1, I0, 5
   eq I1, 25, ok_2
   print "nok mul 5 "
ok_2:
   print "ok 2\n"

   mul I1, I0, 6
   eq I1, 30, ok_3
   print "nok mul 6 "
ok_3:
   print "ok 3\n"

   mul I1, I0, 9
   eq I1, 45, ok_4
   print "nok mul 9 "
ok_4:
   print "ok 4\n"

   mul I1, I0, 10
   eq I1, 50, ok_5
   print "nok mul 10 "
ok_5:
   print "ok 5\n"

   mul I1, I0, 12
   eq I1, 60, ok_6
   print "nok mul 12 "
ok_6:
   print "ok 6\n"

   mul I1, I0, 100
   eq I1, 500, ok_7
   print "nok mul 100 "
ok_7:
   print "ok 7\n"

   end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
ok 6
ok 7
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "div power of 2");
   set I0, 1024
   div I1, I0, 2
   eq I1, 512, ok_1
   print "nok div 2 "
ok_1:
   print "ok 1\n"

   div I1, I0, 4
   eq I1, 256, ok_2
   print "nok div 4 "
ok_2:
   print "ok 2\n"

   div I1, I0, 8
   eq I1, 128, ok_3
   print "nok div 8 "
ok_3:
   print "ok 3\n"

   div I1, I0, 16
   eq I1, 64, ok_4
   print "nok div 16 "
ok_4:
   print "ok 4\n"
   end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

my $code;
for (0..4096)
{
	$code .= qq{   set S0, "hello"\n};
}
$code .= <<CODE;
   print S0
   print "\\ndone\\n"
   end
CODE

output_is($code, <<OUTPUT, "large code" );
hello
done
OUTPUT

1;
