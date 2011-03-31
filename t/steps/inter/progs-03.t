#! perl
# Copyright (C) 2007, Parrot Foundation.
# inter/progs-03.t

use strict;
use warnings;

use Test::More tests =>  9;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::inter::progs');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use Tie::Filehandle::Preempt::Stdin;
use IO::CaptureOutput qw| capture |;

=for hints_for_testing Testing and refactoring of inter::progs should
entail understanding of issues discussed in
https://trac.parrot.org/parrot/ticket/854

=cut

########### ask ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [q{--ask}],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{inter::progs};

$conf->add_steps($pkg);

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

my @prompts;
my $object;
my ($stdout, $debug, $debug_validity);

foreach my $p (
    qw|
        cc
        cxx
        link
        ar
        ld
        ccflags
        linkflags
        arflags
        ldflags
        libs
    |
    )
{
    push @prompts, $conf->data->get($p);
}
push @prompts, q{n};

$object = tie *STDIN, 'Tie::Filehandle::Preempt::Stdin', @prompts;
can_ok( 'Tie::Filehandle::Preempt::Stdin', ('READLINE') );
isa_ok( $object, 'Tie::Filehandle::Preempt::Stdin' );

capture( sub {
    my $ask = inter::progs::_prepare_for_interactivity($conf);
    my $cc;
    ($conf, $cc) = inter::progs::_get_programs($conf, $ask);
    $debug = inter::progs::_get_debug($conf, $ask);
    $debug_validity = inter::progs::_is_debug_setting_valid($debug);
}, \$stdout);
ok( defined $debug_validity, "'debug_validity' set as expected" );

capture( sub {
    $conf = inter::progs::_set_debug_and_warn($conf, $debug);
}, \$stdout);
ok( defined $conf, "Components of runstep() tested okay" );

$object = undef;
untie *STDIN;


pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

inter/progs-03.t - test inter::progs

=head1 SYNOPSIS

    % prove t/steps/inter/progs-03.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test inter::progs.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::inter::progs, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
