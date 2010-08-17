#!perl
# Copyright (C) 2008-2010, Parrot Foundation.
# $Id$

use strict;
use warnings;

use Test::More;
use File::Spec;

my $pipp_pbc = File::Spec->catfile( '..', '..', 'languages', 'pipp', 'pipp.pbc' );
plan skip_all => "Need to first run make in languages/pipp" if not -e $pipp_pbc;

plan tests => 6;

use_ok('Parrot::Embed') or exit;


my $module = 'Parrot::Interpreter';
my $interp = $module->new();
ok( $interp, 'new() should return a valid interpreter' );
isa_ok( $interp, $module );

my $result = eval { $interp->load_file($pipp_pbc) };
my $except = $@;
ok( $result, '... returning true if it could load the file' );
is( $except, '', '... throwing no exeption if so' );

# What is 'Pipp' in hll namespace 'parrot' ?
my $pipp_x = $interp->find_global( 'Pipp' );
{
    local $TODO = 'Namespace and HLL not working yet';
    isa_ok( $pipp_x, 'Parrot::PMC' );
}

# todo: get hll id of Pipp
# todo: set hll namespace root to 'pipp'
# find sub 'eval' and hll namespace 'pipp'
my $pipp_eval = $interp->find_global( 'pipp', 'eval' );
# isa_ok( $pipp_eval, 'Parrot::PMC', todo => '$pipp_eval is not found'  );
# can_ok($pipp, 'invoke');


my $code = <<'END_CODE';
<?php
function add($a, $b) {
    return $a+$b;
}
?>
END_CODE

# compile some PHP code
if (0)
{
    my $pmc = $pipp_eval->invoke( 'PS', $code );
    ok( $pmc, 'invoke() should return a PMC, given that signature' );
    is( $pmc->get_string(), 1, 'string returned in the PMC should be true?' );
}


# invoke a built-in php function
if (0)
{
    my $pmc = $pipp_eval->invoke( 'PS', 'strlen', 'some string' );
    ok( $pmc, 'invoke() should return a PMC, given that signature' );
    is( $pmc->get_string(), 11, 'value returned in the PMC' );
}

# invoke a php function
if (0)
{
    my $pmc = $pipp_eval->invoke( 'PS', 'add', 23, 19 );
    ok( $pmc, 'invoke() should return a PMC, given that signature' );
    is( $pmc->get_string(), 42, 'value returned in the PMC' );
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
