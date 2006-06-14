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
    
    public enum emotion {
        Delighted,
        Devestated,
        Angry,
        Arsey,
        Happy,
        Hurt
    }
    
    public class Test
    {
        public int value()
        {
            emotion em = emotion.Angry;
            return (int) em;
        }

        public int or()
        {
            emotion em1 = emotion.Angry;
            emotion em2 = emotion.Hurt;
            return (int) (em1 | em2);
        }

        public int or_int()
        {
            emotion em = emotion.Arsey;
            return (int) em | 4;
        }

        public int cond_1(int a)
        {
            emotion em;
            if (a == 0)
                em = emotion.Happy;
            else
                em = emotion.Devestated;
            int crying_buckets_of_tears = em == emotion.Devestated ? 1 : 0;
            return crying_buckets_of_tears;
        }

        public int cond_2(int a)
        {
            emotion em;
            if (a == 0)
                em = emotion.Happy;
            else
                em = emotion.Devestated;
            int unhappy = emotion.Happy != em ? 1 : 0;
            return unhappy;
        }

        public int arg_test(emotion em)
        { 
            return em == emotion.Happy ? 1 : 0;
        }

        public int argument(int a)
        {
            emotion em;
            if (a == 0)
                em = emotion.Happy;
            else
                em = emotion.Devestated;
            return arg_test(em);
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'value');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.value()
	print $I0
    print "\n"
.end
PIR
2
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'or');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.or()
	print $I0
    print "\n"
.end
PIR
7
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'or_int');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.or_int()
	print $I0
    print "\n"
.end
PIR
7
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'cond_1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.cond_1(0)
	print $I0
    print "\n"
    $I0 = obj.cond_1(42)
	print $I0
    print "\n"
.end
PIR
0
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'cond_2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.cond_2(2)
	print $I0
    print "\n"
    $I0 = obj.cond_2(0)
	print $I0
    print "\n"
.end
PIR
1
0
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'argument');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.argument(1)
	print $I0
    print "\n"
    $I0 = obj.argument(0)
	print $I0
    print "\n"
.end
PIR
0
1
OUTPUT
