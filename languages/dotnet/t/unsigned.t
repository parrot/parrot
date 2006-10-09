#!perl 

use strict;
use warnings;
use lib qw( lib ../lib ../../lib dotnet dotnet/t );

use DotNetTesting;

use Test::More tests => 7;

## Testing class for this file.t';
#
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public int uge(uint x, uint y)
		{
			if (x >= y)
				return 1;
			else
				return 0;
		}

		public int ugt(uint x, uint y)
		{
			if (x > y)
				return 1;
			else
				return 0;
		}

		public int ule(uint x, uint y)
		{
			if (x <= y)
				return 1;
			else
				return 0;
		}

		public int ult(uint x, uint y)
		{
			if (x < y)
				return 1;
			else
				return 0;
		}

		public uint udiv(uint x, uint y)
		{
			return x / y;
		}

		public uint urem(uint x, uint y)
		{
			return x % y;
		}
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'uge');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.uge(500, 800)
	print $I0
	print "\n"
	$I0 = obj.uge(42, -20202)
	print $I0
	print "\n"
	$I0 = obj.uge(800, 500)
	print $I0
	print "\n"
	$I0 = obj.uge(-20202, 42)
	print $I0
	print "\n"
	$I0 = obj.uge(5, 5)
	print $I0
	print "\n"
.end
PIR
0
0
1
1
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'ugt');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.ugt(500, 800)
	print $I0
	print "\n"
	$I0 = obj.ugt(42, -20202)
	print $I0
	print "\n"
	$I0 = obj.ugt(800, 500)
	print $I0
	print "\n"
	$I0 = obj.ugt(-20202, 42)
	print $I0
	print "\n"
	$I0 = obj.ugt(5, 5)
	print $I0
	print "\n"
.end
PIR
0
0
1
1
0
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'ule');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.ule(500, 800)
	print $I0
	print "\n"
	$I0 = obj.ule(42, -20202)
	print $I0
	print "\n"
	$I0 = obj.ule(800, 500)
	print $I0
	print "\n"
	$I0 = obj.ule(-20202, 42)
	print $I0
	print "\n"
	$I0 = obj.ule(5, 5)
	print $I0
	print "\n"
.end
PIR
1
1
0
0
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'ult');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.ult(500, 800)
	print $I0
	print "\n"
	$I0 = obj.ult(42, -20202)
	print $I0
	print "\n"
	$I0 = obj.ult(800, 500)
	print $I0
	print "\n"
	$I0 = obj.ult(-20202, 42)
	print $I0
	print "\n"
	$I0 = obj.ult(5, 5)
	print $I0
	print "\n"
.end
PIR
1
1
0
0
0
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'udiv');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.udiv(84,2)
	print $I0
	print "\n"
	$I0 = obj.udiv(5,3)
	print $I0
	print "\n"
.end
PIR
42
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'urem');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.urem(84,2)
	print $I0
	print "\n"
	$I0 = obj.urem(5,3)
	print $I0
	print "\n"
.end
PIR
0
2
OUTPUT
