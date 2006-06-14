#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 43;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public byte u1(int x)
        {
            return checked((byte) x);
        }

        public sbyte i1(int x)
        {
            return checked((sbyte) x);
        }

        public ushort u2(int x)
        {
            return checked((ushort) x);
        }

        public short i2(int x)
        {
            return checked((short) x);
        }

        public uint u4(int x)
        {
            return checked((uint) x);
        }

        public byte u1_f(float x)
        {
            return checked((byte) x);
        }

        public sbyte i1_f(float x)
        {
            return checked((sbyte) x);
        }

        public ushort u2_f(float x)
        {
            return checked((ushort) x);
        }

        public short i2_f(float x)
        {
            return checked((short) x);
        }

        public uint u4_f(float x)
        {
            return checked((uint) x);
        }

        public byte u1_un(uint x)
        {
            return checked((byte) x);
        }

        public sbyte i1_un(uint x)
        {
            return checked((sbyte) x);
        }

        public ushort u2_un(uint x)
        {
            return checked((ushort) x);
        }

        public short i2_un(uint x)
        {
            return checked((short) x);
        }

        public int i4_un(uint x)
        {
            return checked((int) x);
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'u1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.u1(200)
	print $I0
	print "\n"
.end
PIR
200
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.u1(300)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.u1(-5)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.i1(100)
	print $I0
	print "\n"
.end
PIR
100
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.i1(-5)
	print $I0
    print "\n"
    end
.end
PIR
-5
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.i1(128)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.i1(-129)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.u2(33000)
	print $I0
	print "\n"
.end
PIR
33000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.u2(68000)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.u2(-5)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.i2(10000)
	print $I0
	print "\n"
.end
PIR
10000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.i2(-5)
	print $I0
    print "\n"
    end
.end
PIR
-5
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.i2(32768)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.i2(-32769)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u4');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.u4(5000000)
	print $I0
	print "\n"
.end
PIR
5000000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u4');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.u4(-5)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u1_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.u1_un(200)
	print $I0
	print "\n"
.end
PIR
200
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u1_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.u1_un(300)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i1_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.i1_un(100)
	print $I0
	print "\n"
.end
PIR
100
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i1_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.i1_un(128)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i1_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.i1_un(-1)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u2_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.u2_un(33000)
	print $I0
	print "\n"
.end
PIR
33000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u2_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.u2_un(68000)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i2_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.i2_un(10000)
	print $I0
	print "\n"
.end
PIR
10000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i2_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.i2_un(32768)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i2_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.i2_un(-1)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i4_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.i4_un(5000000)
	print $I0
	print "\n"
.end
PIR
5000000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i4_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$I0 = obj.i4_un(-5)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u1_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$N0 = obj.u1_f(200.0)
	print $N0
	print "\n"
.end
PIR
200.000000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u1_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$N0 = obj.u1_f(300.0)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u1_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$N0 = obj.u1_f(-5.0)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i1_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$N0 = obj.i1_f(100.0)
	print $N0
	print "\n"
.end
PIR
100.000000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i1_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$N0 = obj.i1_f(-5.0)
	print $N0
    print "\n"
    end
.end
PIR
-5.000000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i1_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$N0 = obj.i1_f(128.0)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i1_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$N0 = obj.i1_f(-129.0)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u2_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$N0 = obj.u2_f(33000.0)
	print $N0
	print "\n"
.end
PIR
33000.000000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u2_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$N0 = obj.u2_f(68000.0)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'u2_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$N0 = obj.u2_f(-5.0)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i2_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$N0 = obj.i2_f(10000.0)
	print $N0
	print "\n"
.end
PIR
10000.000000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i2_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$N0 = obj.i2_f(-5.0)
	print $N0
    print "\n"
    end
.end
PIR
-5.000000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i2_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$N0 = obj.i2_f(32768.0)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'i2_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    push_eh handler
	$N0 = obj.i2_f(-32769.0)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT
