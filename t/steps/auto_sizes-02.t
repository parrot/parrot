#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_sizes-02.t

use strict;
use warnings;
use Test::More tests =>  31;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::sizes');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw( capture );

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::sizes};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );


{
    my $stdout;
    my %results = (
        ptrsize         => 1,
        intvalsize      => 1,
    );
    capture(
        sub { auto::sizes::_handle_intval_ptrsize_discrepancy(\%results); },
        \$stdout,
    );
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = (
        ptrsize         => 1,
        intvalsize      => 2,
    );
    capture(
        sub { auto::sizes::_handle_intval_ptrsize_discrepancy(\%results); },
        \$stdout,
    );
    like($stdout, qr/I see your chosen INTVAL/s,
        "Got expected warning about discrepancy"
    );
}

{
    my $stdout;
    my %results = ( shortsize   => 2 );
    capture(
        sub { auto::sizes::_set_int2($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'int2_t' ), q{short},
        "Got expected value for int2_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = ( shortsize   => 4 );
    capture(
        sub { auto::sizes::_set_int2($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'int2_t' ), q{int},
        "Got expected value for int2_t");
    like($stdout, qr/conversion ops might fail/s,
        "Got expected warning");
}

{
    my $stdout;
    my %results = ( shortsize   => 4 );
    capture(
        sub { auto::sizes::_set_int4($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'int4_t' ), q{short},
        "Got expected value for int4_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = ( intsize   => 4 );
    capture(
        sub { auto::sizes::_set_int4($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'int4_t' ), q{int},
        "Got expected value for int4_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = ( longsize   => 4 );
    capture(
        sub { auto::sizes::_set_int4($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'int4_t' ), q{long},
        "Got expected value for int4_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = ( );
    capture(
        sub { auto::sizes::_set_int4($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'int4_t' ), q{int},
        "Got expected value for int4_t");
    like($stdout, qr/conversion ops might fail/s,
        "Got expected warning");
}

{
    my $stdout;
    my %results = ( floatsize => 4 );
    capture(
        sub { auto::sizes::_set_float4($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'float4_t' ), q{float},
        "Got expected value for float4_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = ( floatsize => 8 );
    capture(
        sub { auto::sizes::_set_float4($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'float4_t' ), q{double},
        "Got expected value for float4_t");
    like($stdout, qr/conversion ops might fail/s,
        "Got expected warning");
}

{
    my $stdout;
    my %results = ( doublesize => 8 );
    capture(
        sub { auto::sizes::_set_float8($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'float8_t' ), q{double},
        "Got expected value for float8_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = ( );
    capture(
        sub { auto::sizes::_set_float8($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'float8_t' ), q{double},
        "Got expected value for float8_t");
    like($stdout, qr/conversion ops might fail/s,
        "Got expected warning");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_sizes-02.t - test config::auto::sizes

=head1 SYNOPSIS

    % prove t/steps/auto_sizes-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::sizes.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::sizes, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
