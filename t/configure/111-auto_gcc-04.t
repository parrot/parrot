#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 111-auto_gcc-04.t

use strict;
use warnings;
use Test::More tests => 15;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::gcc');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use Parrot::IO::Capture::Mini;

my $args = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my ($task, $step_name, @step_params, $step, $ret);
my $pkg = q{auto::gcc};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
$task = $conf->steps->[1];
$step_name   = $task->step;
@step_params = @{ $task->params };

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");

{
    my $tie_out = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    my $gnucref = {};
    $gnucref->{__GNUC__} = undef;
    ok($step->_evaluate_gcc($conf, $gnucref),
        "_evaluate_gcc() returned true value");
    my @more_lines = $tie_out->READLINE;
    ok( @more_lines, "verbose output captured" );
    ok(! defined $conf->data->get( 'gccversion' ),
        "gccversion undef as expected");
    is($step->result(), q{no}, "Got expected result");
}
untie *STDOUT;

pass("Keep Devel::Cover happy");
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

111-auto_gcc-04.t - test config::auto::gcc

=head1 SYNOPSIS

    % prove t/configure/111-auto_gcc-04.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::gcc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gcc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
