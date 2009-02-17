#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# inter_encoding-01.t

use strict;
use warnings;
use Test::More tests => 17;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::inter::encoding');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);
use Tie::Filehandle::Preempt::Stdin;

########## no ask ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{inter::encoding};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    my $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok( $ret, "runstep() returned true value" );
}

$conf->replenish($serialized);

########## ask; $ENV{TEST_ENCODING} ##########

$ENV{TEST_ENCODING} = 'fixed_8.c';
do config::inter::encoding;
($args, $step_list_ref) = process_options(
    {
        argv => [q{--ask}],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my ( @prompts, $prompt, $object );
$prompt = $ENV{TEST_ENCODING};
push @prompts, $prompt;
$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok( 'Tie::Filehandle::Preempt::Stdin', ('READLINE') );
isa_ok( $object, 'Tie::Filehandle::Preempt::Stdin' );
{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    my $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok( $ret, "runstep() returned true value" );
}

undef $object;
untie *STDIN;
@prompts = ();

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

inter_encoding-01.t - test inter::encoding

=head1 SYNOPSIS

    % prove t/steps/inter_encoding-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test inter::encoding.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::encoding, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
