#!perl 

use strict;
use warnings;
use lib qw( lib ../lib ../../lib dotnet dotnet/t );

use DotNetTesting;

use Test::More tests => 9;

## Testing classes for this file.t';
#
die unless compile_cs("t.dll", <<'CSHARP');
namespace Testing
{
    using System;

    class IGotKilledException : System.Exception {
    }

    class IGotEatenException : IGotKilledException {
    }

    class Test
    {
        public int simple(int x)
        {
            int a = 0;
            try {
                if (x != 0)
                    throw new Exception();
            }
            catch (Exception e) {
                a = 1;
            }
            return a;
        }

        public int typed(int x)
        {
            int a = 0;
            try {
                if (x == 0)
                    throw new IGotEatenException();
                else
                    throw new IGotKilledException();
            }
            catch (IGotEatenException e) {
                a = 1;
            }
            catch (IGotKilledException e) {
                a = 2;
            }
            return a;
        }

        public int nested1(int x)
        {
            int a = 0;
            try {
                if (x == 0)
                    throw new IGotEatenException();
                try {
                    throw new IGotEatenException();
                }
                catch (IGotEatenException e) {
                    a = 2;
                }
            }
            catch (IGotEatenException e) {
                a = 1;
            }
            return a;
        }

        public int nested2(int x)
        {
            int a = 0;
            try {
                if (x == 0)
                    throw new IGotEatenException();
                try {
                    throw new IGotKilledException();
                }
                catch (IGotEatenException e) {
                    a = 2;
                }
            }
            catch (IGotKilledException e) {
                a = 1;
            }
            return a;
        }

        public int nested3(int x)
        {
            int a = 0;
            try {
                try {
                    if (x == 0)
                        throw new IGotEatenException();
                }
                catch (IGotEatenException e) {
                    a = 1;
                }
                try {
                    if (x != 0)
                        throw new IGotEatenException();
                }
                catch (IGotEatenException e) {
                    a = 2;
                }
            }
            catch (IGotKilledException e) {
                a = 3;
            }
            return a;
        }

        public int nested4(int x)
        {
            int a = 0;
            try {
                try {
                    if (x == 0)
                        throw new IGotEatenException();
                }
                catch (IGotEatenException e) {
                    a = 1;
                }
                try {
                    if (x != 0)
                        throw new IGotKilledException();
                }
                catch (IGotEatenException e) {
                    a = 2;
                }
            }
            catch (IGotKilledException e) {
                a = 3;
            }
            return a;
        }

        public int nested5(int x)
        {
            int a = 0;
            try {
                try {
                    if (x == 0)
                        throw new IGotKilledException();
                }
                catch (IGotEatenException e) {
                    a = 1;
                }
                try {
                    if (x != 0)
                        throw new IGotEatenException();
                }
                catch (IGotEatenException e) {
                    a = 2;
                }
            }
            catch (IGotKilledException e) {
                a = 3;
            }
            return a;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'simple no exception');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.simple(0)
    print $I0
    print "\n"
.end
PIR
0
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'simple exception');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.simple(1)
    print $I0
    print "\n"
.end
PIR
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'typed exception handler');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.typed(1)
    print $I0
    print "\n"
    $I0 = obj.typed(0)
    print $I0
    print "\n"
.end
PIR
2
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'nested 1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.nested1(0)
    print $I0
    print "\n"
    $I0 = obj.nested1(1)
    print $I0
    print "\n"
.end
PIR
1
2
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'nested 2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.nested2(0)
    print $I0
    print "\n"
    $I0 = obj.nested2(1)
    print $I0
    print "\n"
.end
PIR
1
1
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'nested 3');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.nested3(0)
    print $I0
    print "\n"
    $I0 = obj.nested3(1)
    print $I0
    print "\n"
.end
PIR
1
2
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'nested 4');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.nested4(0)
    print $I0
    print "\n"
    $I0 = obj.nested4(1)
    print $I0
    print "\n"
.end
PIR
1
3
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'nested 5');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new [ "Testing" ; "Test" ]
	$I0 = obj.nested5(0)
    print $I0
    print "\n"
    $I0 = obj.nested5(1)
    print $I0
    print "\n"
.end
PIR
3
2
OUTPUT
