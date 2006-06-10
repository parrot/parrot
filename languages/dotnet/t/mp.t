#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 7;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class test_field
    {
        public int x;
    }

    public class Test
    {
        public void test_ints(ref byte a, ref sbyte b, ref ushort c, ref short d,
                              ref int e, ref uint f)
        {
            a *= 2;
            b *= 2;
            c *= 2;
            d *= 2;
            e *= 2;
            f *= 2;
        }

        public void test_floats(ref float a, ref double b)
        {
            a *= (float)2.5;
            b *= 2.5;
        }

        public void test(ref int x)
        {
            x *= 2;
        }

        public int local_ints()
        {
            byte a = 5;
            sbyte b = 10;
            ushort c = 20;
            short d = 40;
            int e = 80;
            uint f = 160;
            test_ints(ref a, ref b, ref c, ref d, ref e, ref f);
            return a + b + c + d + e + (int)f;
        }

        public double local_floats()
        {
            float a = (float)5.5;
            double b = (double)7.5;
            test_floats(ref a, ref b);
            return a + b;
        }

        public int param_ints(byte a, sbyte b, ushort c, short d, int e, uint f)
        {
            test_ints(ref a, ref b, ref c, ref d, ref e, ref f);
            return a + b + c + d + e + (int)f;
        }

        public double param_floats(float a, double b)
        {
            test_floats(ref a, ref b);
            return a + b;
        }

        public int element()
        {
            int[] v = new int[2];
            v[0] = 5;
            v[1] = 10;
            test(ref v[1]);
            return v[1];
        }

        public int field()
        {
            test_field o = new test_field();
            o.x = 5;
            test(ref o.x);
            return o.x;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'local ints');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.local_ints()
	print $I0
	print "\n"
.end
PIR
630
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'local floats');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$N0 = obj.local_floats()
	print $N0
	print "\n"
.end
PIR
32.500000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'param ints');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.param_ints(5, 10, 20, 40, 80, 160)
	print $I0
	print "\n"
.end
PIR
630
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'param floats');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$N0 = obj.param_floats(5.5, 7.5)
	print $N0
	print "\n"
.end
PIR
32.500000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'element');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.element()
	print $I0
	print "\n"
.end
PIR
20
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'field');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.field()
	print $I0
	print "\n"
.end
PIR
10
OUTPUT
