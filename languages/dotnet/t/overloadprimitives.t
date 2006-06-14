#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 9;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{   
    public class Test
    {
        public int m(int x)
        {
            return 10;
        }

        public int m(uint x)
        {
            return 20;
        }

        public int m(sbyte x)
        {
            return 30;
        }

        public int m(byte x)
        {
            return 40;
        }

        public int m(short x)
        {
            return 50;
        }

        public int m(ushort x)
        {
            return 60;
        }

        public int m(float x)
        {
            return 70;
        }

        public int m(double x)
        {
            return 80;
        }

        public int m_int()
        {
            int y = 5;
            return m(y);
        }

        public int m_uint()
        {
            uint y = 5;
            return m(y);
        }

        public int m_sbyte()
        {
            sbyte y = 5;
            return m(y);
        }

        public int m_byte()
        {
            byte y = 5;
            return m(y);
        }

        public int m_short()
        {
            short y = 5;
            return m(y);
        }

        public int m_ushort()
        {
            ushort y = 5;
            return m(y);
        }

        public int m_float()
        {
            float y = (float)5.0;
            return m(y);
        }

        public int m_double()
        {
            double y = 5.0;
            return m(y);
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'int');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    print "inst\n"
	$I0 = obj.m_int()
    print "called\n"
    print $I0
    print "\n"
.end
PIR
10
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'uint');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.m_uint()
    print $I0
    print "\n"
.end
PIR
20
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'sbyte');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.m_sbyte()
    print $I0
    print "\n"
.end
PIR
30
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'byte');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.m_byte()
    print $I0
    print "\n"
.end
PIR
40
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'short');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.m_short()
    print $I0
    print "\n"
.end
PIR
50
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'ushort');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.m_ushort()
    print $I0
    print "\n"
.end
PIR
60
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'float');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.m_float()
    print $I0
    print "\n"
.end
PIR
70
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'double');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.m_double()
    print $I0
    print "\n"
.end
PIR
80
OUTPUT
