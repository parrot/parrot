#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id: 129-auto_pack-01.t 23905 2007-12-15 01:50:08Z jkeenan $
# 129-auto_pack-01.t

use strict;
use warnings;
use Test::More tests => 19;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::pack');
use Parrot::BuildUtil;
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw( capture );

my $args = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::pack};

$conf->add_steps($pkg);
$conf->options->set(%{$args});

$task = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");

{
    my $current_numvalsize = $conf->data->get('numvalsize');
    $conf->data->set( numvalsize => 12 );
    auto::pack::_set_packtypes($conf);
    is($conf->data->get('packtype_b'), 'C',
        "Got expected value for packtype_b");
    is($conf->data->get('packtype_n'), 'D',
        "Got expected value for packtype_n");
        
    # prepare for next test
    $conf->data->set( numvalsize => $current_numvalsize );
    $conf->data->set( packtype_b => undef );
    $conf->data->set( packtype_n => undef );
}

{
    my $current_numvalsize = $conf->data->get('numvalsize');
    $conf->data->set( numvalsize => 72 );
    auto::pack::_set_packtypes($conf);
    is($conf->data->get('packtype_b'), 'C',
        "Got expected value for packtype_b");
    is($conf->data->get('packtype_n'), 'd',
        "Got expected value for packtype_n");
        
    # prepare for next test
    $conf->data->set( numvalsize => $current_numvalsize );
    $conf->data->set( packtype_b => undef );
    $conf->data->set( packtype_n => undef );
}

{
    my ($ptrsize, $intsize, $longsize);
    $ptrsize = $intsize = 2;
    $longsize = 4;
    auto::pack::_set_ptrconst($conf, $ptrsize, $intsize, $longsize);
    is($conf->data->get( 'ptrconst' ), "u",
        "Got expected value for ptrconst" );
}

{
    my ($ptrsize, $intsize, $longsize);
    $intsize = 2;
    $ptrsize = $longsize = 4;
    auto::pack::_set_ptrconst($conf, $ptrsize, $intsize, $longsize);
    is($conf->data->get( 'ptrconst' ), "ul",
        "Got expected value for ptrconst" );
    $conf->data->set( 'ptrconst' => undef ); # prepare for next test
}

{
    my ($ptrsize, $intsize, $longsize);
    $intsize = 2;
    $ptrsize = 4;
    $longsize = 8;
    my ($stdout, $stderr);
    capture(
        sub { auto::pack::_set_ptrconst($conf, $ptrsize, $intsize, $longsize); },
        \$stdout,
        \$stderr,
    );
    ok(! defined $conf->data->get( 'ptrconst' ),
        "ptrconst not set, as expected");
    ok(! $stdout, "As expected, nothing on STDOUT");
    like($stderr, qr/Unable to find an integer type/,
        "Got expected warning");
    $conf->data->set( 'ptrconst' => undef ); # prepare for next test
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

129-auto_pack-01.t - test config::auto::pack

=head1 SYNOPSIS

    % prove t/configure/129-auto_pack-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::pack.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::pack, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
