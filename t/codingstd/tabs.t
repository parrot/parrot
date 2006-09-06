#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;


=head1 NAME

t/codingstd/tabs.t - checks for tab indents in C source and headers

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/tabs.t

    # test specific files
    % perl t/codingstd/tabs.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that files do not use tabs to indent.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut


my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : source_files();
my @tabs;

foreach my $file (@files) {
    open my $fh, '<',$file
        or die "Cannot open '$file' for reading: $!\n";

    my $tabcount;
    while (<$fh>) {
        next unless /^ *\t/;
        push @tabs, "tab in leading whitespace, file '$file', line $.\n";
        if (++$tabcount >= 5) {
            push @tabs, "skipping remaining lines (you get the idea)\n";
            last;
        }
    }
    close $fh;
}

ok(!scalar(@tabs), "tabs in leading whitespace")
    or diag(@tabs);

exit;


sub source_files {
    return map { $_->path } (
        map($_->files_of_type('C code'),   $DIST->c_source_file_directories),
        map($_->files_of_type('C header'), $DIST->c_header_file_directories),
    );
}

## vim: expandtab sw=4

