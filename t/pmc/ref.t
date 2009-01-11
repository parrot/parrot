#! parrot
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

t/pmc/ref.t - Reference PMC

=head1 SYNOPSIS

    % prove t/pmc/ref.t

=head1 DESCRIPTION

Tests that vtable method delegation works on a C<Ref> PMC.

=cut

.sub main :main
    .include 'test_more.pir'
    plan(41)

    basic_ref_tests()
    setref_tests()
    assign_ref_tests()
    sharedref_tests()
    interface_tests()
    set_get_tests()
    push_pop_tests()
    add_tests()
.end


.sub basic_ref_tests
    new $P2, ['Integer']
    new $P1, ['Ref'], $P2
    ok(1, "Ref creation didn't explode")

    inc $P1
    is($P2, 1, "inc ref incremented the referand")
    is($P1, 1, "inc ref incremented the ref")

    dec $P1
    is($P2, 0, "dec ref decremented the referand")
    is($P1, 0, "dec ref decremented the ref")

    deref $P3, $P1
    typeof $S0, $P1
    is($S0, 'Ref', "Ref has correct type")
    typeof $S0, $P3
    is($S0, 'Integer', "referand has correct type")
.end

.sub setref_tests
    new $P2, ['Integer']
    new $P3, ['Float']
    set $P3, 0.5
    new $P1, ['Ref'], $P2
    inc $P1
    is($P1, 1, "Integer Ref is incremented correctly")
    setref $P1, $P3
    inc $P1
    is($P1, 1.5, "Float Ref (formerly Int Ref) is incremented correctly")
    is($P2, 1, "Int formerly referred to by Ref stays the same")
    is($P3, 1.5, "new Float Ref has right value")
.end

.sub assign_ref_tests
    new $P2, ['Integer']
    new $P3, ['Float']
    set $P2, 0
    set $P3, 0.5
    new $P1, ['Ref'], $P2
    assign $P1, 1
    $S0 = $P1
    #XXX: not sure why the string conversion is needed
    $I0 = $S0 == '1'
    ok(1, "assign'd Ref has correct value")
    assign $P1, $P3
    $S0 = $P1
    $I0 = $S0 == '.5'
    skip(3,'pending new Ref semantic')
    #ok($I0, "assign'd Ref has correct value")
    $S0 = $P2
    $I0 = $S0 == '0'
    #ok($I0, "assign'd Ref has correct value")
    $S0 = $P3
    $I0 = $S0 == '.5'
    #ok($I0, "assign'd Ref has correct value")
.end

.sub sharedref_tests
    new $P2, ['Integer']
    new $P1, ['SharedRef'], $P2
    ok(1, "SharedRef created without explosion")
    set $P1, 4711
    is($P1, 4711, "SharedRef assignment looks good")
    typeof $S0, $P1
    is($S0, "Integer", "SharedRef type looks good")
    set $P1, "hello"
    typeof $S0, $P1
    is($S0, "String", "SharedRef type looks good after type change")
    is($P1, "hello", "SharedRef value looks good after type change")

    new $P2, ['Integer']
    new $P1, ['SharedRef'], $P2
    ok(1, "SharedRef creation didn't explode")
    push_eh eh
    deref $P3, $P1
    pop_eh
    ok(0, "deref of SharedRef didn't cause an exception")
    goto end
eh:
    ok(1, "deref of SharedRef caused an exception")
end:
.end

.sub interface_tests
    .local pmc pmc1
    pmc1 = new ['Array']
    .local pmc pmc2
    pmc2 = new ['Ref'], pmc1
    .local pmc pmc3
    pmc3 = new ['SharedRef'], pmc1
    .local int bool1
    does bool1, pmc2, "scalar"
    is(bool1, 0, "Ref doesn't do scalar")
    does bool1, pmc2, "array"
    is(bool1, 1, "Ref does do array")
    does bool1, pmc2, "no_interface"
    is(bool1, 0, "Ref doesn't do no_interface")

    does bool1, pmc3, "scalar"
    is(bool1, 0, "SharedRef doesn't do scalar")
    does bool1, pmc3, "array"
    is(bool1, 1, "SharedRef does do array")
    does bool1, pmc3, "no_interface"
    is(bool1, 0, "SharedRef doesn't do no_interface")
.end


.sub set_get_tests
    new $P2, ['Integer']
    new $P1, ['Ref'], $P2
    set $P1, 10
    is($P1, 10, "set works on Integer Ref")
    set $I0, $P1
    is($I0, 10, "get works on Integer Ref")

    new $P2, ['Float']
    new $P1, ['Ref'], $P2
    set $P1, 12.5
    set $N0, $P2
    set $N1, 12.5
    is($N0, $N1, "set works on Float Ref")
    set $N2, $P1
    is($N2, $N1, "get works on Float Ref")
.end

.sub push_pop_tests
    new $P2, ['ResizableIntegerArray']
    new $P1, ['Ref'], $P2
    push $P1, 200
    push $P1, -3
    set $I0, $P1
    is($I0, 2, "element count of array via Ref is correct")
    set $I0, $P2
    is($I0, 2, "direct element count of array is correct")
    pop $I1, $P1
    pop $I2, $P1
    is($I1, -3, "first element popped via Ref is correct")
    is($I2, 200, "second element popped via Ref is correct")
    set $I0, $P1
    is($I0, 0, "element count of array via Ref is correct")
.end

.sub add_tests
    new $P2, ['Integer']
    new $P1, ['Ref'], $P2
    set $P1, 10
    add $P1, $P1
    is($P2, 20, "add ref,ref is ok")

    new $P3, ['Integer']
    new $P2, ['Integer']
    new $P1, ['Ref'], $P2
    set $P3, 12
    set $P1, 10
    add $P1, $P3
    is($P2, 22, "add ref,int is ok")

    new $P3, ['Integer']
    new $P2, ['Integer']
    new $P1, ['Ref'], $P2
    set $P3, 12
    set $P1, 10
    add $P4, $P3, $P1
    is($P4, 22, "add dest,int,ref is ok")

    new $P3, ['Integer']
    new $P2, ['Integer']
    new $P1, ['Ref'], $P2
    set $P3, 12
    set $P1, 10
    add $P4, $P1, $P3
    is($P4, 22, "add dest,ref,int is ok")
.end

# Local Variables:
#   mode: pir
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
