#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 122-auto_ops.t

use strict;
use warnings;
use Test::More tests => 11;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::ops');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options(
    {
        argv => [ q{--ops=alpha} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::ops};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

$conf->options->set('ops' => 'alpha');
{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    my $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok( $ret, "$step_name runstep() returned true value" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

122-auto_ops.t - test config::auto::ops

=head1 SYNOPSIS

    % prove t/configure/122-auto_ops.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::ops.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::ops, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
