#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 004-configure.t

use strict;
use warnings;

use Test::More tests => 29;
use Carp;
use lib qw( lib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::List qw| get_steps_list |;

$| = 1;
is( $|, 1, "output autoflush is set" );

my $CC        = "/usr/bin/gcc-3.3";
my $localargv = [ qq{--cc=$CC}, ];
my ($args, $step_list_ref) = process_options(
    {
        mode => q{configure},
        argv => $localargv,
    }
);
ok( defined $args, "process_options returned successfully" );
my %args = %$args;

my $conf = Parrot::Configure->new;
ok( defined $conf, "Parrot::Configure->new() returned okay" );
isa_ok( $conf, "Parrot::Configure" );

my $newconf = Parrot::Configure->new;
ok( defined $newconf, "Parrot::Configure->new() returned okay" );
isa_ok( $newconf, "Parrot::Configure" );
is( $conf, $newconf, "Parrot::Configure object is a singleton" );

# Since these tests peek into the Parrot::Configure object, they will break if
# the structure of that object changes.  We retain them for now to delineate
# our progress in testing the object.
foreach my $k (qw| steps options data |) {
    ok( defined $conf->$k, "Parrot::Configure object has $k key" );
}
is( ref( $conf->steps ), q{ARRAY}, "Parrot::Configure object 'steps' key is array reference" );
is( scalar @{ $conf->steps },
    0, "Parrot::Configure object 'steps' key holds empty array reference" );
foreach my $k (qw| options data |) {
    isa_ok( $conf->$k, "Parrot::Configure::Data" );
}

can_ok( "Parrot::Configure", qw| data | );
can_ok( "Parrot::Configure", qw| options | );
can_ok( "Parrot::Configure", qw| steps | );
can_ok( "Parrot::Configure", qw| add_step | );
can_ok( "Parrot::Configure", qw| add_steps | );
can_ok( "Parrot::Configure", qw| run_single_step | );
can_ok( "Parrot::Configure", qw| runsteps | );
can_ok( "Parrot::Configure", qw| _run_this_step | );

$conf->add_steps( get_steps_list() );
my @confsteps = @{ $conf->steps };
isnt( scalar @confsteps, 0,
    "Parrot::Configure object 'steps' key holds non-empty array reference" );
my $nontaskcount = 0;
foreach my $k (@confsteps) {
    $nontaskcount++ unless $k->isa("Parrot::Configure::Task");
}
is( $nontaskcount, 0, "Each step is a Parrot::Configure::Task object" );

$conf->options->set(%args);
is( $conf->options->{c}->{cc}, $CC, "command-line option '--cc' has been stored in object" );
is( $conf->options->{c}->{debugging},
    1, "command-line option '--debugging' has been stored in object" );

my $res = eval "no strict; use Parrot::Config::Generated; \\%PConfig";
SKIP: {
    my $reason = <<REASON;
If you have already completed configuration,
you can call Parrot::Configure::Data::get_PConfig().
But here you are testing for that method's failure.
REASON

    skip $reason, 1 if defined $res;

    eval { $conf->data()->get_PConfig(); };
    like(
        $@,
        qr/You cannot use --step until you have completed the full configure process/,
"Got expected error message for --step option and get_PConfig() without prior configuration"
    );
}

$res = eval "no strict; use Parrot::Config::Generated; \\%PConfig_Temp";
SKIP: {
    my $reason = <<REASON;
If you have already completed configuration,
you can call Parrot::Configure::Data::get_PConfig_Temp().
But here you are testing for that method's failure.
REASON

    skip $reason, 1 if defined $res;

    eval { $conf->data()->get_PConfig_Temp(); };
    like(
        $@,
        qr/You cannot use --step until you have completed the full configure process/,
"Got expected error message for --step option and get_PConfig_Temp() without prior configuration"
    );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

004-configure.t - test Parrot::Configure

=head1 SYNOPSIS

    % prove t/configure/004-configure.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test those Parrot::Configure methods regularly called
by F<Configure.pl> up to, but not including, C<Parrot::Configure::runsteps()>.
There is also a test for failure of the C<--step> option without prior
completed configuration.

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
