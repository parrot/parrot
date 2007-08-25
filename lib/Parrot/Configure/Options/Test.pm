# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$
package Parrot::Configure::Options::Test;
use strict;
use warnings;

our @preconfiguration_tests = qw(
    t/configure/*.t
);

our @postconfiguration_tests = qw(
    t/postconfigure/*.t
    t/tools/pmc2cutils/*.t
    t/tools/ops2cutils/*.t
    t/tools/ops2pmutils/*.t
);

sub new {
    my ($class, $argsref) = @_;
    my $self = {};
    my ($run_configure_tests, $run_build_tests);
    if (defined $argsref->{test}) {
        if ($argsref->{test} eq '1') {
            $self->{run_configure_tests} = 1;
            $self->{run_build_tests} = 1;
        } elsif ($argsref->{test} eq 'configure') {
            $self->{run_configure_tests} = 1;
        } elsif ($argsref->{test} eq 'build') {
            $self->{run_build_tests} = 1;
        } else {
            die "'$argsref->{test}' is a bad value for command-line option 'test'";
        }
    }
    return bless $self, $class;
}

sub run_configure_tests {
    my $self = shift;
    if ($self->{run_configure_tests}) {
        print "As you requested, we'll start with some tests of the configuration tools.\n\n";
        system(qq{prove @preconfiguration_tests})
            and die "Unable to execute configuration tests";
        print <<"TEST";

I just ran some tests to demonstrate that
Parrot's configuration tools will work as intended.

TEST
    }
    return 1;
}

sub run_build_tests {
    my $self = shift;
    if ($self->{run_build_tests}) {
        print "\n\n";
        print "As you requested, I will now run some tests of the build tools.\n\n";
        system(qq{prove @postconfiguration_tests})
            and die "Unable to execute post-configuration and build tools tests";
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
