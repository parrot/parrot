# Copyright (C) 2005 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

lazy-k/t/calc.t - testing calc.lazy


=head1 SYNOPSIS

	% cd languages && perl lazy-k/t/calc.t

=head1 DESCRIPTION

Test calc.lazy.

=head1 AUTHOR

Bernhard Schmalhofer - C<Bernhard.Schmalhofer@gmx.de>

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib";

use Data::Dumper;
use Test::More tests => 1;
use Parrot::Config;
use File::Spec();

my $parrot    = File::Spec->catfile( File::Spec->updir(), $PConfig{test_prog} );
my $lazy_k    = $parrot . q{ } . File::Spec->catfile( 'lazy-k', 'lazy.pir' );
my $calc_lazy = File::Spec->catfile( 'lazy-k', 'calc.lazy' ); 

# XXX This does not look portable.
my $cmd = qq{echo '1+2*3' | $lazy_k $calc_lazy};
# die Dumper( $cmd );
is( `$cmd`, "7\n", 'calc.lazy' );
