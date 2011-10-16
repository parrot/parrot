package Parrot::Harness::TestSets;
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;

# BASIC GROUPS

our %test_groups = (
    benchmark => [ qw(
        t/benchmark/*.t
    ) ],
    buildtools => [ qw(
        t/tools/pmc2cutils/*.t
        t/pharness/*.t
    ) ],
    codingstd => [ qw(
        t/codingstd/*.t
    ) ],
    compilers => [ qw(
        t/compilers/pct/*.t
        t/compilers/pge/*.t
        t/compilers/pge/p5regex/*.t
        t/compilers/pge/perl6regex/*.t
        t/compilers/tge/*.t
        t/compilers/opsc/*.t
        t/compilers/data_json/*.t
    ) ],
    configure => [ qw(
        t/configure/*.t
        t/steps/*.t
        t/postconfigure/*.t
    ) ],
    distro => [ qw(
        t/distro/*.t
    ) ],
    dynoplibs => [ qw(
        t/dynoplibs/*.t
    ) ],
    dynpmc => [ qw(
        t/dynpmc/*.t
    ) ],
    examples => [ qw(
        t/examples/*.t
    ) ],
    headerizer => [ qw(
        t/tools/dev/headerizer/*.t
    ) ],
    library => [ qw(
        t/library/*.t
    ) ],
    manifest => [ qw(
        t/manifest/*.t
        t/tools/install/*.t
    ) ],
    miscellaneous => [ qw(
        t/ext/winxed/*.t
        t/tools/*.t
        t/profiling/*.t
    ) ],
    perl => [ qw(
        t/perl/*.t
    ) ],
    run => [ qw(
        t/run/*.t
    ) ],
    runcore => [ qw(
        t/compilers/imcc/*/*.t
        t/op/*.t
        t/pmc/*.t
        t/oo/*.t
        t/pir/*.t
        t/native_pbc/*.t
    ) ],
    src => [ qw(
        t/src/*.t
        t/src/embed/*.t
    ) ],
);

# GROUPS OF BASIC GROUPS

our @major_test_group = map { $test_groups{$_} }
    ( qw| compilers dynoplibs dynpmc library miscellaneous | );

our @near_core_test_group = map { $test_groups{$_} }
    ( qw| src run perl | );

# EXPORT FUNCTIONALITY

use base qw( Exporter );
our @EXPORT_OK = qw(
    %test_groups
    @major_test_group
    @near_core_test_group
);

1;

=head1 NAME

Parrot::Harness::TestSets - Various groups of tests

=head1 DESCRIPTION

This package attempts to consolidate all assignments to groups of files used
during testing.  It exports, on demand only, various arrays used in
F<t/harness>, other harnesses and the libraries underlying those programs.

=head1 EXPORTED IDENTIFIERS

=head2 C<%test_groups>

Keys are labels like C<benchmark>. Values are references to arrays of file
glop patterns.  Example:

    buildtools => [ qw(
        t/tools/pmc2cutils/*.t
        t/pharness/*.t
    ] ),

=head2 C<@major_test_group>

Array holding elements of the values of these C<%test_groups> elements:

    compilers dynoplibs dynpmc library miscellaneous

=head2 C<@near_core_test_group>

Array holding elements of the values of these C<%test_groups> elements:

    src run perl

=head1 HOW TO ADD A GROUP

If you need to add a basic group, make up a label for the group to serve as
its key in C<%test_groups>.  For its value, compose an array of file glob
patterns needed, each beginning with C<t/>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
