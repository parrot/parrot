#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id: 015-no_return.t 19028 2007-06-16 00:24:34Z jkeenan $
# 015-no_return.t

use strict;
use warnings;

use Test::More tests => 15;
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
    argv            => [ ],
    script          => $0,
    parrot_version  => $parrot_version,
    svnid           => '$Id: 015-no_return.t 19028 2007-06-16 00:24:34Z jkeenan $',
} );
ok(defined $args, "process_options returned successfully");
my %args = %$args;

my $conf = Parrot::Configure->new;
ok(defined $conf, "Parrot::Configure->new() returned okay");

my $step = q{init::epsilon};
my $description = 'Determining if your computer does epsilon';

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
my ($tie, @lines, $errstr);
{
    $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    local $SIG{__WARN__} = \&_capture;
    $rv = $conf->runsteps;
    @lines = $tie->READLINE;
}
ok($rv, "runsteps successfully ran $step");
my $bigmsg = join q{}, @lines;
like($bigmsg,
    qr/$description/s,
    "Got message expected upon running $step");
like($errstr,
    qr/step $step failed:\s*no result returned/s,
    "Got error message expected when config module did not return object");

pass("Completed all tests in $0");

sub _capture { $errstr = $_[0];}

################### DOCUMENTATION ###################

=head1 NAME

015-no_return.t - see what happens when configuration step does not return object

=head1 SYNOPSIS

    % prove t/configure/015-no_return.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file examine what happens when your configuration step
module fails to return the object and does not have an explicit C<return>.

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
