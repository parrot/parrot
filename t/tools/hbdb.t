#! perl

# Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

t/tools/hbdb.t - tests for the HBDB debugger

=head1 SYNOPSIS

    prove t/tools/hbdb.t

=head1 DESCRIPTION

Tests the HBDB debugger by providing it with a number of source
files and running through it with various commands.

=head1 REQUIREMENTS

This test script requires you to build HBDB, by running "make hbdb". If this
requirement has not been met, all tests will be skipped.

=cut

use warnings;
use strict;

use lib qw/lib/;

use Test::More;
use Parrot::Test::HBDB tests => 2;

# Output to match
my $help_regex = <<OUTPUT;
/Usage: hbdb [[]options[]] [[]file[]]

Options:
(\\s+-.{1},\\s{1}--.*\\s+.*)+

File:
\\s+.*
/m
OUTPUT

# Test that command-line switches are recognized
hbdb_help_output_like("-h", $help_regex, "HBDB: Help message");

# Test that unknown switches fail correctly
hbdb_help_output_like("--foobar", $help_regex, "HBDB: Unknown options");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

