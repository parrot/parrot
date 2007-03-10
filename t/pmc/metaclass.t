#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 8;

=head1 NAME

t/pmc/class.t - test the Class PMC

=head1 SYNOPSIS

    % prove t/pmc/class.t

=head1 DESCRIPTION

Tests the Class PMC.

=cut


## TODO PDD says 'Class', impl says 'MetaClass'
## i'm testing the impl, cause that's more fun


# L<PDD15/Class PMC API/=item new>
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    new $P0, .MetaClass
    say 'ok 1 - $P0 = new .MetaClass'

    $I0 = isa $P0, 'MetaClass'
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say "ok 2 - isa $P0, 'MetaClass'"
.end
CODE
ok 1 - $P0 = new .MetaClass
ok 2 - isa $P0, 'MetaClass'
OUT


# L<PDD15/Class PMC API/"An instance of the Class PMC has ten attributes">
pir_output_is( <<'CODE', <<'OUT', 'Class PMC has ten attributes' );
.sub 'test' :main
    new $P0, .MetaClass
    $P1 = $P0.'attributes'()
    $I0 = $P1.'keys'()
    if $I0 == 10 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - Class PMC has ten attributes'
.end
CODE
ok 1 - Class PMC has ten attributes
OUT


# L<PDD15/Class PMC API/'Class PMCs also have the "I am a class" flag set on them.'>
pir_output_is( <<'CODE', <<'OUT', 'Class have "I am a class" flag set' );
.include 'pmcinfo.pasm'

.sub 'test' :main
    .const int POBJ_IS_CLASS_FLAG = 536870912  # 1 << 29

    new $P0, .MetaClass
    $I0 = pmcinfo $P0, .PMCINFO_FLAGS          # XXX op currently experimental
    $I99 = $I0 & POBJ_IS_CLASS_FLAG
    if $I99 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - Class PMC has "I am a class" flag set'
.end
CODE
ok 1 - Class PMC has "I am a class" flag set
OUT


# L<PDD15/Class PMC API/=item name>
pir_output_is( <<'CODE', <<'OUT', 'name' );
.sub 'test' :main
    new $P0, .MetaClass
    $P1 = $P0.'name'()
    if $P1 == 'MetaClass' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - name() with no args returns class name'

    $P0.'name'('Alex')
    $P1 = $P0.'name'()
    if $P1 == 'Alex' goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - name() with args sets class name'
.end
CODE
ok 1 - name() with no args returns class name
ok 2 - name() with args sets class name
OUT
## TODO test multiple arguments fails as expected


# L<PDD15/Class PMC API/=item new>
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    new $P0, .MetaClass
    $P1 = $P0.'new'()
    $I0 = isa $P1, 'Object'
    if $I0 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - new() with no args returns an object'

    $P1 = $P0.'new'('abc' => '123' )
    $I0 = isa $P1, 'Object'
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - new() with args returns an object'
.end
CODE
ok 1 - new() with no args returns an object
ok 2 - new() with args returns an object
OUT
## test what's set in the object by .'new'() in t/pmc/object.t


# L<PDD15/Class PMC API/=item attributes>
pir_output_is( <<'CODE', <<'OUT', 'attributes' );
.sub 'test' :main
    new $P0, .MetaClass
    $P1 = $P0.'attributes'()
    $I0 = isa $P1, 'Hash'
    if $I0 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - attributes() returns a Hash'
.end
CODE
ok 1 - attributes() returns a Hash
OUT
## NOTES test that accessor is read-only
## NOTES figure out what attributes the base Class has by default (if any)


## TODO add_attribute


# L<PDD15/Class PMC API/=item parents>
pir_output_is( <<'CODE', <<'OUT', 'parents' );
.sub 'test' :main
    new $P0, .MetaClass
    $P1 = $P0.'parents'()
    $I0 = isa $P1, 'ResizableStringArray'  ## XXX really?
    if $I0 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - parents() returns a ResizableStringArray'
.end
CODE
ok 1 - parents() returns a ResizableStringArray
OUT
## NOTES test that accessor is read-only
## NOTES figure out what parents the base Class has by default (if any)


## TODO add_parent


## TODO roles
# L<PDD15/Class PMC API/=item roles>
pir_output_is( <<'CODE', <<'OUT', 'roles' );
.sub 'test' :main
    new $P0, .MetaClass
    $P1 = $P0.'roles'()
    $I0 = isa $P1, 'ResizableStringArray'  ## XXX really?
    if $I0 goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - roles() returns a ResizableStringArray'
.end
CODE
ok 1 - roles() returns a ResizableStringArray
OUT
## NOTES test that accessor is read-only
## NOTES figure out what roles the base Class has by default (if any)


## TODO add_role


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
