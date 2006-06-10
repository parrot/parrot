#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 3;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public int add_hundred(int x)
        {
			int count = 0;
            while (count < 100) {
				x++;
				count++;
			}
			return x;
        }

		public int multiply(int x, int y)
        {
			int result = 0;
			if (x < y) {
				while (x > 0) {
					result += y;
					x--;
				}
			} else {
				while (y > 0) {
					result += x;
					y--;
				}
			}
			return result;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'add_hundred');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.add_hundred(0)
	print $I0
	print "\n"
	$I0 = obj.add_hundred(21)
	print $I0
	print "\n"
	$I0 = obj.add_hundred(-1)
	print $I0
	print "\n"
	$I0 = obj.add_hundred(-500)
	print $I0
	print "\n"
	$I0 = obj.add_hundred(42)
	print $I0
	print "\n"
.end
PIR
100
121
99
-400
142
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'multiply');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.multiply(4,5)
	print $I0
	print "\n"
	$I0 = obj.multiply(6,3)
	print $I0
	print "\n"
	$I0 = obj.multiply(0,1)
	print $I0
	print "\n"
	$I0 = obj.multiply(9,0)
	print $I0
	print "\n"
.end
PIR
20
18
0
0
OUTPUT
