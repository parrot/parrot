#!perl

# Copyright (C) 2009, The Perl Foundation.
# $Id: $

use strict;
use warnings;

use Test::More;
use File::Spec;

my $abc_pbc = File::Spec->catfile( '..', '..', 'languages', 'abc', 'abc.pbc' );
plan skip_all => "Need to first run make in languages/abc" unless -e $abc_pbc;

plan tests => 8;

use_ok('Parrot::Embed') or exit;

my $module = 'Parrot::Interpreter';
my $interp = $module->new();
ok( $interp, 'new() should return a valid interpreter' );
isa_ok( $interp, $module );

my $result = eval { $interp->load_file($abc_pbc) };
my $except = $@;
ok( $result, '... returning true if it could load the file' );
is( $except, '', '... throwing no exeption if so' );

my $abc = $interp->find_global( 'main', 'abc::Compiler' );
isa_ok( $abc, 'Parrot::PMC' );

SKIP: {
    skip( 'Cannot find namespaced names yet', 2 );

    my $pmc  = $abc->invoke('PS', '2+3');
    ok( $pmc, 'invoke() should return a PMC, given that signature' );
    is( $pmc->get_string(), 1, 'value returned in the PMC' );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
