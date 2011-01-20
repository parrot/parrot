# Copyright (C) 2001-2006, Parrot Foundation.
package Parrot::Configure::Options::Test;
use strict;
use warnings;
use Carp;
use Test::Harness;
use lib qw(lib);
use Parrot::Configure::Step::List qw( get_steps_list );
use Parrot::Configure::Options::Test::Prepare qw( get_steps_missing_tests );

sub new {
    my ( $class, $argsref ) = @_;
    my $self = {};
    bless $self, $class;
    if ( defined $argsref->{test} ) {
        if ( $argsref->{test} eq '1' ) {
            $self->set_run('run_configure_tests', 1);
            $self->set_run('run_build_tests', 1);
        }
        elsif ( $argsref->{test} eq 'configure' ) {
            $self->set_run('run_configure_tests', 1);
        }
        elsif ( $argsref->{test} eq 'build' ) {
            $self->set_run('run_build_tests', 1);
        }
        else {
            die "'$argsref->{test}' is a bad value for command-line option 'test'";
        }
    }
    my %excluded_options = map {$_ => 1} qw|
        ask
        configure_trace
        debugging
        fatal
        fatal-step
        help
        script
        silent
        verbose
        verbose-step
    |;
    for my $k (grep { ! $excluded_options{$_} } keys %{$argsref}) {
        $self->set($k, $argsref->{$k});
    }
    return $self;
}

sub set {
    my $self = shift;
    die "Need 2 arguments to Parrot::Configure::Options::Test::set()"
        unless @_ == 2;
    my ($option, $value) = @_;
    $self->{options}{$option} = $value;
}

sub get {
    my $self = shift;
    die "Need 1 argument to Parrot::Configure::Options::Test::get()"
        unless @_ == 1;
    my $option = shift;
    return $self->{options}{$option} || undef;
}

sub set_run {
    my $self = shift;
    die "Need 2 arguments to Parrot::Configure::Options::Test::set_run()"
        unless @_ == 2;
    my ($option, $value) = @_;
    $self->{run}{$option} = $value;
}

sub get_run {
    my $self = shift;
    die "Need 1 argument to Parrot::Configure::Options::Test::get_run()"
        unless @_ == 1;
    my $option = shift;
    return $self->{run}{$option} || undef;
}

sub run_configure_tests {
    my $self = shift;
    my @preconfiguration_tests = @_;
    if ( $self->get_run('run_configure_tests') ) {
        my $start = time();
        print "As you requested, we'll start with some tests of the configuration tools.\n\n";

        runtests(@preconfiguration_tests) or die
            "Pre-configuration tests did not complete successfully; Configure.pl will not continue.";
        print <<"TEST";

I just ran some tests to demonstrate that
Parrot's configuration tools will work as intended.

TEST
        my $end =time();
        print scalar(@preconfiguration_tests),
            " t/configure tests took ",
            ($end - $start), " seconds.\n";
    }
    return 1;
}

sub run_build_tests {
    my $self = shift;
    my @postconfiguration_tests = @_;
    if ( $self->get_run('run_build_tests') ) {
        my $start = time();
        print "\n\n";
        print "As you requested, I will now run some tests of the build tools.\n\n";
        my @steps_missing_tests = get_steps_missing_tests();
        if (@steps_missing_tests) {
            print "The following configuration steps lack corresponding tests:\n";
            print "  $_\n" for @steps_missing_tests;
        }
        runtests(@postconfiguration_tests) or die
            "Post-configuration and build tools tests did not complete successfully; running 'make' might be dubious.";
        my $end =time();
        print scalar(@postconfiguration_tests),
            " t/steps, t/postconfigure and t/pharness tests took ",
            ($end - $start), " seconds.\n";
    }
    return 1;
}

1;

#################### DOCUMENTATION ####################

=head1 NAME

Parrot::Configure::Options::Test - Run configuration and build tests along with F<Configure.pl>

=head1 SYNOPSIS

In F<Configure.pl>:

    use Parrot::Configure::Options;
    use Parrot::Configure::Options::Test;
    use Parrot::Configure::Options::Test::Prepare qw(
        get_preconfiguration_tests
        get_postconfiguration_tests
    );

    $args = process_options( {
        argv            => [ @ARGV ],
        mode            => q{configure},
    } );

    $opttest = Parrot::Configure::Options::Test->new($args);

    $opttest->run_configure_tests( get_preconfiguration_tests() );

    $opttest->run_build_tests( get_postconfiguration_tests() );

On command line:

    # run tests of configuration tools, then configure
    perl Configure.pl  --test=configure

    # configure, then run tests of build tools
    perl Configure.pl  --test=build

    # run tests of configuration tools, then configure,
    # then run tests of build tools
    perl Configure.pl  --test

=head1 DESCRIPTION

Test suites have been constructed which test those of Parrot's configuration
and build tools that are written in Perl 5.  These tests are not necessarily
run when you invoke F<make test>.  In any event, running these tests as part
of F<make test> is, in a certain sense, running them too late.  If you have
successfully called F<Configure.pl> and F<make>, you have implicitly
demonstrated that the configuration and build tools work (for the most part),
so running tests of those tools post-F<make> is somewhat redundant.

On the other hand, tests of the configuration tools I<are> meaningful if run
I<before> F<Configure.pl> is invoked and, similarly, tests of the build tools
I<are> meaningful if run I<before> F<make> is invoked.
Parrot::Configure::Options::Test provides functionality for running such
tests.

=head1 SUBROUTINES

=head2 C<new()>

=over 4

=item * Purpose

Parrot::Configure::Options::Test constructor.

=item * Arguments

One argument:  The hash reference which is the return value of
C<Parrot::Configure::Options::process_options()>.

=item * Return Value

Parrot::Configure::Options::Test object.

=item * Comment

=back

=head2 C<run_configure_tests()>

=over 4

=item * Purpose

Run tests of Parrot's configuration tools.

=item * Arguments

List of test files, typically supplied by
C<Parrot::Configure::Options::Test::Prepare::get_preconfiguration_tests()>.

=item * Return Value

None.

=back

=head2 C<run_build_tests()>

=over 4

=item * Purpose

Run tests of Parrot's build tools.  Also, run tests of certain aspects of the
configuration process which, for legacy reasons, must run after
F<Configure.pl> has completed execution.

=item * Arguments

List of test files, typically supplied by
C<Parrot::Configure::Options::Test::Prepare::get_postconfiguration_tests()>.

=item * Return Value

None.

=back

=head1 AUTHOR

James E Keenan, in response to request by Jerry Gay
in http://rt.perl.org/rt3/Ticket/Display.html?id=42690.

=head1 SEE ALSO

F<Configure.pl>.  F<lib/Parrot/Configure/Options.pm>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
