#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 028-option_or_data.t

use strict;
use warnings;

use Test::More tests => 12;
use Carp;
use lib qw( lib );
use config::init::defaults;
use config::init::install;
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use Parrot::Configure::Step::List qw( get_steps_list );

$| = 1;
is( $|, 1, "output autoflush is set" );

my $testopt    = q{bindir};
my $testoptval = q{mybindir};
my $localargv  = [];
my ($args, $step_list_ref) = process_options(
    {
        mode => q{configure},
        argv => $localargv,
    }
);
ok( defined $args, "process_options returned successfully" );

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my ( $task, $step_name, $step, $ret );
my $pkg = q{init::install};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );
$ret = $step->runstep($conf);
ok( defined $ret, "$step_name runstep() returned defined value" );

my $val = $conf->option_or_data($testopt);
is(
    $val,
    $conf->data->get($testopt),
    'option_or_data() returned expected value when no option provided'
);

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

028-option_or_data.t - test C<Parrot::Configure::option_or_data()>

=head1 SYNOPSIS

    % prove t/configure/028-option_or_data.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

This file tests C<Parrot::Configure::option_or_data()> in the case where
no value for the tested option has been set on the command line but a
value for the tested option has been located internally by a
configuration step.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
