#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 3;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public struct value_type {
        public int x;
        public int y;
    }
    
    public class Test
    {
        public int box_1()
        {
            value_type a;
            object b;
            a.x = 5;
            a.y = 6;
            b = a;
            return ((value_type) b).x + ((value_type) b).y;
        }

        public int box_2()
        {
            value_type a;
            object b;
            object c;
            a.x = 5;
            a.y = 6;
            b = a;
            c = b;
            ((value_type) b).x++;
            ((value_type) c).y++;
            return a.x + a.y + ((value_type) b).y + ((value_type) c).x;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'box_1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.box_1()
	print $I0
    print "\n"
.end
PIR
11
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'box_2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.box_2()
	print $I0
    print "\n"
.end
PIR
22
OUTPUT
