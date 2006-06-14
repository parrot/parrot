#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 6;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public sbyte test_sbyte()
        {
            sbyte[] x = new sbyte[5];

            for (int i = 0; i < x.Length; i++)
                x[i] = (sbyte) (i + 1);
            sbyte total = 0;
            for (int i = 0; i < x.Length; i++)
                total += x[i];
            return total;
        }

        public byte test_byte()
        {
            byte[] x = new byte[5];

            for (int i = 0; i < x.Length; i++)
                x[i] = (byte) (i + 1);
            byte total = 0;
            for (int i = 0; i < x.Length; i++)
                total += x[i];
            return total;
        }

        public short test_short()
        {
            short[] x = new short[5];

            for (int i = 0; i < x.Length; i++)
                x[i] = (short) (i + 1);
            short total = 0;
            for (int i = 0; i < x.Length; i++)
                total += x[i];
            return total;
        }

        public ushort test_ushort()
        {
            ushort[] x = new ushort[5];

            for (int i = 0; i < x.Length; i++)
                x[i] = (ushort) (i + 1);
            ushort total = 0;
            for (int i = 0; i < x.Length; i++)
                total += x[i];
            return total;
        }

        public int test_int()
        {
            int[] x = new int[5];

            for (int i = 0; i < x.Length; i++)
                x[i] = i + 1;
            int total = 0;
            for (int i = 0; i < x.Length; i++)
                total += x[i];
            return total;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'sbyte');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.test_sbyte()
	print $I0
	print "\n"
.end
PIR
15
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'byte');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.test_byte()
	print $I0
	print "\n"
.end
PIR
15
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'short');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.test_short()
	print $I0
	print "\n"
.end
PIR
15
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'ushort');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.test_ushort()
	print $I0
	print "\n"
.end
PIR
15
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'int');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.test_int()
	print $I0
	print "\n"
.end
PIR
15
OUTPUT
