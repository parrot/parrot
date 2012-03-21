#!./parrot
# Copyright (C) 2008-2010, Parrot Foundation.

.include 'load_bytecode.pir'

.sub 'init_test_builder_tester'
    '__load_bytecode'('Test/Builder/Tester.pbc')

    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace
    test_namespace = get_root_namespace [ 'parrot'; 'Test'; 'Builder'; 'Tester' ]
    exports        = split ' ', 'plan test_out test_diag test_test'
    test_namespace.'export_to'( curr_namespace, exports )
.end

.sub 'init_test_more'
    '__load_bytecode'('runtime/parrot/library/Test/More.pbc')

    # get the testing functions
    .local pmc exports, curr_namespace, test_namespace
    curr_namespace = get_namespace [ 'Foo' ]
    test_namespace = get_root_namespace [ 'parrot'; 'Test'; 'More' ]
    exports        = split ' ', 'diag ok is is_deeply like isa_ok skip'

    test_namespace.'export_to'(curr_namespace, exports)
.end

.sub 'init_test_class'
    '__load_bytecode'('Test/Class.pbc')
.end

.sub 'main' :main
    init_test_builder_tester()
    init_test_more()
    init_test_class()

    .local pmc class
    class = subclass [ 'Test'; 'Class' ], 'Foo'

    .local pmc obj
    obj = class.'new'()

    plan( 1 )
    test_out( '1..13' )
    test_out( 'ok 1 - startup called' )
    test_out( 'ok 2 - setup one' )
    test_out( 'ok 3 - setup two' )
    test_out( 'ok 4 - foo first' )
    test_out( 'ok 5 - foo second' )
    test_out( 'ok 6 - foo third' )
    test_out( 'ok 7 - tearing down' )
    test_out( 'ok 8 - setup one' )
    test_out( 'ok 9 - setup two' )
    test_out( 'ok 10 - bar second' )
    test_out( 'ok 11 - bar third' )
    test_out( 'ok 12 - tearing down' )
    test_out( 'ok 13 - shutdown called' )

    obj.'runtests'()

    test_test( 'tests run in proper order, test plan expressed, tests wrapped' )
.end

.namespace [ 'Foo' ]

.sub 'init' :vtable :method
    self.'add_startup'( 'startup',   'tests' => 1 )
    self.'add_shutdown'( 'shutdown', 'tests' => 1 )
    self.'add_setup'( 'setup',       'tests' => 2 )
    self.'add_teardown'( 'teardown', 'tests' => 1 )
    self.'add_test'( 'test_foo',     'tests' => 3 )
    self.'add_test'( 'test_bar',     'tests' => 2 )
.end

.sub 'startup' :method
    ok( 1, 'startup called' )
.end

.sub 'shutdown' :method
    ok( 1, 'shutdown called' )
.end

.sub 'setup' :method
    ok( 1, 'setup one' )
    ok( 1, 'setup two' )
.end

.sub 'teardown' :method
    ok( 1, 'tearing down' )
.end

.sub 'test_foo' :method
    ok( 1, 'foo first' )
    ok( 2, 'foo second' )
    ok( 3, 'foo third' )
.end

.sub 'test_bar' :method
    ok( 4, 'bar second' )
    ok( 5, 'bar third' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
