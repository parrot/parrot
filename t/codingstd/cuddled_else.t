#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;

=head1 NAME

t/codingstd/cuddled_else.t - checks for cuddled elses in C source and headers

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/cuddled_else.t

    # test specific files
    % perl t/codingstd/cuddled_else.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that files do not use cuddled else a.k.a C<} else {>.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();
my @else;

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

    my $tabcount;
    my $message = qq<  $path:>;
    while (<$fh>) {
        next unless /}\s*else\s*{/;
        $message .= " $.";
        $tabcount++;
    }
    push @else => "$message\n"
        if $tabcount;
    close $fh;
}

ok( !scalar(@else), "cuddled else" )
    or diag( "cuddled else found in " . scalar @else . " files:\n@else" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
