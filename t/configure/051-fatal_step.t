#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 051-fatal_step.t

use strict;
use warnings;

use Test::More tests => 19;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use IO::CaptureOutput qw | capture |;

$| = 1;
is( $|, 1, "output autoflush is set" );

##### designate one step as --fatal-step; step fails #####

my ($args, $step_list_ref) = process_options(
    {
        argv => [ qw( --fatal-step=init::zeta ) ],
        mode => q{configure},
    }
);
ok( defined $args, "process_options returned successfully" );
my %args = %$args;

my $conf = Parrot::Configure->new;
ok( defined $conf, "Parrot::Configure->new() returned okay" );
my $serialized = $conf->pcfreeze();

my $step        = q{init::zeta};
my $description = 'Determining if your computer does zeta';

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
    my ($stdout, $stderr);
    capture ( sub {$rv    = $conf->runsteps}, \$stdout, \$stderr );
    ok(! defined $rv, 'runsteps() returned undef');

    like($stdout,
    qr/$description\.\.\./s,
    "Got STDOUT message expected upon running $step");
    like($stderr,
    qr/step $step failed:/s,
    "Got STDERR message expected upon running $step");
}

$conf->replenish($serialized);

##### designate multiple steps as --fatal-step; one of them fails #####

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--fatal-step=init::zeta,init::manifest} ],
        mode => q{configure},
    }
);

$step = q{init::zeta};
$conf->add_steps($step);
$conf->options->set( %{$args} );
{
    my $rv;
    my ($stdout, $stderr);
    capture ( sub {$rv    = $conf->runsteps}, \$stdout, \$stderr );
    ok(! defined $rv, 'runsteps() returned undef');

    like($stdout,
    qr/$description\.\.\./s,
    "Got STDOUT message expected upon running $step");
    like($stderr,
    qr/step $step failed:/s,
    "Got STDERR message expected upon running $step");
}

$conf->replenish($serialized);

#####  misspecified value for --fatal-step  #####

($args, $step_list_ref) = process_options(
    {
        argv => [ qw( --fatal-step=foo::zeta ) ],
        mode => q{configure},
    }
);
$step = q{foo::zeta};
$conf->add_steps($step);
$conf->options->set( %{$args} );
my $rv;
eval { $rv = $conf->runsteps; };
like($@, qr/^Argument to fatal-step option/,
    "Got expected error message when value to --fatal-step option was misspecified");

$conf->replenish($serialized);

#####   #####

($args, $step_list_ref) = process_options(
    {
        argv => [ qw( --fatal-step=init::alpha ) ],
        mode => q{configure},
    }
);
$step = q{init::kappa};
$description = 'Determining if your computer does kappa';
$conf->add_steps($step);
$conf->options->set( %{$args} );
{
   my $rv;
   my $stdout;
   capture ( sub {$rv    = $conf->runsteps}, \$stdout);
   ok($rv, "runsteps() returned true value");
   like($stdout,
   qr/$description\.\.\./s,
   "Got STDOUT message expected upon running $step");
}


pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

051-fatal_step.t - test bad step failure case in Parrot::Configure

=head1 SYNOPSIS

    % prove t/configure/051-fatal_step.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file examine various cases involving use of the
C<--fatal-step> option.

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

