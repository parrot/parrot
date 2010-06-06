#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# gen/opengl-01.t

use strict;
use warnings;
use Test::More tests =>  20;
use Carp;
use lib qw( lib );
use_ok('config::gen::opengl');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########## regular ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my ($pkg, $step, $result);
my $serialized = $conf->pcfreeze();

$pkg = q{gen::opengl};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

##### mock no OpenGL #####
$conf->data->set( has_opengl => 0 );
$result = $step->runstep($conf);
ok($result, "runstep() returned true value");
is($step->result(), q{skipped}, "Got expected result when no 'has_opengl'" );

$conf->replenish($serialized);

########### verbose ###########

($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose} ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my ($stdout, $stderr);
    capture(
        sub { $result = $step->runstep($conf); },
        \$stdout,
        \$stderr,
    );
    ok($result, "runstep() returned true value");
    like( $stdout,
        qr/Checking for OpenGL headers using the following globs/s,
        "Got expected verbose output"
    );
    like( $stdout,
        qr/Found the following OpenGL headers/s,
        "Got expected verbose output"
    );
    like( $stdout,
        qr/PASS\s+FAIL\s+IGNORE\s+HEADER/s,
        "Got expected verbose output"
    );
    like( $stdout,
        qr/unique signatures successfully translated/s,
        "Got expected verbose output"
    );
}

$conf->replenish($serialized);

########### extra verbose ###########

($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose=3} ],
    mode => q{configure},
} );

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my ($stdout, $stderr);
    capture(
        sub { $result = $step->runstep($conf); },
        \$stdout,
        \$stderr,
    );
    ok($result, "runstep() returned true value");
    like( $stdout,
        qr/COUNT\s+NCI SIGNATURE/s,
        "Got expected verbose output"
    );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

  gen/opengl-01.t - test gen::opengl

=head1 SYNOPSIS

    % prove t/steps/gen/opengl-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test gen::opengl.

=head1 AUTHOR

Geoffrey Broadwell; modified from a similar file by James E Keenan.

=head1 SEE ALSO

config::gen::opengl, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
