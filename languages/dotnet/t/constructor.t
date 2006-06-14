#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 3;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class has_cons {
        private int x;

        public has_cons()
        {
            x = 5;
        }

        public int get_x()
        {
            return x;
        }
    }

    public class has_cons_params {
        private int x;
        private double y;

        public has_cons_params(int x, double y)
        {
            this.x = x;
            this.y = y;
        }

        public int get_x()
        {
            return x;
        }

        public double get_y()
        {
            return y;
        }
    }

    public class Test
    {
        public int cc_no_args()
        {
            has_cons test = new has_cons();
            return test.get_x();
        }

        public double cc_args(int x, double y)
        {
            has_cons_params test = new has_cons_params(x, y);
            return ((double)test.get_x()) + test.get_y();
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'cc_no_args');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.cc_no_args()
    print $I0
    print "\n"
.end
PIR
5
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'cc_args');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$N0 = obj.cc_args(10, 2.45)
    print $N0
    print "\n"
.end
PIR
12.450000
OUTPUT
