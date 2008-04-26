#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_macports-05.t

use strict;
use warnings;
use Test::More;
plan( skip_all => 'Macports is Darwin only' ) unless $^O =~ /darwin/;
plan( tests => 12 );
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::macports');

use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw( capture );

my $args = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::macports};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
$task = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);

# mock no Macports-default directories
$step->{ports_root} = File::Spec->catdir( qw( / my ridiculous foobar ) );
{
    my ($stdout, $stderr);
    my $ret = capture sub { $step->runstep($conf) }, \$stdout, \$stderr;
    ok($ret, "runstep() returned true value");
    is($step->result(), 'no', "Got expected result");
    like(
        $stdout,
        qr/^Could not locate Macports directories/,
        "Got expected verbose output"
    );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_macports-05.t - test config::auto::macports

=head1 SYNOPSIS

    % prove t/steps/auto_macports-05.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::macports by mocking the case where
default directories for Macports are not located and verbose output has been
requested.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::macports, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

