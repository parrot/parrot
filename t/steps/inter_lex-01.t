#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$
# inter_lex-01.t

use strict;
use warnings;
use Test::More tests => 31;
use Carp;
use Data::Dumper;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::inter::lex');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use Tie::Filehandle::Preempt::Stdin;
use IO::CaptureOutput qw | capture |;

########## ask ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [q{--ask}],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new();

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{inter::lex};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );
is( $step->result(), q{skipped}, "Step was skipped as expected; no '--maintainer' option" );
# re-set for next test
$step->set_result(q{});

$conf->replenish($serialized);

########## ask; maintainer; $ENV{LEX} ##########

$ENV{LEX} = 'foobar';

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--ask}, q{--maintainer} ],
        mode => q{configure},
    }
);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );
my $result_expected = q{user defined};
is( $step->result(), $result_expected,
    "Result was $result_expected because environment variable was set" );
# re-set for next test
delete $ENV{LEX};
$step->set_result('');

$conf->replenish($serialized);

########## ask; maintainer; lex=flex ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--ask}, q{--maintainer}, q{--lex=flex} ],
        mode => q{configure},
    }
);
my ( @prompts, $object, @entered );
@prompts = map { q{foo_} . $_ } qw| alpha |;

$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok( 'Tie::Filehandle::Preempt::Stdin', ('READLINE') );
isa_ok( $object, 'Tie::Filehandle::Preempt::Stdin' );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );
$result_expected = q{user defined};
is( $step->result(), $result_expected, "Result was $result_expected" );
$object = undef;
untie *STDIN;
# re-set for next test
$step->set_result(q{});

$conf->replenish($serialized);

########## ask; maintainer ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--ask}, q{--maintainer} ],
        mode => q{configure},
    }
);
@prompts = q{flex};
$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok( 'Tie::Filehandle::Preempt::Stdin', ('READLINE') );
isa_ok( $object, 'Tie::Filehandle::Preempt::Stdin' );
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my $rv;
    my $stdout;
    capture ( sub {$rv = $step->runstep($conf)}, \$stdout);
    my $possible_results = qr/^(
        no\slex\sprogram\swas\sfound
      | lex\sprogram\sdoes\snot\sexist\sor\sdoes\snot\sunderstand\s--version
      | could\snot\sunderstand\sflex\sversion\srequirement
      | found\sflex\sversion.*?but\sat\sleast.*?is\srequired
      | flex
    )/x;
    my @dump_msg = ( Dumper( $step->result() ) =~ /'(.*?)'/ );
    like( $step->result(), $possible_results,
        "Response to prompt led to acceptable result:  " . $dump_msg[0] );
    if ( $dump_msg[0] eq q{no lex program was found} ) {
        ok( !$stdout, "No lex program => no prompts" );
    }
    else {
        ok( $stdout, "prompts were captured" );
    }
}
$object = undef;

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

inter_lex-01.t - test inter::lex

=head1 SYNOPSIS

    % prove t/steps/inter_lex-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test inter::lex.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::lex, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
