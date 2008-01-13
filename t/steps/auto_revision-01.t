#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_revision-01.t

use strict;
use warnings;
use Test::More tests => 20;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::revision');
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

my $pkg = q{auto::revision};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

my ($testrev, $ret);
{
    $testrev = 99999;
    local $Parrot::Revision::current = $testrev;
    $ret = $step->runstep($conf);
    ok( $ret, "$step_name runstep() returned true value" );
    is($conf->data->get('revision'), $testrev,
        "'revision' element was set correctly");
    is($step->result(), qq{r$testrev}, "Expected result was set");
}

{
    $testrev = 0;
    local $Parrot::Revision::current = $testrev;
    $ret = $step->runstep($conf);
    ok( $ret, "$step_name runstep() returned true value" );
    is($conf->data->get('revision'), $testrev,
        "'revision' element was set correctly");
    is($step->result(), q{done}, "Expected result was set");
}

{
    $testrev = q{foobar};
    local $Parrot::Revision::current = $testrev;
    eval { $ret = $step->runstep($conf); };
    like($@, qr/Cannot use non-numeric revision number/,
        "Got expected error message");
}

{
    $testrev = undef;
    local $Parrot::Revision::current = $testrev;
    $ret = $step->runstep($conf);
    ok( $ret, "$step_name runstep() returned true value" );
    ok(! defined($conf->data->get('revision')),
        "'revision' element is undefined as expected");
    is($step->result(), q{done}, "Expected result was set");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_revision-01.t - test config::auto::revision

=head1 SYNOPSIS

    % prove t/steps/auto_revision-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::revision.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::revision, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
