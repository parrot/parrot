# Copyright (C) 2001-2006, Parrot Foundation.
# $Id$
package Parrot::Configure::Options::Test::Prepare;
use strict;
use warnings;
use Carp;
use base qw( Exporter );
our @EXPORT_OK = qw(
    get_preconfiguration_tests
    get_postconfiguration_tests
);
use lib qw(lib);
use Parrot::Configure::Step::List qw( get_steps_list );

my $config_dir = q{t/configure};
my @framework_tests = _get_framework_tests($config_dir);

my $steps_dir = q{t/steps};
my $steps_tests_ref  = _get_steps_tests($steps_dir);
my @steps_expected = get_steps_list();
my @steps_tests = _prepare_steps_tests_list(
    $steps_dir,
    $steps_tests_ref,
    \@steps_expected,
);

sub get_preconfiguration_tests {
    return ( @framework_tests, @steps_tests );
};

sub get_postconfiguration_tests {
    my @postconfiguration_tests = (
        glob("t/postconfigure/*.t"),
        glob("t/tools/pmc2cutils/*.t"),
        glob("t/tools/ops2cutils/*.t"),
        glob("t/tools/ops2pm/*.t"),
        glob("t/pharness/*.t"),
    );
    return @postconfiguration_tests;
};

########## INTERNAL SUBROUTINES ##########

sub _get_framework_tests {
    my $config_dir = shift;
    my @framework_tests;
    opendir my $DIRH, $config_dir or croak "Unable to open $config_dir";
    for my $t (sort grep { /\d{3}-\w+\.t$/ } readdir $DIRH) {
        push @framework_tests, qq{$config_dir/$t};
    }
    closedir $DIRH or croak "Unable to close $config_dir";
    return @framework_tests;
}

sub _get_steps_tests {
    my $steps_dir = shift;
    my %steps_tests = ();
    opendir my $DIRH2, $steps_dir or croak "Unable to open $steps_dir";
    for my $t (grep { /\.t$/ } readdir $DIRH2) {
        my ($type, $class, $num);
        if ($t =~ m/(init|inter|auto|gen)_(\w+)-(\d{2})\.t$/) {
            ($type, $class, $num) = ($1,$2,$3);
            $steps_tests{$type}{$class}{$num}++;
        }
        else {
            carp "Unable to match $t";
        }
    }
    closedir $DIRH2 or croak "Unable to close $steps_dir";
    return \%steps_tests;
}

sub _prepare_steps_tests_list {
    my $steps_dir = shift;
    my $steps_tests_ref = shift;
    my $steps_expected_ref = shift;
    my %steps_tests = %{ $steps_tests_ref };
    my @steps_tests;
    foreach my $step ( @{ $steps_expected_ref } ) {
        my @temp = split /::/, $step;
        my $these_tests = $steps_tests{$temp[0]}{$temp[1]}
            or carp "No tests exist for configure step $step";
        foreach my $k (sort keys %$these_tests) {
            push @steps_tests, qq{$steps_dir/$temp[0]_$temp[1]-$k.t};
        }
    }
    return @steps_tests;
}

1;

#################### DOCUMENTATION ####################

=head1 NAME

Parrot::Configure::Options::Test::Prepare

=head1 ABSTRACT

Prepare the lists of tests run before and after configuration when C<--test>
option is provided to F<Configure.pl>.

=head1 SYNOPSIS

In F<Configure.pl>:

    use Parrot::Configure::Options::Test::Prepare qw(
        get_preconfiguration_tests
        get_postconfiguration_tests
    );

    ...

    $opttest->run_configure_tests( get_preconfiguration_tests() );

    ...

    $opttest->run_build_tests( get_postconfiguration_tests() );

=head1 DESCRIPTION

This module exports on demand two subroutines, each of which takes no
arguments and returns a list:

=over 4

=item * C<get_preconfiguration_tests()>

Returns a list of the tests of the mechanics of the configuration system found
in F<t/configure/> and tests of the configuration step classes found in
F<t/steps/>.

=item * C<get_postconfiguration_tests()>

Returns a list of the tests found in these directories:

    t/postconfigure/
    t/tools/pmc2cutils/
    t/tools/ops2cutils/
    t/tools/ops2pm/
    t/pharness/

=back

=head1 AUTHOR

James E Keenan.

=head1 SEE ALSO

F<Configure.pl>.  F<lib/Parrot/Configure/Options/Test.pm>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
