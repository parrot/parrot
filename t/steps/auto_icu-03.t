#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_icu-03.t

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
        plan tests => 14;
    }
}
use_ok('config::init::defaults');
use_ok('config::auto::icu');
use IO::CaptureOutput qw( capture );

my $args = process_options(
    {
        argv => [
            q{--icu-config=1},
            q{--icuheaders=alpha},
            q{--icushared=beta}
        ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::icu};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

{
    my ($stdout, $stderr, $ret);
    capture(
        sub { $ret = $step->runstep($conf); },
        \$stdout,
        \$stderr,
    );
    ok(! defined $ret, "runstep() returned undefined value as expected");
    like($stderr, qr/error: icushared not defined/s,
        "Got expected warnings");
    like($stderr, qr/error: icuheaders not defined or invalid/s,
        "Got expected warnings");
    like($stderr, qr/Something is wrong with your ICU installation/s,
        "Got expected warnings");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_icu-03.t - test config::auto::icu

=head1 SYNOPSIS

    % prove t/steps/auto_icu-03.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::icu with command-line options
C<--icushared> and C<--icuheaders>.

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
