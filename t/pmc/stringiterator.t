#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/stringiterator.t - StringIterator.

=head1 SYNOPSIS

    % prove t/pmc/stringiterator.t

=head1 DESCRIPTION

Tests the C<StringIterator> PMC. Iterate over string in both directions.

=cut

.include 'iterator.pasm'

.sub main :main
    .include 'test_more.pir'

    plan(24)

    test_clone()
    test_elements()
    iterate_forward() # 11 tests
    iterate_backward() # 8 tests
    iterate_wrong() # 1 test
    iterate_out() # 1 test

.end

.sub 'test_clone'
    .local pmc s, it, itc
    .local int nit, nitc

    s = new ['String']
    s = 'somestring'
    it = iter s
    # Get a clone and make sure both the original and the clone
    # gets marked.
    sweep 1
    nit = elements it
    itc = clone it
    sweep 1
    nitc = elements itc
    is(nit, nitc, "clone has same length as original")
.end

.sub test_elements
    .local string s
    .local pmc ps, it
    .local int ns, nit

    s = 'someotherstring'
    ps = new ['String']
    ps = s
    it = iter ps
    ns = length s
    nit = elements it
    is(ns, nit, "iter elements is equal to string length")
    nit = it
    is(ns, nit, "iter get_integer is equal to string length")
.end

.sub 'iterate_forward'
    .local pmc s, it

    s = new ['String']

    it = iter s
    nok(it, "Iterator for empty string is empty")
    $I0 = isa it, 'Iterator'
    ok($I0, "Have proper type")

    s  = "bar"
    it = s

    it = iter s
    ok(it, "Iterator for 'bar' is not empty")
    $S0 = shift it
    ok(it, "Can shift 1st character")
    is($S0, 'b', "With correct value")

    $S0 = it[0]
    is($S0, 'a', "can get string keyed int correct value")

    $S0 = shift it
    ok(it, "Can shift 2nd character")
    is($S0, 'a', "With correct value")

    $P0 = shift it
    nok(it, "Iterator is finished after 3rd shift")
    is($P0, 'r', "3rd character has correct value as PMC")

    $I0 = 1
    push_eh fail
    $P0 = shift it
    $I0 = 0
  fail:
    pop_eh:
    ok($I0, "Shifting from finished iterator throws exception")

.end

.sub 'iterate_backward'
    .local pmc s, it

    s = new ['String']
    s = 'BAZ'

    it = iter s
    it = .ITERATE_FROM_END
    ok(it, "Iterator reset to backward iteration")

    $S0 = pop it
    ok(it, "Can shift 1st character")
    is($S0, 'Z', "With expected value")

    $S0 = pop it
    ok(it, "Can shift 2nd character")
    is($S0, 'A', "With expected value")

    $P0 = pop it
    nok(it, "Iterator is finished after third shift")
    is($P0, 'B', "3rd element has correct value as PMC")

    $I0 = 1
    push_eh fail
    $P0 = pop it
    $I0 = 0
  fail:
    pop_eh
    ok($I0, "Shifting from finished iterator throws exception")
.end

.sub 'iterate_wrong'
    .local pmc s, it, ex
    .local int r

    s = new ['String']
    s = 'BAZ'

    it = iter s
    push_eh catch_wrong
    it = 42 # Let's hope we'll never have such direction
    r = 0
    goto dotest
catch_wrong:
    .get_results(ex)
    finalize ex
    pop_eh
    r = 1
dotest:
    ok(r, "Caught wrong direction")
.end

# out of bounds conditions not covered by previous tests
.sub 'iterate_out'
    .local pmc s, it, eh
    s = new ['String']
    s = 'hi'
    it = iter s
    .local string rs
    rs = shift it
    rs = shift it
    eh = new ['ExceptionHandler']
    push_eh eh

    # shift string
    set_addr eh, catch1
    rs = shift it
    goto fail
catch1:
    finalize eh

    # shift integer
    set_addr eh, catch2
    .local int ri
    ri = shift it
    goto fail
catch2:
    finalize eh

t3:
    # pop string
    set_addr eh, catch3
    .local int ri
    rs = pop it
    goto fail
catch3:
    finalize eh

    # pop integer
    set_addr eh, catch4
    .local int ri
    ri = pop it
    goto fail
catch4:
    finalize eh

    ok(1, "Caught out of bounds iterations")
    goto end
fail:
    ok(0, "Out of bounds iteration should throw")
end:
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
