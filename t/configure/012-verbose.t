#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id: 012-verbose.t 19028 2007-06-16 00:24:34Z jkeenan $
# 012-verbose.t

use strict;
use warnings;

use Test::More tests => 14;
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
    argv            => [ q{--verbose} ],
    script          => $0,
    parrot_version  => $parrot_version,
    svnid           => '$Id: 012-verbose.t 19028 2007-06-16 00:24:34Z jkeenan $',
} );
ok(defined $args, "process_options returned successfully");
my %args = %$args;

my $conf = Parrot::Configure->new;
ok(defined $conf, "Parrot::Configure->new() returned okay");

my $step = q{init::beta};
my $description = 'Determining if your computer does beta';

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
    qr/$description\.\.\..*beta is verbose.*You've got beta.*done\./s, #'
    "Got message expected upon running $step");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

012-verbose.t - test the C<--verbose> command-line argument

=head1 SYNOPSIS

    % prove t/configure/012-verbose.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file examine what happens when you configure with
C<--verbose>.

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
