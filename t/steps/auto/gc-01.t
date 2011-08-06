#! perl
# Copyright (C) 2007, Parrot Foundation.
# auto/gc-01.t

use strict;
use warnings;
use Test::More tests =>  8;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::gc');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

########### --verbose ###########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ '--verbose', '--gc=ms2' ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::gc};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
{
    my ($ret, $stdout);
    capture(
        sub { $ret = $step->runstep($conf); },
        \$stdout,
    );
    ok($ret, "runstep() returned true value");
    like($stdout, qr/\(ms2\)/, "Got expected verbose output");
    is($conf->data->get('gc_type'), 'MS2',
          "Got expected value for 'gc_type'");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_gc-01.t - test auto::gc

=head1 SYNOPSIS

    % prove t/steps/auto/gc-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::gc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
