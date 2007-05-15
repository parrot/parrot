#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 05-run_one_step.t

use strict;
use warnings;

use Test::More tests => 23;
use Carp;
use lib qw( . lib ../lib ../../lib t/configure/testlib );
use Parrot::BuildUtil;
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::IO::Capture::Mini;

my $parrot_version = Parrot::BuildUtil::parrot_version();
like($parrot_version, qr/\d+\.\d+\.\d+/,
    "Parrot version is in 3-part format");

$| = 1;
is($|, 1, "output autoflush is set");

my $args = process_options( {
    argv            => [],
    script          => $0,
    parrot_version  => $parrot_version,
    svnid           => '$Id$',
} );
ok(defined $args, "process_options returned successfully");
my %args = %$args;

my $conf = Parrot::Configure->new;
ok(defined $conf, "Parrot::Configure->new() returned okay");

my $newconf = Parrot::Configure->new;
ok(defined $newconf, "Parrot::Configure->new() returned okay");
is($conf, $newconf, "Parrot::Configure object is a singleton");

# Since these tests peek into the Parrot::Configure object, they will break if
# the structure of that object changes.  We retain them for now to delineate
# our progress in testing the object.
foreach my $k (qw| steps options data |) {
    ok(defined $conf->$k, "Parrot::Configure object has $k key");
}
is(ref($conf->steps), q{ARRAY},
    "Parrot::Configure object 'steps' key is array reference");
is(scalar @{$conf->steps}, 0,
    "Parrot::Configure object 'steps' key holds empty array reference");
foreach my $k (qw| options data |) {
    isa_ok($conf->$k, "Parrot::Configure::Data");
}

my $step = q{init::foobar};
my $description = 'Determining if your computer does foobar';

$conf->add_steps( $step );
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
my ($tie, $msg);
{
    $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    $rv = $conf->runsteps;
    $msg = $tie->READLINE;
}
ok($rv, "runsteps successfully ran $step");
like($msg, qr/$description/,
    "Got message expected upon running $step");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

05-run_one_step.t - test Parrot::Configure by running one step

=head1 SYNOPSIS

    % prove t/configure/05-run_one_step.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test those Parrot::Configure methods regularly called
by F<Configure.pl> up to C<Parrot::Configure::runsteps()> but providing only
one step instead of the regular full set.

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
