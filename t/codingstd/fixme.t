#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;

=head1 NAME

t/codingstd/fixme.t - checks for "FIXME" and similar notes in C source and headers

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/fixme.t

    # test specific files
    % perl t/codingstd/fixme.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that no C source or header file in the distribution contains the
following strings:

    FIXME
    TODO
    XXX

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();
my @fixme;

foreach my $file (@files) {
    my $path;

    ## get the full path of the file
    # if we have command line arguments, the file is the full path
    if (@ARGV) {
        $path = $file;
    }
    # otherwise, use the relevant Parrot:: path method
    else {
        $path = $file->path;
    }

    open my $fh, '<', $path
        or die "Cannot open '$path' for reading: $!\n";

    while (<$fh>) {
        next unless /(FIXME|XXX|TODO)/;
     
        if (! m/\((?:RT)?#+\d+\)/) {
            push @fixme, "file '$path', line $.: $1\n";
        }
    }
    close $fh;
}

ok( !scalar(@fixme), 'FIXME strings' )
    or diag( "FIXME strings found in " . scalar @fixme . " files:\n@fixme" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
