#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 4;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public int x;
	    public int y;

	    public void set_x(int x)
    	{
	    	this.x = x;
    	}
    
	    public void set_y(int y)
    	{
	    	this.y = y;
    	}

	    public int add()
    	{
	    	return x + y;
	    }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'set_x');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	obj.set_x(28)
    $P0 = new Integer
    $P0 = getattribute obj, "x"
	print $P0
	print "\n"
.end
PIR
28
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'set_y');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	obj.set_y(14)
    $P0 = new Integer
    $P0 = getattribute obj, "y"
	print $P0
	print "\n"
.end
PIR
14
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'add');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	obj.set_x(28)
	obj.set_y(14)
    $I0 = obj.add()
	print $I0
	print "\n"
.end
PIR
42
OUTPUT
