#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 132-auto_arch-02.t

use strict;
use warnings;
use Test::More tests => 14;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::arch');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::arch};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

my $errstr;
{
    # As the t/configure/ test suite is currently (Dec 25 2007) constructed,
    # an uninitialized value warning is generated when this test is run on
    # Darwin because of a hack in config/auto/arch.pm.  We capture the warning
    # and verify that we did so if on Darwin.  In the future, we will be able
    # to eliminate this use of the signal handler because the
    # Parrot::Configure object will have the same information available to it
    # as it does during regular configuration.
    local $SIG{__WARN__} = \&_capture;
    my $ret = $step->runstep($conf);
    ok( $ret, "$step_name runstep() returned true value" );
    is($step->result(), q{}, "Result was empty string as expected");
    if ($^O eq 'darwin') {
        like(
            $errstr,
            qr/Uninitialized value/i,
            "Caught uninitialized value warning as expected"
        );
    } else {
        pass("Test not needed except on Darwin");
    } 
}

pass("Keep Devel::Cover happy");
pass("Completed all tests in $0");

sub _capture { $errstr = $_[0]; }

################### DOCUMENTATION ###################

=head1 NAME

132-auto_arch-02.t - test config::auto::arch

=head1 SYNOPSIS

    % prove t/configure/132-auto_arch-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::arch in its typical case.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::arch, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
