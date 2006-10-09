#!perl 

use strict;
use warnings;
use lib qw( lib ../lib ../../lib dotnet dotnet/t );

use DotNetTesting;

use Test::More tests => 6;

## Testing class for this file.t';
#
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    using System;

    class grand_mummy
    {
        public int test()
        {
            return 123;
        }

        public int gm_meth()
        {
            return 18;
        }
    }

    class mummy : grand_mummy
    {
        public new int test()
        {
            return 666;
        }

        public int m_meth()
        {
            return 20;
        }
    }

    class baby : mummy
    {
        public new int test()
        {
            return 42;
        }

        public int b_meth()
        {
            return 22;
        }
    }

    class Test
    {
        public int test_2_up(baby x)
        {
            return x.gm_meth();
        }

        public int test_1_up(baby x)
        {
            return x.m_meth();
        }

        public int test_cur(baby x)
        {
            return x.b_meth();
        }

        public int test(grand_mummy x)
        {
            return x.test();
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'test_2_up');
.sub main
	.local pmc obj1, obj2
	load_bytecode "t.pbc"
	obj1 = new [ "Testing" ; "Test" ]
    obj2 = new [ "Testing" ; "baby" ]
	$I0 = obj1.test_2_up(obj2)
    print $I0
    print "\n"
.end
PIR
18
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'test_1_up');
.sub main
	.local pmc obj1, obj2
	load_bytecode "t.pbc"
	obj1 = new [ "Testing" ; "Test" ]
    obj2 = new [ "Testing" ; "baby" ]
	$I0 = obj1.test_1_up(obj2)
    print $I0
    print "\n"
.end
PIR
20
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'test_cur');
.sub main
	.local pmc obj1, obj2
	load_bytecode "t.pbc"
	obj1 = new [ "Testing" ; "Test" ]
    obj2 = new [ "Testing" ; "baby" ]
	$I0 = obj1.test_cur(obj2)
    print $I0
    print "\n"
.end
PIR
22
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'override 1');
.sub main
	.local pmc obj1, obj2
	load_bytecode "t.pbc"
	obj1 = new [ "Testing" ; "Test" ]
    obj2 = new [ "Testing" ; "mummy" ]
	$I0 = obj1.test(obj2)
    print $I0
    print "\n"
.end
PIR
666
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'override 2');
.sub main
	.local pmc obj1, obj2
	load_bytecode "t.pbc"
	obj1 = new [ "Testing" ; "Test" ]
    obj2 = new [ "Testing" ; "baby" ]
	$I0 = obj1.test(obj2)
    print $I0
    print "\n"
.end
PIR
42
OUTPUT
