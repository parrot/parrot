#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 7;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public int add(int x, int y)
        {
            return x + y;
        }

		public int sub(int x, int y)
        {
            return x - y;
        }

		public int mul(int x, int y)
        {
            return x * y;
        }

		public int div(int x, int y)
        {
            return x / y;
        }
		
		public int rem(int x, int y)
        {
            return x % y;
        }

		public int neg(int x)
        {
            return -x;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'add');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.add(500,72)
	print $I0
	print "\n"
	$I0 = obj.add(500,-72)
	print $I0
	print "\n"
.end
PIR
572
428
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'sub');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj."sub"(500,72)
	print $I0
	print "\n"
	$I0 = obj."sub"(500,-72)
	print $I0
	print "\n"
.end
PIR
428
572
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'mul');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.mul(50,7)
	print $I0
	print "\n"
	$I0 = obj.mul(-7,-6)
	print $I0
	print "\n"
.end
PIR
350
42
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'div');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.div(12,3)
	print $I0
	print "\n"
	$I0 = obj.div(15,14)
	print $I0
	print "\n"
	$I0 = obj.div(-121,11)
	print $I0
	print "\n"
.end
PIR
4
1
-11
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'rem');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.rem(13,3)
	print $I0
	print "\n"
	$I0 = obj.rem(-15,13)
	print $I0
	print "\n"
.end
PIR
1
-2
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'neg');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.neg(100)
	print $I0
	print "\n"
	$I0 = obj.neg(-15)
	print $I0
	print "\n"
.end
PIR
-100
15
OUTPUT
