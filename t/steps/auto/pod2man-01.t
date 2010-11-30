#! perl
# Copyright (C) 2007, Parrot Foundation.
# auto_pod2man-01.t

use strict;
use warnings;
use Test::More tests => 10;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::pod2man');
use Parrot::BuildUtil;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);

########## regular ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::pod2man};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);
ok($step->runstep($conf), "runstep() completed successfully");
ok(defined($step->result), "Result was defined");
my $has = $conf->data->get('has_pod2man');
ok( ( ($has == 1) or ($has == 0) ),
    "Got an acceptable value for 'has_pod2man'");

$conf->replenish($serialized);

########## _initial_content_check() ##########

my $content = undef;
my $rv = $step->_initial_content_check($conf, $content);
ok(! defined $rv, "Got expected return value when content was undefined");
is($step->result(),
    q{no}, "Got expected result when content was undefined");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_pod2man-01.t - test auto::pod2man

=head1 SYNOPSIS

    % prove t/steps/auto_pod2man-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::pod2man.

=head1 SEE ALSO

config::auto::pod2man, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
