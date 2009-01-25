# Copyright (C) 2005-2009, The Perl Foundation.
# $Id$

=head1 NAME

t/examples.t - testing the lazy-l code examples

=head1 SYNOPSIS

    % cd languages/lazy-k && perl t/examples.t

=head1 DESCRIPTION

Test calc.lazy and cat.lazy.
powers.lazy is not tested, as the output is infinite.

=head1 AUTHOR

Bernhard Schmalhofer - C<Bernhard.Schmalhofer@gmx.de>

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib";

use Test::More       tests => 2;
use Parrot::Config   qw(%PConfig);
use File::Spec       ();

my $is_win32  = $^O eq 'MSWin32';
my $parrot    = File::Spec->catfile( $FindBin::Bin,
                                     File::Spec->updir(),
                                     File::Spec->updir(),
                                     File::Spec->updir(),
                                     $PConfig{test_prog} );
my $lazy_k    = $parrot . q{ } . File::Spec->catfile( $FindBin::Bin,
                                                      File::Spec->updir(), 
                                                      'lazy.pbc' );
my $source_fn = 'examples/calc.lazy'; 
my @test_cases = (
    [ 'calc.lazy', '2*4+3', "11\n" ],
    [ 'cat.lazy',  '2*4+3', "2*4+3\n" ],
);

foreach (@test_cases) {
    my ($code_fn, $in, $out) = @{$_};

    my $code_path = File::Spec->catfile( $FindBin::Bin,
                                         File::Spec->updir(),
                                         'examples',
                                         $code_fn ); 
    # XXX This does not look portable.
    # Don't quote the string on Windows, it is passed on literally
    my $cmd = $is_win32 ? qq{echo $in | $lazy_k $code_path}
                        : qq{echo '$in' | $lazy_k $code_path};
    is( `$cmd`, $out, "$code_fn $in" );
}
