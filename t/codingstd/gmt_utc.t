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

t/codingstd/gmt_utc.t - checks for GMT/UTC timezone in generated files

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/gmt_utc.t

    # test specific files
    % perl t/codingstd/gmt_utc.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Generated files which have timezone information should have this as either
GMT or UTC.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : source_files();
my @failures;

foreach my $file (@files) {
    my $buf = $DIST->slurp($file);

    # trim out SVN Id line
    $buf =~ s{\$Id:.*}{}g;

    # if we have a timezone, check to see if it is GMT/UTC
    push @failures => "$file\n"
        if $buf =~ m{
                        \d:\d\d:\d\d        # a time-looking string
                        (?! .*? (GMT|UTC))  # not GMT or UTC
                    }x;
}

ok( !scalar(@failures), 'Generated timestamps correct' )
    or diag( "Non GMT/UTC timestamp found in " . scalar @failures . " files:\n@failures" );

exit;

sub source_files {
    my $manifest = maniread('MANIFEST.generated');
    my @test_files;

    # grab names of files to test (except binary files)
    foreach my $filename ( sort keys %$manifest ) {
        next if !( -e $filename );

        push @test_files, $filename
            if ( $filename =~ m/\.(c|h|pod|pl|pm)$/ );
    }

    return @test_files;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
