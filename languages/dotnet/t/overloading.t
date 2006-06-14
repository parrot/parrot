#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 6;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class test_item
    {
    }

    public class test_item_2
    {
    }
    
    public class Test
    {
        public int m(int x)
        {
            return 10;
        }

        public int m(int x, int y)
        {
            return 20;
        }

        public int m(int x, double y)
        {
            return 30;
        }

        public int m(test_item x)
        {
            return 40;
        }

        public int m(test_item_2 x)
        {
            return 50;
        }

        public int one_arg_i()
        {
            return m(2);
        }

        public int two_args_ii()
        {
            int x = 2;
            int y = 5;
            return m(x, y);
        }

        public int two_args_if()
        {
            int x = 2;
            double y = 5.0;
            return m(x, y);
        }

        public int test_obj_1()
        {
            test_item o = new test_item();
            return m(o);
        }

        public int test_obj_2()
        {
            test_item_2 o = new test_item_2();
            return m(o);
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'one_arg_i');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.one_arg_i()
    print $I0
    print "\n"
.end
PIR
10
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'two_args_ii');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.two_args_ii()
    print $I0
    print "\n"
.end
PIR
20
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'two_args_if');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.two_args_if()
    print $I0
    print "\n"
.end
PIR
30
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'test_obj_1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.test_obj_1()
    print $I0
    print "\n"
.end
PIR
40
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'test_obj_2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.test_obj_2()
    print $I0
    print "\n"
.end
PIR
50
OUTPUT
