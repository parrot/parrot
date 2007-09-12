#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 110-inter_yacc.04.t

use strict;
use warnings;
use Test::More tests => 14;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::inter::yacc');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use Tie::Filehandle::Preempt::Stdin;

my $args = process_options( {
    argv            => [ q{--ask}, q{--maintainer}, q{--yacc=bison} ],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my ($task, $step_name, @step_params, $step, $ret);
my $pkg = q{inter::yacc};

$conf->add_steps($pkg);
$conf->options->set(%{$args});

$task = $conf->steps->[1];
$step_name   = $task->step;
@step_params = @{ $task->params };

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");

my (@prompts, $object);
@prompts = map { q{foo_} . $_ }
    qw| alpha |;
$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok('Tie::Filehandle::Preempt::Stdin', ('READLINE'));
isa_ok($object, 'Tie::Filehandle::Preempt::Stdin');

$ret = $step->runstep($conf);
ok(defined $ret, "$step_name runstep() returned defined value");
my $result_expected = q{user defined};
is($step->result(), $result_expected,
    "Result was $result_expected");

$object = undef;
untie *STDIN;

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

110-inter_yacc.04.t - test config::inter::yacc

=head1 SYNOPSIS

    % prove t/configure/110-inter_yacc.04.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::inter::yacc.  In
this test the C<--ask>, C<--maintainer> and C<--yacc> options are
provided.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::yacc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
