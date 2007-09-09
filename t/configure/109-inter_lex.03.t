#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 109-inter_lex.03.t

use strict;
use warnings;
use Test::More tests => 12;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
$ENV{TEST_LEX} = 'foobar';
use_ok('config::inter::lex');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options( {
    argv            => [ q{--ask}, q{--maintainer} ],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my ($task, $step_name, @step_params, $step, $ret);
my $pkg = q{inter::lex};

$conf->add_steps($pkg);
$conf->options->set(%{$args});

$task = $conf->steps->[1];
$step_name   = $task->step;
@step_params = @{ $task->params };

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");
$ret = $step->runstep($conf);
is($ret, undef, "$step_name runstep() returned undefined value");
my $result_expected = q{no lex program was found}; 
is($step->result(), $result_expected,
    "Result was $result_expected");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

109-inter_lex.03.t - test config::inter::lex

=head1 SYNOPSIS

    % prove t/configure/109-inter_lex.03.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::inter::lex.  In
this case, the C<--ask> and C<--maintainer> options are provided but an
environmental variable was provided in order to trick the package into not
finding a real F<lex>-equivalent program.  As a result, no prompt is ever
reached.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::lex, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
