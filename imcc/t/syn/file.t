#!perl

# $Id$

=head1 NAME

syn/file.t - test inclusion of files

=head1 SYNOPSIS

A test script which is supposed to be called by Test::Harness.

=cut

use strict;
use 5;

use Parrot::Config;
use TestCompiler tests => 12;

# Do not assume that . is in $PATH
my $PARROT = ".$PConfig{slash}parrot$PConfig{exe}";
my $PERL5  = $PConfig{perl};

##############################
open FOO, ">temp.pasm" or die "Can't write temp.pasm\n";
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
open FOO, ">temp.imc" or die "Can't write temp.imc\n";
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
open FOO, ">temp.inc" or die "Can't write temp.inc\n";
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
open FOO, ">temp.imc" or die "Can't write temp.imc\n";
print FOO <<'ENDF';
.pcc_sub _sub2 prototyped
    print "sub2\n"
    end
.end
ENDF
close FOO;
# compile it

system("$PARROT -o temp.pbc temp.imc");

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
open FOO, ">temp.imc" or die "Can't write temp.imc\n";
print FOO <<'ENDF';
.pcc_sub _sub2 prototyped
    print "sub2\n"
   .pcc_begin_return
   .pcc_end_return
    end
.end
ENDF
close FOO;
# compile it

system("$PARROT -o temp.pbc temp.imc");

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
open FOO, ">temp.imc" or die "Can't write temp.imc\n";
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
close FOO;
# compile it

system("$PARROT -o temp.pbc temp.imc");

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

# write sub2
open FOO, ">temp.imc" or die "Can't write temp.imc\n";
print FOO <<'ENDF';
.pcc_sub _sub2 prototyped
    print "sub2\n"
   .pcc_begin_return
   .pcc_end_return
    end
.end
ENDF
close FOO;
# compile it

output_is(<<'CODE', <<'OUT', "call sub in external imc, return");
.pcc_sub _sub1 prototyped
    print "sub1\n"
    load_bytecode "temp.imc"
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


output_is(<<'CODE', <<'OUT', "call internal sub like external");
.pcc_sub _sub1 prototyped
    print "sub1\n"
    $P0 = global "_sub2"
    .pcc_begin prototyped
    .pcc_call $P0
    ret:
    .pcc_end
    print "back\n"
    end
.end

.pcc_sub _sub2 prototyped
    print "sub2\n"
   .pcc_begin_return
   .pcc_end_return
    end
.end
CODE
sub1
sub2
back
OUT

# write subs
open FOO, ">temp.imc" or die "Can't write temp.imc\n";
print FOO <<'ENDF';
.pcc_sub _sub1 prototyped
    print "sub1\n"
    $P0 = global "_sub2"
    .pcc_begin prototyped
    .pcc_call $P0
    ret:
    .pcc_end
    print "back\n"
    end
.end

.pcc_sub _sub2 prototyped
    print "sub2\n"
    .pcc_begin_return
    .pcc_end_return
    end
.end
ENDF
close FOO;
# compile it

system("$PARROT -o temp.pbc temp.imc");

use Test::More;
is(`$PARROT temp.pbc`, <<OUT, "call internal sub like external, precompiled");
sub1
sub2
back
OUT

{
  # include a non-existent file and catch the error message
  my $err_msg;
  {
    open FOO, ">temp.imc" or die "Can't write temp.imc\n";
    print FOO << 'END_PIR';
# Including a non-existent file should produce an error
.include "non_existent.imc"
# An error should have been raised
.sub _main
  # dummy, because a main function is expected
  end
.end
END_PIR
    close FOO;
    local *OLDERR;
    open OLDERR, ">&STDERR" or die "Can't save STDERR\n";
    open STDERR, ">temp.out" or die "Can't write temp.out\n";
    system "$PARROT temp.imc";
    open FOO, "<temp.out" or die "Can't read temp.out\n";
    { local $/; $err_msg = <FOO>; }
    close FOO;
    open STDERR, ">&OLDERR" or die "Can't restore STDERR\n";
    unlink "temp.out";
  }

  # read a non-existent file and catch the error message
  my $enoent_err_msg;
  {
    open FOO, "<non_existent.file";
    my $ENOENT = $! + 0;
    open FOO, ">temp.imc" or die "Can't write temp.imc\n";
    print FOO << "END_PIR";
.sub _main
  # run a OS command, and get the errmessge for the exit code
  .local string enoent_err_msg
  err enoent_err_msg, $ENOENT
  print enoent_err_msg
  end
.end
END_PIR
    close FOO;
    $enoent_err_msg = qx{$PARROT temp.imc}
  }

  is( $err_msg, << "OUT", "including a non-existent file");
error:imcc:$enoent_err_msg
in file 'temp.imc' line 2
OUT
  unlink "temp.imc";
}

SKIP:
{
  skip("multiple loading not speced - failing", 1);

  output_is(<<'CODE', <<'OUT', "twice call sub in external imc, return");
.pcc_sub _sub1 prototyped
    print "sub1\n"
    load_bytecode "temp.imc"
    print "loaded\n"
    $P0 = global "_sub2"
    .pcc_begin prototyped
    .pcc_call $P0
    ret:
    .pcc_end
    print "back\n"
    print "sub1 again\n"
    load_bytecode "temp.imc"
    print "loaded again\n"
    $P0 = global "_sub2"
    .pcc_begin prototyped
    .pcc_call $P0
    ret_again:
    .pcc_end
    print "back again\n"
    end
.end
CODE
sub1
loaded
sub2
back
sub1 again
loaded again
sub2
back again
OUT
}

END
{
  unlink $file;
  unlink "temp.imc";
  unlink "temp.pbc";
}
