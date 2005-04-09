#!perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use Parrot::Test tests => 9;


pir_output_is(<<'CODE', <<'OUT', "allocate 1");
#
# Test the ability of the register allocator to
# generate spills.
#
.sub test @MAIN
	$I0 = 0
	$I1 = 1
	$I2 = 2
	$I3 = 3
	$I4 = 4
	$I5 = 5
	$I6 = 6
	$I7 = 7
	$I8 = 8
	$I9 = 9

	$I10 = 10
	$I11 = 11
	$I12 = 12
	$I13 = 13
	$I14 = 14
	$I15 = 15
	$I16 = 16
	$I17 = 17
	$I18 = 18
	$I19 = 19

	$I20 = 20
	$I21 = 21
	$I22 = 22
	$I23 = 23
	$I24 = 24
	$I25 = 25
	$I26 = 26
	$I27 = 27
	$I28 = 28
	$I29 = 29

	$I30 = 30
	$I31 = 31
	$I32 = 32
	$I33 = 33
	$I34 = 34
	$I35 = 35
	$I36 = 36
	$I37 = 37
	$I38 = 38
	$I39 = 39

	$I40 = 40

	print $I0
	print "\n"
	print $I10
	print "\n"
	print $I20
	print "\n"
	print $I30
	print "\n"
	print $I40
	print "\n"

	end
.end
CODE
0
10
20
30
40
OUT


pir_output_is(<<'CODE', <<'OUT', "spill 1");
#
# Test the ability of the register allocator to
# generate spills.
#
.sub test @MAIN
	$I0 = 0
	$I1 = 1
	$I2 = 2
	$I3 = 3
	$I4 = 4
	$I5 = 5
	$I6 = 6
	$I7 = 7
	$I8 = 8
	$I9 = 9

	$I10 = 10
	$I11 = 11
	$I12 = 12
	$I13 = 13
	$I14 = 14
	$I15 = 15
	$I16 = 16
	$I17 = 17
	$I18 = 18
	$I19 = 19

	$I20 = 20
	$I21 = 21
	$I22 = 22
	$I23 = 23
	$I24 = 24
	$I25 = 25
	$I26 = 26
	$I27 = 27
	$I28 = 28
	$I29 = 29

	$I30 = 30
	$I31 = 31
	$I32 = 32
	$I33 = 33
	$I34 = 34
	$I35 = 35
	$I36 = 36
	$I37 = 37
	$I38 = 38
	$I39 = 39

	$I40 = $I0 + $I1
	$I41 = $I2 + $I3
	$I42 = $I4 + $I5
	$I43 = $I6 + $I7
	$I44 = $I8 + $I9

	$I50 = $I10 + $I11
	$I51 = $I12 + $I13
	$I52 = $I14 + $I15
	$I53 = $I16 + $I17
	$I54 = $I18 + $I19

	$I60 = $I20 + $I21
	$I61 = $I22 + $I23
	$I62 = $I24 + $I25
	$I63 = $I26 + $I27
	$I64 = $I28 + $I29

	$I70 = $I30 + $I31
	$I71 = $I32 + $I33
	$I72 = $I34 + $I35
	$I73 = $I36 + $I37
	$I74 = $I38 + $I39

	print $I0
	print $I1
	print $I2
	print $I3
	print $I4
	print $I5
	print $I6
	print $I7
	print $I8
	print $I9
	print "\n"
	print $I10
	print $I11
	print $I12
	print $I13
	print $I14
	print $I15
	print $I16
	print $I17
	print $I18
	print $I19
	print "\n"
	print $I20
	print $I21
	print $I22
	print $I23
	print $I24
	print $I25
	print $I26
	print $I27
	print $I28
	print $I29
	print "\n"
	print $I30
	print $I31
	print $I32
	print $I33
	print $I34
	print $I35
	print $I36
	print $I37
	print $I38
	print $I39
	print "\n"
	print $I40
	print $I41
	print $I42
	print $I43
	print $I44
	print "\n"
	print $I50
	print $I51
	print $I52
	print $I53
	print $I54
	print "\n"
	print $I60
	print $I61
	print $I62
	print $I63
	print $I64
	print "\n"
	print $I70
	print $I71
	print $I72
	print $I73
	print $I74
	print "\n"
	end
.end
CODE
0123456789
10111213141516171819
20212223242526272829
30313233343536373839
1591317
2125293337
4145495357
6165697377
OUT


pir_output_is(<<'CODE', <<'OUT', "pcc arg overflow 1");
#
# Test the ability of the register allocator in
# combination with PCC calling convention and overflow arguments.
# Slightly redundant with tests in t/syn/pcc.t but please leave.
#
.sub test @MAIN
  _foo(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40)
  end
.end
.sub _foo
  .param int i1
  .param int i2
  .param int i3
  .param int i4
  .param int i5
  .param int i6
  .param int i7
  .param int i8
  .param int i9
  .param int i10
  .param int i11
  .param int i12
  .param int i13
  .param int i14
  .param int i15
  .param int i16
  .param int i17
  .param int i18
  .param int i19
  .param int i20
  .param int i21
  .param int i22
  .param int i23
  .param int i24
  .param int i25
  .param int i26
  .param int i27
  .param int i28
  .param int i29
  .param int i30
  .param int i31
  .param int i32
  .param int i33
  .param int i34
  .param int i35
  .param int i36
  .param int i37
  .param int i38
  .param int i39
  .param int i40
  print i1
  print "\n"
  print i2
  print "\n"
  print i3
  print "\n"
  print i4
  print "\n"
  print i5
  print "\n"
  print i10
  print "\n"
  print i15
  print "\n"
  print i20
  print "\n"
  print i25
  print "\n"
  print i30
  print "\n"
  print i35
  print "\n"
  print i40
  print "\n"
  end
.end
CODE
1
2
3
4
5
10
15
20
25
30
35
40
OUT


pir_output_is(<<'CODE', <<'OUT', "spill 4");
#
# Another spill test
#
.sub test @MAIN
	$I0 = 0
	$I1 = 1
	$I2 = 2
	$I3 = 3
	$I4 = 4
	$I5 = 5
	$I6 = 6
	$I7 = 7
	$I8 = 8
	$I9 = 9

	$I10 = 10
	$I11 = 11
	$I12 = 12
	$I13 = 13
	$I14 = 14
	$I15 = 15
	$I16 = 16
	$I17 = 17
	$I18 = 18
	$I19 = 19

	$I20 = 20
	$I21 = 21
	$I22 = 22
	$I23 = 23
	$I24 = 24
	$I25 = 25
	$I26 = 26
	$I27 = 27
	$I28 = 28
	$I29 = 29

	$I30 = 30
	$I31 = 31
	$I32 = 32
	$I33 = 33
	$I34 = 34
	$I35 = 35
	$I36 = 36
	$I37 = 37
	$I38 = 38
	$I39 = 39

	if $I0 != 0 goto err
	if $I1 != 1 goto err
	if $I2 != 2 goto err
	if $I3 != 3 goto err
	if $I4 != 4 goto err
	if $I5 != 5 goto err
	if $I6 != 6 goto err
	if $I7 != 7 goto err
	if $I8 != 8 goto err
	if $I9 != 9 goto err
	if $I10 != 10 goto err
	if $I11 != 11 goto err
	if $I12 != 12 goto err
	if $I13 != 13 goto err
	if $I14 != 14 goto err
	if $I15 != 15 goto err
	if $I16 != 16 goto err
	if $I17 != 17 goto err
	if $I18 != 18 goto err
	if $I19 != 19 goto err
	if $I20 != 20 goto err
	if $I21 != 21 goto err
	if $I22 != 22 goto err
	if $I23 != 23 goto err
	if $I24 != 24 goto err
	if $I25 != 25 goto err
	if $I26 != 26 goto err
	if $I27 != 27 goto err
	if $I28 != 28 goto err
	if $I29 != 29 goto err
	if $I30 != 30 goto err
	if $I31 != 31 goto err
	if $I32 != 32 goto err
	if $I33 != 33 goto err
	if $I34 != 34 goto err
	if $I35 != 35 goto err
	if $I36 != 36 goto err
	if $I37 != 37 goto err
	if $I38 != 38 goto err
	if $I39 != 39 goto err

	print "ok\n"
	end
err:
	print "nok\n"
	end
.end
CODE
ok
OUT

pir_output_is(<<'CODE', <<'OUT', "bug #32996");

.namespace ["Foo"]

.sub __biginit prototyped, @MAIN
	newclass $P0, "Foo"
	$I1 = find_type "Foo"
	$P1 = new $I1
	$P1.method1()
	$P1.method2()

	$P2 = new $I1
	$P2.method1()
	$P2.method2()

	$P3 = new $I1
	$P3.method1()
	$P3.method2()

	$P4 = new $I1
	$P4.method1()
	$P4.method2()

	$P5 = new $I1
	$P5.method1()
	$P5.method2()

	$P6 = new $I1
	$P6.method1()
	$P6.method2()

	$P7 = new $I1
	$P7.method1()
	$P7.method2()

	$P8 = new $I1
	$P8.method1()
	$P8.method2()

	$P9 = new $I1
	$P9.method1()
	$P9.method2()

	$P10 = new $I1
	$P10.method1()
	$P10.method2()

	$P11 = new $I1
	$P11.method1()
	$P11.method2()

	$P12 = new $I1
	$P12.method1()
	$P12.method2()

	$P13 = new $I1
	$P13.method1()
	$P13.method2()

	$P14 = new $I1
	$P14.method1()
	$P14.method2()

	$P15 = new $I1
	$P15.method1()
	$P15.method2()

	$P1.method1()
	$P1.method2()
	$P2.method1()
	$P2.method2()
	$P3.method1()
	$P3.method2()
	$P4.method1()
	$P4.method2()
	$P5.method1()
	$P5.method2()
	$P6.method1()
	$P6.method2()
	$P7.method1()
	$P7.method2()
	$P8.method1()
	$P8.method2()
	$P9.method1()
	$P9.method2()
	$P10.method1()
	$P10.method2()
	$P11.method1()
	$P11.method2()
	$P12.method1()
	$P12.method2()
	$P13.method1()
	$P13.method2()
	$P14.method1()
	$P14.method2()
	$P15.method1()
	$P15.method2()

	end
.end

.sub method1 prototyped, method
	print "In method 1\n"
	.pcc_begin_return
	.pcc_end_return
.end

.sub method2 prototyped, method
	print "In method 2\n"
	.pcc_begin_return
	.pcc_end_return
.end
CODE
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
In method 1
In method 2
OUT

sub repeat {
    my ($template, $count, %substs) = @_;
    my ($code, $n, $start);
    foreach (split(/\n/, $template)) {
	$n = $count;
	$start = 0;
        if (/^(.*)=(\w+)=(.*)/) {
            my ($pre, $key, $post) = ($1, $2, $3);
	    if ($key eq 'ARGS') {
		my @params;
		for my $i (0..$n-1) {
                    (my $new = $substs{$key}) =~ s/\<index\>/$i/g;
		    push @params, $new;
		}
		$code .= $pre . join(',', @params) . "$post\n";
		next;
	    }
	    $start = $n / 2 if ($key eq 'TESTS2');
            for my $i ($start..$n-1) {
                (my $new = $substs{$key}) =~ s/\<index\>/$i/g;
                $code .= "$pre$new$post\n";
            }
        } else {
            $code .= "$_\n";
        }
    }

    return $code;
}
    my $template2 = <<'TEMPLATE';
.sub _main
    new P3, .Integer
    new P4, .Integer
    =LOCALS=
    =INITS=
    _sub(=ARGS=)
    =TESTS2=
    P5 = P3
    P5 = P4
    end
fail:
    print "failed\n"
    end
.end
.pcc_sub _sub prototyped
    =PARAMS=
    =TESTS=
    print "all params ok\n"
    .pcc_begin_return
    .pcc_end_return
fail:
    print "failed\n"
    end
.end
TEMPLATE

my $code = repeat($template2, 18,
               LOCALS => ".local Integer a<index>\n\ta<index> = new Integer",
               INITS => 'a<index> = <index>',
               ARGS => 'a<index>',
               PARAMS => '.param Integer a<index>',
               TESTS => "set I0, a<index>\nne I0, <index>, fail",
               TESTS2 => "set I0, a<index>\nne I0, <index>, fail");

pir_output_is($code, <<'OUT', "overflow pmcs 18 spill");
all params ok
OUT

$code = repeat($template2, 22,
               LOCALS => ".local Integer a<index>\n\ta<index> = new Integer",
               INITS => 'a<index> = <index>',
               ARGS => 'a<index>',
               PARAMS => '.param Integer a<index>',
               TESTS => "set I0, a<index>\nne I0, <index>, fail",
               TESTS2 => "set I0, a<index>\nne I0, <index>, fail");

pir_output_is($code, <<'OUT', "overflow pmcs 22 spill");
all params ok
OUT

$code = repeat($template2, 40,
               LOCALS => ".local Integer a<index>\n\ta<index> = new Integer",
               INITS => 'a<index> = <index>',
               ARGS => 'a<index>',
               PARAMS => '.param Integer a<index>',
               TESTS => "set I0, a<index>\nne I0, <index>, fail",
               TESTS2 => "set I0, a<index>\nne I0, <index>, fail");

pir_output_is($code, <<'OUT', "overflow pmcs 40 spill");
all params ok
OUT

$code = repeat($template2, 60,
               LOCALS => ".local Integer a<index>\n\ta<index> = new Integer",
               INITS => 'a<index> = <index>',
               ARGS => 'a<index>',
               PARAMS => '.param Integer a<index>',
               TESTS => "set I0, a<index>\nne I0, <index>, fail",
               TESTS2 => "set I0, a<index>\nne I0, <index>, fail");

pir_output_is($code, <<'OUT', "overflow pmcs 60 spill");
all params ok
OUT
