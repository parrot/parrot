#! perl

# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

t/tools/hbdb.t - tests for the HBDB debugger

=head1 SYNOPSIS

    prove t/tools/hbdb.t

=head1 DESCRIPTION

Tests the C<hbdb> debugger by providing it with a number of source
files and running through it with various commands.

=head1 REQUIREMENTS

This test script requires you to build hbdb, by running "make hbdb". If this
requirement has not been met, all tests will be skipped.

=cut

use warnings;
use strict;

use lib qw/lib/;

use Test::More;
use Parrot::Config;
use Parrot::Test;

my ($path, $exec);

# Check that HBDB has been built first
BEGIN {
    $path = File::Spec->join(".", "hbdb");
    $exec = $path . $PConfig{'exe'};

    # Skip tests if executable doesn't exist
    unless (-f $exec) {
        plan(skip_all => "HBDB hasn't been built. Please run \"make hbdb\"");
        exit(0);
    }

    plan(tests => 2);
}

my $help_regex = <<OUTPUT;
/Usage: hbdb [[]options[]] [[]file[]]

Options:
(\\s+-.{1},\\s{1}--.*\\s+.*)+

File:
\\s+.*
/m
OUTPUT

# Test that command-line switches are recognized
hbdb_output_like("-h", $help_regex, "HBDB: Help message");

# Test that unknown switches fail correctly
hbdb_output_like("--foobar", $help_regex, "HBDB: Unknown options");

=head1 SUBROUTINES

=over 4

=item C<hbdb_output_like($opt, $rx, $desc)>

Acts as a wrapper around C<like()> to reduce duplicate code. C<$opt> is the
command-line switch to test, C<$rx> is a regular expression to match, and
C<$desc> is a short description.

=cut

sub hbdb_output_like {
    my ($opt, $rx, $desc) = @_;
    my $out = `$exec $opt`;

    like($out, $rx, $desc);
}

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

