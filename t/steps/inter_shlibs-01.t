#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# inter_shlibs-01.t

use strict;
use warnings;
use Test::More tests => 21;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::inter::shlibs');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);
use Tie::Filehandle::Preempt::Stdin;

########## ask; mock response to prompt  ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [q{--ask}],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{inter::shlibs};
$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

my ( @prompts, $prompt, $object );
$prompt = q{foobar};
push @prompts, $prompt;

$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok( 'Tie::Filehandle::Preempt::Stdin', ('READLINE') );
isa_ok( $object, 'Tie::Filehandle::Preempt::Stdin' );

{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    my $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok( $ret, "runstep() returned true value" );
    is( $step->result(), $prompt, "Expected result was set" );
}

undef $object;
untie *STDIN;
@prompts = ();

$conf->replenish($serialized);

########## ask; empty response to prompt  ##########

($args, $step_list_ref) = process_options(
    {
        argv => [q{--ask}],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$prompt = q{ };
push @prompts, $prompt;

$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok( 'Tie::Filehandle::Preempt::Stdin', ('READLINE') );
isa_ok( $object, 'Tie::Filehandle::Preempt::Stdin' );

{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    my $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok( $ret, "runstep() returned true value" );
    is( $step->result(), q{done}, "Expected result was set" );
}

undef $object;
untie *STDIN;
@prompts = ();

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

inter_shlibs-01.t - test inter::shlibs

=head1 SYNOPSIS

    % prove t/steps/inter_shlibs-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test inter::shlibs.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::shlibs, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
