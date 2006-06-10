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
        public void is_void()
        {
        }

        public int no_args()
        {
            return 13;
        }

        public int call_no_args(int x)
        {
            return x + no_args();
        }

        public int one_arg(int x)
        {
            return 2 * x;
        }

        public int call_one_arg()
        {
            int y = one_arg(20);
            y += 2;
            return y;
        }

        public int many_args(int a, int b, int c, int d)
        {
            return a + (b * c) - d;
        }

        public int call_many_args(int x, int y)
        {
            return many_args(x, 2 * x, 3 * y, y);
        }

        public int call_void()
        {
            is_void();
            return 9;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'call_no_args');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.call_no_args(29)
    print $I0
    print "\n"
.end
PIR
42
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'call_one_arg');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.call_one_arg()
    print $I0
    print "\n"
.end
PIR
42
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'call_many_args');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.call_many_args(2, 3)
    print $I0
    print "\n"
.end
PIR
35
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'is_void');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.call_void()
    print $I0
    print "\n"
.end
PIR
9
OUTPUT
