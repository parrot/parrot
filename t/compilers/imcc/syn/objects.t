#!perl
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Config;
use Parrot::Test tests => 13;

##############################
# ".namespace" sanity

pir_output_is( <<'CODE', <<'OUT', "different namespace declarations");

.namespace ["Foo"]
.namespace [ ]
.namespace []

.sub test :main
    print "ok\n"
.end
CODE
ok
OUT

##############################
# Parrot Calling Conventions

pir_output_is( <<'CODE', <<'OUT', "meth call syntax" );

.sub test :main
    .local pmc class
    .local pmc obj
    newclass class, "Foo"
    obj = new "Foo"
    obj.'_meth'()
    print "done\n"
    end
.end

.namespace [ "Foo" ]
.sub _meth :method
    print "in meth\n"
.end
CODE
in meth
done
OUT

pir_output_is( <<'CODE', <<'OUT', "meth call syntax m.o(arg)" );
.sub test :main
    .local pmc class
    .local pmc obj
    newclass class, "Foo"
    obj = new "Foo"
    $P0 = new 'String'
    $P0 = "ok\n"
    obj.'_meth'($P0)
    print "done\n"
    end
.end

.namespace [ "Foo" ]
.sub _meth :method
    .param pmc s
    print "in meth\n"
    print s
.end
CODE
in meth
ok
done
OUT

pir_output_is( <<'CODE', <<'OUT', "meth call ret = o.m(arg)" );
.sub test :main
    .local pmc class
    .local pmc obj
    newclass class, "Foo"
    obj = new "Foo"
    $P0 = new 'String'
    $P0 = "ok\n"
    $S0 = obj.'_meth'($P0)
    print $S0
    end
.end

.namespace [ "Foo" ]
.sub _meth :method
    .param pmc s
    print "in meth\n"
    print s
    .begin_return
    .set_return "done\n"
    .end_return
.end
CODE
in meth
ok
done
OUT

pir_output_is( <<'CODE', <<'OUT', "meth call syntax, string" );
.sub test :main
    .local pmc class
    .local pmc obj
    .local string meth
    meth = "_meth"
    newclass class, "Foo"
    obj = new "Foo"
    obj."_meth"()
    set $S10, "_meth"
    obj.$S10()
    set $S10, "_meth"
    obj.$S10()
    print "done\n"
    end
.end
.namespace [ "Foo" ]
.sub _meth :method
    print "in meth\n"
.end
CODE
in meth
in meth
in meth
done
OUT

pir_output_is( <<'CODE', <<'OUT', "initializer" );
.sub test :main
    newclass $P1, "Foo"
    subclass $P2, $P1, "Bar"
    subclass $P3, $P2, "Baz"
    $P3 = new "Baz"
    get_global $P0, "_sub"
    invokecc $P0
    print "done\n"
    end
.end

.namespace ["Foo"]
.sub init :vtable :method
    print "foo_init\n"
.end

.namespace ["Bar"]
.sub init :vtable :method
    print "bar_init\n"
.end

.namespace ["Baz"]
.sub init :vtable :method
    print "baz_init\n"
.end

.namespace [] # main again
.sub _sub
    print "in sub\n"
.end
CODE
foo_init
bar_init
baz_init
in sub
done
OUT

pir_output_is( <<'CODE', <<'OUT', "meth call syntax - method, self" );

.sub test :main
    .local pmc class
    .local pmc obj
    newclass class, "Foo"
    obj = new "Foo"
    obj.'_meth'()
    print "done\n"
    end
.end

.namespace [ "Foo" ]
.sub _meth :method
    print "in meth\n"
    isa $I0, self, "Foo"
    if $I0, ok
    print "not "
ok:
    print "ok\n"
.end
CODE
in meth
ok
done
OUT

pir_output_is( <<'CODE', <<'OUT', "explicit meth call syntax" );

.sub test :main
    .local pmc class
    .local pmc obj
    newclass class, "Foo"
    obj = new "Foo"
    .begin_call
    .invocant obj
    .meth_call "_meth"
    .end_call
    print "done\n"
    end
.end

.namespace [ "Foo" ]
.sub _meth :method
    print "in meth\n"
.end
CODE
in meth
done
OUT

pir_output_is( <<'CODE', <<'OUT', "explicit meth call syntax, meth var" );

.sub test :main
    .local pmc class
    .local pmc obj
    .local string meth
    newclass class, "Foo"
    obj = new "Foo"
    meth = "_me"
    meth = meth . "th"  # test concat to
    .begin_call
    .invocant obj
    .meth_call meth
    .end_call
    print "done\n"
    end
.end

.namespace [ "Foo" ]
.sub _meth :method
    print "in meth\n"
.end
CODE
in meth
done
OUT
pir_output_is( <<'CODE', <<'OUT', "explicit meth call syntax, args" );

.sub test :main
    .local pmc class
    .local pmc obj
    newclass class, "Foo"
    obj = new "Foo"
    .begin_call
    .set_arg "hello"
    .set_arg "\n"
    .invocant obj
    .meth_call "_meth"
    .get_result $S0
    .end_call
    print $S0
    print "done\n"
    end
.end

.namespace [ "Foo" ]
.sub _meth :method
    .param string p1
    .param string p2
    print "in meth\n"
    print p1
    print p2
    .begin_return
    .set_return "ok\n"
    .end_return
.end
CODE
in meth
hello
ok
done
OUT

pir_output_is( <<'CODE', <<'OUT', "explicit meth call syntax" );

.sub test :main
    .local pmc class
    .local pmc obj
    newclass class, "Foo"
    obj = new "Foo"
    .begin_call
    .invocant obj
    .meth_call "_meth"
    .end_call
    print "done\n"
    end
.end

.namespace [ "Foo" ]
.sub _meth :method
    print "in meth\n"
.end
CODE
in meth
done
OUT

pir_output_is( <<'CODE', <<'OUT', "meth call syntax - reserved word" );

.sub test :main
    .local pmc class
    .local pmc obj
    newclass class, "Foo"
    obj = new "Foo"
    obj.'open'()
    print "done\n"
    end
.end

.namespace [ "Foo" ]
.sub open :method
    print "in meth\n"
.end
CODE
in meth
done
OUT

pir_output_is( <<'CODE', <<'OUT', ":vtable implies self (see RT #47674)" );
.sub 'main' :main
    $P1 = newclass "Foo"
    $P2 = new "Foo"
    $S1 = $P2
    print $S1
.end

.namespace [ "Foo" ]

.sub 'get_string' :vtable
    self.'bar'()
    .return ("stringy thingy\n")
.end

.sub bar :method
    print "called bar\n"
.end
CODE
called bar
stringy thingy
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
