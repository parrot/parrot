#!./parrot
# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

t/op/gc.t - Garbage collection

=head1 SYNOPSIS

    % prove t/op/gc.t

=head1 DESCRIPTION

Tests garbage collection with the C<interpinfo> operation and various
GC related bugs.

=cut

.include 'interpinfo.pasm'

.sub main :main
    .include 'test_more.pir'

    sweep_1()
    sweep_0()
    sweep_0_need_destroy_obj()
    sweep_0_need_destroy_destroy_obj()
    collect_count()
    collect_toggle()
    collect_toggle_nested()
    "stats"()
    vanishing_singleton_PMC()
    vanishing_ret_continuation()
    regsave_marked()
    recursion_and_exceptions()
    write_barrier_1()
    write_barrier_2()
    addr_registry_1()
    addr_registry_2_int()
    pmc_proxy_obj_mark()
    coro_context_ret_continuation()
    # END_OF_TESTS

    "done_testing"()
.end

.sub sweep_1
    $I1 = interpinfo .INTERPINFO_GC_MARK_RUNS  # How many GC mark runs have we done already?
    sweep 1
    $I2 = interpinfo .INTERPINFO_GC_MARK_RUNS  # Should be one more now
    $I3 = $I2 - $I1
    is($I3,1, "sweep_1")
.end


.sub sweep_0
    $I1 = interpinfo .INTERPINFO_GC_MARK_RUNS   # How many GC mark runs have we done already?
    sweep 0
    $I2 = interpinfo .INTERPINFO_GC_MARK_RUNS  # Should be same
    $I3 = $I2 - $I1
    is($I3,0, "sweep_0")
.end


# sweep 0, with object that needs destroy/destroy
.sub sweep_0_need_destroy_obj
    $P0 = new 'Undef'
    $I1 = interpinfo .INTERPINFO_GC_MARK_RUNS   # How many GC mark runs have we done already?
    needs_destroy $P0
    sweep 0
    $I2 = interpinfo .INTERPINFO_GC_MARK_RUNS   # Should be one more now
    $I3 = $I2 - $I1
    is($I3,1, "sweep_0_need_destroy_obj")
.end


# sweep 0, with object that needs destroy/destroy
.sub sweep_0_need_destroy_destroy_obj
    $P0 = new 'Undef'
    needs_destroy $P0
    $I1 = interpinfo .INTERPINFO_GC_MARK_RUNS   # How many GC mark runs have we done already?
    $P0 = new 'Undef'  #kill object
    sweep 0
    $I2 = interpinfo .INTERPINFO_GC_MARK_RUNS   # Should be one more now
    $I3 = $I2 - $I1
    sweep 0
    $I4 = interpinfo .INTERPINFO_GC_MARK_RUNS   # Should be same as last
    $I5 = $I4 - $I2
    is($I3,1, "sweep_0_need_destroy_destroy_obj")
    is($I5,0, "sweep_0_need_destroy_destroy_obj")
.end


.sub collect_count
    $I1 = interpinfo .INTERPINFO_GC_COLLECT_RUNS   # How many garbage collections have we done already?
    collect
    $I2 = interpinfo .INTERPINFO_GC_COLLECT_RUNS  # Should be one more now
    $I3 = $I2 - $I1
    is($I3,1, "collect_count")
.end


.sub collect_toggle
    $I1 = interpinfo .INTERPINFO_GC_COLLECT_RUNS
    collectoff
    collect
    $I2 = interpinfo .INTERPINFO_GC_COLLECT_RUNS
    $I3 = $I2 - $I1
    is($I3,0, "collect_toggle")

    collecton
    collect
    $I4 = interpinfo .INTERPINFO_GC_COLLECT_RUNS
    $I6 = $I4 - $I2
    is($I6,1, "collect_toggle")
.end


.sub collect_toggle_nested
    $I1 = interpinfo .INTERPINFO_GC_COLLECT_RUNS
    collectoff
    collectoff
    collecton
    collect           # This shouldn't do anything...    #'
    $I2 = interpinfo .INTERPINFO_GC_COLLECT_RUNS
    $I3 = $I2 - $I1
    is($I3,0, "collect_toggle_nested")

    collecton
    collect           # ... but this should
    $I4 = interpinfo .INTERPINFO_GC_COLLECT_RUNS
    $I6 = $I4 - $I2
    is($I6,1, "collect_toggle_nested")

.end

.sub "stats"
    $P0 = new ['ResizablePMCArray']
    $P0[5] = 'hello'

    sweep 1
    collect

    $I0 = interpinfo .INTERPINFO_ACTIVE_PMCS
    ok($I0, "Got non-zero number of active PMCs")

    $I1 = interpinfo .INTERPINFO_TOTAL_PMCS
    ok($I0, "Got non-zero number of total PMCs")

    $I2 = $I0 < $I1
    ok($I2, "Number of total PMCs is greater than active")
.end

.sub vanishing_singleton_PMC
    $P16 = new 'Env'
    $P16['Foo'] = 'bar'
    $I16 = 100    #Why 100?
    $I17 = 0

    loop:
	sweep 1
    	_rand()
    	$I17 += 1
    	if $I17 <= $I16 goto loop
.end

.sub _rand
    $P16 = new 'Env'
    $P5 = $P16['Foo']
    is($P5, 'bar', "_rand")
    if $P5 != 'bar' goto err
    .return()
    err:
	print "singleton destroyed .Env = ."
    	$P16 = new 'Env'
    	$S16 = typeof $P16
    	say $S16
.end
# END: vanishing_singleton_PMC


# vanishing return continuation in method calls
.namespace ["Foo"]
.sub init :vtable :method
    ok(1, "entered init()")
    sweep 1
    new $P6, 'String'
    set $P6, "hi"
    self."do_inc"()
    sweep 1
.end

.sub do_inc :method
    sweep 1
    inc self
    sweep 1
    ok(1, "leaving do_inc")
.end

.sub increment :vtable :method
    ok(1, "in __increment")
    sweep 1
.end
.namespace [ ]

.sub vanishing_ret_continuation
    .local pmc o, cl
    cl = newclass 'Foo'
    o = new 'Foo'
    ok(1, "end vanishing_return_continuation")
.end

# END: vanishing_return_continuation



#Fail if regsave is not marked
.namespace ['Source']
.sub get_string :method :vtable # buffer
    $P4  = self
    $P2 = getprop "buffer", $P4
    sweep 1
    unless_null $P2, buffer_ok
    $P2 = new ['Source'; 'Buffer']
    $P3 = new 'String'
    $P3 = 'hello'
    $P2 = setprop 'buf', $P3
    $P4  = setprop 'buffer', $P2
buffer_ok:
    .return($P2)
.end

.namespace ['Source'; 'Buffer']
.sub get_string :method :vtable
    $P4 = self
    sweep 1
    $P2 = getprop "buf", $P4
    $S0 = $P2
    .return($S0)
.end

.namespace [ ]

.sub regsave_marked
    $P0  = newclass 'Source'
    $P1 = newclass ['Source'; 'Buffer']
    $P2 = new 'Source'

    $S1 = $P2
    is($S1, "hello")

    $S1 = $P2        #why are we doing this twice?
    is($S1, "hello")
.end

# end regsave_marked()


# Recursion and exceptions
# NOTE: this did segfault with GC_DEBUG
.sub recursion_and_exceptions
    .local pmc n
    $P0 = getinterp
    $P0."recursion_limit"(10)
    $P0 = newclass "b"
    $P0 = new "b"
    $P1 = new 'Integer'
    $P1 = 0
    n = $P0."b11"($P1)
    ok(1, "recursion_and_exceptions")
    is(n,8, "recursion_and_exceptions")
.end
.namespace ["b"]
.sub b11 :method
    .param pmc n
    .local pmc n1
    # new_pad -1
    # store_lex -1, "n", n
    n1 = new 'Integer'
    n1 = n + 1
    push_eh catch    # we're going to catch an exception when recursion_depth
                     # is too large
    n = self."b11"(n1)
    # store_lex -1, "n", n
    pop_eh
catch:
    # n = find_lex "n"
    .return(n)
.end
.namespace [ ]

# write barrier 1
.sub write_barrier_1
    null $I2
    $I3 = 100
lp3:
    null $I0
    $I1 = 1000
    $P1 = new 'ResizablePMCArray'
lp1:
    $P2 = new 'ResizablePMCArray'
    $P0 = new 'Integer'
    $P0 = $I0
    $P2[0] = $P0
    $P1[$I0] = $P2
    if $I0, not_0
    needs_destroy $P0
    # force marking past $P2[0]
    sweep 0
not_0:
    $P3 = new 'Undef'
    $P4 = new 'Undef'
    inc $I0
    lt $I0, $I1, lp1

    null $I0
    # trace 1
lp2:
    $P2 = $P1[$I0]
    $P2 = $P2[0]
    eq $P2, $I0, ok
    print "nok\n"
    print "I0: "
    print $I0
    print " P2: "
    print $P2
    print " type: "
    $S0 = typeof $P2
    print $S0
    print " I2: "
    print $I2
    print "\n"
    exit 1
ok:
    inc $I0
    lt $I0, $I1, lp2
    inc $I2
    lt $I2, $I3, lp3
    ok(1, "leaving write_barrier_1")
.end


# write barrier 2 - hash
.sub write_barrier_2
    null $I2
    $I3 = 100
lp3:
    null $I0
    $I1 = 100
    $P1 = new 'Hash'
lp1:
    $P2 = new 'Hash'
    $P0 = new 'Integer'
    $P0 = $I0
    $S0 = $I0
    $P2["first"] = $P0
    $P1[$S0] = $P2
    if $I0, not_0
    $P0 = new 'Integer'
    needs_destroy $P0
    null $P0
    # force full sweep
    sweep 0
not_0:
    $P3 = new 'Undef'
    $P4 = new 'Undef'
    inc $I0
    lt $I0, $I1, lp1

    null $I0
    # trace 1
lp2:
    $S0 = $I0
    $P2 = $P1[$S0]
    $P2 = $P2["first"]
    eq $P2, $I0, ok
    print "nok\n"
    print "I0: "
    print $I0
    print " P2: "
    print $P2
    print " type: "
    $S0 = typeof $P2
    print $S0
    print " I2: "
    print $I2
    print "\n"
    exit 1
ok:
    inc $I0
    lt $I0, $I1, lp2
    inc $I2
    lt $I2, $I3, lp3
    ok(1, "leaving write_barrier_2")
.end



# AddrRegistry 1
.sub addr_registry_1
    .local pmc a, reg, nil
    reg = new 'AddrRegistry'
    a = new 'String'
    null nil
    $I0 = reg[a]
    if $I0 == 0 goto ok1
    notok(1)
ok1:
    ok(1, "ok 1")
    reg[a] = nil
    $I0 = reg[a]
    if $I0 == 1 goto ok2
    notok(1)
ok2:
    ok(1, "ok 2")
    reg[a] = nil
    $I0 = reg[a]
    if $I0 == 2 goto ok3
    notok(1)
ok3:
    ok(1, "ok 3")
    delete reg[a]
    $I0 = reg[a]
    if $I0 == 1 goto ok4
    notok(1)
ok4:
    ok(1, "ok 4")
    delete reg[a]
    $I0 = reg[a]
    if $I0 == 0 goto ok5
    notok(1)
ok5:
    ok(1, "ok 5")
.end


# AddrRegistry 2
.sub addr_registry_2_int
    .local pmc a, b, reg, nil
    null nil
    reg = new 'AddrRegistry'
    a = new 'String'
    b = new 'String'
    $I0 = elements reg
    is($I0, 0, "addr_registry_2_int")
    reg[a] = nil
    $I0 = elements reg
    is($I0, 1, "addr_registry_2_int")
    reg[a] = nil
    $I0 = elements reg
    is($I0, 1, "addr_registry_2_int")
    reg[b] = nil
    $I0 = elements reg
    is($I0, 2, "addr_registry_2_int")
.end


# verify pmc proxy object marking
.sub pmc_proxy_obj_mark
    .local pmc cl, s, t
    cl = subclass "String", "X"
    addattribute cl, "o3"
    addattribute cl, "o4"
    s = new "X"
    $P0 = new 'String'
    $S0 = "ok" . " 3"
    $P0 = $S0
    setattribute s, "o3", $P0
    $P0 = new 'String'
    $S0 = "ok" . " 4"
    $P0 = $S0
    setattribute s, "o4", $P0
    null $P0
    null $S0
    null cl
    sweep 1
    s = "ok 1"
    is(s, "ok 1")
    .local int i
    i = 0
lp:
    t = new "X"
    inc i
    if i < 1000 goto lp
    t = "ok 2"
    is(s, "ok 1")
    is(t, "ok 2")
    $P0 = getattribute s, "o3"
    is($P0, "ok 3")
    $P0 = getattribute s, "o4"
    is($P0, "ok 4")
.end


# coro context and invalid return continuations
# this is a stripped down version of imcc/t/syn/pcc_16

.sub coro_context_ret_continuation
    .const 'Sub' $P0 = "co1"
    $I20 = 0
l:
    get_results ''
    set_args ''
    invokecc $P0
    inc $I20
    lt $I20, 3, l
    ok(1, "done\n")
.end

.sub co1
    get_params ''
    $P17 = $P1
col:
    ok(1, "coro\n")
    sweep 1
    yield
    branch col
.end

=head1 SEE ALSO

F<examples/benchmarks/primes.c>,
F<examples/benchmarks/primes.pasm>,
F<examples/benchmarks/primes.pl>,
F<examples/benchmarks/primes2_i.pasm>,
F<examples/benchmarks/primes2.c>,
F<examples/benchmarks/primes2.py>.

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
