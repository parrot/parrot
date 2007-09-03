#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 107-inter_progs.02.t

use strict;
use warnings;
# Please leave as 'no_plan'; see 'BUG' in POD.
use Test::More qw(no_plan); # tests => 23;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::init::install');
use_ok('config::init::hints');
use_ok('config::inter::progs');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use Tie::Filehandle::Preempt::Stdin;

=for hints_for_testing Testing and refactoring of inter::progs should
entail understanding of issues discussed in the following RT tickets:
http://rt.perl.org/rt3/Ticket/Display.html?id=43174;
http://rt.perl.org/rt3/Ticket/Display.html?id=43173; and
http://rt.perl.org/rt3/Ticket/Display.html?id=41168.  You will have to
determine a way to test a user response to a prompt.

=cut

my $args = process_options( {
    argv            => [ q{--ask}, q{--debugging=0} ],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new;

test_step_thru_runstep($conf, q{init::defaults}, $args);
test_step_thru_runstep($conf, q{init::install}, $args);
test_step_thru_runstep($conf, q{init::hints}, $args);

my ($task, $step_name, @step_params, $step, $ret);
my $pkg = q{inter::progs};

$conf->add_steps($pkg);
$conf->options->set(%{$args});

$task = $conf->steps->[3];
$step_name   = $task->step;
@step_params = @{ $task->params };

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");

my (@prompts, $object);
foreach my $p ( qw|
        cc
        link
        ld
        ccflags
        linkflags
        ldflags
        libs
        cxx
    | ) {
    push @prompts, $conf->data->get($p);
}
push @prompts, q{y};

$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok('Tie::Filehandle::Preempt::Stdin', ('READLINE'));
isa_ok($object, 'Tie::Filehandle::Preempt::Stdin');

{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok(defined $ret, "$step_name runstep() returned defined value");
}

$object = undef;
untie *STDIN;

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

107-inter_progs.02.t - test config::inter::progs

=head1 SYNOPSIS

    % prove t/configure/107-inter_progs.02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::inter::progs.

=head1 BUG

This file tests the case where the C<--ask> option is specified and,
hence, the user must respond to a prompt.  The response to the prompt is
supplied automatically via Tie::Filehandle::Preempt::Stdin.  But that
response is made via C<STDOUT>.  A user generally would not like to see
that output when running this test, say, via C<prove -v>.  So the data
written to C<STDOUT> must be captured rather than displayed.

In other test files we can do that with Parrot::IO::Capture::Mini.  We
cannot do that here because there is extensive manipulation of C<STDOUT>
deep inside the code being tested.  The solution employed in this test
successfully disposes of information printed to C<STDOUT>, but it
confuses Test::Harness's count of tests run.  This would cause the file
as a whole to be reported as having failed, when in fact every single
test passed.  As a compromise, we run the file with C<no_plan>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::progs, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
