#!perl 

use strict;
use warnings;
use lib qw( lib ../lib ../../lib dotnet dotnet/t );

use DotNetTesting;

use Test::More tests => 2;

## Testing class for this file.t';
#
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    public class Test
    {
        public int test(int x) {
            switch (x) {
            case 0:
                return 42;
            case 1:
                return 99;
            case 2:
                return 33;
            }
            return 0;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'switch');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.test(0)
	print $I0
	print "\n"
    $I0 = obj.test(1)
	print $I0
	print "\n"
    $I0 = obj.test(2)
	print $I0
	print "\n"
    $I0 = obj.test(3)
	print $I0
	print "\n"
.end
PIR
42
99
33
0
OUTPUT
