# Copyright (C) 2006-2008, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Harness::DefaultTests - Tests run by default by F<t/harness>

=head1 DESCRIPTION

Upon request, this package exports six arrays holding various sets of paths to
directories holding test files:

    @runcore_tests
    @core_tests
    @library_tests
    @configure_tests
    @standard_tests
    @developing_tests

Each of these arrays holds a list of paths containing wildcards which are
expanded by the shell when provided to programs such as F<t/harness>.  The
paths describe directories holding test files.

Example:

    @core_tests = qw(
        t/run/*.t
        t/src/*.t
        t/perl/*.t
    );


In addition, Parrot::Harness::Default Tests exports B<by default> one
subroutine:  C<get_default_tests()>.  In list context, C<get_default_tests()>
returns a list of shell-expandable paths to the most common tests.  In scalar
context it returns a reference to that list.

=cut

package Parrot::Harness::DefaultTests;

use strict;
use warnings;

our (
    @runcore_tests,
    @core_tests,
    @library_tests,
    @configure_tests,
    @standard_tests,
    @developing_tests
);
use base qw( Exporter );
our @EXPORT = qw( get_default_tests );
our @EXPORT_OK = qw(
    @runcore_tests
    @core_tests
    @library_tests
    @configure_tests
    @standard_tests
    @developing_tests
);

# runcore tests are always run.
@runcore_tests = qw(
    t/compilers/imcc/*/*.t
    t/op/*.t
    t/pmc/*.t
    t/oo/*.t
    t/native_pbc/*.t
    t/dynpmc/*.t
    t/dynoplibs/*.t
);

# core tests are run unless --runcore-tests is present.  Typically
# this list and the list above are run in response to --core-tests
@core_tests = qw(
    t/run/*.t
    t/src/*.t
    t/perl/*.t
);

# library tests are run unless --runcore-tests or --core-tests is present.
@library_tests = qw(
    t/compilers/pct/*.t
    t/compilers/pge/*.t
    t/compilers/pge/p5regex/*.t
    t/compilers/pge/perl6regex/*.t
    t/compilers/tge/*.t
    t/library/*.t
    t/tools/*.t
);

# configure tests are tests to be run at the beginning of 'make test';
# standard tests are other tests run by default with no core options
# present
@configure_tests = qw( t/configure/*.t t/steps/*.t t/postconfigure/*.t );
@standard_tests = qw(
    t/compilers/json/*.t
    t/examples/*.t
    t/distro/manifest.t
);

@developing_tests = ( 't/distro/file_metadata.t' );
# Add in all t/codingstd except for a few skips.
push @developing_tests, glob 't/codingstd/*.t';

sub get_default_tests {
    my ($core_tests_only, $runcore_tests_only) = @_;

    # Add metadata.t and coding standards tests only if we're DEVELOPING

    # Note:  As of 2008-10-21, we're no longer including @standard_tests in
    # @default_tests -- which means they're not included in 'make test'.
    # But, for the time being, at least, we are still making
    # it an exportable variable.  So we'll test for it in
    # t/pharness/01-default_tests.t.

    if ( -e "DEVELOPING" ) {
        push @standard_tests, @developing_tests;
    }

    # build the list of default tests
    my @default_tests = @runcore_tests;
    unless ($runcore_tests_only) {
       push @default_tests, @core_tests;
       unless ($core_tests_only) {
           push @default_tests, @library_tests;
           unshift @default_tests, @configure_tests;
       }
    }
    wantarray
        ? return @default_tests
        : return [ @default_tests ];
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
