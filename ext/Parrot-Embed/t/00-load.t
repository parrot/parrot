#!perl

# Copyright (C) 2006-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;

use Test::More tests => 9;
use File::Spec;

use_ok('Parrot::Embed' ) or exit;

my $module = 'Parrot::Interpreter';
can_ok( $module, 'new' );

my $interp = $module->new();
ok( $interp, 'new() should return a valid interpreter' );
isa_ok( $interp, $module );

my $interp2 = $module->new($interp);
ok( $interp, 'new() should return a valid interpreter, given a parent interp' );
isa_ok( $interp, $module );

isnt( $$interp, $$interp2, '... but different interpreters' );

{
    local @Subclass::ISA = $module;
    my $sc = Subclass->new($interp2);
    isa_ok( $sc, $module );
    isa_ok( $sc, 'Subclass' );
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
