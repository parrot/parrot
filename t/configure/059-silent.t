#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 059-silent.t

use strict;
use warnings;

use Test::More tests => 13;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use IO::CaptureOutput qw | capture |;

$| = 1;
is( $|, 1, "output autoflush is set" );

my ($args, $step_list_ref) = process_options(
    {
        argv => [ q{--silent} ],
        mode => q{configure},
    }
);
ok( defined $args, "process_options returned successfully" );
my %args = %$args;

my $conf = Parrot::Configure->new;
ok( defined $conf, "Parrot::Configure->new() returned okay" );
my $serialized = $conf->pcfreeze();

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

my $rv;
my ($stdout, $stderr);
capture ( sub { eval { $rv = $conf->runsteps; } }, \$stdout, \$stderr);
ok(! $stdout, "silent option worked");
like( $stderr,
qr/step $step died during execution: Dying gamma just to see what happens/,
        "Got expected error message despite silent option");

$conf->replenish($serialized);

##### --silent option; valid step #####

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--silent} ],
        mode => q{configure},
    }
);
%args = %$args;
$step        = q{init::lambda};
$conf->add_steps($step);
$conf->options->set(%args);
{
    my $rv;
    my ($stdout);
    capture ( sub { eval { $rv = $conf->runsteps; } }, \$stdout);
    ok(! $stdout, "silent option worked");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

059-silent.t - test what happens when the C<--silent> option is set

=head1 SYNOPSIS

    % prove t/configure/059-silent.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file examine various cases occurring while using the
C<--silent> option.

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
