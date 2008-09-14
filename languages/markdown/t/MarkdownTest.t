#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/MarkdownTest.t - the official test suite

=head1 SYNOPSIS

    % perl -I../lib -Imarkdown/t markdown/t/MarkdownTest.t

=head1 DESCRIPTION

Run the tests of the official test suite.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test;
use Test::More;
use File::Basename;
use File::Spec;

my @dir = ( 'markdown', 't', 'MarkdownTest_1.0', 'Tests' );
my @test_files = glob( File::Spec->catfile( @dir, '*.text' ) );

if ( scalar @test_files ) {
    plan tests => scalar @test_files;
}
else {
    plan skip_all => 'no MarkdownTest';
}

foreach my $test_file (@test_files) {
    my $test_name = basename($test_file, '.text');

    my $code = Parrot::Test::slurp_file( $test_file );
    my $out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, "$test_name.html" ));
    language_output_is( 'markdown', $code, $out, $test_name, todo => 'not implemented' );
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
