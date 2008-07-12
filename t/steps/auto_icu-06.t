#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_icu-06.t

use strict;
use warnings;
use Test::More;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use Parrot::Configure::Utils qw( capture_output );
{
    my ($stdout, $stderr, $ret);
    eval { ($stdout, $stderr, $ret) =
        capture_output( qw| icu-config --exists | ); };
    if ($stderr) {
        plan skip_all => "icu-config not available";
    }
    else {
        plan tests => 16;
    }
}
use_ok('config::init::defaults');
use_ok('config::auto::icu');
use IO::CaptureOutput qw( capture );

my $args = process_options(
    {
        argv => [ q{--verbose}, ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::icu};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

{
    my ($stdout, $stderr, $ret);
    my $icuconfig;
    my ($without, $icushared, $icuheaders);
    capture(
        sub {
            $icuconfig = $step->_handle_icuconfig_opt(1);
            ($without, $icushared, $icuheaders) = $step->_try_icuconfig(
                $conf,
                {
                    without         => 0,
                    autodetect      => 1,
                    icuconfig       => $icuconfig,
                    verbose         => 1,
                }
            );
        },
        \$stdout,
        \$stderr,
    );
    like($stdout, qr/Trying $icuconfig with '--ldflags'/s,
        "Got expected verbose output re --ldflags");
    like($stdout, qr/icushared:  captured/s,
        "Got expected verbose output re icushared");
    like($stdout, qr/For icushared, found $icushared and $without/s,
        "Got expected verbose output re icushared");
    like($stdout, qr/Trying $icuconfig with '--prefix'/s,
        "Got expected verbose output re --prefix");
    like($stdout, qr/icuheaders:  captured/s,
        "Got expected verbose output re icuheaders");
    like($stdout, qr/For icuheaders, found $icuheaders and $without/s,
        "Got expected verbose output re icuheaders");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_icu-06.t - test config::auto::icu

=head1 SYNOPSIS

    % prove t/steps/auto_icu-06.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test verbose output in config::auto::icu internal
subroutines.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::icu, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

