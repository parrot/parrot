#! perl
# Copyright (C) 2006-2009, Parrot Foundation.

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More;
use ExtUtils::Manifest qw(maniread);
use Parrot::Distribution;
use File::Spec;

# set up how many tests to run
plan tests => 3;

=head1 NAME

t/codingstd/filenames.t - checks that filenames conform to standards

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/filenames.t

    # test specific files
    % perl t/codingstd/filenames.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that the filenames used for files within the Parrot distribution
conform to a set of highly portable standards.

=over 4

=item No multiple dots within filenames

Files with more than one dot ( '.' ) in their filename are problematic on
some platforms (e.g. VMS) hence avoid these in Parrot.

=item No strange characters in filenames

Filenames are restricted to the characters C<a-zA-Z0-9_-.>

=item Filenames length restriction

Filenames are restricted to 32 characters.

=back

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

my $DIST = Parrot::Distribution->new;
my @files;
if (@ARGV){
    @files = <@ARGV>;
}
else {
    my $manifest = maniread('MANIFEST');
    # Give ports a little more leeway
    @files = grep {! /^ports/} sort keys %$manifest;
}
my ( @multi_dots, @strange_chars, @too_long );

foreach my $file ( @files ) {

    # check for multiple dots in filenames
    my $num_dots = grep(m/\./g, split( m//, $file));
    if ( $num_dots > 1 ) {
        # this file is not used to build Parrot, so VMS can just deal with it
        push @multi_dots, $file . "\n" unless $file eq '.travis.yml';
    }

    # check the characters used in filenames
    push @strange_chars, $file . "\n"
        if $file =~ m/[^\w\/.\-]/g;

    # check for filenames that are too long
    my ($volume, $directory, $filename) = File::Spec->splitpath( $file );
    my @filename_chars = split  m//, $filename;
    my $filename_len = scalar @filename_chars;
    push @too_long, $file . ":$filename_len chars\n"
        if $filename_len > 32;

}

ok( !@multi_dots, 'No multi-dot filenames' )
    or diag( "Multi-dot filename found in " . @multi_dots
        . " files:\n@multi_dots" );

ok( !@strange_chars, 'Portable characters in filenames' )
    or diag( "Filename with non-portable character found in "
        . @strange_chars . " files:\n@strange_chars" );

ok( !@too_long, 'Filenames length' )
    or diag( "Filename with more than 32 chars found in "
        . @too_long . " files:\n@too_long" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
