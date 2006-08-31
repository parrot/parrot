#!perl
# Copyright (C) 2005, The Perl Foundation.
# $Id$

use strict;
use lib qw( . lib ../lib ../../lib );
use Parrot::Test tests => 36;
use Test::More;

# these tests are run with -Oc by TestCompiler and show
# generated PASM code for call optimization


##############################

pir_2_pasm_like(<<'CODE', <<'OUT', "in P param");
.sub _main
    $P0 = new Undef
    $P0 = 42
    foo($P0)
    noop
    end
.end
.sub foo
    .param Undef a
    print a
.end
CODE
/_main:
  new (P\d+), \d+ # \.Undef
  set \1, 42
@pcc_sub_call_\d:
  set_args
  set_p_pc (P\d+), foo
  get_results
  invokecc \2
  noop
  end
foo:
  get_params
  print P0
  set_returns
  returncc/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "tailcall 1");
.sub _main
    foo(1, 2)
.end
.sub foo
    .param int i
    .param int j
    .return foo(I2, I3)
.end
CODE
/ set I\d, I2
  set I\d, I3/
OUT

pir_2_pasm_like(<<'CODE', <<'OUT', "tailcall 2");
.sub _main
    foo(1, 2)
.end
.sub foo
    .param int i
    .param int j
    .return foo(j, i)
.end
CODE
/ set I(\d), I(\d)
  set I\2, I(\d)
  set I\3, I\1/
OUT

pir_output_is(<<'CODE', <<'OUT', "tailcall 3 args");
.sub _main
    foo(0, 1, 2, 3)
.end
.sub foo
    .param int done
    .param int i
    .param int j
    .param int k
    unless done goto tc
    print_item "i"
    print_item i
    print_item "j"
    print_item j
    print_item "k"
    print_item k
    print_newline
    end
tc:    
    .return foo(1, i, k, j)
.end
CODE
i 1 j 3 k 2
OUT

sub permute (&@) {
    my $code = shift;
    my @idx = 0..$#_;
    while ( $code->(@_[@idx]) ) {
        my $p = $#idx;
        --$p while $idx[$p-1] > $idx[$p];
        my $q = $p or return;
        push @idx, reverse splice @idx, $p;
        ++$q while $idx[$p-1] > $idx[$q];
        @idx[$p-1,$q]=@idx[$q,$p-1];
    }
}

my @array=('i','j','k');
my @b;
permute {push @b,"@_"} @array;
my $x;
my $y;
foreach $x (@b)
{
    $x=~tr/ /,/;
    $y=$x;
    $y=~tr/ijk/123/;
    pir_output_is(<<"CODE", <<"OUT", "tailcall 3 args $x");
.sub _main
    foo(0, 1, 2, 3)
.end
.sub foo
    .param int done
    .param int i
    .param int j
    .param int k
    unless done goto tc
    print i
    print ","
    print j
    print ","
    print k
    print_newline
    end
tc:
    .return foo(1, $x )
.end
CODE
$y
OUT
}
undef @b;

@array=('i','j','k','l');
permute {push @b,"@_"} @array;
foreach $x (@b)
{
	$x=~tr/ /,/;
	$y=$x;
	$y=~tr/ijkl/1234/;
	pir_output_is(<<"CODE", <<"OUT", "tailcall 4 args $x");	
.sub _main
    foo(0, 1, 2, 3, 4)
.end
.sub foo
    .param int done
    .param int i
    .param int j
    .param int k
    .param int l
    unless done goto tc
    print i
    print ","
    print j
    print ","
    print k
    print ","
    print l
	print_newline
    end
tc:
    .return foo(1, $x )
.end
CODE
$y
OUT
}

undef @b;

@array=('i','j');
permute {push @b,"@_"} @array;
foreach $x (@b)
{
    $x=~tr/ /,/;
    $y=$x;
    $y=~tr/ij/12/;
    pir_output_is(<<"CODE", <<"OUT", "tailcall 2 args $x");
.sub _main
    foo(0, 1, 2)
.end
.sub foo
    .param int done
    .param int i
    .param int j
    unless done goto tc
    print i
    print ","
    print j
    print_newline
    end
tc:
    .return foo(1, $x )
.end
CODE
$y
OUT
}

