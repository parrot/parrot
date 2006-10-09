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
    using System;

    interface I2 : I1, I3
    {
    }

    class C1 : C3, I2
    {   
    }

    interface I1
    {
    }

    class C3 : C2
    {
    }

    interface I3
    {
    }

    class C2
    {
    }

    class Test
    {
        public int check_it_works()
        {
            return 42;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'check_it_works');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    $I0 = obj.check_it_works()
    print $I0
    print "\n"
.end
PIR
42
OUTPUT
