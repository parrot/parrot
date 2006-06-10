#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 6;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public bool is_same(int x, int y)
        {
            bool b = x == y;
            return b;
        }

        public bool is_lt(int x, int y)
        {
            bool b = x < y;
            return b;
        }

        public bool is_lt_un(uint x, uint y)
        {
            bool b = x < y;
            return b;
        }

        public bool is_gt(int x, int y)
        {
            bool b = x > y;
            return b;
        }

        public bool is_gt_un(uint x, uint y)
        {
            bool b = x > y;
            return b;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'is_same');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.is_same(0, 0)
	print $I0
	print "\n"
    $I0 = obj.is_same(0, 1)
	print $I0
	print "\n"
    $I0 = obj.is_same(1, 0)
	print $I0
	print "\n"
    $I0 = obj.is_same(42, 42)
	print $I0
	print "\n"
.end
PIR
1
0
0
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'is_lt');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.is_lt(0, 0)
	print $I0
	print "\n"
    $I0 = obj.is_lt(0, 1)
	print $I0
	print "\n"
    $I0 = obj.is_lt(1, 0)
	print $I0
	print "\n"
    $I0 = obj.is_lt(42, 42)
	print $I0
	print "\n"
.end
PIR
0
1
0
0
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'is_lt_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.is_lt_un(0, 0)
	print $I0
	print "\n"
    $I0 = obj.is_lt_un(0, 1)
	print $I0
	print "\n"
    $I0 = obj.is_lt_un(1, 0)
	print $I0
	print "\n"
    $I0 = obj.is_lt_un(42, 42)
	print $I0
	print "\n"
.end
PIR
0
1
0
0
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'is_gt');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.is_gt(0, 0)
	print $I0
	print "\n"
    $I0 = obj.is_gt(0, 1)
	print $I0
	print "\n"
    $I0 = obj.is_gt(1, 0)
	print $I0
	print "\n"
    $I0 = obj.is_gt(42, 42)
	print $I0
	print "\n"
.end
PIR
0
0
1
0
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'is_gt_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.is_gt_un(0, 0)
	print $I0
	print "\n"
    $I0 = obj.is_gt_un(0, 1)
	print $I0
	print "\n"
    $I0 = obj.is_gt_un(1, 0)
	print $I0
	print "\n"
    $I0 = obj.is_gt_un(42, 42)
	print $I0
	print "\n"
.end
PIR
0
0
1
0
OUTPUT
