#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# inter_yacc-01.t

use strict;
use warnings;
use Test::More tests => 31;
use Carp;
use Data::Dumper;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::inter::yacc');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
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

my $pkg = q{inter::yacc};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );
is( $step->result(), q{skipped},
    "Step was skipped as expected; no '--maintainer' option" );
# re-set for next step
$step->set_result(q{});

$conf->replenish($serialized);

########## ask; maintainer; $ENV{YACC}  ##########

$ENV{YACC} = 'foobar';
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
# re-set for next step
delete $ENV{YACC};
$step->set_result('');

$conf->replenish($serialized);

########## ask; maintainer; yacc=bison  ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--ask}, q{--maintainer}, q{--yacc=bison} ],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
my ( @prompts, $object );
@prompts = map { q{foo_} . $_ } qw| alpha |;
$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok( 'Tie::Filehandle::Preempt::Stdin', ('READLINE') );
isa_ok( $object, 'Tie::Filehandle::Preempt::Stdin' );
$ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );
$result_expected = q{user defined};
is( $step->result(), $result_expected, "Result was $result_expected" );
$object = undef;
untie *STDIN;
# re-set for next step
$step->set_result(q{});
@prompts = ();

$conf->replenish($serialized);

########## ask; maintainer; ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--ask}, q{--maintainer} ],
        mode => q{configure},
    }
);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
@prompts = q{bison};
$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok( 'Tie::Filehandle::Preempt::Stdin', ('READLINE') );
isa_ok( $object, 'Tie::Filehandle::Preempt::Stdin' );
{
    my $rv;
    my $stdout;
    capture ( sub {$rv = $step->runstep($conf)}, \$stdout);
    my $possible_results = qr/^(
        no\syacc\sprogram\swas\sfound
      | yacc\sprogram\sdoes\snot\sexist\sor\sdoes\snot\sunderstand\s--version
      | could\snot\sunderstand\sbison\sversion\srequirement
      | found\sbison\sversion.*?but\sat\sleast.*?is\srequired
      | bison
    )/x;
    my @dump_msg = ( Dumper( $step->result() ) =~ /'(.*?)'/ );
    like( $step->result(), $possible_results,
        "Response to prompt led to acceptable result:  " . $dump_msg[0] );
    if ( $dump_msg[0] eq q{no yacc program was found} ) {
        ok( !$stdout, "No yacc program => no prompts" );
    }
    else {
        ok( $stdout, "prompts were captured" );
    }
}
$object = undef;
untie *STDIN;
# re-set for next step
$step->set_result(q{});
@prompts = ();


pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

inter_yacc-01.t - test inter::yacc

=head1 SYNOPSIS

    % prove t/steps/inter_yacc-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test inter::yacc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::yacc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
