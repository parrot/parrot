#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 5;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public int no_args()
        {
            return 1;
        }
        
        public int one_arg(int x)
        {
            return x;
        }
        
        public int three_args(int x1, int x2, int x3)
        {
            return x1 + x2 + x3;
        }

        public int ten_args(int x1, int x2, int x3, int x4, int x5,
                            int x6, int x7, int x8, int x9, int x10)
        {
            return x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'no_args');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.no_args()
	print $I0
	print "\n"
.end
PIR
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'one_arg');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = 42
	$I1 = obj.one_arg($I0)
	print $I1
	print "\n"
	$I0 = 7
	$I1 = obj.one_arg($I0)
	print $I1
	print "\n"
.end
PIR
42
7
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'three_args');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.three_args(1,2,3)
	print $I0
	print "\n"
.end
PIR
6
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'ten_args');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.ten_args(1,2,3,4,5,6,7,8,9,10)
	print $I0
	print "\n"
.end
PIR
55
OUTPUT

## Clean up.
unlink "t.dll";
unlink "t.pbc";
