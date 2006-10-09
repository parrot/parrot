#!perl 

use strict;
use warnings;
use lib qw( lib ../lib ../../lib dotnet dotnet/t );

use DotNetTesting;

use Test::More tests => 5;

## Testing classes for this file.t';
#
die unless compile_cs("external.dll", <<'CSHARP');
namespace ExportsStuff
{
    public class Monkey
    {
        public string name;
        public int age;

        public string speak()
        {
            return "Ook! Ook! Banana! Banana!";
        }
    }
}
CSHARP
die unless compile_cs("t.dll", <<'CSHARP', '-r:external.dll');
namespace Testing
{
    using System;
    using ExportsStuff;
    
    class Test
    {
        public Monkey create_monkey()
        {
            Monkey x = new Monkey();
            x.name = "Fred";
            x.age = 8;
            return x;
        }
    
        public int monkey_age_doubled(Monkey m)
        {
            return m.age * 2;
        }

        public string monkey_talk(Monkey m)
        {
            return m.speak();
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("external.dll", "external.pbc"), 'translate');
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'create_monkey');
.sub main
	.local pmc obj
    load_bytecode "external.pbc"
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$P0 = obj.create_monkey()
    unless null $P0 goto IS_OK
    print "busted\n"
IS_OK:
    print "ok\n"
.end
PIR
ok
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'monkey_age_doubled');
.sub main
	.local pmc obj
    load_bytecode "external.pbc"
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$P0 = obj.create_monkey()
    $I0 = obj.monkey_age_doubled($P0)
    print $I0
    print "\n"
.end
PIR
16
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'monkey_talk');
.sub main
	.local pmc obj
    load_bytecode "external.pbc"
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$P0 = obj.create_monkey()
    $S0 = obj.monkey_talk($P0)
    print $S0
    print "\n"
.end
PIR
Ook! Ook! Banana! Banana!
OUTPUT
