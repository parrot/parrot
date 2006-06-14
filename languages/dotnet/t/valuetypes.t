#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 7;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public struct value_type {
        public int x;

        public void inc()
        {
            x++;
        }
    }
    
    public class Test
    {
        public value_type double_it(value_type t)
        {
            t.x *= 2;
            return t;
        }

        public void double_it_ref(ref value_type t)
        {
            t.x *= 2;
        }

        public int locals_1()
        {
            value_type a;
            value_type b;
            a.x = 1;
            b = a;
            b.x = 2;
            return a.x + b.x;
        }

        public int locals_2()
        {
            value_type a;
            value_type b;
            a.x = 2;
            b = a;
            b.x += 1;
            return a.x + b.x;
        }

        public int locals_3()
        {
            value_type a = new value_type();
            value_type b = new value_type();
            a.x += 3;
            b = a;
            b.x += 1;
            return a.x + b.x;
        }

        public int pass()
        {
            value_type a;
            a.x = 2;
            value_type b = double_it(a);
            return a.x + b.x;
        }

        public int pass_ref()
        {
            value_type a;
            a.x = 12;
            double_it_ref(ref a);
            return a.x;
        }

        public int method()
        {
            value_type a;
            a.x = 41;
            a.inc();
            return a.x;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'locals_1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.locals_1()
	print $I0
    print "\n"
.end
PIR
3
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'locals_2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.locals_2()
	print $I0
    print "\n"
.end
PIR
5
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'locals_3');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.locals_3()
	print $I0
    print "\n"
.end
PIR
7
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'pass');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.pass()
	print $I0
    print "\n"
.end
PIR
6
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'pass ref');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.pass_ref()
	print $I0
    print "\n"
.end
PIR
24
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'method');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj."method"()
	print $I0
    print "\n"
.end
PIR
42
OUTPUT
