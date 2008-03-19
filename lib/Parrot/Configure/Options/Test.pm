# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$
package Parrot::Configure::Options::Test;
use strict;
use warnings;
use Carp;
use Test::Harness;
use lib qw(lib);
use Parrot::Configure::Step::List qw( get_steps_list );

my @framework_tests;
my $config_dir = q{t/configure};
opendir my $DIRH, $config_dir or croak "Unable to open $config_dir";
for my $t (sort grep { /\d{3}-\w+\.t$/ } readdir $DIRH) {
    push @framework_tests, qq{$config_dir/$t};
}
closedir $DIRH or croak "Unable to close $config_dir";

my $steps_dir = q{t/steps};
my %steps_tests;
my @steps_tests;
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

my @steps = get_steps_list();

foreach my $step (@steps) {
    my @temp = split /::/, $step;
    my %these_tests = %{ $steps_tests{$temp[0]}{$temp[1]} };
    foreach my $k (sort keys %these_tests) {
        push @steps_tests, qq{$steps_dir/$temp[0]_$temp[1]-$k.t};
    }
}

our @preconfiguration_tests = (
    @framework_tests,
    @steps_tests,
);

our @postconfiguration_tests = (
    glob("t/postconfigure/*.t"),
    glob("t/tools/pmc2cutils/*.t"),
    glob("t/tools/ops2cutils/*.t"),
    glob("t/tools/ops2pmutils/*.t"),
    glob("t/tools/revision/*.t"),
    glob("t/pharness/*.t"),
);

sub new {
    my ( $class, $argsref ) = @_;
    my $self = {};
    bless $self, $class;
    my ( $run_configure_tests, $run_build_tests );
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
        silent
        verbose
        verbose-step
    |;
    for my $k (grep { ! $excluded_options{$_} } keys %{$argsref}) {
        $self->set($k, $argsref->{$k});
    }
    my $sto = '.configure_parallel.sto';
    if (-e $sto) {
        unlink $sto or die "Unable to unlink $sto: $!";
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
    if ( $self->get_run('run_configure_tests') ) {
        print "As you requested, we'll start with some tests of the configuration tools.\n\n";

        runtests(@preconfiguration_tests) or die
            "Pre-configuration tests did not complete successfully; Configure.pl will not continue.";
        print <<"TEST";

I just ran some tests to demonstrate that
Parrot's configuration tools will work as intended.

TEST
    }
    return 1;
}

sub run_build_tests {
    my $self = shift;
    if ( $self->get_run('run_build_tests') ) {
        print "\n\n";
        print "As you requested, I will now run some tests of the build tools.\n\n";
        runtests(@postconfiguration_tests) or die
            "Post-configuration and build tools tests did not complete successfully; running 'make' might be dubious.";
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

    $args = process_options( {
        argv            => [ @ARGV ],
        mode            => q{configure},
    } );

    $opttest = Parrot::Configure::Options::Test->new($args);

    $opttest->run_configure_tests();

    $opttest->run_build_tests();

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

None.

=item * Return Value

None.

=item * Comments

The tests to be executed are listed in
C<@Parrot::Configure::Options::Test::preconfiguration_tests>.  Edit that list
to run different tests.  Currently, that array runs all tests in
F<t/configure/*.t>.

=back

=head2 C<run_build_tests()>

=over 4

=item * Purpose

Run tests of Parrot's build tools.  Also, run tests of certain aspects of the
configuration process which, for legacy reasons, must run after
F<Configure.pl> has completed execution.

=item * Arguments

None.

=item * Return Value

None.

=item * Comments

The tests to be executed are listed in
C<@Parrot::Configure::Options::Test::postconfiguration_tests>.  Edit that list
to run different tests.  Currently, that array runs all tests in:

    t/postconfigure/*.t
    t/tools/pmc2cutils/*.t
    t/tools/ops2cutils/*.t
    t/tools/ops2pmutils/*.t

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
