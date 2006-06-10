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
        public int and(int x, int y)
        {
            return x & y;
        }

		public int or(int x, int y)
        {
            return x | y;
        }

		public int xor(int x, int y)
        {
            return x ^ y;
        }

		public int not(int x)
        {
            return ~x;
        }

		public int shl(int x, int y)
        {
            return x << y;
        }

		public int shr_un(int x, int y)
        {
            return x >> y;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'and');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.and(65, 1088)
	print $I0
	print "\n"
.end
PIR
64
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'or');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.or(65, 1024)
	print $I0
	print "\n"
.end
PIR
1089
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'xor');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.xor(0xF0, 0x77)
	print $I0
	print "\n"
.end
PIR
135
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'not');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.not(0xFFFFFFF0)
	print $I0
	print "\n"
.end
PIR
15
OUTPUT
