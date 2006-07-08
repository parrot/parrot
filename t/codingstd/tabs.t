#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Distribution;


=head1 NAME

t/codingstd/tabs.t - checks for tab indents in C source and headers

=head1 SYNOPSIS

    % prove t/codingstd/tabs.t [file ...]

=head1 DESCRIPTION

Checks that the indicated file(s) do not use tabs to indent.

If no file(s) are specified, checks the Parrot C source and header files for
tab indents.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut


my @files = @ARGV ? @ARGV : source_files();

plan tests => scalar @files;

foreach my $file (@files) {
    open FILE, "<$file" or die "Unable to open '$file' for reading: $!";

    my @tabs;
    LINE:
    while (<FILE>) {
        next unless /^ *\t/;
        push @tabs, "tab in leading whitespace, file '$file', line $.\n";
        if (@tabs >= 5) {
            push @tabs, "skipping remaining lines (you get the idea)\n";
            last LINE;
        }
    }
    close FILE;

    is(scalar(@tabs), 0, "file '$file' does not use tabs")
      or diag(@tabs);
}


exit;


sub source_files {
    my $dist = Parrot::Distribution->new;
    return map { $_->path } (
        map($_->files_of_type('C code'),   $dist->c_source_file_directories),
        map($_->files_of_type('C header'), $dist->c_header_file_directories),
    );
}

## vim: expandtab sw=4

