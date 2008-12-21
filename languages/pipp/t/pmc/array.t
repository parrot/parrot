#! ../../parrot
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/array.t - test the PhpArray PMC

=head1 SYNOPSIS

    perl t/harness t/pmc/array.t

=head1 DESCRIPTION

Tests the PhpArray PMC.

=cut

.loadlib 'php_group'

.sub main :main
    .include 'include/test_more.pir'

    plan(91)

    cached_string_hashval_workaround()
    basic_get_set()
    stack_and_queue_ops()
    index_increment()
    string_to_int_key_conversion()
    autovivification_tests()
    exists_delete_tests()
    generic_iterator_tests_string_key()
    generic_iterator_tests_pmc_key()
    php_iterator_tests()
    php_array_func_tests()
    cmp_shallow_native()
    cmp_order_test()
    cmp_deep_native()
    equals_shallow_native()
    equals_deep_native()
    assign_pmc_shallow_native()
    assign_pmc_deep_native()
    add_pmc_shallow_native()
    #print_r_deep()
    vanilla_freeze_thaw()
    goofy_freeze_thaw()
.end

#workaround for bug addressed in RT #59810.
.sub cached_string_hashval_workaround
    .local pmc p
    p = new 'PhpArray'
    p.'next'()
    p.'prev'()
    p.'current'()
    p.'end'()
    p.'key'()
    p.'current'()
    p.'each'()
    p.'sanity_check'()
.end

.sub basic_get_set
    .local pmc p, extra_pmc
    .local int i, j, is_ok
    .local string s
    .local num n

    p = new 'PhpArray'
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

    extra_pmc = new 'FixedBooleanArray'
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

    extra_pmc = new 'FixedBooleanArray'
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

    p = new 'PhpArray'
    ar = new 'ResizableIntegerArray'
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

    p = new 'PhpArray'
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

    p = new 'PhpArray'
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

.sub string_to_int_key_conversion
    .local pmc p
    .local string s
    .local int is_ok

    p = new 'PhpArray'
    p[1] = 'fo' #as in shizzle
    s = p['1']
    is_ok = s == 'fo'
    ok(is_ok, "int -> string conversion for indicies")

    p['1'] = 'correct'
    p['01'] = 'alternative view of correctness' #a.k.a. wrong
    s = p[1]
    is_ok = s == 'correct'
    ok(is_ok, "string -> int conversion for indicies")

    p = new 'PhpArray'
    p[0]  = 'x'
    s = get_repr p
    is(s, '{0: x}', "output from get_repr looks good")

    p = new 'PhpArray'
    p['00']  = 'x'
    s = get_repr p
    is(s, '{"00": x}', "string->int conversion doesn't convert '00'")

    p = new 'PhpArray'
    p['-0']  = 'x'
    s = get_repr p
    is(s, '{"-0": x}', "string->int conversion doesn't convert '-0'")

    p = new 'PhpArray'
    p['04']  = 'x'
    s = get_repr p
    is(s, '{"04": x}', "string->int conversion doesn't convert '04'")

    p = new 'PhpArray'
    p['0']  = 'x'
    s = get_repr p
    is(s, '{0: x}', "string->int conversion converts '0' to 0")

    p = new 'PhpArray'
    p['-1']  = 'x'
    s = get_repr p
    is(s, '{-1: x}', "string->int conversion converts '-1'")

    p = new 'PhpArray'
    p['99999999999999999999999'] = 'x' #check for overflow
    s = get_repr p
    is(s, '{"99999999999999999999999": x}', "string->int conversion doesn't convert '99999999999999999999999'")

    p = new 'PhpArray'
    p['-7']  = 'x'
    s = get_repr p
    is(s, '{-7: x}', "string->int conversion converts '-7'")

    p = new 'PhpArray'
    p['7']   = 'x'
    s = get_repr p
    is(s, '{7: x}', "string->int conversion converts '7'")

    p = new 'PhpArray'
    p['100'] = 'x'
    s = get_repr p
    is(s, '{100: x}', "string->int conversion converts '100'")
.end


.sub autovivification_tests
    .local pmc p_av, p
    .local int i_av, i, is_ok
    .local string s, s_av
    .local num n_av

    p = new 'PhpArray'

    p["one";2;3;"four";"five";6;7] = "magic"
    s_av = p["one";2;3;"four";"five";6;7]
    is_ok = s_av == "magic"
    ok(is_ok, "desireable autovivification happens (string)")

    p = new 'PhpArray'

    p["one";2;3;"four";"five";6;7] = 86
    i_av = p["one";2;3;"four";"five";6;7]
    is_ok = i_av == 86
    ok(is_ok, "desireable autovivification happens (int)")

    p = new 'PhpArray'
    p_av = new 'String'
    p_av = "whiskey"

    p["one";2;3;"four";"five";6;7] = p_av
    p_av = p["one";2;3;"four";"five";6;7]
    s = p_av
    is_ok = s == "whiskey"
    ok(is_ok, "desireable autovivification happens (pmc)")

    p = new 'PhpArray'

    p["one";2;3;"four";"five";6;7] = 1.001
    n_av = p["one";2;3;"four";"five";6;7]
    is_ok = n_av == 1.001
    ok(is_ok, "desireable autovivification happens (float)")

    p['foo'] = 'bix'
    i = exists p['foo';'bar';'buzzed']
    delete p['this';'element';'does';'not';'exist']
    p['this';'element'] = 'does'
    i = elements p
    is_ok = i == 3
    ok(is_ok, "unwanted autovivification doesn't happen")

.end


.sub exists_delete_tests
    .local pmc p
    .local int is_ok, i

    p = new 'PhpArray'
    p['asf'] = 8
    is_ok = exists p['asf']
    ok(is_ok, "shallow string-keyed exists")

    p[8] = 'asf'
    is_ok = exists p[8]
    ok(is_ok, "shallow int-keyed exists")

    p['this';'thingy';9] = 'exists'
    is_ok = exists p['this';'thingy';9]
    ok(is_ok, "deep keyed exists")

    delete p['asf']
    i = exists p['asf']
    is_ok = !i
    ok(is_ok, "shallow string-keyed delete")

    delete p[8]
    i = exists p[8]
    is_ok = !i
    ok(is_ok, "shallow int-keyed delete")

    delete p['this']
    i = exists p['this';'thingy';9]
    is_ok = !i
    ok(is_ok, "deep keyed delete")

.end

.sub generic_iterator_tests_string_key
    .local pmc p, it
    .local string s, val_str
    .local int is_ok

    p = new 'PhpArray'
    p['asdf'] = 'im '
    p[444444] = 'not in '
    p[0]      = 'ur '
    p[-1234]  = 'iterator '
    p[-1233]  = 'ideradin '
    p[-1235]  = 'ur '
    p['y']    = 'valuze.'

    #overwrite old values without changing the internal order
    p[444444] = 'in '
    p[-1234]  = 'iderayder '

    it = iter p
iter_loop:
    unless it goto iter_done
    val_str = shift it
    val_str = p[val_str]
    concat s, val_str
    goto iter_loop

iter_done:
    is_ok = s == 'im in ur iderayder ideradin ur valuze.'
    ok(is_ok, "basic iterator test (string key)")

.end

.sub generic_iterator_tests_pmc_key
    .local pmc p, it, val
    .local string s, val_str
    .local int is_ok

    p = new 'PhpArray'
    p['asdf'] = 'im '
    p[444444] = 'not in '
    p[0]      = 'ur '
    p[-1234]  = 'iterator '
    p[-1233]  = 'ideradin '
    p[-1235]  = 'ur '
    p['y']    = 'valuze.'

    #overwrite old values without changing the internal order
    p[444444] = 'in '
    p[-1234]  = 'iderayder '

    it = iter p
iter_loop:
    unless it goto iter_done
    val = shift it
    val_str = p[val]
    concat s, val_str
    goto iter_loop

iter_done:
    is_ok = s == 'im in ur iderayder ideradin ur valuze.'
    ok(is_ok, "basic iterator test (pmc_key)")

.end

.sub php_iterator_tests
    .local pmc p, it, val, pair
    .local string s, val_str, s1, s2
    .local int is_ok

    p = new 'PhpArray'

    p["skip"] = "/dev/null"
    p[9]      = "Beware the Jabberwock"
    p['nein'] = ", my son!\nT"
    p['delete'] = "me"
    p['-234'] = "he jaws that bite, the claws"
    p[234]    = " that catch!"
    p[0]      = "\n"
    push p,     ", and shun\n"
    p[999]    = "the unbeliever!11!! SHUUUNNN!!11!!" #whoops
    p["abc"]  = "uhkashflkdfhsa"
    p["9000"] = "The frumious "
    p["wx"]   = "Bender"
    p["o"]    = "snatch!"
    push p,     "Beware the Jubjub bird"
    push p,     "the end"

    delete p['delete']

    p.'next'()
    p.'reset'()
    p.'next'()
    p.'next'()
    it = iter p
    p.'prev'()


    val = shift it
    val_str = p[val]
    concat s, val_str
    val = shift it
    val_str = p[val]
    concat s, val_str
    p.'reset'()
    p.'next'()
    p.'next'()
    p.'next'()
    val = shift it
    val_str = p[val]
    concat s, val_str
    p.'prev'()
    p.'next'()
    val = shift it
    val_str = p[val]
    concat s, val_str
    val = shift it
    val_str = p[val]
    concat s, val_str
    p.'end'()
    p.'prev'()
    val = shift it
    val_str = p[val]
    concat s, val_str
    p.'prev'()
    p.'prev'()
    p.'prev'()
    p.'prev'()
    p.'prev'()
    p.'prev'()
    p.'prev'()
    val = shift it
    val_str = p[val]
    concat s, val_str

    p.'next'()
    p.'next'()
    val = shift it
    val_str = p[val]
    concat s, val_str

    p['wx'] = 'Bander'
    val = shift it
    val_str = p[val]
    concat s, val_str

    val = shift it
    val_str = p[val]
    concat s, val_str

    is_ok = s == "Beware the Jabberwock, my son!\nThe jaws that bite, the claws that catch!\nBeware the Jubjub bird, and shun\nThe frumious Bandersnatch!"
    ok(is_ok, "iterator fun with next/prev/end/reset")


    is_ok = 1
    p = new 'PhpArray'
    p['a'] = "p['a']"
    p['b'] = "p['b']"
    p[3]   = "p[3]"

    it = iter p
    p.'end'()
    val = shift it

    if it goto not_done_but_should_be
    goto done_and_should_be
not_done_but_should_be:
    is_ok = 0
done_and_should_be:
    ok(is_ok, "using next at inopportune times w/o an iter loop")

    is_ok = 1
    p.'reset'()
    s = ""

    it = iter p

iter_test_loop:
    unless it goto iter_test_done
    val = shift it
    p.'next'()
    val_str = p[val]
    concat s, val_str
    goto iter_test_loop

iter_test_done:
    is_ok = s == "p['a']p[3]"
    ok(is_ok, "using next at inopportune times in an iter loop")


    s = ''
    p = new 'PhpArray'
    push p, 'SKIP'
    push p, 'I '
    push p, 'SKIP'
    push p, 'wish '
    push p, 'SKIP'
    push p, 'I '
    push p, 'SKIP'
    push p, 'were '
    push p, 'SKIP'
    push p, 'a '
    push p, 'SKIP'
    push p, 'jellyfish.'

    it = iter p
iter_skip_loop:
    unless it goto iter_skip_done
    p.'next'()
    val_str = shift it
    val_str = p[val_str]
    concat s, val_str
    goto iter_skip_loop
iter_skip_done:

    is_ok = s == 'I wish I were a jellyfish.'
    ok(is_ok, "using next in an iter loop")


    is_ok = 1
    p = new 'PhpArray'
    push p, "This "
    push p, "is "
    push p, "yet "
    push p, "another "
    push p, "iterator "
    push p, "test."

    pair = p.'each'()
    is_ok = exists pair[0]
    unless is_ok goto each_test_not_ok
    is_ok = exists pair[1]
    unless is_ok goto each_test_not_ok
    is_ok = exists pair['key']
    unless is_ok goto each_test_not_ok
    is_ok = exists pair['value']
    unless is_ok goto each_test_not_ok
    s1 = pair[0]
    s2 = pair['key']
    unless s1 == s2 goto each_test_not_ok
    s1 = pair[1]
    s2 = pair['value']
    unless s1 == s2 goto each_test_not_ok

    goto each_test_ok
each_test_not_ok:
    is_ok = 0
each_test_ok:
    ok(is_ok, "each() behaves as expected")

    is_ok = 1
    s = ''
    p.'reset'()
each_iter_loop:
    pair = p.'each'()
    unless pair goto each_iter_end
    val_str = pair['value']
    concat s, val_str
    goto each_iter_loop

each_iter_end:
    is_ok = s == "This is yet another iterator test."
    ok(is_ok, "iterating using each")

.end

.sub php_array_func_tests
    .local pmc p
    .local string s
    .local int is_ok

    p = new 'PhpArray'
    p['pears']        = 'pear tree'
    p['donuts']       = 'donut tree' #they're healthy if they grow on trees
    p['cheezburgers'] = 'cheezburger tree' #DO WANT

    s = p.'key'()
    s = p.'key'() #make sure there are no side-effects
    unless s == 'pears' goto current_and_key_not_ok
    s = p.'current'()
    s = p.'current'()
    unless s == 'pear tree' goto current_and_key_not_ok

    p.'next'()
    s = p.'key'()
    unless s == 'donuts' goto current_and_key_not_ok
    s = p.'current'()
    unless s == 'donut tree' goto current_and_key_not_ok

    goto current_and_key_ok
current_and_key_not_ok:
    is_ok = 0
current_and_key_ok:
    ok(is_ok, "current() and key() work properly")
.end

.sub cmp_shallow_native
    .local pmc p1, p2
    .local int i, j, is_ok

    p1 = new 'PhpArray'
    p2 = new 'PhpArray'
    i = cmp p1, p2
    is_ok = i == 0
    ok(is_ok, "cmp empty phparrays")
    i = cmp p1, p1
    is_ok = i == 0
    ok(is_ok, "cmp empty phparray against itself")

    p1['quux'] = 90
    p1[23141]  = 1.0202
    p1['awfe'] = 0
    p1['poi']  = 'sdfeww'

    p2['poi']  = 'sdfeww'
    p2['awfe'] = 0
    p2['quux'] = 90
    p2[23141]  = 1.0202

    i = cmp p1, p2
    is_ok = ! i
    ok(is_ok, "cmp similar phparrays with different ordering (a)")
    i = cmp p2, p1
    is_ok = ! i
    ok(is_ok, "cmp similar phparrays with different ordering (b)")

    p1['adfwef'] = 'adfwef'
    is_ok = cmp p1, p2
    ok(is_ok, "cmp different phparrays (different size, a)")
    is_ok = cmp p2, p1
    ok(is_ok, "cmp different phparrays (different size, b)")

    p2['adfwef'] = 'ADFWEF'
    is_ok = cmp p1, p2
    ok(is_ok, "cmp different phparrays (same size, a)")
    is_ok = cmp p2, p1
    ok(is_ok, "cmp different phparrays (same size, b)")

    p2['adfwef'] = 'adfwef'
    i = cmp p1, p2
    is_ok = ! i
    ok(is_ok, "cmp similar phparrays again (a)")
    i = cmp p2, p1
    is_ok = ! i
    ok(is_ok, "cmp similar phparrays again (b)")
.end

.sub cmp_order_test
    .local pmc p1, p2
    .local int is_ok, i

    #note: This is how Zend PHP works.  Try the following for fun:
    #$a['a'] = 1; $a['b'] = 2; $b['b'] = 1; $b['a'] = 2;
    #if ($a > $b) echo "a > b\n"; if ($b > $a) echo "b > a\n";
    #if ($a < $b) echo "a < b\n"; if ($b < $a) echo "b < a\n";

    p1 = new 'PhpArray'
    p2 = new 'PhpArray'
    p1['a'] = 1
    p1['b'] = 2
    p2['b'] = 1
    p2['a'] = 2

    i = cmp p1, p2
    is_ok = i == -1
    ok(is_ok, "goofy cmp check, part 1")
    i = cmp p2, p1
    is_ok = i == -1
    ok(is_ok, "goofy cmp check, part 2")
.end

.sub cmp_deep_native
    .local pmc p1, p1a, p1b, p1c, p1d
    .local pmc p2, p2a, p2b, p2c, p2d
    .local int is_ok, i, j

    p1 = new 'PhpArray'
    p1a = new 'PhpArray' #empty
    p1b = new 'PhpArray'
    p1c = new 'PhpArray' #empty
    p1d = new 'PhpArray'

    p2 = new 'PhpArray'
    p2a = new 'PhpArray' #empty
    p2b = new 'PhpArray'
    p2c = new 'PhpArray' #empty
    p2d = new 'PhpArray'

    p1['a'] = 1.2
    p1[2]   = 'c'
    p1[4]   = p1a #empty
    p1['w'] = 'x'
    p1['c'] = p1b
    p1[4;5;6;7;8] = 9

    p1b['a'] = p1c #empty
    p1b['b'] = p1d
    p1b['c'] = ''

    p1d['w'] = 2.5
    p1d['x'] = 6

    is_ok = cmp p1, p2
    ok(is_ok, "cmp deep vs empty (a)")
    is_ok = cmp p2, p1
    ok(is_ok, "cmp deep vs empty (b)")

    p2['a'] = 1.2
    p2[2]   = 'c'
    p2[4]   = p2a #empty
    p2['w'] = 'x'
    p2['c'] = p2b
    p2[4;5;6;7;8] = 8 #different

    is_ok = cmp p1, p2
    ok(is_ok, "cmp deep vs deep, not same (a)")
    is_ok = cmp p2, p1
    ok(is_ok, "cmp deep vs deep, not same (b)")

    p2b['a'] = p2c #empty
    p2b['b'] = p2d
    p2b['c'] = ''

    p2d['w'] = 2.5
    p2d['x'] = 6

    is_ok = cmp p1, p2
    ok(is_ok, "cmp deep vs deep, almost same (a)")
    is_ok = cmp p2, p1
    ok(is_ok, "cmp deep vs deep, almost same (b)")

    p2[4;5;6;7;8] = 9

    i = cmp p1, p2
    is_ok = ! i
    ok(is_ok, "cmp deep vs deep, same (a)")
    i = cmp p2, p1
    is_ok = ! i
    ok(is_ok, "cmp deep vs deep, same (b)")

    p2[4;5;6;7;7] = ''

    is_ok = cmp p1, p2
    ok(is_ok, "cmp deep vs deep, different again (a)")
    is_ok = cmp p2, p1
    ok(is_ok, "cmp deep vs deep, different again (b)")

    i = cmp p1, p1
    is_ok = ! i
    ok(is_ok, "cmp a deep array against itself")
.end

.sub equals_shallow_native
    .local pmc p1, p2
    .local int i, j, is_ok

    p1 = new 'PhpArray'
    p2 = new 'PhpArray'
    is_ok = p1 == p2
    ok(is_ok, "eq empty arrays")

    p1['quux'] = 90
    p1[23141]  = 1.0202
    p1['awfe'] = 0
    p1['poi']  = 'sdfeww'

    p2['poi']  = 'sdfeww'
    p2['awfe'] = 0
    p2['quux'] = 90
    p2[23141]  = 1.0202

    is_ok = p1 == p2
    ok(is_ok, "eq similar phparrays with different ordering (a)")
    is_ok = p2 == p1
    ok(is_ok, "eq similar phparrays with different ordering (b)")

    p1['adfwef'] = 'adfwef'
    is_ok = 1
    i = p1 == p2
    is_ok = ! i
    ok(is_ok, "eq different phparrays (different size, a)")
    i = p2 == p1
    is_ok = ! i
    ok(is_ok, "eq different phparrays (different size, b)")

    p2['adfwef'] = 'ADFWEF'
    is_ok = 1
    i = p1 == p2
    is_ok = ! i
    ok(is_ok, "eq different phparrays (same size, a)")
    i = p2 == p1
    is_ok = ! i
    ok(is_ok, "eq different phparrays (same size, b)")

    p2['adfwef'] = 'adfwef'
    is_ok = p1 == p2
    ok(is_ok, "eq similar phparrays again (a)")
    is_ok = p2 == p1
    ok(is_ok, "eq similar phparrays again (b)")
.end


.sub equals_deep_native
    .local pmc p1, p1a, p1b, p1c, p1d
    .local pmc p2, p2a, p2b, p2c, p2d
    .local int is_ok, i, j

    p1 = new 'PhpArray'
    p1a = new 'PhpArray' #empty
    p1b = new 'PhpArray'
    p1c = new 'PhpArray' #empty
    p1d = new 'PhpArray'

    p2 = new 'PhpArray'
    p2a = new 'PhpArray' #empty
    p2b = new 'PhpArray'
    p2c = new 'PhpArray' #empty
    p2d = new 'PhpArray'

    p1['a'] = 1.2
    p1[2]   = 'c'
    p1[4]   = p1a #empty
    p1['w'] = 'x'
    p1['c'] = p1b
    p1[4;5;6;7;8] = 9

    p1b['a'] = p1c #empty
    p1b['b'] = p1d
    p1b['c'] = ''

    p1d['w'] = 2.5
    p1d['x'] = 6

    i = p1 == p2
    is_ok = ! i
    ok(is_ok, "eq deep vs empty (a)")
    i = p2 == p1
    is_ok = ! i
    ok(is_ok, "eq deep vs empty (b)")

    p2['a'] = 1.2
    p2[2]   = 'c'
    p2[4]   = p2a #empty
    p2['w'] = 'x'
    p2['c'] = p2b
    p2[4;5;6;7;8] = 8 #different

    i = p1 == p2
    is_ok = ! i
    ok(is_ok, "eq deep vs deep, not same (a)")
    i = p2 == p1
    is_ok = ! i
    ok(is_ok, "eq deep vs deep, not same (b)")

    p2b['a'] = p2c #empty
    p2b['b'] = p2d
    p2b['c'] = ''

    p2d['w'] = 2.5
    p2d['x'] = 6

    i = p1 == p2
    is_ok = ! i
    ok(is_ok, "eq deep vs deep, almost same (a)")
    i = p2 == p1
    is_ok = ! i
    ok(is_ok, "eq deep vs deep, almost same (a)")

    p2[4;5;6;7;8] = 9

    i = p1 == p2
    ok(is_ok, "cmp deep vs deep, same (a)")
    i = p2 == p1
    ok(is_ok, "cmp deep vs deep, same (b)")

    p2[4;5;6;7;7] = ''

    i = p1 == p2
    is_ok = ! i
    ok(is_ok, "cmp deep vs deep, different again (a)")
    i = p2 == p1
    is_ok = ! i
    ok(is_ok, "cmp deep vs deep, different again (b)")
.end


.sub assign_pmc_shallow_native
    .local pmc p1, p2, it, p1_key, p1_val, p2_val
    .local int is_ok, i, j

    p1 = new 'PhpArray'
    p2 = new 'PhpArray'

    p1['abc'] = 123
    p1['abq'] = 1.2
    p1['abthing'] = 'some string'
    p1[1] = 'a'
    p1[0] = 1.9
    p1[999] = 'foooo'

    assign p2, p1

    i = elements p2
    is_ok = i == 6
    ok(is_ok, "assigned pmc has correct element count")

    is_ok = 1
    it = iter p1
iter_loop:
    unless it goto iter_done
    unless is_ok goto iter_done
    p1_key = shift it
    is_ok = exists p2[p1_key]
    unless is_ok goto iter_done
    p2_val = p2[p1_key]
    p1_val = p1[p1_key]
    is_ok = p1_val == p2_val
    unless is_ok goto iter_done

    goto iter_loop
iter_done:
    ok(is_ok, "assigned pmc has correct key/value pairs")
.end


.sub assign_pmc_deep_native
    .local pmc p1, p2, it, p1_key, p1_val, p2_val
    .local int is_ok, i, j

    p1 = new 'PhpArray'
    p2 = new 'PhpArray'

    p1['a';'x';'w'] = 1234
    p1['a';'x';'x'] = 1.24
    p1['a';'x';'y'] = "1234"
    p1['d';5] = 'qwerty'
    p1['e';8] = 9.999
    p1['f';19] = 4
    p1['g'] = 7315
    p1['h'] = 78.58
    p1['i'] = "w"

    assign p2, p1

    i = elements p2
    is_ok = i == 7
    ok(is_ok, "assigned pmc has correct element count")

    is_ok = 1
    it = iter p1
iter_loop:
    unless it goto iter_done
    unless is_ok goto iter_done
    p1_key = shift it
    is_ok = exists p2[p1_key]
    unless is_ok goto iter_done
    p2_val = p2[p1_key]
    p1_val = p1[p1_key]
    is_ok = p1_val == p2_val
    unless is_ok goto iter_done

    goto iter_loop
iter_done:
    ok(is_ok, "assigned pmc has correct key/value pairs")
.end

.sub add_pmc_shallow_native
    .local pmc p1, p2, p3, it, val
    .local int is_ok, i, max
    .local string s, val_str

    p1 = new 'PhpArray'
    p2 = new 'PhpArray'

    p1[0] = 'i_add '
    p1[1] = 'appears '
    p1[2] = 'to '
    p1[3] = 'be '
    p1[4] = 'working '
    p2[4] = 'horribly broken and not at all working '
    p2[5] = 'correctly'
    p2[6] = '.'

    p1 += p2
    it = iter p1
i_add_loop:
    unless it goto i_add_loop_end
    val = shift it
    val_str = p1[val]
    concat s, val_str
    goto i_add_loop
i_add_loop_end:

    is_ok = s == 'i_add appears to be working correctly.'
    ok(is_ok, "i_add adds elements correctly")


    p1 = new 'PhpArray'
    p2 = new 'PhpArray'
    s = ''

    p1[0] = 'add '
    p1[1] = 'appears '
    p1[2] = 'to '
    p1[3] = 'be '
    p1[4] = 'working '
    p2[4] = 'horribly broken and not at all working '
    p2[5] = 'correctly'
    p2[6] = '.'

    p3 = p1 + p2
    it = iter p3
add_loop:
    unless it goto add_loop_end
    val = shift it
    val_str = p3[val]
    concat s, val_str
    goto add_loop
add_loop_end:

    is_ok = s == 'add appears to be working correctly.'
    ok(is_ok, "add adds elements correctly")
.end

.sub print_r_deep
    .local pmc p1
    .local string is, should_be
    .local int is_ok
    .local num n

    p1 = new 'PhpArray'

    p1['first']  = 1
    #XXX: this gets rounded
    n = 99999.999
    p1['second'] = n
    p1['third']  = "quux"
    p1["\"\"quoted\" quote's quotes\""]  = "'more' \"quoted\" quotes"

    p1['aa';'a'] = 987
    #XXX: this gets rounded
    p1['aa';'b'] = 3.31234242
    p1['aa';'v'] = 'typo'

    p1[11;1] = 'one'
    p1[11;11] = 11
    p1[11;111] = 111.111

    p1[4] = 'are we there yet'
    p1[5] = 'no'

    p1[1] = 6
    p1[2] = .666
    p1[3] = 'seven'

    p1[6] = 'are we there yet'
    p1[7] = 'no'

    p1['aaa';'a';1] = 'twas brillig'
    p1['aaa';'a';'a'] = 0
    p1[111;1;'a'] = 'generator'
    p1[111;1;0]   = 65537

    p1[8] = 'are we there yet'
    p1[9] = 'yes'

    is = get_repr p1
    should_be = <<'SHOULD_BE'
Array
(
    [first] => 1
    [second] => 99999.999
    [third] => quux
    [""quoted" quote's quotes"] => 'more' "quoted" quotes
    [aa] => Array
        (
            [a] => 987
            [b] => 3.31234242
            [v] => typo
        )

    [11] => Array
        (
            [1] => one
            [11] => 11
            [111] => 111.111
        )

    [4] => are we there yet
    [5] => no
    [1] => 6
    [2] => 0.666
    [3] => seven
    [6] => are we there yet
    [7] => no
    [aaa] => Array
        (
            [a] => Array
                (
                    [1] => twas brillig
                    [a] => 0
                )

        )

    [111] => Array
        (
            [1] => Array
                (
                    [a] => generator
                    [0] => 65537
                )

        )

    [8] => are we there yet
    [9] => yes
)
SHOULD_BE

    is_ok = is == should_be
    ok(is_ok, "get_repr output looks ok")
.end

.sub vanilla_freeze_thaw

    .local pmc p, thawed, it, key
    .local string frozen, msg, s, expected

    p = new 'PhpArray'
    p[0] = "Freeze "
    p[-234232] = "and "
    push p, "thaw "
    p['fooo'] = "seem "
    p['bar'] = "to "
    p[999] = "be "
    p['google'] = 'doing '
    p['what'] = 'what '
    p[2] = 'they '
    p[4] = 'should.'

    frozen = freeze p
    thawed = thaw frozen

    it = iter thawed
    msg = ''
    expected = "Freeze and thaw seem to be doing what they should."
iter_loop:
    unless it goto iter_end
    key = shift it
    s = thawed[key]
    concat msg, s
    goto iter_loop
iter_end:
    is(msg, expected, msg)
.end


.sub goofy_freeze_thaw

    .local pmc p, thawed, it, key
    .local string frozen, msg, s, expected

    p = new 'PhpArray'
    p[-1] = "It is not true that "
    p[0] = "Freeze "
    p[-234232] = "and "
    push p, "thaw "
    p['fooo'] = "seem "
    p['bar'] = "to "
    p[999] = "be "
    p['google'] = 'doing '
    p['what'] = 'what '
    p[2] = 'they '
    p[4] = 'should.'

    #make sure the position of internalPointer is stored correctly
    p.'next'()
    frozen = freeze p
    thawed = thaw frozen

    it = iter thawed
    msg = ''
    expected = "Freeze and thaw seem to be doing what they should."
iter_loop:
    unless it goto iter_end
    key = shift it
    s = thawed[key]
    concat msg, s
    goto iter_loop
iter_end:
    is(msg, expected, msg)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
