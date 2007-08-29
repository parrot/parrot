#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 014-params.t

use strict;
use warnings;

use Test::More tests => 13;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::IO::Capture::Mini;

$| = 1;
is($|, 1, "output autoflush is set");

my $args = process_options( {
    argv            => [ ],
    mode            => q{configure},
} );
ok(defined $args, "process_options returned successfully");
my %args = %$args;

my $conf = Parrot::Configure->new;
ok(defined $conf, "Parrot::Configure->new() returned okay");

my $step = q{init::delta};
my $description = 'Determining if your computer does delta';
my @params = qw| delta phi beta kappa |;
my $paramstr = join q{ }, @params;

$conf->add_step( $step, @params );
my @confsteps = @{$conf->steps};

isnt(scalar @confsteps, 0,
    "Parrot::Configure object 'steps' key holds non-empty array reference");
is(scalar @confsteps, 1,
    "Parrot::Configure object 'steps' key holds ref to 1-element array");
my $nontaskcount = 0;
foreach my $k (@confsteps) {
    $nontaskcount++ unless $k->isa("Parrot::Configure::Task");
}
is($nontaskcount, 0, "Each step is a Parrot::Configure::Task object");
is($confsteps[0]->step, $step,
    "'step' element of Parrot::Configure::Task struct identified");
is(ref($confsteps[0]->params), 'ARRAY',
    "'params' element of Parrot::Configure::Task struct is array ref");
ok(! ref($confsteps[0]->object),
    "'object' element of Parrot::Configure::Task struct is not yet a ref");

$conf->options->set(%args);
is($conf->options->{c}->{debugging}, 1,
    "command-line option '--debugging' has been stored in object");

my $rv;
my ($tie, @lines);
{
    $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    $rv = $conf->runsteps;
    @lines = $tie->READLINE;
}
ok($rv, "runsteps successfully ran $step");
my $bigmsg = join q{}, @lines;
like($bigmsg,
    qr/$description\.\.\..*$paramstr.*done\./s,
    "Got message expected upon running $step");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

014-params.t - test what happens when a step is registered with parameters

=head1 SYNOPSIS

    % prove t/configure/014-params.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file examine what happens when you register a configuration
step with parameter.  (This feature does not appear to be in current (April
16, 2007) use.)

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
