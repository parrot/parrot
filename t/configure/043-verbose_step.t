#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 043-verbose_step.t

use strict;
use warnings;

use Test::More tests => 15;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use IO::CaptureOutput qw | capture |;

$| = 1;
is( $|, 1, "output autoflush is set" );

my ($args, $step_list_ref) = process_options(
    {
        argv => [q{--verbose-step=init::beta}],
        mode => q{configure},
    }
);
ok( defined $args, "process_options returned successfully" );
my %args = %$args;

my $conf = Parrot::Configure->new;
ok( defined $conf, "Parrot::Configure->new() returned okay" );
my $serialized = $conf->pcfreeze();

my $step        = q{init::beta};
my $description = 'Determining if your computer does beta';

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
    ok( $rv, "runsteps successfully ran $step" );
    like(
        $stdout,
        qr/$description\.\.\..*beta\sis\sverbose/s,
        "Got message expected upon running $step"
    );
}

$conf->replenish($serialized);

#####  designate multiple steps as --verbose-step; one of them bad #####

($args, $step_list_ref) = process_options(
    {
        argv => [q{--verbose-step=alpha::beta,init::manifest}],
        mode => q{configure},
    }
);
%args =  %{ $args };
$conf->add_steps( @{ $step_list_ref } );
$conf->options->set(%args);
eval { $conf->runsteps(); };
like($@,
    qr/Argument to verbose-step option must be comma-delimited.*?steps/,
    "Got expected error message for bad value to --verbose-step"
);

$conf->replenish($serialized);

##### designate one step as --verbose-step; valid step  #####

($args, $step_list_ref) = process_options(
    {
        argv => [q{--verbose-step=init::mu}],
        mode => q{configure},
    }
);
%args =  %{ $args };
$step = q{init::mu};
$conf->add_steps( $step );
$conf->options->set(%args);
{
    my $rv;
    my ($stdout, $stderr);
    capture ( sub {$rv    = $conf->runsteps}, \$stdout, \$stderr );
    ok( $rv, "runsteps successfully ran $step" );
    like($stdout, qr/^\s*init::mu.*done\.\s*$/s,
        "As expected, description is only standard output");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

043-verbose_step.t - test --verbose-step option to Configure.pl

=head1 SYNOPSIS

    % prove t/configure/043-verbose_step.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file examine various cases involving the C<--verbose-step>
option to Configure.pl

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
