#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# inter_lex-03.t

use strict;
use warnings;
use Test::More tests =>  14;
use Carp;
use Data::Dumper;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::inter::lex');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);
use Tie::Filehandle::Preempt::Stdin;
use IO::CaptureOutput qw | capture |;

########## ask; maintainer; prompt flex ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ q{--ask}, q{--maintainer} ],
        mode => q{configure},
    }
);
my $conf = Parrot::Configure->new();

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my @prompts = q{flex};
my $object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok( 'Tie::Filehandle::Preempt::Stdin', ('READLINE') );
isa_ok( $object, 'Tie::Filehandle::Preempt::Stdin' );

my $pkg = q{inter::lex};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

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
$conf->replenish($serialized);

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

inter_lex-03.t - test inter::lex

=head1 SYNOPSIS

    % prove t/steps/inter_lex-03.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test inter::lex.  In
this test the C<--ask>, C<--maintainer> and C<--lex=flex> options are
provided.

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
