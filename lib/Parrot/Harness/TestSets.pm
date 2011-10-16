package Parrot::Harness::TestSets;
# Copyright (C) 2011, Parrot Foundation.

use strict;
use warnings;

# BASIC GROUPS

our @benchmark_test_files = qw(
    t/benchmark/*.t
);
our @buildtools_test_files = qw(
    t/tools/pmc2cutils/*.t
    t/pharness/*.t
);
our @codingstd_test_files = qw(
    t/codingstd/*.t
);
our @compilers_test_files = qw(
    t/compilers/pct/*.t
    t/compilers/pge/*.t
    t/compilers/pge/p5regex/*.t
    t/compilers/pge/perl6regex/*.t
    t/compilers/tge/*.t
    t/compilers/opsc/*.t
    t/compilers/data_json/*.t
);
our @configure_test_files = qw(
    t/configure/*.t
    t/steps/*.t
    t/postconfigure/*.t
);
our @distro_test_files = qw(
    t/distro/*.t
);
our @dynoplibs_test_files = qw(
    t/dynoplibs/*.t
);
our @dynpmc_test_files = qw(
    t/dynpmc/*.t
);
our @examples_test_files = qw(
    t/examples/*.t
);
our @headerizer_test_files = qw(
    t/tools/dev/headerizer/*.t
);
our @library_test_files = qw(
    t/library/*.t
);
our @manifest_test_files = qw(
    t/manifest/*.t
    t/tools/install/*.t
);
our @miscellaneous_test_files = qw(
    t/ext/winxed/*.t
    t/tools/*.t
    t/profiling/*.t
);
our @perl_test_files = qw(
    t/perl/*.t
);
our @run_test_files = qw(
    t/run/*.t
);
our @runcore_test_files = qw(
    t/compilers/imcc/*/*.t
    t/op/*.t
    t/pmc/*.t
    t/oo/*.t
    t/pir/*.t
    t/native_pbc/*.t
);
our @src_test_files = qw(
    t/src/*.t
    t/src/embed/*.t
);

# GROUPS OF BASIC GROUPS

our @major_test_group = (
    @compilers_test_files,
    @dynoplibs_test_files,
    @dynpmc_test_files,
    @library_test_files,
    @miscellaneous_test_files,
);
our @near_core_test_group = (
    @src_test_files,
    @run_test_files,
    @perl_test_files,
);

use base qw( Exporter );
our @EXPORT_OK = (
    @benchmark_test_files,
    @buildtools_test_files,
    @codingstd_test_files,
    @compilers_test_files,
    @configure_test_files,
    @distro_test_files,
    @dynoplibs_test_files,
    @dynpmc_test_files,
    @examples_test_files,
    @headerizer_test_files,
    @library_test_files,
    @manifest_test_files,
    @miscellaneous_test_files,
    @perl_test_files,
    @run_test_files,
    @runcore_test_files,
    @src_test_files,
    #
    @major_test_group,
    @near_core_test_group,
);

1;

=head1 NAME

Parrot::Harness::TestSets - Various groups of tests

=head1 DESCRIPTION

This package attempts to consolidate all assignments to groups of files used
during testing.  It exports, on demand only, various arrays used in
F<t/harness> or in F<Makefile> and the templates (I<e.g.,>
F<config/gen/makefiles/root.in>) underlying F<Makefile>.

Two types of arrays are defined in this package.

=over 4

=item * Basic Groups

A basic group is a list of glob patterns, defined with respect to the
top-level Parrot directory.  Example:

    our @buildtools_test_files = (
        glob("./t/tools/pmc2cutils/*.t"),
        glob("./t/pharness/*.t"),
    );

=item * Groups of Basic Groups

A group of basic group is a list of basic groups.  Example:

    our @major_test_group = (
        @compilers_test_files,
        @dynoplibs_test_files,
        @dynpmc_test_files,
        @library_test_files,
        @miscellaneous_test_files,
    );

=back

=head2 How to Add a Group

If you need to add a basic group, define the group as an C<our
@XXX_test_files> and assign glob statements in the order you want them to be
run.

Then add the array holding the basic group to C<@EXPORT_OK> toward the bottom
of the file.

=cut

