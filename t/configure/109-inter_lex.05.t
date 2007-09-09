#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 109-inter_lex.05.t

use strict;
use warnings;
use Data::Dumper;
use Test::More tests => 14;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::inter::lex');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::IO::Capture::Mini;
use Parrot::Configure::Test qw( test_step_thru_runstep);
use Tie::Filehandle::Preempt::Stdin;

my $args = process_options( {
    argv            => [ q{--ask}, q{--maintainer} ],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my (@prompts, $object, @entered);
@prompts = q{flex};
$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok('Tie::Filehandle::Preempt::Stdin', ('READLINE'));
isa_ok($object, 'Tie::Filehandle::Preempt::Stdin');

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

{
    my $tie_out = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    $ret = $step->runstep($conf);
    my @more_lines = $tie_out->READLINE;
    my $possible_results = qr/^(
        no\slex\sprogram\swas\sfound
      | lex\sprogram\sdoes\snot\sexist\sor\sdoes\snot\sunderstand\s--version
      | could\snot\sunderstand\sflex\sversion\srequirement
      | found\sflex\sversion.*?but\sat\sleast.*?is\srequired
      | flex
    )/x;
    my @dump_msg = ( Dumper($step->result()) =~ /'(.*?)'/ );
    like($step->result(), $possible_results,
        "Response to prompt led to acceptable result:  " . $dump_msg[0]);
    if ($dump_msg[0] eq q{no lex program was found}) {
        ok(! @more_lines, "No lex program => no prompts");
    } else {
        ok(@more_lines, "prompts were captured");
    }
}


$object = undef;
untie *STDIN;

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

109-inter_lex.05.t - test config::inter::lex

=head1 SYNOPSIS

    % prove t/configure/109-inter_lex.05.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::inter::lex.

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
