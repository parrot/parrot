#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 013-die.t

use strict;
use warnings;

use Test::More tests => 12;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use IO::CaptureOutput qw | capture |;

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

my $step        = q{init::gamma};
my $description = 'Determining if your computer does gamma';

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

my $errstr;
{
    my $rv;
    my ($stdout, $stderr);
    capture ( sub {eval {$rv    = $conf->runsteps } }, \$stdout, \$stderr );
    like(
        $stdout,
        qr/$description/s,
        "Got message expected upon running $step"
    );
    like(
        $stderr,
        qr/step $step died during execution: Dying gamma just to see what happens/,
        "Got expected error message"
    );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

013-die.t - test what happens when a configuration step dies during execution

=head1 SYNOPSIS

    % prove t/configure/013-die.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file examine what happens when your configuration step dies
during execution.

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
