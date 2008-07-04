#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_icu-04.t

use strict;
use warnings;
use Test::More tests => 12;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use_ok('config::init::defaults');
use_ok('config::auto::icu');

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::icu};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

my $phony = q{phony};
$step->{icuconfig_default} = $phony;

my $ret = $step->runstep($conf);
ok( $ret, "$step_name runstep() returned true value" );
TODO: {
    local $TODO = 'reported failing on Win32';
    my $expected = q{failed};
    is($step->result(), $expected,
        "Got expected return value: $expected");
}
    
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_icu-04.t - test config::auto::icu

=head1 SYNOPSIS

    % prove t/steps/auto_icu-04.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::icu in the case where an alternate
ICU configuration program is utilized.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::icu, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
