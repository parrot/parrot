#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;

=head1 NAME

t/codingstd/c_struct.t - checks for struct tags in C source and headers

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_struct.t

    # test specific files
    % perl t/codingstd/c_struct.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C source files use struct tags, as defined in PDD07.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my @files =
      @ARGV
    ? $^O eq 'MSWin32'
        ? <@ARGV>
        : @ARGV
    : $DIST->get_c_language_files();
my @struct;

for my $file (@files) {
    my $path = ref $file ? $file->path : $file;

    open my $fh, '<', $path
        or die "Cannot open '$path' for reading: $!\n";

    my $count   = 0;
    my $message = qq<  $path:>;
    while (<$fh>) {

        # we're only interested in lines with structs
        next unless /\btypedef\s+struct\s+{/;

        $count++;
        $message .= " $.";
    }
    push @struct => "$message\n"
        if $count;
    close $fh;
}

# L<PDD07/Code Structure/=item Structure types must have tags>
ok( !scalar(@struct), "structure types must have tags" )
    or diag( "struct without tag found in " . scalar @struct . " files:\n@struct" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
