#!/usr/bin/env perl

# Copyright (C) 2007, The Perl Foundation.
# $Id$

# A wrapper around a Scheme test file

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../lib";

use Test::More;
use Data::Dumper;

( my $t_fn = $FindBin::Script ) =~ s/\.pl$/\.t/;

# 'petite' is Petite Chez Scheme
# 7.3 is the current version
my $petite_version = `petite --version 2>&1` || q{};
my $has_petite = $petite_version =~ m/7/xms;
diag( Dumper( $petite_version, $has_petite ) );

if ( ! $has_petite ) {
    plan skip_all => 'petite is needed for running this test';
}
else {
    chdir 'eclectus';
    exec 'petite', '--script', "t/$t_fn";
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
