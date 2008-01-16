#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_warnings-08.t

use strict;
use warnings;
use Test::More tests => 23;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::init::hints');
use_ok('config::inter::progs');
use_ok('config::auto::warnings');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw | capture |;

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );
test_step_thru_runstep( $conf, q{init::hints}, $args );
test_step_thru_runstep( $conf, q{inter::progs}, $args );

my $pkg = q{auto::warnings};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

{
    my ($stdout, $rv);
    # Mock case where C compiler is not gcc.
    $conf->data->set( gccversion => undef );
    $conf->options->set( verbose => 1 );
    capture(
        sub { $rv = $step->runstep($conf); },
        \$stdout,
    );
    ok($rv, "runstep() returned true value");
    is($step->result(), q{skipped}, "Got expected result");
    like($stdout,
        qr/Currently we only set warnings/,
        "Got expected verbose output"
    );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_warnings-08.t - test config::auto::warnings

=head1 SYNOPSIS

    % prove t/steps/auto_warnings-08.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::warnings when the C compiler
being used is not I<gcc> and when C<--verbose> option has been selected.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::warnings, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
