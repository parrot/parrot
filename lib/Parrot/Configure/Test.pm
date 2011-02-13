# Copyright (C) 2007, Parrot Foundation.
package Parrot::Configure::Test;
use strict;
use warnings;
our ( @ISA, @EXPORT_OK );
@ISA       = qw(Exporter);
@EXPORT_OK = qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use Carp;
*ok     = *Test::More::ok;
*isa_ok = *Test::More::isa_ok;
use lib qw( lib );
use Parrot::Configure;

my $stepnum = -1;

sub stepnum {
    $stepnum++;
    return $stepnum;
}

sub test_step_thru_runstep {
    my ( $conf, $pkg, $args ) = @_;
    my ( $task, $step_name, $step, $ret );

    $conf->add_steps($pkg);
    $conf->options->set( %{$args} );

    $task        = $conf->steps->[ stepnum() ];
    $step_name   = $task->step;

    $step = $step_name->new();
    ok( defined $step, "$step_name constructor returned defined value" );
    isa_ok( $step, $step_name );
    ok( $step->description(), "$step_name has description" );
    $ret = $step->runstep($conf);
    ok( defined $ret, "$step_name runstep() returned defined value" );
    return $stepnum;
}

sub rerun_defaults_for_testing {
    my $conf = shift;
    my $args = shift;
    $conf->add_steps(q{init::defaults});
    $conf->options->set( %{$args} );

    my ( $task, $step_name, $step );
    $task        = $conf->steps->[ -1 ];
    $step_name   = $task->step;

    $step = $step_name->new();
    ok( defined $step, "$step_name constructor returned defined value" );
    isa_ok( $step, $step_name );
    ok( $step->description(), "$step_name has description" );
    my $ret = $step->runstep($conf);
    return $ret;
}

sub test_step_constructor_and_description {
    my $conf = shift;
    my $task = $conf->steps->[-1];
    my $step_name   = $task->step;
    my $step = $step_name->new();
    ok(defined $step, "$step_name constructor returned defined value");
    isa_ok($step, $step_name);
    ok($step->description(), "$step_name has description");
    return $step;
}

1;

################### DOCUMENTATION ###################

=head1 NAME

Parrot::Configure::Test - subroutines used in F<t/configure/*> tests

=head1 SYNOPSIS

    use lib qw( lib );
    use Parrot::Configure::Test qw( test_step_thru_runstep );

Set-up for C<test_step_thru_runstep()>:

    $parrot_version = Parrot::BuildUtil::parrot_version();
    $args = process_options( {
        argv            => [ ],
        script          => $0,
        parrot_version  => $parrot_version,
} );

    $conf = Parrot::Configure->new;
    test_step_thru_runstep($conf, q{init::defaults}, $args);

=head1 DESCRIPTION

The subroutines in this package are used to simplify tests found in
F<t/configure/>.  Any subroutine in this package should be functional
(C<i.e.>, not object-oriented), be exported only on demand and have all its
arguments explicitly passed as arguments.

=head1 FUNCTIONS

=head2 C<test_step_thru_runstep()>

=over 4

=item * Purpose

Reduce code repeated in many test files in the F<t/configure/101+> series.
Execution of certain configuration steps depends upon successful
execution of some (though not necessarily all) of the preceding configuration
steps.  Hence, unit tests of the packages generating certain steps may require
execution of preceding steps in the test file.  Once you determine that you
need to execute one step as a prerequisite to another, you can provide that
step as an argument to C<test_step_thru_runstep()> and not worry about it
further.

=item * Arguments

List of three arguments:

=over 4

=item *

Parrot::Configure object

=item *

string holding the name of the step to be run

=item *

hash reference which is the output of
C<Parrot::Configure::Options::process_options()>.

=back

=item * Return Value

Returns the step number, but currently this is not used and needs
further exploration.

=item * Comment

Each invocation of C<test_step_thru_runstep()> runs 4 Test::More tests.

=back

=head1 AUTHORS

David H Adler and James E Keenan

=head1 SEE ALSO

F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
