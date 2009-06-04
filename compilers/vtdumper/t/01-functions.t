#! ../../parrot

.include 't/common.pir'

.sub 'main' :main
    .include 'test_more.pir'
    load_bytecode 'vtdumper.pbc'

    plan(19)
    valid_functions()
    invalid_functions()
.end

.sub valid_functions
    .local pmc parse_tests

    parse_tests = new ['Hash']

    parse_tests['valid: void retval, no args'] =<<"VTABLE"
void do_foo()
VTABLE

    parse_tests['valid: void retval, 1 simple arg'] =<<"VTABLE"
void do_foo(INTVAL i)
VTABLE

    parse_tests['valid: void retval, 2 simple args'] =<<"VTABLE"
void do_foo(INTVAL i, FLOATVAL j)
VTABLE

    parse_tests['valid: void retval, 3 simple args'] =<<"VTABLE"
void do_foo(FLOATVAL f, INTVAL i, INTVAL j)
VTABLE

    parse_tests['valid: simple retval, no args'] =<<"VTABLE"
INTVAL do_foo()
VTABLE

    parse_tests['valid: pointer retval, no args'] =<<"VTABLE"
PMC* do_foo()
VTABLE

    parse_tests['valid: void pointer retval, no args'] =<<"VTABLE"
void* do_foo()
VTABLE

    parse_tests['valid: alt. pointer retval, no args'] =<<"VTABLE"
PMC *do_foo()
VTABLE

    parse_tests['valid: void retval, 1 pointer arg'] =<<"VTABLE"
void do_foo(PMC *p)
VTABLE

    parse_tests['valid: void retval, 2 pointer args'] =<<"VTABLE"
void do_foo(PMC *p, STRING* s)
VTABLE

    parse_tests['valid: void retval, 3 pointer args'] =<<"VTABLE"
void do_foo(PMC *p, STRING *s, void *s)
VTABLE

    parse_tests['valid: pointer retval, mixed args 1'] =<<"VTABLE"
PMC* do_foo(INTVAL i, PMC* p, STRING* s)
VTABLE

    .local pmc it, key
    .local string vtable, test_result

    it = iter parse_tests
  iter_loop:
    unless it goto iter_done
    key = shift it
    vtable = parse_tests[key]
    test_result = 'test_parse_one'(vtable)
    is(test_result, '', key)
    goto iter_loop
  iter_done:

.end

.sub invalid_functions
    .local pmc parse_tests

    parse_tests = new ['Hash']

    parse_tests['invalid: void void retval'] =<<"VTABLE"
void void do_foo()
VTABLE

    parse_tests['invalid: bad pointer retval 1'] =<<"VTABLE"
*PMC do_foo(INTVAL i)
VTABLE

    parse_tests['invalid: bad pointer retval 2'] =<<"VTABLE"
PMC *PMC do_foo()
VTABLE

    parse_tests['invalid: unicorns'] =<<"VTABLE"
PMC* do_foo(unicorns)
VTABLE

    parse_tests['invalid: bad first arg'] =<<"VTABLE"
PMC *do_foo(PMC*)
VTABLE

    parse_tests['invalid: bad second arg'] =<<"VTABLE"
PMC *do_foo(INTVAL i, k, INTVAL q)
VTABLE

    parse_tests['invalid: space in function name'] =<<"VTABLE"
PMC *do foo()
VTABLE

    .local pmc it, key
    .local string vtable, test_result

    it = iter parse_tests
  iter_loop:
    unless it goto iter_done
    key = shift it
    vtable = parse_tests[key]
    test_result = 'test_parse_one'(vtable)
    isnt(test_result, '', key)
    goto iter_loop
  iter_done:

.end

# Don't forget to update plan!

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
