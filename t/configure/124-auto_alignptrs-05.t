#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 124-auto_alignptrs-05.t

use strict;
use warnings;
use Test::More qw(no_plan); # tests => 13;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::alignptrs');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::alignptrs};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, @step_params, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;
@step_params = @{ $task->params };

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

{
    $conf->data->set('ptr_alignment' => undef);
    if ($^O eq q{hpux}) { $^O = q{linux} }
    my $ret;
    eval { $ret = $step->runstep($conf); };
    if ($@) {
        like($@, qr/Can't determine alignment/,
            "Got expected error message when runstep() failed");
    } else {
        like($step->result(), qr/bytes?/,
            "Expected result was set");
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

124-auto_alignptrs-05.t - test config::auto::alignptrs

=head1 SYNOPSIS

    % prove t/configure/124-auto_alignptrs-05.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::alignptrs.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::alignptrs, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
