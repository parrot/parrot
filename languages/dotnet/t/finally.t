#!perl -w

use Test::More;
use DotNetTesting;
use strict;

use Test::More tests => 7;

## Testing classes for this file.
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
        public int unwind_over()
        {
            int a = 0;
            try {
                try {
                    throw new Exception();
                }
                finally {
                    a = 41;
                }
            }
            catch (Exception e) {
                a++;
            }
            return a;
        }

        public int unwind_over_2()
        {
            int a = 0;
            try {
                try {
                    try {
                        throw new Exception();
                    }
                    finally {
                        a = 42;
                    }
                }
                finally {
                    a += 7;
                }
            }
            catch (Exception e) {
                a++;
            }
            return a;
        }

        public int try_finally()
        {
            int a = 0;
            try {
                a = 1;
            }
            finally {
                a += 41;
            }
            return a;
        }

        public int mixed()
        {
            int a = 0;
            try {
                try {
                    try {
                        throw new Exception();
                    }
                    finally {
                        a = 42;
                    }
                }
                finally {
                    a += 7;
                }
            }
            catch (Exception e) {
                a++;
            }
            finally {
                a += 5;
            }
            return a;
        }

        public int nested_1(int x)
        {
            int a = 0;
            int f = 0;
            try {
                try {
                    if (x == 0)
                        throw new IGotEatenException();
                }
                catch (IGotEatenException e) {
                    a = 1;
                }
                finally {
                    f++;
                }
                try {
                    if (x != 0)
                        throw new IGotKilledException();
                }
                catch (IGotEatenException e) {
                    a = 2;
                }
                finally {
                    f++;
                }
            }
            catch (IGotKilledException e) {
                a = 3;
            }
            finally {
                f++;
            }
            return (f * 10) + a;
        }

        public int nested_2(int x)
        {
            int a = 0;
            int f = 0;
            try {
                try {
                    if (x != 0)
                        throw new IGotKilledException();
                }
                catch (IGotEatenException e) {
                    a = 2;
                }
                finally {
                    f++;
                }
                try {
                    if (x == 0)
                        throw new IGotEatenException();
                }
                catch (IGotEatenException e) {
                    a = 1;
                }
                finally {
                    f++;
                }
            }
            catch (IGotKilledException e) {
                a = 3;
            }
            finally {
                f++;
            }
            return (f * 10) + a;
        }
    }
}
CSHARP

## Attempt to translate.
ok(translate("t.dll", "t.pbc"), 'translate');

## Tests.
is (run_pir(<<'PIR'), <<'OUTPUT', 'unwind over');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.unwind_over()
    print $I0
    print "\n"
.end
PIR
42
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'unwind over 2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.unwind_over_2()
    print $I0
    print "\n"
.end
PIR
50
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'try...finally');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.try_finally()
    print $I0
    print "\n"
.end
PIR
42
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'mixed');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.mixed()
    print $I0
    print "\n"
.end
PIR
55
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'nested 1');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.nested_1(0)
    print $I0
    print "\n"
    $I0 = obj.nested_1(1)
    print $I0
    print "\n"
.end
PIR
31
33
OUTPUT

is (run_pir(<<'PIR'), <<'OUTPUT', 'nested 2');
.sub main
	.local pmc obj
	load_bytecode "t.pbc"
	obj = new "Testing.Test"
	$I0 = obj.nested_2(0)
    print $I0
    print "\n"
    $I0 = obj.nested_2(1)
    print $I0
    print "\n"
.end
PIR
31
23
OUTPUT
