#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

.sub main :main
    .include 'test_more.pir'
    plan(20)

    test_different_namespace_declarations()
    test_meth_call_syntax()
    test_meth_call_syntax_m_o_arg()
    test_meth_call_ret_o_m_arg()
    test_meth_call_syntax_string()
    test_initializer()
    test_meth_call_syntax_method_self()
    test_explicit_meth_call_syntax()
    test_explicit_meth_call_syntax_meth_var()
    test_explicit_meth_call_syntax_args()
    test_explicit_meth_call_syntax_2()
    test_meth_call_syntax_reserved_word()
    test_vtable_implies_self()
.end
##############################
# ".namespace" sanity

.sub test_different_namespace_declarations
   lives_ok( <<'CODE', "different namespace declarations")
.namespace ["Foo"]
.namespace [ ]
.namespace []
.namespace [unicode:"»ö«"; ascii:"perl6"]

.sub test
    $I0 = 42
.end
CODE
    # TODO (waiting on TT #1610)
#     throws_substring( '.namespace [$P0]', syn_err, <<'DESC', todo => 'TT #1610' )
# invalid namespace declarations (register)
# DESC
#     throws_substring( '.namespace [1]',   syn_err, <<'DESC', todo => 'TT #1610' )
# invalid namespace declarations (integer)
# DESC
#     throws_substring( '.namespace [1.2]', syn_err, <<'DESC', todo => 'TT #1610' )
# invalid namespace declarations (float)
# DESC
.end

##############################
# Parrot Calling Conventions

.sub test_meth_call_syntax
    .local pmc class
    .local pmc obj
    newclass class, "Foo"
    obj = new "Foo"
    obj.'_meth'()
.end

.namespace [ "Foo" ]
.sub _meth :method
    ok(1, 'meth call syntax')
.end

# reset to default namespace
.namespace []

.sub test_meth_call_syntax_m_o_arg
    .local pmc class
    .local pmc obj
    newclass class, "Foo1"
    obj = new "Foo1"
    $P0 = new 'String'
    $P0 = "ok"
    obj.'_meth1'($P0)
.end

.namespace [ "Foo1" ]
.sub _meth1 :method
    .param pmc s
    is(s, 'ok','meth call syntax m.o(arg)')
.end

# reset to default namespace
.namespace []

.sub test_meth_call_ret_o_m_arg
# meth call ret = o.m(arg)
    .local pmc class
    .local pmc obj
    newclass class, "Foo2"
    obj = new "Foo2"
    $P0 = new 'String'
    $P0 = "ok"
    $S0 = obj.'_meth'($P0)
.end

.namespace [ "Foo2" ]
.sub _meth :method
    .param pmc s
    is(s, 'ok', 'meth call ret = o.m(arg)')
    .begin_return
    .set_return "done\n"
    .end_return
.end

# reset to default namespace
.namespace []

.sub test_meth_call_syntax_string
    .local pmc class
    .local pmc obj
    .local string meth
    meth = "_meth"
    newclass class, "Foo3"
    obj = new "Foo3"
    obj."_meth"()
    set $S10, "_meth"
    obj.$S10()
    set $S10, "_meth"
    obj.$S10()
.end

.namespace [ "Foo3" ]
.sub _meth :method
    ok(1, 'meth call syntax, string')
.end

# reset to default namespace
.namespace []

.sub test_initializer
    newclass $P1, "Foo4"
    subclass $P2, $P1, "Bar1"
    subclass $P3, $P2, "Baz1"
    $P3 = new "Baz1"
    get_global $P0, "_sub"
    invokecc $P0
.end

.namespace ["Foo4"]
.sub init :vtable :method
    ok(1, "initializer: foo_init")
.end

.namespace ["Bar1"]
.sub init :vtable :method
    ok(1, "initializer: bar_init")
.end

.namespace ["Baz1"]
.sub init :vtable :method
    ok(1, "initializer: baz_init")
.end

.namespace [] # main again
.sub _sub
    ok(1, "initializer: in sub")
.end

.sub test_meth_call_syntax_method_self
# meth call syntax - method, self
    .local pmc class
    .local pmc obj
    newclass class, "Foo5"
    obj = new "Foo5"
    obj.'_meth'()
.end

.namespace [ "Foo5" ]
.sub _meth :method
    isa $I0, self, "Foo5"
    if $I0, ok
    ok(0, 'meth call syntax - method, self')
    .return()
  ok:
    ok(1, 'meth call syntax - method, self')
.end

# reset to default namespace
.namespace []

.sub test_explicit_meth_call_syntax
    .local pmc class
    .local pmc obj
    newclass class, "Foo6"
    obj = new "Foo6"
    .begin_call
    .invocant obj
    .meth_call "_meth"
    .end_call
.end

.namespace [ "Foo6" ]
.sub _meth :method
    ok(1, 'explicit meth call syntax')
.end

# reset to default namespace
.namespace []

.sub test_explicit_meth_call_syntax_meth_var
    .local pmc class
    .local pmc obj
    .local string meth
    newclass class, "Foo7"
    obj = new "Foo7"
    meth = "_me"
    meth = meth . "th"  # test concat to
    .begin_call
    .invocant obj
    .meth_call meth
    .end_call
.end

.namespace [ "Foo7" ]
.sub _meth :method
    ok(1, 'explicit meth call syntax, meth var')
.end

# reset to default namespace
.namespace []

.sub test_explicit_meth_call_syntax_args
    .local pmc class
    .local pmc obj
    newclass class, "Foo8"
    obj = new "Foo8"
    .begin_call
    .set_arg "hello"
    .invocant obj
    .meth_call "_meth"
    .get_result $S0
    .end_call
    is($S0, 'ok', 'explicit meth call syntax, args')
.end

.namespace [ "Foo8" ]

.sub _meth :method
    .param string p1
    is(p1, 'hello', 'explicit meth call syntax, args')
    .begin_return
    .set_return "ok"
    .end_return
.end

# reset to default namespace
.namespace []

.sub test_explicit_meth_call_syntax_2
    .local pmc class
    .local pmc obj
    newclass class, "Foo9"
    obj = new "Foo9"
    .begin_call
    .invocant obj
    .meth_call "_meth"
    .end_call
.end

.namespace [ "Foo9" ]
.sub _meth :method
   ok(1, 'explicit meth call syntax')
.end

# reset to default namespace
.namespace []

.sub test_meth_call_syntax_reserved_word
    .local pmc class
    .local pmc obj
    newclass class, "Foo10"
    obj = new "Foo10"
    obj.'open'()
.end

.namespace [ "Foo10" ]
.sub open :method
    ok(1, 'meth call syntax - reserved word')
.end

# reset to default namespace
.namespace []

.sub test_vtable_implies_self
    $P1 = newclass "Foo11"
    $P2 = new "Foo11"
    $S1 = $P2
    is($S1, 'stringy thingy', ':vtable implies self')
.end

.namespace [ "Foo11" ]

.sub 'get_string' :vtable
    self.'bar'()
    .return ("stringy thingy")
.end

.sub bar :method
    ok(1, ":vtable implies self - called bar")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
