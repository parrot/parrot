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
        public int factorial(int x)
        {
            if (x <= 1)
                return 1;
            else
                return x * factorial(x - 1);
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'factorial');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.factorial(0)
    print $I0
    print "\n"
    $I0 = obj.factorial(1)
    print $I0
    print "\n"
    $I0 = obj.factorial(2)
    print $I0
    print "\n"
    $I0 = obj.factorial(10)
    print $I0
    print "\n"
.end
PIR
1
1
2
3628800
OUTPUT
