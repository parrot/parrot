#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# inter_libparrot-01.t

use strict;
use warnings;
use Test::More tests => 58;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::init::install');
use_ok('config::inter::libparrot');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);
use Tie::Filehandle::Preempt::Stdin;

########## no ask; no other options ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );
test_step_thru_runstep( $conf, q{init::install}, $args );

my $pkg = q{inter::libparrot};

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

########## no ask; parrot_is_shared ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--parrot_is_shared} ],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    my $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok( $ret, "runstep() returned true value" );
}

$conf->replenish($serialized);

########## no ask; parrot_is_shared; has_dynamic_linking ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--parrot_is_shared} ],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my $has_dynamic_linking_orig = $conf->data->get('has_dynamic_linking');
$conf->data->set('has_dynamic_linking' => 1);

{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    my $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok( $ret, "runstep() returned true value" );
}
is($step->result(), 'yes', "Expected result was set");
# re-set for next test
$step->set_result(q{});
$conf->data->set('has_dynamic_linking' => $has_dynamic_linking_orig);

$conf->replenish($serialized);

########## no ask; parrot_is_shared; has_dynamic_linking; rpath ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--parrot_is_shared} ],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->data->set('has_dynamic_linking' => 1);
my $rpath_orig = $conf->data->get('rpath');
$conf->data->set('rpath' => q{-L});
{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    my $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok( $ret, "runstep() returned true value" );
}
is($step->result(), 'yes', "Expected result was set");
# re-set for next test
$step->set_result(q{});
$conf->data->set('has_dynamic_linking' => $has_dynamic_linking_orig);
$conf->data->set('rpath' => $rpath_orig);

$conf->replenish($serialized);

########## no ask; parrot_is_shared; has_dynamic_linking; rpath ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--parrot_is_shared} ],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->data->set('has_dynamic_linking' => 1);
$rpath_orig = $conf->data->get('rpath');
$conf->data->set('rpath' => q{-L});
{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    my $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok( $ret, "runstep() returned true value" );
}
is($step->result(), 'yes', "Expected result was set");
# re-set for next test
$step->set_result(q{});
$conf->data->set('has_dynamic_linking' => $has_dynamic_linking_orig);
$conf->data->set('rpath' => $rpath_orig);

$conf->replenish($serialized);

########## no ask; libparrot_ldflags ##########

($args, $step_list_ref) = process_options(
    {
        argv => [],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my $libparrot_ldflags_orig = $conf->data->get('libparrot_ldflags');
$conf->data->set('libparrot_ldflags' => 'libparrot.lib');
{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    my $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok( $ret, "runstep() returned true value" );
}
$conf->data->set('libparrot_ldflags' => $libparrot_ldflags_orig);

$conf->replenish($serialized);

########## ask; no has_dynamic_linking ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--ask} ],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->data->set('has_dynamic_linking' => 0);
{
    open STDOUT, '>', "/dev/null" or croak "Unable to open to myout";
    my $ret = $step->runstep($conf);
    close STDOUT or croak "Unable to close after myout";
    ok( $ret, "runstep() returned true value" );
}
is($step->result(), 'no', "Expected result was set");
# re-set for next test
$step->set_result(q{});
$conf->data->set('has_dynamic_linking' => $has_dynamic_linking_orig);

$conf->replenish($serialized);

########## ask; parrot_is_shared; has_dynamic_linking ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--ask}, q{--parrot_is_shared} ],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->data->set('has_dynamic_linking' => 1);

my ( @prompts, $prompt, $object );

$prompt = q{y};
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
is($step->result(), 'yes', "Expected result was set");
# re-set for next test
$step->set_result(q{});
$conf->data->set('has_dynamic_linking' => $has_dynamic_linking_orig);
@prompts = ();

$conf->replenish($serialized);

########## ask; has_dynamic_linking ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--ask} ],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$conf->data->set('has_dynamic_linking' => 1);
$prompt = q{n};
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
is($step->result(), 'no', "Expected result was set");
# re-set for next test
$step->set_result(q{});
$conf->data->set('has_dynamic_linking' => $has_dynamic_linking_orig);
@prompts = ();

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

inter_libparrot-01.t - test inter::libparrot

=head1 SYNOPSIS

    % prove t/steps/inter_libparrot-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test inter::libparrot.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::libparrot, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
