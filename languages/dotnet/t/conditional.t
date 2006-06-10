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
        public int clip(int x)
        {
            if (x > 0)
				return 1;
			else if (x < 0)
				return -1;
			else
				return 0;
        }

		public int band_pass(int x)
		{
			if (x >= 5)
				return 0;
			else if (x <= 2)
				return 0;
			else
				return x;
		}

		public int is_42(int x)
		{
			if (x == 42)
				return 1;
			else
				return 0;
		}
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'clip');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.clip(0)
	print $I0
	print "\n"
	$I0 = obj.clip(1)
	print $I0
	print "\n"
	$I0 = obj.clip(-1)
	print $I0
	print "\n"
	$I0 = obj.clip(-500)
	print $I0
	print "\n"
	$I0 = obj.clip(42)
	print $I0
	print "\n"
.end
PIR
0
1
-1
-1
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'band_pass');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.band_pass(1)
	print $I0
	print "\n"
	$I0 = obj.band_pass(2)
	print $I0
	print "\n"
	$I0 = obj.band_pass(3)
	print $I0
	print "\n"
	$I0 = obj.band_pass(4)
	print $I0
	print "\n"
	$I0 = obj.band_pass(5)
	print $I0
	print "\n"
	$I0 = obj.band_pass(6)
	print $I0
	print "\n"
.end
PIR
0
0
3
4
0
0
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'is_42');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.is_42(99)
	print $I0
	print "\n"
	$I0 = obj.is_42(-2)
	print $I0
	print "\n"
	$I0 = obj.is_42(42)
	print $I0
	print "\n"
	$I0 = obj.is_42(-42)
	print $I0
	print "\n"
.end
PIR
0
0
1
0
OUTPUT
