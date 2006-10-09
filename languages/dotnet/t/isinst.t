#!perl 

use strict;
use warnings;
use lib qw( lib ../lib ../../lib dotnet dotnet/t );

use DotNetTesting;

use Test::More tests => 3;

## Testing class for this file.t';
#
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    using System;

    class Animal {
    }

    class Badger : Animal {
    }

    class Test
    {
        public int is_badger(Animal b) {
            int x;
            if (b is Badger)
                x = 1;
            else
                x = 0;
            return x;
        }

        public int pos()
        {
            Animal a = new Badger();
            return is_badger(a);
        }

        public int neg()
        {
            Animal a = new Animal();
            return is_badger(a);
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'pos');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.pos()
    print $I0
    print "\n"
.end
PIR
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'neg');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.neg()
    print $I0
    print "\n"
.end
PIR
0
OUTPUT
