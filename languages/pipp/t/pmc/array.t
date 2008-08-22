#! parrot
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id: array.t 25819 2008-02-18 00:16:21Z coke $

=head1 NAME

languages/pipp/t/pmc/array.t - test the PhpArray PMC

=head1 SYNOPSIS

% prove languages/pipp/t/pmc/array.t

=head1 DESCRIPTION

Tests the PhpArray PMC.

=cut

.HLL 'PHP', 'php_group'

.sub main :main
    .include 'include/test_more.pir'

    plan(13)

    basic_get_set()
    stack_and_queue_ops()
    index_increment()
    int_string_convert()
    autovivification_tests()
.end

.sub basic_get_set
    .local pmc p, extra_pmc
    .local int i, j, is_ok
    .local string s
    .local num n

    p = new PhpArray
    s = p
    i = s == 'Array'
    ok(i, "unkeyed get string returns 'Array'")

    p[1234] = 9999
    i = p[1234]
    j = i == 9999
    ok(j, "basic int-keyed get and set")

    p[0] = 'zero'
    p[1] = 'one'
    p[2] = 'three'
    p[3] = 'two'
    p[4] = 'six'
    p[5] = 'four'
    p[7] = 'five'
    p[8] = 'Wait... Where was I again?'
    s = p[7]
    is_ok = s == 'five' #I think so, at least
    ok(is_ok, "multiple int-keyed sets")

    p['one']  = 'billion dollars'
    p['one billion']  = 'dollars'
    p['one billion dollars'] = ''
    p['one']  = 'million dollars' #I hope that billion wasn't important
    p['one million']  = 'dollars'
    p['one million dollars'] = ''
    s = p['one']
    is_ok = s == 'million dollars'
    ok(is_ok, "several string-keyed sets")

    p['qwer'] = 9
    i = p['qwer']
    is_ok = i == 9
    ok(is_ok, "basic string-keyed get and set")

    extra_pmc = new FixedBooleanArray
    extra_pmc = 6
    p['pmc'] = extra_pmc
    p['float'] = 1.12345678
    p['int'] = 1
    p['string'] = 'one'

    extra_pmc = p['pmc']
    i = elements extra_pmc
    unless i == 6 goto basic_set_get_not_ok
    i = extra_pmc[5]
    unless i == 0 goto basic_set_get_not_ok
    n = p['float']
    unless n == 1.12345678 goto basic_set_get_not_ok
    i = p['int']
    unless i == 1 goto basic_set_get_not_ok
    s = p['string']
    unless s == 'one' goto basic_set_get_not_ok

    extra_pmc = new FixedBooleanArray
    extra_pmc = 6
    p[0] = extra_pmc
    p[1] = 1.12345678
    p[2] = 1
    p[3] = 'one'

    extra_pmc = p[0]
    i = elements extra_pmc
    unless i == 6 goto basic_set_get_not_ok
    i = extra_pmc[5]
    unless i == 0 goto basic_set_get_not_ok
    n = p[1]
    unless n == 1.12345678 goto basic_set_get_not_ok
    i = p[2]
    unless i == 1 goto basic_set_get_not_ok
    s = p[3]
    unless s == 'one' goto basic_set_get_not_ok

    goto basic_set_get_ok
basic_set_get_not_ok:
    is_ok = 0
basic_set_get_ok:
    ok( is_ok, "get/set with various key and value types")
.end

.sub stack_and_queue_ops
    .local pmc p, ar
    .local int is_ok, i
    .local string s
    .local num n

    p = new PhpArray
    ar = new ResizableIntegerArray
    ar[0] = 1234321
    ar[6] = 9876543

    is_ok = 1
    push p, "foo"
    push p, 2.222
    push p, -2
    push p, ar
    ar = pop p
    i = elements ar
    unless i == 7 goto push_pop_not_ok
    i = ar[6]
    unless i == 9876543 goto push_pop_not_ok
    i = pop p
    unless i == -2 goto push_pop_not_ok
    n = pop p
    unless n == 2.222 goto push_pop_not_ok
    s = pop p
    unless s == 'foo' goto push_pop_not_ok

    goto push_pop_ok

push_pop_not_ok:    
    is_ok = 0

push_pop_ok:
    ok(is_ok, "push/pop with various values")

    p = new PhpArray
    is_ok = 1

    unshift p, "foo"
    unshift p, 2.222
    unshift p, -2
    unshift p, ar

    ar = shift p
    i = elements ar
    unless i == 7 goto unshift_shift_not_ok
    i = shift p
    unless i == -2 goto unshift_shift_not_ok
    n = shift p
    unless n == 2.222 goto unshift_shift_not_ok
    s = shift p
    unless s == 'foo' goto unshift_shift_not_ok

    goto unshift_shift_ok

unshift_shift_not_ok:
    is_ok = 0

unshift_shift_ok:
    ok(is_ok, "unshift_shift with various values")

.end

.sub index_increment
    .local pmc p, it, key
    .local string s
    .local int i, is_ok

    p = new PhpArray
    is_ok = 1

    p[-124] = 0 #next_index should be 0  (assign -124)
    push p, 0   #next_index should be 1  (assign 0)
    p[-5] = 0   #no change               (assign -5)
    push p, 0   #next_index should be 2  (assign 1)
    p[9] = 0    #next_index should be 10 (assign 9)
    p[5] = 0    #no change               (assign 5)
    push p, 0   #next_index should be 11 (assign 10)

    it = iter p
    key = shift it
    unless key == -124 goto ii_not_ok
    key = shift it
    unless key == 0 goto ii_not_ok
    key = shift it
    unless key == -5 goto ii_not_ok
    key = shift it
    unless key == 1 goto ii_not_ok
    key = shift it
    unless key == 9 goto ii_not_ok
    key = shift it
    unless key == 5 goto ii_not_ok
    key = shift it
    unless key == 10 goto ii_not_ok

    goto ii_end
ii_not_ok:
    is_ok = 0
ii_end:
    ok(is_ok, "automatic index increment")
.end

.sub int_string_convert
    .local pmc p
    .local string s
    .local int is_ok

    p = new PhpArray
    p[1] = 'fo' #as in shizzle
    s = p['1']
    is_ok = s == 'fo'
    ok(is_ok, "int -> string conversion for indicies")

    p['1'] = 'correct'
    p['01'] = 'alternative view of correctness' #a.k.a. wrong
    s = p[1]
    is_ok = s == 'correct'
    ok(is_ok, "string -> int conversion for indicies")

.end


.sub autovivification_tests
    .local pmc p
    .local int i, is_ok
    .local string s

    p = new PhpArray

    p["one";2;3;"four";"five";6;7] = "magic"
    s = p["one";2;3;"four";"five";6;7]
    is_ok = s == "magic"
    ok(is_ok, "desireable autovivification happen")

    p['foo'] = 'bix'
    i = exists p['foo';'bar';'buzzed']
    delete p['this';'element';'does';'not';'exist']
    p['this';'element'] = 'does'
    i = elements p
    is_ok = i == 3
    ok(is_ok, "unwanted autovivifications don't happen")

.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
