#!perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;

=head1 NAME

t/pmc/metaattribute.t - test the MetaAttribute PMC

=head1 SYNOPSIS

    % prove t/pmc/metaattribute.t

=head1 DESCRIPTION

Tests the MetaAttribute PMC.

=cut


## TODO PDD does not spec MetaAttribute, but it's been implemented
## in most of these tests, i'm either testing what's been implemented,
## or my assumptions -- particle


# L<PDD15/MetaAttribute PMC API>
# TODO fix smartlinks once this is specced
pir_output_is( <<'CODE', <<'OUT', 'new' );
.sub 'test' :main
    $P0 = new .MetaAttribute
    say 'ok 1 - $P0 = new .MetaAttribute'

    $I0 = isa $P0, 'MetaAttribute'
    if $I0 goto ok_2
    print 'not '
  ok_2:
    say "ok 2 - isa $P0, 'MetaAttribute'"
.end
CODE
ok 1 - $P0 = new .MetaAttribute
ok 2 - isa $P0, 'MetaAttribute'
OUT


pir_output_is( <<'CODE', <<'OUT', 'name' );
.sub 'test' :main
    $P0 = new .MetaAttribute
    $P1 = $P0.'name'()
    if $P1 == '' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - name() with no args returns attribute name, which is empty at first'

    $P0.'name'('Alex')
    $P1 = $P0.'name'()
    if $P1 == 'Alex' goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - name() with args sets attribute name'

    push_eh ok_3
    $P0.'name'('Alice', 'Bob')
    clear_eh

    print 'not '
  ok_3:
    say 'ok 3 - name() with too many args fails'

.end
CODE
ok 1 - name() with no args returns attribute name, which is empty at first
ok 2 - name() with args sets attribute name
ok 3 - name() with too many args fails
OUT


pir_output_is( <<'CODE', <<'OUT', 'type' );
.sub 'test' :main
    $P0 = new .MetaAttribute
    $P1 = $P0.'type'()
    if $P1 == '' goto ok_1
    print 'not '
  ok_1:
    say 'ok 1 - type() with no args returns attribute type, which is empty at first'

    $P0.'type'('Alex')
    $P1 = $P0.'type'()
    if $P1 == 'Alex' goto ok_2
    print 'not '
  ok_2:
    say 'ok 2 - type() with args sets attribute type'

    push_eh ok_3
    $P0.'type'('Alice', 'Bob')
    clear_eh

    print 'not '
  ok_3:
    say 'ok 3 - type() with too many args fails'

.end
CODE
ok 1 - type() with no args returns attribute type, which is empty at first
ok 2 - type() with args sets attribute type
ok 3 - type() with too many args fails
OUT


## TODO add more tests as this is documented and implemented


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
