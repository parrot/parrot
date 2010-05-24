# Copyright (C) 2001-2006, Parrot Foundation.
# $Id$
package Parrot::Configure::Options::Test::Prepare;
use strict;
use warnings;
use Carp;
use Data::Dumper;$Data::Dumper::Indent=1;
use File::Find;
#use Scalar::Util qw( looks_like_number );
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
my ( $steps_tests_simple_ref, $steps_tests_complex_ref )  =
    _find_steps_tests($steps_dir);
my @steps_expected = get_steps_list();
my @steps_tests = _prepare_steps_tests_list(
    $steps_dir,
    $steps_tests_complex_ref,
    \@steps_expected,
);

sub get_preconfiguration_tests {
    return ( @framework_tests );
};

sub get_postconfiguration_tests {
    my @postconfiguration_tests = (
        @steps_tests,
        glob("t/postconfigure/*.t"),
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

my %steps_tests_simple = ();
my %steps_tests_complex = ();
sub _find_steps_tests {
    my $steps_dir = shift;
    sub wanted {
        if ( $File::Find::name =~
            m<
                (init|inter|auto|gen) # category
                /
                ([a-z_\d]+) # class
                (?:/
                ([a-z_]+) # second-level
                )?        # may not be defined
                -
                (\d{2}) # number
                \.t$
            >x ) {
            $steps_tests_simple{$File::Find::name}++;
            my ($category, $class, $secondlevel, $number) =
                ($1, $2, $3 || q{}, $4);
            my $final = ( $secondlevel )
                ? qq|$secondlevel-$number|
                : $number;
            $steps_tests_complex{$category}{$class}{$final}++;

            return;
        }
    } # END wanted()
    finddepth( \&wanted, ( $steps_dir ) );
    return ( \%steps_tests_simple, \%steps_tests_complex );
}

sub _prepare_steps_tests_list {
    my $steps_dir = shift;
    my $steps_tests_ref = shift;
    my $steps_expected_ref = shift;
    my @steps_tests;
    # The order of tests of config steps is governed by
    # Parrot::Configure::Step::List::get_steps_list().
    foreach my $step ( @{ $steps_expected_ref } ) {
        my @module_path = split /::/, $step;
        my $these_tests = $steps_tests_ref->{$module_path[0]}{$module_path[1]}
            or carp "No tests exist for configure step $step";
        foreach my $k (sort keys %$these_tests) {
            if ( $k =~ m/^(\w+)-(\d{2})$/ ) {
                my ($secondlevel, $number) = ($1, $2);
                push @steps_tests,
                    qq{$steps_dir/$module_path[0]/$module_path[1]/$secondlevel-$number.t};
            }
            else {
                push @steps_tests,
                    qq{$steps_dir/$module_path[0]/$module_path[1]-$k.t};
            }
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
