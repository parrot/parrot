#!perl
use strict;
use TestCompiler tests => 7;
use lib '../../lib';
use Parrot::Config;

# include file tests

##############################
open FOO, ">temp.pasm" or die "Cant write temp.pasm\n";
print FOO <<'ENDF';
  .constant BAR 42
ENDF
close FOO;

output_is(<<'CODE', <<'OUT', "include pasm");
.sub _main
    print "before\n"
    .include "temp.pasm"
    print .BAR
    print "\nafter\n"
    end
.end
CODE
before
42
after
OUT
unlink "temp.pasm";

##############################
open FOO, ">temp.imc" or die "Cant write temp.imc\n";
print FOO <<'ENDF';
  .const int BAR = 42
ENDF
close FOO;

output_is(<<'CODE', <<'OUT', "include pir");
.sub _main
    print "before\n"
    .include "temp.imc"
    print BAR
    print "\nafter\n"
    end
.end
CODE
before
42
after
OUT
unlink "temp.imc";

##############################
open FOO, ">temp.inc" or die "Cant write temp.inc\n";
print FOO <<'ENDF';
  .const int BAR = 42
ENDF
close FOO;

output_is(<<'CODE', <<'OUT', "include .inc");
.sub _main
    print "before\n"
    .include "temp.inc"
    print BAR
    print "\nafter\n"
    end
.end
CODE
before
42
after
OUT
unlink "temp.inc";

##############################
my $file = '_test.inc';
open F, ">$file";
print F <<'EOF';
.sub _foo		# sub foo(int a, int b)
   saveall
   .param int a
   .param int b
   print "a = "
   print a
   print "\n"
   print "b = "
   print b
   print "\n"
   .local int pl
   .local int mi
   pl = a + b
   mi = a - b
   .return mi		# from right to left
   .return pl		# return (pl, mi)
   restoreall
   ret
.end
EOF
close F;

output_is(<<'CODE', <<'OUT', "subroutine in external file");
.sub _main
   .local int x
   x = 10
   .const int y = 20

   .arg y	# save args in reversed order
   .arg x
   call _foo	#(r, s) = _foo(x,y)
   .local int r
   .local int s
   .result r
   .result s	# restore results in order

   print "r = "
   print r
   print "\n"
   print "s = "
   print s
   print "\n"
   end
.end
.include "_test.inc"
CODE
a = 10
b = 20
r = 30
s = -10
OUT


# test load_bytecode branches and subs

# write sub2
open FOO, ">temp.imc" or die "Cant write temp.imc\n";
print FOO <<'ENDF';
.pcc_sub _sub2 prototyped
    print "sub2\n"
    end
.end
ENDF
# compile it

system("imcc$PConfig{exe} -o temp.pbc temp.imc");

output_is(<<'CODE', <<'OUT', "call sub in external pbc");
.pcc_sub _sub1 prototyped
    print "sub1\n"
    load_bytecode "temp.pbc"
    print "loaded\n"
    $P0 = global "_sub2"
    .pcc_begin prototyped
    .pcc_call $P0
    ret:
    .pcc_end
    end
.end
CODE
sub1
loaded
sub2
OUT

# write sub2
open FOO, ">temp.imc" or die "Cant write temp.imc\n";
print FOO <<'ENDF';
.pcc_sub _sub2 prototyped
    print "sub2\n"
   .pcc_begin_return
   .pcc_end_return
    end
.end
ENDF
# compile it

system("imcc$PConfig{exe} -o temp.pbc temp.imc");

output_is(<<'CODE', <<'OUT', "call sub in external pbc, return");
.pcc_sub _sub1 prototyped
    print "sub1\n"
    load_bytecode "temp.pbc"
    print "loaded\n"
    $P0 = global "_sub2"
    .pcc_begin prototyped
    .pcc_call $P0
    ret:
    .pcc_end
    print "back\n"
    end
.end
CODE
sub1
loaded
sub2
back
OUT

# write sub2
open FOO, ">temp.imc" or die "Cant write temp.imc\n";
print FOO <<'ENDF';
.pcc_sub _not_sub2 prototyped
    print "not sub2\n"
    end
.end

.pcc_sub _sub2 prototyped
    print "sub2\n"
    end
.end
ENDF
# compile it

system("imcc$PConfig{exe} -o temp.pbc temp.imc");

output_is(<<'CODE', <<'OUT', "call sub in external pbc with 2 subs");
.pcc_sub _sub1 prototyped
    print "sub1\n"
    load_bytecode "temp.pbc"
    print "loaded\n"
    $P0 = global "_sub2"
    .pcc_begin prototyped
    .pcc_call $P0
    ret:
    .pcc_end
    end
.end
CODE
sub1
loaded
sub2
OUT


END {
  unlink $file;
  #unlink "temp.imc";
  #unlink "temp.pbc";
}
