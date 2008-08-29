#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 050-fatal.t

use strict;
use warnings;

use Test::More tests =>  6;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::List qw( get_steps_list );
use IO::CaptureOutput qw | capture |;

$| = 1;
is($|, 1, "output autoflush is set");

my ($args, $step_list_ref) = process_options( {
    argv    => [ q{--fatal} ],
    mode    => q{configure},
} );
ok(defined $args, "process_options returned successfully");
my %args = %$args;

my $conf = Parrot::Configure->new;
ok(defined $conf, "Parrot::Configure->new() returned okay");

my $first_step = q{init::zeta};
my $description = 'Determining if your computer does zeta';

$conf->add_steps( $first_step, get_steps_list() );

$conf->options->set(%args);
is($conf->options->{c}->{debugging}, 1,
    "command-line option '--debugging' has been stored in object");

{
    my $rv;
    my ($stdout, $stderr);
    capture ( sub {$rv    = $conf->runsteps}, \$stdout, \$stderr );

    ok(! defined $rv, "runsteps returned undefined value as expected");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

050-fatal.t - see what happens when C<--fatal-step> is set for all configuration steps

=head1 SYNOPSIS

    % prove t/configure/050-fatal.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file examine what happens when you require the failure of
any configuration step to cause all configuration to cease.

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
