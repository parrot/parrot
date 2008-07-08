#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# init_hints-04.t

use strict;
use warnings;
use Test::More tests =>  10;
use Carp;
use File::Spec::Functions qw/catfile/;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::init::hints');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw( capture );

my $args = process_options(
    {
        argv => [ q{--verbose} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my ( $task, $step_name, $step, $ret );
my $pkg = q{init::hints};

$conf->add_steps($pkg); $conf->options->set( %{$args} );

$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );


{
    my ($stdout, $stderr);
    $conf->data->set_p5( OSNAME => q{imaginaryOS} );
    my $osname = lc( $conf->data->get_p5( 'OSNAME' ) );
    my $hints_file = catfile('config', 'init', 'hints', "$osname.pm");
    capture (
        sub { $ret = $step->runstep($conf); },
        \$stdout,
        \$stderr,
    );;
    like(
        $stdout,
        qr/No \Q$hints_file\E found/s,
        "Got expected verbose output when no hints file found"
    );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

init_hints-04.t - test config::init::hints

=head1 SYNOPSIS

    % prove t/steps/init_hints-04.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::init::hints.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::hints, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
