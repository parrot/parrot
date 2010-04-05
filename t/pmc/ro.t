#! parrot
# Copyright (C) 2006-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/ro.t -- tests read-only value support

=head1 SYNOPSIS

    % prove t/pmc/ro.t

=head1 DESCRIPTION

Tests automatically generated read-only PMC support.

=cut

.namespace []

.include "except_types.pasm"

.sub make_readonly
    .param pmc arg
    .local pmc one
    one = new ['Integer']
    one = 1
    setprop arg, '_ro', one
.end

.sub make_writable
    .param pmc arg
    .local pmc zero
    zero = new ['Integer']
    zero = 0
    setprop arg, '_ro', zero
.end

.sub main :main
    .include 'test_more.pir'

    plan(13)

    integer_set_read_only_is_not_writable() # 1 test
    integer_set_read_only_can_be_read()     # 6 tests
    integer_stays_integer()                 # 1 test
    integer_add()                           # 1 test
    complex_i_add()                         # 1 test
    resizablepmcarray_non_recursive_part()  # 1 test
    objects()                               # 1 test
    resizablepmcarray_recursive()           # 1 test
.end

.sub integer_set_read_only_is_not_writable
    .local pmc foo, eh

    foo = new ['Integer']
    foo = 42

    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_WRITE_TO_CONSTCLASS)
    set_addr eh, eh_label

    make_readonly(foo)
    push_eh eh
    foo = 43
    pop_eh
    ok( 0, "integer_set_read_only_is_not_writable" )
    goto end

  eh_label:
    .local string message
    .get_results($P0)
    message = $P0['message']
    is( message, "set_integer_native() in read-only instance of 'Integer'", "integer_set_read_only_is_not_writable" )
  end:
.end

.sub integer_set_read_only_can_be_read
    .local pmc foo
    .local pmc tmp

    foo = new ['Integer']
    foo = 42

    make_readonly(foo)
    is(foo, 42, 'foo initialised to 42 is readable after make_readonly')
    $I0 = foo
    is($I0, 42, 'foo copied to int correctly')
    $S0 = foo
    is($S0, 42, 'foo copied to string correctly')

    tmp = new ['Integer']
    add tmp, foo, foo
    is(tmp, 84, 'foo can be added to foo correctly and stored elsewhere')

    $P0 = foo
    add foo, foo, foo
    is(foo, 84, 'foo can be added to foo correctly and stored to foo')

    is($P0, 42, 'copied foo retains its value')
.end

.sub integer_stays_integer
    .local pmc foo

    foo = new ['Integer']
    foo = 42

    make_readonly(foo)
    typeof $S0, foo
    is($S0, 'Integer', 'integer_stays_integer')
.end

.sub integer_add
    .local pmc foo, eh

    foo = new ['Integer']
    foo = 42

    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_WRITE_TO_CONSTCLASS)
    set_addr eh, eh_label

    make_readonly(foo)
    push_eh eh
    foo += 16
    pop_eh

    ok(0, 'integer_add')
    goto end

  eh_label:
    .local string message
    .get_results($P0)
    message = $P0['message']
    is( message, "i_add_int() in read-only instance of 'Integer'", 'integer_add' )
  end:
.end

.sub complex_i_add
    .local pmc foo, eh

    foo = new ['Complex']
    foo[0] = 1.0
    foo[1] = 1.0

    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_WRITE_TO_CONSTCLASS)
    set_addr eh, eh_label

    make_readonly(foo)
    push_eh eh
    add foo, 4
    pop_eh
    ok( 0, 'complex_i_add')
    goto end

  eh_label:
    .local string message
    .get_results($P0)
    message = $P0['message']
    is( message, "i_add_int() in read-only instance of 'Complex'", 'complex_i_add' )
  end:
.end

.sub resizablepmcarray_non_recursive_part
    .local pmc foo, three, four, eh

    foo = new ['ResizablePMCArray']
    three = new ['Integer']
    three = 3
    four = new ['Integer']
    four = 4

    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_WRITE_TO_CONSTCLASS)
    set_addr eh, eh_label

    foo = 3
    foo[0] = three
    foo[1] = three
    foo[2] = three
    make_readonly(foo)

    push_eh eh
    foo[0] = four
    pop_eh

    ok(0, 'resizablepmcarray_non_recursive_part')
    goto end

  eh_label:
    .local string message
    .get_results($P0)
    message = $P0['message']
    is( message, "set_pmc_keyed_int() in read-only instance of 'ResizablePMCArray'", 'resizablepmcarray_non_recursive_part' )
  end:
.end

.sub objects
    .local pmc fooclass, foo, eh, i

    i = new ['Integer']
    i = 1

    eh = new ['ExceptionHandler']
    eh.'handle_types'(.EXCEPTION_WRITE_TO_CONSTCLASS)
    set_addr eh, eh_label

    fooclass = newclass 'Foo'
    addattribute fooclass, 'bar'
    foo = new ['Foo']
    setattribute foo, 'bar', i
    make_readonly(foo)
    inc i

    push_eh eh
    setattribute foo, 'bar', i
    pop_eh

    ok( 0, 'objects')
    goto end

  eh_label:
    .local string message
    .get_results($P0)
    message = $P0['message']
    is( message, "set_attr_str() in read-only instance of 'Foo'", 'objects' )
  end:
.end

.sub resizablepmcarray_recursive
    .local pmc foo
    .local pmc three
    .local pmc four

    foo = new ['ResizablePMCArray']
    three = new ['Integer']
    three = 3

    foo = 1
    foo[0] = three

    make_readonly(foo)

    four = foo[0]
    four = 4
    four = foo[0]
    is(four, 4, 'TT #1036 - readonly should be shallow')
.end



# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
