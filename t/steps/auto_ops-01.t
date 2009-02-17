#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_ops-01.t

use strict;
use warnings;
use Test::More tests =>  6;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::ops');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);

########## ops ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ q{--ops=alpha} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $pkg = q{auto::ops};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

$conf->options->set('ops' => 'alpha');
{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    my $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok( $ret, "runstep() returned true value" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_ops-01.t - test auto::ops

=head1 SYNOPSIS

    % prove t/steps/auto_ops-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::ops.

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
