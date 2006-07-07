#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Distribution;


=head1 NAME

t/codingstd/fixme.t - checks for "FIXME" and similar notes in C source and headers

=head1 SYNOPSIS

    % prove t/codingstd/fixme.t

=head1 DESCRIPTION

Checks that no C source or header file in the distribution contains the
following strings:

    FIXME
    TODO
    XXX

=cut


my @files = @ARGV ? @ARGV : source_files();

plan tests => scalar @files;

foreach my $file (@files) {
    open FILE, "<$file" or die "Unable to open '$file' for reading: $!";

    my @matches;
    while (<FILE>) {
        next unless /(FIXME|XXX|TODO)/;
        push @matches, "file '$file', line $.: $1\n";
    }
    close FILE;

    is(scalar(@matches), 0, "file '$file' has no FIXME strings")
      or diag(@matches);
}

sub source_files {
    my $dist = Parrot::Distribution->new;
    return map { $_->path } (
        map($_->files_of_type('C code'),   $dist->c_source_file_directories),
        map($_->files_of_type('C header'), $dist->c_header_file_directories),
    );
}

