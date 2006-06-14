#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 4;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public int zero2eight()
        {
            int a = 0;
			int b = 1;
			int c = 2;
			int d = 3;
			int e = 4;
			int f = 5;
			int g = 6;
			int h = 7;
			int i = 8;
			return a + b + c + d + e + f + g + h + i;
        }

		public int m1()
        {
            return -1;
        }

		public int bigger_consts()
		{
			int a = 200;
			int b = 20000;
			int c = 2000000;
			return a + b + c;
		}
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'ldc.i4.(0..8)');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.zero2eight()
	print $I0
	print "\n"
.end
PIR
36
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'minus one');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.m1()
	print $I0
	print "\n"
.end
PIR
-1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'bigger_consts');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.bigger_consts()
	print $I0
	print "\n"
.end
PIR
2020200
OUTPUT
