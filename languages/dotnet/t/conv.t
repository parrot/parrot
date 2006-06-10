#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 13;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public sbyte conv_i1_i(int x)
		{
			return (sbyte) x;
		}
		
		public sbyte conv_i1_f(float x)
		{
			return (sbyte) x;
		}

        public byte conv_u1_i(int x)
		{
			return (byte) x;
		}
		
		public byte conv_u1_f(float x)
		{
			return (byte) x;
		}

        public short conv_i2_i(int x)
		{
			return (short) x;
		}
		
		public short conv_i2_f(float x)
		{
			return (short) x;
		}

        public ushort conv_u2_i(int x)
		{
			return (ushort) x;
		}
		
		public ushort conv_u2_f(float x)
		{
			return (ushort) x;
		}

		public int conv_i4_f(float x)
		{
			return (int) x;
		}
		
		public uint conv_u4_f(float x)
		{
			return (uint) x;
		}

		public float conv_r4_i(int x)
		{
			return (float) x;
		}

		public double conv_r8_i(int x)
		{
			return (double) x;
		}
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'conv_i1_i');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.conv_i1_i(42)
	print $I0
	print "\n"
	$I0 = obj.conv_i1_i(-42)
	print $I0
	print "\n"
	$I0 = obj.conv_i1_i(258)
	print $I0
	print "\n"
	$I0 = obj.conv_i1_i(-258)
	print $I0
	print "\n"
.end
PIR
42
-42
2
-2
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'conv_i1_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.conv_i1_f(42.0)
	print $I0
	print "\n"
	$I0 = obj.conv_i1_f(-42.0)
	print $I0
	print "\n"
	$I0 = obj.conv_i1_f(258.0)
	print $I0
	print "\n"
	$I0 = obj.conv_i1_f(-258.0)
	print $I0
	print "\n"
.end
PIR
42
-42
2
-2
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'conv_u1_i');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.conv_u1_i(42)
	print $I0
	print "\n"
	$I0 = obj.conv_u1_i(258)
	print $I0
	print "\n"
.end
PIR
42
2
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'conv_u1_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.conv_u1_f(42.0)
	print $I0
	print "\n"
	$I0 = obj.conv_u1_f(258.0)
	print $I0
	print "\n"
.end
PIR
42
2
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'conv_i2_i');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.conv_i2_i(42)
	print $I0
	print "\n"
	$I0 = obj.conv_i2_i(-42)
	print $I0
	print "\n"
	$I0 = obj.conv_i2_i(70000)
	print $I0
	print "\n"
	$I0 = obj.conv_i2_i(-70000)
	print $I0
	print "\n"
.end
PIR
42
-42
4464
-4464
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'conv_i2_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.conv_i2_f(42.0)
	print $I0
	print "\n"
	$I0 = obj.conv_i2_f(-42.0)
	print $I0
	print "\n"
	$I0 = obj.conv_i2_f(70000.0)
	print $I0
	print "\n"
	$I0 = obj.conv_i2_f(-70000.0)
	print $I0
	print "\n"
.end
PIR
42
-42
4464
-4464
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'conv_u2_i');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.conv_u2_i(42)
	print $I0
	print "\n"
	$I0 = obj.conv_u2_i(70000)
	print $I0
	print "\n"
.end
PIR
42
4464
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'conv_u2_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.conv_u2_f(42.0)
	print $I0
	print "\n"
	$I0 = obj.conv_u2_f(70000.0)
	print $I0
	print "\n"
.end
PIR
42
4464
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'conv_i4_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.conv_i4_f(42.0)
	print $I0
	print "\n"
	$I0 = obj.conv_i4_f(-42.0)
	print $I0
	print "\n"
.end
PIR
42
-42
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'conv_u4_f');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.conv_u4_f(42.0)
	print $I0
	print "\n"
.end
PIR
42
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'conv_r4_i');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$N0 = obj.conv_r4_i(42)
	print $N0
	print "\n"
	$N0 = obj.conv_r4_i(-42)
	print $N0
	print "\n"
.end
PIR
42.000000
-42.000000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'conv_r8_i');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$N0 = obj.conv_r8_i(42)
	print $N0
	print "\n"
	$N0 = obj.conv_r8_i(-42)
	print $N0
	print "\n"
.end
PIR
42.000000
-42.000000
OUTPUT
