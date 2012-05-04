#! perl
# Copyright (C) 2007-2011, Parrot Foundation.
# auto/headers-01.t

use strict;
use warnings;
use Test::More tests =>  21;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::headers');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;

########## regular ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );
my $serialized = $conf->pcfreeze();

my $pkg = q{auto::headers};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
is($step->result(), q{}, "Result is empty string as expected");

$conf->replenish($serialized);

########## --verbose ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--verbose} ],
        mode => q{configure},
    }
);

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $rv;
    my $stdout;
    capture ( sub {$rv = $step->runstep($conf) }, \$stdout);
    ok( $stdout, "verbose output captured" );
    ok( $rv, "runstep() returned true value" );
    is($step->result(), q{}, "Result is empty string as expected");
}

$conf->replenish($serialized);

########## _set_from_Config(); _list_extra_headers() ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

auto::headers::_set_from_Config($conf);
ok(! $conf->data->get('i_niin'), "Mapping made correctly");

{
    my $os = 'msys';
    $conf->data->set( OSNAME_provisional => $os );
    my %extra_headers =
        map {$_, 1} auto::headers::_list_extra_headers($conf);
    my @special_headers = qw(sysmman.h netdb.h sys/utsname.h);
    foreach my $h (@special_headers) {
        ok($extra_headers{$h}, "Special header $h set for $os");
    }
}

{
    my $os = 'MSWin32';
    $conf->data->set( OSNAME_provisional => $os );
    my %extra_headers =
        map {$_, 1} auto::headers::_list_extra_headers($conf);
    ok($extra_headers{'sal.h'}, "Special header set for $os");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/headers-01.t - test auto::headers

=head1 SYNOPSIS

    % prove t/steps/auto/headers-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::headers.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::headers, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
