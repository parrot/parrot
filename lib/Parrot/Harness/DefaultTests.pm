# Copyright (C) 2006-2011, Parrot Foundation.

=head1 NAME

Parrot::Harness::DefaultTests - Tests run by default by F<t/harness>

=head1 DESCRIPTION

Upon request, this package exports four arrays holding glob patterns for
directories holding test files:

    @runcore_tests
    @core_tests
    @library_tests
    @configure_tests

The package also exports one array holding a list of test files:

    @developing_tests

The definition of these lists is found in
F<lib/Parrot/Harness/TestSets.pm>.

In addition, Parrot::Harness::DefaultTests exports B<by default> one
subroutine:  C<get_common_tests()>.  In list context, C<get_common_tests()>
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
    @developing_tests
);
use base qw( Exporter );
our @EXPORT = qw( get_common_tests );
our @EXPORT_OK = qw(
    @runcore_tests
    @core_tests
    @library_tests
    @configure_tests
    @developing_tests
);
use lib qw( ./lib );
use Parrot::Harness::TestSets qw(
    %test_groups
    @major_test_group
    @near_core_test_group
);

# runcore tests are always run.
@runcore_tests = @{ $test_groups{runcore} };

# core tests are run unless --runcore-tests is present.  Typically
# this list and the list above are run in response to --core-tests
foreach my $el (@near_core_test_group) {
    push @core_tests, @{$el};
}

# library tests are run unless --runcore-tests or --core-tests is present.
foreach my $el (@major_test_group) {
    push @library_tests, @{$el};
}

# configure tests are tests to be run at the beginning of 'make test';
@configure_tests = @{ $test_groups{configure} };

@developing_tests = glob("@{ $test_groups{codingstd} }");

sub get_common_tests {
    my ($longopts) = @_;

    my @common_tests = @runcore_tests;
    unless ($longopts->{runcore_tests_only}) {
       push @common_tests, @core_tests;
       unless ($longopts->{core_tests_only}) {
           push @common_tests, @library_tests;
           unshift @common_tests, @configure_tests;
       }
    }
    wantarray
        ? return @common_tests
        : return [ @common_tests ];
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
