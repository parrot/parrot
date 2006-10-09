#!perl 

use strict;
use warnings;
use lib qw( lib ../lib ../../lib dotnet dotnet/t );

use DotNetTesting;

use Test::More tests => 3;

## Testing class for this file.
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
        public Badger try_cast(Animal a) {
            Badger b = (Badger) a;
            return b;
        }

        public int pos()
        {
            Animal a = new Badger();
            try_cast(a);
            return 1;
        }

        public int neg()
        {
            Animal a = new Animal();
            try_cast(a);
            return 1;
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
    push_eh caught
	$I0 = obj.neg()
    print "not "
caught:
    print "ok\n"
.end
PIR
ok
OUTPUT
