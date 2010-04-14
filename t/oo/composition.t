#! parrot
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/oo/compositon.t - test role composition

=head1 SYNOPSIS

    % prove t/oo/compositon.t

=head1 DESCRIPTION

Tests role composition in the OO implementation.

=cut

.sub main :main
    .include 'except_types.pasm'
    .include 'test_more.pir'
    plan(45)

    role_with_no_methods()
    role_with_one_method_no_methods_in_class()
    two_roles_and_a_class_a_method_each_no_conflict()
    two_roles_that_conflict()
    role_that_conflicts_with_a_class_method()
    conflict_resolution_by_exclusion()
    conflict_resolution_by_aliasing_and_exclude()
    conflict_resolution_by_resolve()
    role_that_does_a_role()
    conflict_from_indirect_role()
    multi_composition()
.end

.sub badger :method :nsentry('badger')
    .return('Badger!')
.end
.sub badger2 :method :nsentry('badger2')
    .return('Second Badger!')
.end
.sub mushroom :method :nsentry('mushroom')
    .return('Mushroom!')
.end
.sub snake :method :nsentry('snake')
    .return('Snake!')
.end
.sub fire
    .return("You're FIRED!")
.end
.sub fire2
    .return('BURNINATION!')
.end
.sub give_payrise
    .return('You all get a pay rise of 0.0005%.')
.end

.sub role_with_no_methods
    $P0 = new 'Role'
    $P1 = new 'Class'

    $P1.'add_role'($P0)
    ok(1, 'added role')

    $P2 = $P1.'roles'()
    $I0 = elements $P2
    is($I0, 1, 'roles list has the role')

    $P2 = $P1.'new'()
    ok(1, 'instantiated class with composed role')
.end

.sub role_with_one_method_no_methods_in_class
    $P0 = new 'Role'
    $P1 = new 'Class'

    $P2 = get_global "badger"
    $P0.'add_method'("badger", $P2)
    ok(1, 'added method to a role')

    $P1.'add_role'($P0)
    ok(1, 'composed role into the class')

    $P2 = $P1.'roles'()
    $I0 = elements $P2
    is($I0, 1, 'roles list has the role')

    $P2 = $P1.'new'()
    ok(1, 'instantiated class with composed role')

    $S0 = $P2.'badger'()
    is($S0, 'Badger!', 'called method composed from role')
.end

.sub two_roles_and_a_class_a_method_each_no_conflict
    $P0 = new 'Role'
    $P1 = new 'Role'
    $P2 = new 'Class'

    $P3 = get_global "snake"
    $P2.'add_method'("snake", $P3)
    ok(1, 'class has a method')

    $P3 = get_global "badger"
    $P0.'add_method'("badger", $P3)
    $P2.'add_role'($P0)
    ok(1, 'composed first role into the class')

    $P3 = get_global "mushroom"
    $P1.'add_method'("mushroom", $P3)
    $P2.'add_role'($P1)
    ok(1, 'composed second role into the class')

    $P3 = $P2.'new'()
    ok(1, 'instantiated class')

    $S0 = $P3.'badger'()
    is($S0, 'Badger!', 'called method from first role')

    $S1 = $P3.'mushroom'()
    is($S1, 'Mushroom!', 'called method from second role')

    $S2 = $P3.'snake'()
    is($S2, 'Snake!', 'called method from class')
.end

.sub two_roles_that_conflict
    .local pmc eh
    $P0 = new 'Role'
    $P1 = new 'Role'
    $P2 = new 'Class'

    $P3 = get_global "badger"
    $P0.'add_method'("badger", $P3)
    $P2.'add_role'($P0)
    ok(1, 'composed first role into the class')

    $P3 = get_global "badger2"
    $P1.'add_method'("badger", $P3)

  try:
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_ROLE_COMPOSITION_METHOD_CONFLICT)
    set_addr eh, catch

    push_eh eh
    $P2.'add_role'($P1)
    $I0 = 1
    goto finally

  catch:
    $I0 = 0

  finally:
    pop_eh
    nok($I0, 'composition failed due to conflict')
.end

.sub role_that_conflicts_with_a_class_method
    .local pmc eh
    $P0 = new 'Role'
    $P1 = new 'Class'

    $P2 = get_global "badger"
    $P1.'add_method'("badger", $P2)
    ok(1, 'class has a method')

    $P2 = get_global "badger2"
    $P0.'add_method'("badger", $P2)

  try:
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_ROLE_COMPOSITION_METHOD_CONFLICT)
    set_addr eh, catch

    push_eh eh
    $P1.'add_role'($P0)
    $I0 = 1
    goto finally

  catch:
    $I0 = 0

  finally:
    pop_eh
    nok($I0, 'composition failed due to conflict')
.end

.sub conflict_resolution_by_exclusion
    $P0 = new 'Role'
    $P1 = new 'Class'

    $P2 = get_global "badger"
    $P1.'add_method'("badger", $P2)
    ok(1, 'class has a method')

    $P2 = get_global "badger2"
    $P0.'add_method'("badger", $P2)
    $P2 = get_global "snake"
    $P0.'add_method'("snake", $P2)
    $P3 = new 'ResizableStringArray'
    push $P3, "badger"
    $P1.'add_role'($P0, 'exclude_method' => $P3)
    ok(1, 'composition worked due to exclusion')

    $P2 = $P1.'new'()
    $S0 = $P2.'badger'()
    is($S0, 'Badger!', 'called method from class')

    $S1 = $P2.'snake'()
    is($S1, 'Snake!', "called method from role that wasn't excluded")
.end

.sub conflict_resolution_by_aliasing_and_exclude
    $P0 = new 'Role'
    $P1 = new 'Class'

    $P2 = get_global 'badger'
    $P1.'add_method'('badger', $P2)
    ok(1, 'class has a method')

    $P2 = get_global 'badger2'
    $P0.'add_method'('badger', $P2)
    $P2 = get_global 'snake'
    $P0.'add_method'('snake', $P2)
    $P3 = new 'Hash'
    $P3['badger'] = 'role_badger'
    $P4 = new 'ResizableStringArray'
    $P4[0] = 'badger'
    $P1.'add_role'($P0, 'alias_method' => $P3, 'exclude_method' => $P4)
    ok(1, 'composition worked due to aliasing and exclude')

    $P2 = $P1.'new'()
    $S0 = $P2.'badger'()
    is($S0, 'Badger!', 'called method from class')

    $S1 = $P2.'snake'()
    is($S1, 'Snake!', "called method from role that wasn't aliased")

    $S2 = $P2.'role_badger'()
    is($S2, 'Second Badger!', 'called method from role that was aliased')
.end

.sub conflict_resolution_by_resolve
    $P0 = new 'Role'
    $P1 = new 'Class'

    $P3 = new 'ResizableStringArray'
    push $P3, 'badger'
    $P1.'resolve_method'($P3)
    ok(1, 'set resolve list')

    $P4 = $P1.'resolve_method'()
    $S0 = $P4[0]
    is($S0, 'badger', 'got resolve list and it matched')

    $P2 = get_global 'badger'
    $P1.'add_method'('badger', $P2)
    ok(1, 'class has a method')

    $P2 = get_global 'badger2'
    $P0.'add_method'('badger', $P2)
    $P2 = get_global 'snake'
    $P0.'add_method'('snake', $P2)
    $P1.'add_role'($P0)
    ok(1, 'composition worked due to resolve')

    $P2 = $P1.'new'()
    $S1 = $P2.'badger'()
    is($S1, 'Badger!', 'called method from class')

    $S2 = $P2.'snake'()
    is($S2, 'Snake!', "called method from role that wasn't resolved")
.end

.sub role_that_does_a_role
    .local pmc PHB, Manage, FirePeople

    FirePeople = new 'Role'
    $P0 = get_global 'fire'
    FirePeople.'add_method'("fire", $P0)

    Manage = new 'Role'
    $P0 = get_global 'give_payrise'
    Manage.'add_method'("give_payrise", $P0)
    Manage.'add_role'(FirePeople)
    ok(1, 'adding one role to another happens')

    PHB = new 'Class'
    PHB.'add_role'(Manage)
    ok(1, 'added one rule that does another role to the class')

    $P0 = PHB.'new'()
    $S0 = $P0.'give_payrise'()
    is($S0, 'You all get a pay rise of 0.0005%.', 'called method from direct role')

    $S1 = $P0.'fire'()
    is($S1, "You're FIRED!", 'called method from indirect role')
.end

.sub conflict_from_indirect_role
    .local pmc eh, BurninatorBoss, Manage, FirePeople, Burninator

    FirePeople = new 'Role'
    $P0 = get_global 'fire'
    FirePeople.'add_method'('fire', $P0)

    Manage = new 'Role'
    $P0 = get_global 'give_payrise'
    FirePeople.'add_method'('give_payrise', $P0)
    Manage.'add_role'(FirePeople)

    Burninator = new 'Role'
    $P0 = get_global 'fire2'
    Burninator.'add_method'('fire', $P0)
    ok(1, 'all roles created')

    BurninatorBoss = new 'Class'
    BurninatorBoss.'add_role'(Manage)
    ok(1, 'added first role with indirect role')

  try:
    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_ROLE_COMPOSITION_METHOD_CONFLICT)
    set_addr eh, catch

    push_eh eh
    BurninatorBoss.'add_role'(Burninator)
    $I0 = 1
    goto finally

  catch:
    $I0 = 0

  finally:
    pop_eh
    nok($I0, 'second role conflicts with method from indirect role')
.end

.sub 'multi_composition'
    .local pmc R, C
    R = new 'Role'
    $P0 = get_global 'mctest_2'
    R.'add_method'("mctest", $P0)
    C = new 'Class'
    $P0 = get_global 'mctest_1'
    C.'add_method'("mctest", $P0)
    C.'add_role'(R)
    ok(1, 'a multi in the class prevents a role conflict')

    $P0 = inspect C, 'methods'
    $I0 = elements $P0
    is($I0, 1, 'class had still one method after composition')
    $P0 = $P0['mctest']
    $I0 = isa $P0, 'MultiSub'
    is($I0, 1, 'method was a multi sub')
    $I0 = elements $P0
    is($I0, 2, 'multi holds both candidates')
.end
.sub 'mctest_1' :multi()
.end
.sub 'mctest_2'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
