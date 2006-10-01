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
my @files = @ARGV ? @ARGV : source_files();
my @fixme;

foreach my $file (@files) {
    open my $fh, '<', $file
        or die "Cannot open '$file' for reading: $!\n";

    while (<$fh>) {
        next unless /(FIXME|XXX|TODO)/;
        push @fixme, "file '$file', line $.: $1\n";
    }
    close $fh;
}

ok( !scalar(@fixme), 'FIXME strings' )
    or diag( "FIXME strings found in " . scalar @fixme . " files:\n@fixme" );

exit;

sub source_files {
    return map { $_->path } (
        map( $_->files_of_type('C code'),   $DIST->c_source_file_directories ),
        map( $_->files_of_type('C header'), $DIST->c_header_file_directories ),
    );
}

## vim: expandtab sw=4
