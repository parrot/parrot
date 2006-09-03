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
        public static int x;
        public static int y;
	    
        public static void set_x()
    	{
	    	x = 5;
    	}
    
	    public static void set_y(int y)
    	{
	    	Test.y = y;
    	}

        public static int add()
        {
            return x + y;
        }

        public void test_no_args()
    	{
            set_x();
	    }

	    public void test_args(int y)
    	{
            set_y(y);
	    }

        public int test_ret()
        {
            set_x();
            set_y(37);
            return add();
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'test_no_args');
.HLL 'dotnet', ''
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	obj.test_no_args()
    $P0 = new Integer
    $P0 = get_hll_global [ "Testing" ; "Test" ], "x"
	print $P0
	print "\n"
.end
PIR
5
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'test_args');
.HLL 'dotnet', ''
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	obj.test_args(10)
    $P0 = new Integer
    $P0 = get_hll_global [ "Testing" ; "Test" ], "y"
	print $P0
	print "\n"
.end
PIR
10
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'test_ret');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    $I0 = obj.test_ret()
	print $I0
	print "\n"
.end
PIR
42
OUTPUT
