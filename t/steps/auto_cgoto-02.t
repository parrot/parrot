#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_cgoto-02.t

use strict;
use warnings;
use Test::More tests =>  16;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::cgoto');
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

my $pkg = q{auto::cgoto};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );


my $ret = $step->runstep($conf);
ok( $ret, "$step_name runstep() returned true value" );
ok(defined($step->result()), "A result was defined");
ok(defined($conf->data->get('TEMP_cg_h')), "An attribute has been defined");
ok(defined($conf->data->get('TEMP_cg_c')), "An attribute has been defined");
ok(defined($conf->data->get('TEMP_cg_o')), "An attribute has been defined");
ok(defined($conf->data->get('TEMP_cg_r')), "An attribute has been defined");
ok(defined($conf->data->get('cg_flag')), "An attribute has been defined");


pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_cgoto-02.t - test config::auto::cgoto

=head1 SYNOPSIS

    % prove t/steps/auto_cgoto-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::cgoto.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::cgoto, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
