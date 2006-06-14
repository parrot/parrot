#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 7;

## Testing class for this file.
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    using System;

    interface Kickable
    {
        void kick();
    }

    interface Sufferer : Kickable
    {
        int get_pain_level();
    }

    class UnfortunatePerson : Sufferer
    {
        int pain;

        public UnfortunatePerson()
        {
            pain = 0;
        }

        public void kick()
        {
            pain++;
        }

        public int get_pain_level()
        {
            return pain;
        }
    }

    class Test
    {
        private UnfortunatePerson joseph;

        public void setup()
        {
            joseph = new UnfortunatePerson();
        }

        public void kick_da_brother(int times)
        {
            for (int i = 0; i < times; i++)
                joseph.kick();
        }

        public int ready_to_sell()
        {
            return joseph.get_pain_level() > 100 ? 1 : 0;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
SKIP: { skip "Parrot exceptions from constructors bug", 2;
is (run_pir(<<'PIR'), <<'OUTPUT', 'no instantiation');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
    push_eh handler
	obj = new [ "Testing" ; "Kickable" ]
    print "not "
handler:
    print "ok\n"
.end
PIR
ok
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'no instantiation');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
    push_eh EH
	obj = new [ "Testing" ; "Sufferer" ]
    print "not "
EH:
    print "ok\n"
.end
PIR
ok
OUTPUT
}

is (run_pir(<<'PIR'), <<'OUTPUT', 'concrete instantiation');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
    push_eh EH
	obj = new [ "Testing" ; "UnfortunatePerson" ]
    print "ok\n"
    end
EH:
    print "uh, not!\n"
.end
PIR
ok
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'abstract method call');
.sub main
	.local pmc prt, cls, obj
	load_bytecode "t.pbc"
    prt = getclass [ "Testing" ; "Kickable" ]
    cls = newclass "badness"
    addparent cls, prt
	obj = new "badness"
    push_eh handler
    obj.kick()
    print "not "
handler:
    print "ok\n"
.end
PIR
ok
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'methods');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    obj.setup()
    obj.kick_da_brother(10)
    $I0 = obj.ready_to_sell()
    print $I0
    print "\n"
.end
PIR
0
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'methods');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
    obj.setup()
    obj.kick_da_brother(1000) # ouch!
    $I0 = obj.ready_to_sell()
    print $I0
    print "\n"
.end
PIR
1
OUTPUT
