#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 056-verbose_step.t

use strict;
use warnings;

use Test::More tests =>  7;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use IO::CaptureOutput qw | capture |;

$| = 1;
is( $|, 1, "output autoflush is set" );

my ($args, $steps_list_ref) = process_options(
    {
        argv => [q{--verbose-step=init::mu}],
        mode => q{configure},
    }
);
ok( defined $args, "process_options returned successfully" );
my %args = %$args;

my $conf = Parrot::Configure->new;
ok( defined $conf, "Parrot::Configure->new() returned okay" );

my $step        = q{init::mu};
my $description = 'Determining if your computer does mu';

$conf->add_steps($step);

$conf->options->set(%args);
is( $conf->options->{c}->{debugging},
    1, "command-line option '--debugging' has been stored in object" );

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

056-verbose_step.t - test bad step failure case in Parrot::Configure

=head1 SYNOPSIS

    % prove t/configure/056-verbose_step.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file examine what happens when you configure with the
<--verbose-step> option and provide a value for a step other than the step
currently running.

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
