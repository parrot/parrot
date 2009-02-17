#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 030-option_or_data.t

use strict;
use warnings;

use Test::More tests =>  6;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use Parrot::Configure::Step::List qw( get_steps_list );
use IO::CaptureOutput qw | capture |;

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
ok( defined $conf, "Parrot::Configure->new() returned okay" );

my $step        = q{init::foobar};
my $description = 'Determining if your computer does foobar';

$conf->add_steps($step);
$conf->options->set( %{$args} );
{
    my $rv;
    my $stdout;
    capture ( sub {$rv    = $conf->runsteps}, \$stdout );
    like( $stdout, qr/$description/s, "Got message expected upon running $step" );
    ok( !defined( $conf->option_or_data($testopt) ),
        "option_or_data returned undef; neither option nor data had been defined" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

030-option_or_data.t - test C<Parrot::Configure::option_or_data()>

=head1 SYNOPSIS

    % prove t/configure/030-option_or_data.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

This file tests C<Parrot::Configure::option_or_data()> in the case where
no value for the tested option has been set on the command line but
where no value for the tested option has been located internally by a
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
