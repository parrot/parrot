#! ../../parrot

.include 't/common.pir'

.sub 'main' :main
    .include 'test_more.pir'
    load_bytecode 'vtdumper.pbc'

    plan(48)
    comments()
    valid_functions()
    invalid_functions()
    function_parsing()
.end

.sub comments
    .local pmc parse_tests

    parse_tests = new ['Hash']

    parse_tests['comments: before function'] = <<"VTABLE"
#HAVE A NICE DAY
void do_foo()
VTABLE

    parse_tests['comments: after function'] = <<"VTABLE"
void do_foo()
#I've got a lovely bunch of coconuts.
VTABLE

    parse_tests['comments: with function'] = <<"VTABLE"
void do_foo() #This is an important function that does important things.
VTABLE

    test_parse_loop(parse_tests, 0)

.end


.sub valid_functions
    .local pmc parse_tests

    parse_tests = new ['Hash']

    parse_tests['valid: void retval, no args'] = <<"VTABLE"
void do_foo()
VTABLE

    parse_tests['valid: void retval, 1 simple arg'] = <<"VTABLE"
void do_foo(INTVAL i)
VTABLE

    parse_tests['valid: void retval, 2 simple args'] = <<"VTABLE"
void do_foo(INTVAL i, FLOATVAL j)
VTABLE

    parse_tests['valid: void retval, 3 simple args'] = <<"VTABLE"
void do_foo(FLOATVAL f, INTVAL i, INTVAL j)
VTABLE

    parse_tests['valid: simple retval, no args'] = <<"VTABLE"
INTVAL do_foo()
VTABLE

    parse_tests['valid: pointer retval, no args'] = <<"VTABLE"
PMC* do_foo()
VTABLE

    parse_tests['valid: void pointer retval, no args'] = <<"VTABLE"
void* do_foo()
VTABLE

    parse_tests['valid: alt. pointer retval, no args'] = <<"VTABLE"
PMC *do_foo()
VTABLE

    parse_tests['valid: void retval, 1 pointer arg'] = <<"VTABLE"
void do_foo(PMC *p)
VTABLE

    parse_tests['valid: void retval, 2 pointer args'] = <<"VTABLE"
void do_foo(PMC *p, STRING* s)
VTABLE

    parse_tests['valid: void retval, 3 pointer args'] = <<"VTABLE"
void do_foo(PMC *p, STRING *s, void *s)
VTABLE

    parse_tests['valid: pointer retval, mixed args 1'] = <<"VTABLE"
PMC* do_foo(INTVAL i, PMC* p, STRING* s)
VTABLE

    test_parse_loop(parse_tests, 0)

.end

.sub invalid_functions
    .local pmc parse_tests

    parse_tests = new ['Hash']

    parse_tests['invalid: void void retval'] = <<"VTABLE"
void void do_foo()
VTABLE

    parse_tests['invalid: bad pointer retval 1'] = <<"VTABLE"
*PMC do_foo(INTVAL i)
VTABLE

    parse_tests['invalid: bad pointer retval 2'] = <<"VTABLE"
PMC *PMC do_foo()
VTABLE

    parse_tests['invalid: unicorns'] = <<"VTABLE"
PMC* do_foo(unicorns)
VTABLE

    parse_tests['invalid: bad first arg'] = <<"VTABLE"
PMC *do_foo(PMC*)
VTABLE

    parse_tests['invalid: bad second arg'] = <<"VTABLE"
PMC *do_foo(INTVAL i, k, INTVAL q)
VTABLE

    parse_tests['invalid: space in function name'] = <<"VTABLE"
PMC *do foo()
VTABLE

    test_parse_loop(parse_tests, 1)

.end


.sub function_parsing
    .local pmc parse_test

    parse_test = new ['String']

    parse_test = <<"VTABLE"
PMC0* do_foo(INTVAL i, FLOATVAL j, SPECIALVAL k)
INTVAL0 do_bar(PMC1* p1, PMC2* p2)
INTVAL1 quuxle(PMC3* p3, PMC4* p4)
VTABLE

    .local pmc past
    past = get_past(parse_test)

    .local pmc do_foo, do_bar, quuxle, args
    do_foo = past[0]
    do_bar = past[1]
    quuxle = past[2]


    #test do_foo
    #PMC0* do_foo(INTVAL i, FLOATVAL j, SPECIALVAL k)

    $S0 = do_foo['name']
    is($S0, 'do_foo', "do_foo name")

    $S0 = do_foo['returns']
    is($S0, "PMC0* ", "do_foo return type")

    $I0 = do_foo['parameters']
    is($I0, 3, "do_foo arg count")

    $S0 = do_foo['parameter_list']
    is($S0, "INTVAL i, FLOATVAL j, SPECIALVAL k", "do_foo arg list")

    $S0 = do_foo['parameters';0;'type';'identifier']
    is($S0, "INTVAL", "do_foo first arg type")

    $S0 = do_foo['parameters';0;'identifier']
    is($S0, "i", "do_foo first arg name")

    $S0 = do_foo['parameters';1;'type';'identifier']
    is($S0, "FLOATVAL", "do_foo second arg type")

    $S0 = do_foo['parameters';1;'identifier']
    is($S0, "j", "do_foo second arg name")

    $S0 = do_foo['parameters';2;'type';'identifier']
    is($S0, "SPECIALVAL", "do_foo third arg type")

    $S0 = do_foo['parameters';2;'identifier']
    is($S0, "k", "do_foo third arg name")


    #test do_bar
    #INTVAL0 do_bar(PMC1* p1, PMC2* p2)

    $S0 = do_bar['name']
    is($S0, 'do_bar', "do_bar name")

    $S0 = do_bar['returns']
    is($S0, "INTVAL0 ", "do_bar return type")

    $I0 = do_bar['parameters']
    is($I0, 2, "do_bar arg count")

    $S0 = do_bar['parameter_list']
    is($S0, "PMC1* p1, PMC2* p2", "do_bar arg list")

    $S0 = do_bar['parameters';0;'type']
    is($S0, "PMC1* ", "do_bar first arg type")

    $S0 = do_bar['parameters';0;'identifier']
    is($S0, "p1", "do_bar first arg name")

    $S0 = do_bar['parameters';1;'type']
    is($S0, "PMC2* ", "do_bar second arg type")

    $S0 = do_bar['parameters';1;'identifier']
    is($S0, "p2", "do_bar second arg name")


    #test quuxle
    #INTVAL1 quuxle(PMC3* p3, PMC4* p4)

    $S0 = quuxle['name']
    is($S0, 'quuxle', "quuxle name")

    $S0 = quuxle['returns']
    is($S0, "INTVAL1 ", "quuxle return type")

    $I0 = quuxle['parameters']
    is($I0, 2, "quuxle arg count")

    $S0 = quuxle['parameter_list']
    is($S0, "PMC3* p3, PMC4* p4", "quuxle arg list")

    $S0 = quuxle['parameters';0;'type']
    is($S0, "PMC3* ", "quuxle first arg type")

    $S0 = quuxle['parameters';0;'identifier']
    is($S0, "p3", "quuxle first arg name")

    $S0 = quuxle['parameters';1;'type']
    is($S0, "PMC4* ", "quuxle second arg type")

    $S0 = quuxle['parameters';1;'identifier']
    is($S0, "p4", "quuxle second arg name")

.end


# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
