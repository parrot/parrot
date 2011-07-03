#! perl
# Copyright (C) 2007, Parrot Foundation.
# inter/types-01.t

use strict;
use warnings;
use Test::More tests => 12;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::inter::types');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
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

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{inter::types};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );

$conf->replenish($serialized);

########## ask ##########

($args, $step_list_ref) = process_options(
    {
        argv => [q{--ask}],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

my ( @prompts, $object );

$conf->options->set('intval' => 'alpha');
$conf->options->set('floatval' => 'beta');
@prompts = qw( delta epsilon );

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

inter/types-01.t - test inter::types

=head1 SYNOPSIS

    % prove t/steps/inter/types-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test inter::types.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::types, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
