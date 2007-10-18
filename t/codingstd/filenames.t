#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More;
use ExtUtils::Manifest qw(maniread);
use Parrot::Distribution;

# set up how many tests to run
plan tests => 1;

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

Filenames are restricted to 32 characters.  Test currently "todoed".

=back

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

my $DIST = Parrot::Distribution->new;
my $manifest = maniread('MANIFEST');
my @files = @ARGV ? @ARGV : sort keys %$manifest;
my @multi_dots;

foreach my $file (@files) {

    # check for multiple dots in filenames
    my $num_dots = grep(m/\./g, split('', $file));
    if ( $num_dots > 1 ) {
        push @multi_dots, $file . "\n";
    }

}

ok( !scalar(@multi_dots), 'No multi-dot filenames' )
    or diag( "Multi-dot filename found in " . scalar @multi_dots
        . " files:\n@multi_dots" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
