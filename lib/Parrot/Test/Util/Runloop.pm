# Copyright (C) 2008, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Test::Util::Runloop - consolidated test for lots of files

=head1 SYNOPSIS

    use Parrot::Test::Util::Runloop;

    Parrot::Test::Util::Runloop->testloop(
        name     => 'No trailing spaces or tabs',
        files    => [ $DIST->get_c_language_files() ],
        skips    => { 'lib/Parrot/Test/Util/Runloop.pm' => 'devel' },
        per_line => sub { !/.?[ \t]+$/ };


=head1 DESCRIPTION

This module provides a basic runloop for test scripts which perform the same
test, over and over, on lots of files.  It is intended to consolidate some
code to handle loops, skips etc, replicated many times in the F<t/distro/> and
F<t/codingstd/> test directories.

You can specify a callback routine to get called back once per line (with the
C<per_line> attribute), or once per file (with the C<per_file> attribute).
The C<per_line> callback gets passed the line as a text string.  The
C<per_file> callback gets passed the whole file as a text string.  If the
callback function returns positive, the test passed, otherwise the test
failed.  Failures are tallied, and later reported to the test harness once, as
a single test.  On failure, some informational diagnostics are also generated,
showing the user which file(s) and which line(s) (if applicable) had the
failure.


=head1 AUTHOR

Written by Mark Glines, based on an idea (and lots of enthusiasm) from
Jerry Gay and Will Coleda.


=cut

package Parrot::Test::Util::Runloop;

use strict;
use warnings;

use Carp;
use Test::More;
use IO::File ();

sub testloop {
    my ($self, %args) = @_;
    # sanity
    my $usage = "Usage: Parrot::Test::Util::Runloop->testloop(\n"
               ."    name => 'foo',\n"
               ."    files => [ ... ],\n"
               ."    per_line => sub { ... });\n";
    croak $usage unless exists $args{name};
    croak $usage unless exists $args{files};
    croak "'files' is not an array reference!" unless ref($args{files}) eq 'ARRAY';
    croak "no per_file or per_line test callback was provided!"
        unless exists($args{per_file}) || exists($args{per_line});

    my @failures;
    my $failed_files = 0;

    foreach my $path (sort @{$args{files}}) {
        $path = $path->path if ref $path;
        next if exists($args{skips}) && exists($args{skips}{$path});

        my $file = IO::File->new("<$path")
            or die "Cannot open '$path' for reading: $!\n";

        my @lines = $file->getlines();
        my $error_line = "$path";
        my $have_errors = 0;

        if(exists($args{per_file})) {
            my $cb = $args{per_file};
            my $buf = join('', @lines);
            # do the per-file test
            unless($cb->($buf)) {
                push(@failures, $error_line);
            }
        }

        if(exists($args{per_line})) {
            my $cb = $args{per_line};

            # do the test, once for each line
            foreach my $n (0..@lines-1) {
                my $line = $lines[$n];
                unless($cb->($line)) {
                    $error_line .= "," if $have_errors;
                    $error_line .= " " . ($n+1);
                    $have_errors = 1;
                }
            }

            push(@failures, $error_line) if $have_errors;
            $failed_files++ if $have_errors;
        }
    }
    local $Test::Builder::Level = $Test::Builder::Level + 1;
    ok(!@failures, $args{name});
    if(@failures) {
        diag($args{diag_prefix} . " in the following files:")
            if exists $args{diag_prefix};
        foreach my $failure (@failures) {
            diag($failure);
        }
        my $failures = @failures;
        my $total_files = @{$args{files}};
        diag("That's $failures failed files out of $total_files files total.");
    }

    return;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
