#!perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . .. lib ../lib ../../lib ../../../lib ../../../../lib );
use Test::More;
use Parrot::Test;
use Parrot::Config;

=head1 NAME

examples/languages/abc/t/01-tests.t - test harness for Parrot abc

=head1 DESCRIPTION

This file is the current implementation for the abc test harness. The
tests are actually in simple text files, this harness given this list of
tests sources, executes all the tests.

The test source is a plain text file divided in three columns. The
columns are separated by three white spaces C<\s{3,}> or at least one
tab C<\t+>. The three columns are:

=over 4

=item B<expression>

The exact expression that is passed to the abc compiler as source code.
This input is pasted as a double quotes delimited string into PIR code.
This means that you can use \n to indicate newlines.

=item B<expected>

The expected result for the compiled source. Note that you can (and
probably should) use C<\n> in the expected result to represent newlines.

=item B<description>

This should be a string describing the test that is being made.

=back

Since this is supposed to be a temporary harness. We're expecting to be
able to capture the result of the compilation to write this file in PIR.
The skip and todo tests are defined in the test source file itself, so
that later when the harness is changed we don't have to bother to convert
the skip/todo tests list. So, you can simply set a test to be todo or
skipped by adding the C<SKIP> or C<TODO> keywords in the begin of the
test description. For example:

1+2+3           6       SKIP no add operation yet
1-2-3           6       TODO no minus operation yet

B<NOTE:> to add more source test files remember to update the C<@files>
array in this file.

=head1 SYNOPSIS

$ prove examples/languages/abc/t/01-tests.t

=cut

# abc build directory
my $abcdir = "$PConfig{'build_dir'}/examples/languages/abc";

# files to load tests from
my @files = qw(
    abc_basic
    abc_special_variables
    abc_statement
    abc_functions
);

# for each test file given calculate full path
my @test_files = map { "$abcdir/t/$_" } @files;

# calculate total number of tests
my $numtests = 0;
foreach my $f (@test_files) {
    open my $TEST_FILE, '<', $f;

    # for each line in the given files if it's not a comment line
    # or an empty line, the it's a test
    while (<$TEST_FILE>) { $numtests++ unless ( ( $_ =~ m/^#/ ) or ( $_ =~ m/^\s*$/ ) ); }
}

# set plan
plan tests => $numtests;

# main loop
foreach my $file (@test_files) {
    open my $TEST_FILE, '<', $file or die "can't open file";
    while (<$TEST_FILE>) {
        chomp;
        s/\r//g;

        # skip comment lines
        $_ =~ /^#/ and next;

        # skip empty lines
        $_ =~ /^\s*$/ and next;

        # split by tabs or 3+ spaces
        my ( $expr, $expect, $description ) = split / *\t\s*|\s{3,}/, $_;

        # do some simple checking
        if ( $expr eq '' or $expect eq '' or $description eq '' ) {
            warn "$file line $. doesn't match a valid test!";
            next;
        }

        $expr =~ s/"/\\"/g;           # Escape the '"', as $expr will be
                                      # enclosed by '"' in the generated PIR

        $expect =~ s/^'(.*)'$/$1/;    # remove surrounding quotes (for '')
        $expect =~ s/\\n/\n/g;        # treat \n as newline

        # build pir code
        my $pir_code = abc_template();
        $pir_code =~ s/<<EXPR>>/$expr/g;

        # check if we need to skip this test
        if ( $description =~ m/^(SKIP|skip)\s+(.*)/ ) {
        SKIP: {
                skip $2, 1;
                pir_output_is( $pir_code, $expect, $description );
            }
            next;
        }

        # check if we need to todo this test
        if ( $description =~ m/^(TODO|todo)\s+(.*)/ ) {
            my @todo = ();
            push @todo, todo => $2;
            pir_output_is( $pir_code, $expect, $description, @todo );
            next;
        }

        # no skip or todo -- run test
        pir_output_is( $pir_code, $expect, $description );
    }
}

# end
exit;

sub abc_template {
    return <<"PIR";
.sub 'main' :main
    load_bytecode '$abcdir/abc.pbc'
    .local pmc compiler, code
    compiler = compreg 'abc'
    code = compiler.'compile'("<<EXPR>>")
    code()
.end
PIR
}

=head1 AUTHOR

Nuno 'smash' Carvalho  <mestre.smash@gmail.com>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
