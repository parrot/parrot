#! parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/namepspace-subs.t - test NameSpace PMC

=head1 SYNOPSIS

    % prove t/pmc/namespace-subs.t

=head1 DESCRIPTION

Tests subroutines stored in the NameSpace PMC, specifically focusing on the
specified behavior for :method, :vtable, :nsentry, and :anon.

=cut

.namespace []

.sub 'main' :main
    .include 'test_more.pir'
    plan(17)
    anon_sub_and_method()
    anon_vtable()
    store_method()
    store_nsentry()
    store_multisub()
.end


# Subs marked with :anon should not be stored in the namespace. Methods marked
# with :anon should not be stored in the class.

.sub 'anon_sub_and_method'
    $P2 = get_hll_global ['AnonTest'], 'anonsub'
    is_null($P2, "Anon sub not stored in namespace")

    $P0 = newclass 'AnonTest'
    $P1 = new 'AnonTest'

    push_eh method_not_in_namespace
    $I1 = $P1.'anonmethod'()
    ok(0, "Anon method not stored in class")
    pop_eh
    goto failed
  method_not_in_namespace:
    ok(1, "Anon method not stored in class")
  failed:

    $P2 = get_hll_global ['AnonTest'], 'anonmethod'
    is_null($P2, "Anon method not stored in namespace")

.end

# Vtable overrides marked with :anon should be stored in the class anyway. See
# RT #44471
.sub 'anon_vtable'
    $P1 = new 'AnonTest'

    $I0 = $P1
    is($I0, 414, "Anon vtable override stored in class")
.end


# Methods should not be stored in the namespace. See TT #389.
.sub 'store_method'
    $P0 = newclass 'MethodTest'
    $P1 = new 'MethodTest'

    $I1 = $P1.'methodtest'()
    is($I1, 75, "Invoked stored method")

    $P2 = get_hll_global ['MethodTest'], 'methodtest'
    is_null($P2, "Method not stored in namespace")
.end

.sub 'store_nsentry'
    $P0 = newclass 'NsentryTest'
    $P1 = new 'NsentryTest'

    $I1 = $P1.'nsentrymethodtest'()
    is($I1, 63, "Invoked nsentry method")

    $P2 = get_hll_global ['NsentryTest'], 'renamedmethod'
    isa_ok($P2, "Sub", "Nsentry method stored in namespace")

    $I2 = $P1.$P2()
    is($I2, 63, "Invoked nsentry method from namespace")

    $P3 = get_hll_global ['NsentryTest'], 'renamedsub'
    isa_ok($P3, "Sub", "Nsentry sub stored in namespace")

    $I3 = $P3()
    is($I3, 36, "Invoked nsentry sub from namespace")

    $P4 = get_hll_global ['NsentryTest'], 'renamedvtable'
    isa_ok($P4, "Sub", "Nsentry vtable stored in namespace")

    $I4 = $P4()
    is($I4, 363, "Invoked nsentry vtable from namespace")
.end

.sub 'store_multisub'
    $P1 = get_hll_global ['MultiSubTest'], 'multisubtest'
    isa_ok($P1, "MultiSub", "Multi sub stored in namespace")

    $S1 = $P1(7)
    is($S1, "called int variant", "Multi sub int stored in namespace")

    $S2 = $P1('foo')
    is($S2, "called string variant", "Multi sub string stored in namespace")

    $S3 = $P1(5.5)
    is($S3, "called num variant", "Anon multi sub num stored in namespace")

.end

.namespace ['AnonTest']
.sub 'anonsub' :anon
    .return(14)
.end

.sub 'anonmethod' :anon :method
    .return(41)
.end

.sub 'get_integer' :anon :vtable
    .return(414)
.end


.namespace ['MethodTest']
.sub 'methodtest' :method
    .return(75)
.end

.namespace ['NsentryTest']
.sub 'nsentrymethodtest' :method :nsentry('renamedmethod')
    .return(63)
.end
.sub 'nsentrysubtest' :nsentry('renamedsub')
    .return(36)
.end
.sub 'nsentryvtabletest' :nsentry('renamedvtable')
    .return(363)
.end

.namespace ['MultiSubTest']
.sub 'multisubtest' :multi(int)
   .return("called int variant")
.end
.sub 'multisubtest' :multi(string)
   .return("called string variant")
.end
.sub 'multisubtest' :anon :multi(num)
   .return("called num variant")
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
