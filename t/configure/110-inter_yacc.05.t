#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 110-inter_yacc.05.t

use strict;
use warnings;
use Test::More tests => 14;
use Carp;
use Data::Dumper;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::inter::yacc');
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
@prompts = q{bison};

$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok('Tie::Filehandle::Preempt::Stdin', ('READLINE'));
isa_ok($object, 'Tie::Filehandle::Preempt::Stdin');

{
    my $tie_out = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    $ret = $step->runstep($conf);
    my @more_lines = $tie_out->READLINE;
    my $possible_results = qr/^(
        no\syacc\sprogram\swas\sfound
      | yacc\sprogram\sdoes\snot\sexist\sor\sdoes\snot\sunderstand\s--version
      | could\snot\sunderstand\sbison\sversion\srequirement
      | found\sbison\sversion.*?but\sat\sleast.*?is\srequired
      | bison
    )/x;
    my @dump_msg = ( Dumper($step->result()) =~ /'(.*?)'/ );
    like($step->result(), $possible_results,
        "Response to prompt led to acceptable result:  " . $dump_msg[0]);
    if ($dump_msg[0] eq q{no yacc program was found}) {
        ok(! @more_lines, "No yacc program => no prompts");
    } else {
        ok(@more_lines, "prompts were captured");
    }
}

$object = undef;
untie *STDIN;

pass("Completed all tests in $0");


################### DOCUMENTATION ###################

=head1 NAME

110-inter_yacc.05.t - test config::inter::yacc

=head1 SYNOPSIS

    % prove t/configure/110-inter_yacc.05.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::inter::yacc.

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
