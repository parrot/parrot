#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_gettext-03.t

use strict;
use warnings;
use Test::More tests =>  15;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::gettext');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw| capture |;


my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::gettext};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );


my $verbose;

$verbose = undef;
$conf->data->set( ccflags => q{} );
ok(auto::gettext::_handle_gettext($conf, $verbose),
    "_handle_gettext() returned true value");
like($conf->data->get( 'ccflags' ), qr/-DHAS_GETTEXT/,
    "HAS_GETTEXT was added to 'ccflags'");

{
    my ($stdout, $rv);
    $verbose = 1;
    capture(
        sub { $rv = auto::gettext::_handle_gettext($conf, $verbose); },
        \$stdout,
    );
    ok($rv, "_handle_gettext() returned true value");
    like($conf->data->get( 'ccflags' ), qr/-DHAS_GETTEXT/,
        "HAS_GETTEXT was added to 'ccflags'");
    like($stdout,
        qr/ccflags:\s.*-DHAS_GETTEXT/,
        "Got expected verbose output"
    );
}

pass("Keep Devel::Cover happy");
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_gettext-03.t - test config::auto::gettext

=head1 SYNOPSIS

    % prove t/steps/auto_gettext-03.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test internal subroutine
C<auto::gettext::_handle_gettext()>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gettext, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
