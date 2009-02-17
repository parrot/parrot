#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 046-inter.t

use strict;
use warnings;
use Test::More tests => 12;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use IO::CaptureOutput qw | capture |;
use Tie::Filehandle::Preempt::Stdin;

$| = 1;
is( $|, 1, "output autoflush is set" );

my ($args, $step_list_ref) = process_options(
    {
        argv => [],
        mode => q{configure},
    }
);
ok( defined $args, "process_options returned successfully" );
my %args = %$args;

my $conf = Parrot::Configure->new;
ok( defined $conf, "Parrot::Configure->new() returned okay" );

my $step        = q{inter::theta};
my $description = 'Determining if your computer does theta';

$conf->add_steps($step);
my @confsteps = @{ $conf->steps };
isnt( scalar @confsteps, 0,
    "Parrot::Configure object 'steps' key holds non-empty array reference" );
is( scalar @confsteps, 1, "Parrot::Configure object 'steps' key holds ref to 1-element array" );
my $nontaskcount = 0;
foreach my $k (@confsteps) {
    $nontaskcount++ unless $k->isa("Parrot::Configure::Task");
}
is( $nontaskcount, 0, "Each step is a Parrot::Configure::Task object" );
is( $confsteps[0]->step, $step, "'step' element of Parrot::Configure::Task struct identified" );
ok( !ref( $confsteps[0]->object ),
    "'object' element of Parrot::Configure::Task struct is not yet a ref" );

$conf->options->set(%args);
is( $conf->options->{c}->{debugging},
    1, "command-line option '--debugging' has been stored in object" );

{
    my $rv;
    my $stdout;
    capture ( sub {$rv    = $conf->runsteps}, \$stdout );
    ok($rv, "runsteps() returned true value");
    like(
    $stdout,
    qr/$description\.\.\./s,
    "Got STDOUT message expected upon running $step")
};

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

046-inter.t - test Parrot::Configure::_run_this_step()
=head1 SYNOPSIS

    % prove t/configure/046-inter.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

This file tests Parrot::Configure::_run_this_step() with regard to
configuration steps that prompt for user input.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

