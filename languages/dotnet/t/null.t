#!perl 

use strict;
use warnings;
use lib qw( lib ../lib ../../lib dotnet dotnet/t );

use DotNetTesting;

use Test::More tests => 4;

## Testing class for this file.t';
#
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public object ret_null()
        {
            return null;
        }

        public int comp_null(Testing.Test o)
        {
            return o == null ? 1 : 0;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'ret_null');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$P0 = obj.ret_null()
    if null $P0 goto IS_NULL
	print "not null\n"
IS_NULL:
	print "is null\n"
.end
PIR
is null
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'comp_null');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    $P0 = obj.ret_null()
	$I0 = obj.comp_null($P0)
    print $I0
    print "\n"
.end
PIR
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'comp_null');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.comp_null(obj)
    print $I0
    print "\n"
.end
PIR
0
OUTPUT
