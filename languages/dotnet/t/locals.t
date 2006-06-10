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
        public int no_locals()
        {
            return 42;
        }

        public int few_locals()
        {
            int x = 5;
			int y = 7;
			return x + y;
        }

		public int fib_locals()
        {
            int a = 1;
			int b = 1;
			int c = a + b;
			int d = b + c;
			int e = c + d;
			int f = d + e;
			int g = e + f;
			int h = f + g;
			int i = g + h;
			int j = h + i;
			return j;
        }

		public int locals_with_args(int a, int b)
		{
			int c = a + b;
			int d = a + c;
			int e = b + d;
			c = e;
			d = c;
			return d;
		}
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'no_locals');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.no_locals()
	print $I0
	print "\n"
.end
PIR
42
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'few_locals');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.few_locals()
	print $I0
	print "\n"
.end
PIR
12
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'fib_locals');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.fib_locals()
	print $I0
	print "\n"
.end
PIR
55
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'locals_with_args');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.locals_with_args(2,3)
	print $I0
	print "\n"
.end
PIR
10
OUTPUT
