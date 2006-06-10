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
        public int add(int x, int y)
        {
            return checked(x + y);
        }

        public uint add_un(uint x, uint y)
        {
            return checked(x + y);
        }

        public int sub(int x, int y)
        {
            return checked(x - y);
        }

        public uint sub_un(uint x, uint y)
        {
            return checked(x - y);
        }

        public int mul(int x, int y)
        {
            return checked(x * y);
        }

        public uint mul_un(uint x, uint y)
        {
            return checked(x * y);
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'add_ovf');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.add(500,72)
	print $I0
	print "\n"
.end
PIR
572
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'add_ovf');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
    push_eh handler
	$I0 = obj.add(2147483640, 100)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'add_ovf_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.add_un(500,72)
	print $I0
	print "\n"
.end
PIR
572
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'add_ovf_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.add_un(2147483647, 2147483647)
    push_eh handler
    $I0 = obj.add_un($I0, 10)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'sub_ovf');
.sub main
    .local pmc obj
    load_bytecode "t.pbc"
    obj = new "Testing.Test"
    $I0 = obj."sub"(500,72)
    print $I0
    print "\n"
    $I0 = obj."sub"(72,100)
    print $I0
    print "\n"
.end
PIR
428
-28
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'sub_ovf');
.sub main
    .local pmc obj
    load_bytecode "t.pbc"
    obj = new "Testing.Test"
    push_eh handler
    $I0 = obj."sub"(-2147483640, 100)
    print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'sub_ovf_un');
.sub main
    .local pmc obj
    load_bytecode "t.pbc"
    obj = new "Testing.Test"
    $I0 = obj."sub_un"(500,72)
    print $I0
    print "\n"
.end
PIR
428
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'sub_ovf_un');
.sub main
    .local pmc obj
    load_bytecode "t.pbc"
    obj = new "Testing.Test"
    push_eh handler
    $I0 = obj."sub_un"(10, 20)
    print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'mul_ovf');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.mul(500,20)
	print $I0
	print "\n"
.end
PIR
10000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'mul_ovf');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
    push_eh handler
	$I0 = obj.mul(214748364, 100)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'mul_ovf_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.mul_un(500,20)
	print $I0
	print "\n"
.end
PIR
10000
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'mul_ovf_un');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	push_eh handler
	$I0 = obj.mul_un(214748364, 214748364)
	print "failed\n"
    end
handler:
    print "success\n"
    end
.end
PIR
success
OUTPUT
