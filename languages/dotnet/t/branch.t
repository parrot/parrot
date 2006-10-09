#!perl 

use strict;
use warnings;
use lib qw( lib ../lib ../../lib dotnet dotnet/t );

use DotNetTesting;

use Test::More tests => 5;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public int lt(int x, int y)
        {
            if (x < y)
				return 1;
			else
				return 0;
        }

		public int le(int x, int y)
        {
            if (x <= y)
				return 1;
			else
				return 0;
        }

		public int gt(int x, int y)
        {
            if (x > y)
				return 1;
			else
				return 0;
        }

		public int ge(int x, int y)
        {
            if (x >= y)
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
is (run_pir(<<'PIR'), <<'OUTPUT', 'lt');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.lt(5,7)
	print $I0
	print "\n"
	$I0 = obj.lt(400,8)
	print $I0
	print "\n"
	$I0 = obj.lt(5,-7)
	print $I0
	print "\n"
	$I0 = obj.lt(-400,8123)
	print $I0
	print "\n"
	$I0 = obj.lt(4,4)
	print $I0
	print "\n"
.end
PIR
1
0
0
1
0
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'le');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.le(5,7)
	print $I0
	print "\n"
	$I0 = obj.le(400,8)
	print $I0
	print "\n"
	$I0 = obj.le(5,-7)
	print $I0
	print "\n"
	$I0 = obj.le(-400,8123)
	print $I0
	print "\n"
	$I0 = obj.le(4,4)
	print $I0
	print "\n"
.end
PIR
1
0
0
1
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'gt');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.gt(5,7)
	print $I0
	print "\n"
	$I0 = obj.gt(400,8)
	print $I0
	print "\n"
	$I0 = obj.gt(5,-7)
	print $I0
	print "\n"
	$I0 = obj.gt(-400,8123)
	print $I0
	print "\n"
	$I0 = obj.gt(4,4)
	print $I0
	print "\n"
.end
PIR
0
1
1
0
0
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'ge');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.ge(5,7)
	print $I0
	print "\n"
	$I0 = obj.ge(400,8)
	print $I0
	print "\n"
	$I0 = obj.ge(5,-7)
	print $I0
	print "\n"
	$I0 = obj.ge(-400,8123)
	print $I0
	print "\n"
	$I0 = obj.ge(4,4)
	print $I0
	print "\n"
.end
PIR
0
1
1
0
1
OUTPUT
