#! perl
# Copyright (C) 2007, Parrot Foundation.
# inter/make-01.t

use strict;
use warnings;
use Test::More tests => 13;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::inter::make');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use Tie::Filehandle::Preempt::Stdin;

########## ask  ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [q{--ask}],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{inter::make};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

my ( @prompts, $object );
@prompts = (q{make});
$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok( 'Tie::Filehandle::Preempt::Stdin', ('READLINE') );
isa_ok( $object, 'Tie::Filehandle::Preempt::Stdin' );

my $ret = $step->runstep($conf);
ok( defined $ret, "runstep() returned defined value" );

$object = undef;
untie *STDIN;

$conf->replenish($serialized);

########## ask  ##########

($args, $step_list_ref) = process_options(
    {
        argv => [q{--ask}],
        mode => q{configure},
    }
);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

$conf->data->set('gmake_version' => '4.1');
my $prog = 'gmake';
inter::make::_set_make_c($conf, $prog);
is($conf->data->get('make_c'), '+gmake -C',
    "make_c correctly set when gmake");

$conf->data->set('gmake_version' => undef);
my $str = q|$(PERL) -e 'chdir shift @ARGV; system q{make}, @ARGV; exit $$?  >> 8;'|;
$conf->data->set(make_c => $str);
$prog = 'make';
inter::make::_set_make_c($conf, $prog);
is($conf->data->get('make_c'),
    q|$(PERL) -e 'chdir shift @ARGV; system q{make}, @ARGV; exit $$?  >> 8;'|,
    "make_c correctly set when gmake");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

inter/make-01.t - test inter::make

=head1 SYNOPSIS

    % prove t/steps/inter/make-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test inter::make.

B<Note:>  Since F<inter::make> probes for the F<make> program
found on a particular OS, it will probably be difficult to achieve high
branch or condition coverage.  The module is likely to discover a
F<make> program long before it reaches the point where it must prompt
the user for a response.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::make, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
