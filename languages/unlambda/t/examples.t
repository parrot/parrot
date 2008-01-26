#! perl

# Copyright (C) 2005-2008, The Perl Foundation.
# $Id$

=head1 NAME

unlambda/t/examples.t - testing the examples

=head1 SYNOPSIS

	% cd languages && perl unlambda/t/examples.t

	% cd languages/unlambda && perl t/examples.t

=head1 DESCRIPTION

Test the examples.

=head1 AUTHOR

Bernhard Schmalhofer - C<Bernhard.Schmalhofer@gmx.de>

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib";

use Test::More        tests => 3;
use Parrot::Config;
use File::Spec        ();

my $parrot    = File::Spec->catfile( $FindBin::Bin,
                                     File::Spec->updir(),
                                     File::Spec->updir(),
                                     File::Spec->updir(),
                                     $PConfig{test_prog} );
my $unlamba   = $parrot . q{ } . File::Spec->catfile( $FindBin::Bin,
                                                      File::Spec->updir(), 
                                                      'unl.pir' );
my %expected = (
  newline  => "\n",
  h        => "h\n",
  hello    => "Hello world\n",
);

while ( my ( $example, $out ) = each %expected ) {
    my $prog = File::Spec->catfile( $FindBin::Bin,
                                    File::Spec->updir(),
                                    'examples',
                                    "$example.unl" ); 
    is( `$unlamba $prog`, $out, "example $example" );
}
