#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 7;

=head1 NAME

t/oo/compositon.t - test role composition

=head1 SYNOPSIS

    % prove t/oo/compositon.t

=head1 DESCRIPTION

Tests role composition in the OO implementation.

=cut

pir_output_is( <<'CODE', <<'OUT', 'role with no methods' );
.sub 'test' :main
    $P0 = new Role
    $P1 = new MetaClass
    
    $P1.'add_role'($P0)
    print "ok 1 - added role\n"

    $P2 = $P1.'roles'()
    $I0 = elements $P2
    if $I0 == 1 goto OK_2
    print "not "
OK_2:
    print "ok 2 - roles list has the role\n"
    
    $P2 = $P1.'new'()
    print "ok 3 - instantiated class with composed role\n"
.end
CODE
ok 1 - added role
ok 2 - roles list has the role
ok 3 - instantiated class with composed role
OUT

pir_output_is( <<'CODE', <<'OUT', 'role with one method, no methods in class' );
.sub 'test' :main
    $P0 = new Role
    $P1 = new MetaClass

    $P2 = find_global "badger"
    $P0.'add_method'("badger", $P2)
    print "ok 1 - added method to a role\n"
    
    $P1.'add_role'($P0)
    print "ok 2 - composed role into the class\n"

    $P2 = $P1.'roles'()
    $I0 = elements $P2
    if $I0 == 1 goto OK_3
    print "not "
OK_3:
    print "ok 3 - roles list has the role\n"
    
    $P2 = $P1.'new'()
    print "ok 4 - instantiated class with composed role\n"

    $P2.'badger'()
    print "ok 5 - called method composed from role\n"
.end

.sub badger :method
    print "Badger!\n"
.end
CODE
ok 1 - added method to a role
ok 2 - composed role into the class
ok 3 - roles list has the role
ok 4 - instantiated class with composed role
Badger!
ok 5 - called method composed from role
OUT

pir_output_is( <<'CODE', <<'OUT', 'two roles and a class, a method each, no conflict' );
.sub 'test' :main
    $P0 = new Role
    $P1 = new Role
    $P2 = new MetaClass

    $P3 = find_global "snake"
    $P2.'add_method'("snake", $P3)
    print "ok 1 - class has a method\n"

    $P3 = find_global "badger"
    $P0.'add_method'("badger", $P3)
    $P2.'add_role'($P0)
    print "ok 2 - composed first role into the class\n"

    $P3 = find_global "mushroom"
    $P1.'add_method'("mushroom", $P3)
    $P2.'add_role'($P1)
    print "ok 3 - composed second role into the class\n"

    $P3 = $P2.'new'()
    print "ok 4 - instantiated class\n"

    $P3.'badger'()
    print "ok 5 - called method from first role\n"

    $P3.'mushroom'()
    print "ok 6 - called method from second role\n"

    $P3.'snake'()
    print "ok 7 - called method from class\n"
.end

.sub badger :method
    print "Badger!\n"
.end
.sub mushroom :method
    print "Mushroom!\n"
.end
.sub snake :method
    print "Snake!\n"
.end
CODE
ok 1 - class has a method
ok 2 - composed first role into the class
ok 3 - composed second role into the class
ok 4 - instantiated class
Badger!
ok 5 - called method from first role
Mushroom!
ok 6 - called method from second role
Snake!
ok 7 - called method from class
OUT

pir_output_is( <<'CODE', <<'OUT', 'two roles that conflict' );
.sub 'test' :main
    $P0 = new Role
    $P1 = new Role
    $P2 = new MetaClass

    $P3 = find_global "badger"
    $P0.'add_method'("badger", $P3)
    $P2.'add_role'($P0)
    print "ok 1 - composed first role into the class\n"

    $P3 = find_global "badger2"
    $P1.'add_method'("badger", $P3)
    push_eh OK_2
    $P2.'add_role'($P1)
    print "not "
    clear_eh
OK_2:
    print "ok 2 - composition failed due to conflict\n"
.end

.sub badger :method
    print "Badger!\n"
.end
.sub badger2 :method
    print "Badger!\n"
.end
CODE
ok 1 - composed first role into the class
ok 2 - composition failed due to conflict
OUT

pir_output_is( <<'CODE', <<'OUT', 'role that conflicts with a class method' );
.sub 'test' :main
    $P0 = new Role
    $P1 = new MetaClass

    $P2 = find_global "badger"
    $P1.'add_method'("badger", $P2)
    print "ok 1 - class has a method\n"

    $P2 = find_global "badger2"
    $P0.'add_method'("badger", $P2)
    push_eh OK_2
    $P1.'add_role'($P0)
    print "not "
    clear_eh
OK_2:
    print "ok 2 - composition failed due to conflict\n"
.end

.sub badger :method
    print "Badger!\n"
.end
.sub badger2 :method
    print "Badger!\n"
.end
CODE
ok 1 - class has a method
ok 2 - composition failed due to conflict
OUT

pir_output_is( <<'CODE', <<'OUT', 'conflict resolution by exclusion' );
.sub 'test' :main
    $P0 = new Role
    $P1 = new MetaClass

    $P2 = find_global "badger"
    $P1.'add_method'("badger", $P2)
    print "ok 1 - class has a method\n"

    $P2 = find_global "badger2"
    $P0.'add_method'("badger", $P2)
    $P2 = find_global "snake"
    $P0.'add_method'("snake", $P2)
    $P3 = new ResizableStringArray
    push $P3, "badger"
    $P1.'add_role'($P0, 'without' => $P3)
    print "ok 2 - composition worked due to exclusion\n"

    $P2 = $P1.'new'()
    $P2.'badger'()
    print "ok 3 - called method from class\n"

    $P2.'snake'()
    print "ok 4 - called method from role that wasn't excluded\n"
.end

.sub badger :method
    print "Badger!\n"
.end
.sub badger2 :method
    print "Oops, wrong badger.\n"
.end
.sub snake :method
    print "Snake!\n"
.end
CODE
ok 1 - class has a method
ok 2 - composition worked due to exclusion
Badger!
ok 3 - called method from class
Snake!
ok 4 - called method from role that wasn't excluded
OUT

pir_output_is( <<'CODE', <<'OUT', 'conflict resolution by aliasing' );
.sub 'test' :main
    $P0 = new Role
    $P1 = new MetaClass

    $P2 = find_global "badger"
    $P1.'add_method'("badger", $P2)
    print "ok 1 - class has a method\n"

    $P2 = find_global "badger2"
    $P0.'add_method'("badger", $P2)
    $P2 = find_global "snake"
    $P0.'add_method'("snake", $P2)
    $P3 = new Hash
    $P3["badger"] = "role_badger"
    $P1.'add_role'($P0, 'alias' => $P3)
    print "ok 2 - composition worked due to aliasing\n"

    $P2 = $P1.'new'()
    $P2.'badger'()
    print "ok 3 - called method from class\n"

    $P2.'snake'()
    print "ok 4 - called method from role that wasn't aliased\n"

    $P2.'role_badger'()
    print "ok 5 - called method from role that was aliased\n"
.end

.sub badger :method
    print "Badger!\n"
.end
.sub badger2 :method
    print "Aliased badger!\n"
.end
.sub snake :method
    print "Snake!\n"
.end
CODE
ok 1 - class has a method
ok 2 - composition worked due to aliasing
Badger!
ok 3 - called method from class
Snake!
ok 4 - called method from role that wasn't aliased
Aliased badger!
ok 5 - called method from role that was aliased
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
