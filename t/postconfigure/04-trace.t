#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 04-trace.t

use strict;
use warnings;
use Carp;
use Data::Dumper;
use Test::More;
if (
        (-e qq{./lib/Parrot/Config/Generated.pm})
        and
        (-e qq{./.configure_trace.sto})
    ) {
    plan tests => 36;
} else {
    plan skip_all =>
   q{Tests irrelevant unless configuration completed with tracing requested};
}
use lib qw( . lib ../lib ../../lib );
use_ok( 'Parrot::Configure::Trace' );
use Parrot::Configure::Step::List qw( get_steps_list );

my $obj;

eval {
    $obj = Parrot::Configure::Trace->new( [
        storable => '.configure_trace.sto',
    ] );
};
like($@, qr/^Constructor correctly failed due to non-hashref argument/,
    "Correctly failed due to argument other than hash ref");

eval {
    $obj = Parrot::Configure::Trace->new( {
        storable => 'somestrangename.sto',
    } );
};
like($@, qr/^Unable to retrieve storable file of configuration step data/,
    "Correctly failed due to non-existent config data file"); 

ok($obj = Parrot::Configure::Trace->new(),
    "Constructor returned true");
isa_ok($obj, q{Parrot::Configure::Trace});

my $steps = $obj->list_steps();
my $steps_number = scalar(@{$steps});
is(ref($steps), q{ARRAY},
    "list_steps() correctly returned array ref");

# Sanity check!
is_deeply($steps, [ get_steps_list() ],
    "list_steps() returned same as Parrot::Configure::Step::List::get_steps_list()");

my $index = $obj->index_steps();
is(ref($index), q{HASH},
    "index_steps() correctly returned hash ref");
is(scalar(keys %{$index}), $steps_number,
    "list_steps() and index_steps() return same number of elements");

my ($attr, $trig, $bad);

$attr = $obj->trace_options_c( {
    attr        => 'yacc',
} );
is(ref($attr), q{ARRAY},
    "trace_options_c() correctly returned array ref");
is(scalar(@{$attr}), $steps_number,
    "trace_options_c() and list_steps() return same number of elements");

$attr = $obj->trace_options_c( {
    attr        => 'yacc',
    verbose     => 1,
} );
is(ref($attr), q{ARRAY},
    "trace_options_c() correctly returned array ref");
is(scalar(@{$attr}), $steps_number,
    "trace_options_c() and list_steps() return same number of elements");
$bad = 0;
foreach my $el (@{$attr}) {
    $bad++ unless ref($el) eq 'HASH';
}
is($bad, 0,
    "With 'verbose', each element in array returned by trace_options_c() is hash ref");

$trig = $obj->trace_options_triggers( {
    trig        => 'yacc',
} );
is(ref($trig), q{ARRAY},
    "trace_options_triggers() correctly returned array ref");
is(scalar(@{$trig}), $steps_number,
    "trace_options_triggers() and list_steps() return same number of elements");

$trig = $obj->trace_options_triggers( {
    trig        => 'yacc',
    verbose     => 1,
} );
is(ref($trig), q{ARRAY},
    "trace_options_triggers() correctly returned array ref");
is(scalar(@{$trig}), $steps_number,
    "trace_options_triggers() and list_steps() return same number of elements");
$bad = 0;
foreach my $el (@{$trig}) {
    $bad++ unless ref($el) eq 'HASH';
}
is($bad, 0,
    "With 'verbose', each element in array returned by trace_options_triggers() is hash ref");

$attr = $obj->trace_data_c( {
    attr        => 'yacc',
} );
is(ref($attr), q{ARRAY},
    "trace_data_c() correctly returned array ref");
is(scalar(@{$attr}), $steps_number,
    "trace_data_c() and list_steps() return same number of elements");

$attr = $obj->trace_data_c( {
    attr        => 'yacc',
    verbose     => 1,
} );
is(ref($attr), q{ARRAY},
    "trace_data_c() correctly returned array ref");
is(scalar(@{$attr}), $steps_number,
    "trace_data_c() and list_steps() return same number of elements");
$bad = 0;
foreach my $el (@{$attr}) {
    $bad++ unless ref($el) eq 'HASH';
}
is($bad, 0,
    "With 'verbose', each element in array returned by trace_data_c() is hash ref");

$trig = $obj->trace_data_triggers( {
    trig        => 'yacc',
} );
is(ref($trig), q{ARRAY},
    "trace_data_triggers() correctly returned array ref");
is(scalar(@{$trig}), $steps_number,
    "trace_data_triggers() and list_steps() return same number of elements");

$trig = $obj->trace_data_triggers( {
    trig        => 'yacc',
    verbose     => 1,
} );
is(ref($trig), q{ARRAY},
    "trace_data_triggers() correctly returned array ref");
is(scalar(@{$trig}), $steps_number,
    "trace_data_triggers() and list_steps() return same number of elements");
$bad = 0;
foreach my $el (@{$trig}) {
    $bad++ unless ref($el) eq 'HASH';
}
is($bad, 0,
    "With 'verbose', each element in array returned by trace_data_triggers() is hash ref");

my @state;
ok($state[0] = $obj->get_state_at_step(54),
    "get_state_at_step() returned true");
ok($state[1] = $obj->get_state_at_step('gen::makefiles'),
    "get_state_at_step() returned true");
is_deeply($state[0], $state[1],
    "Numeric and string arguments gave same result");

my $state;
eval { $state = $obj->get_state_at_step(0); };
like($@, qr/^Must supply positive integer as step number/,
    "Correctly failed due to non-positive argument");

eval { $state = $obj->get_state_at_step(1000000); };
like($@, qr/^Must supply positive integer as step number/,
    "Correctly failed due to non-existent step");

eval { $state = $obj->get_state_at_step(q{init::something}); };
like($@, qr/^Must supply valid step name/,
    "Correctly failed due to non-existent step");

#@state = ();
#$state[1] = $obj->get_state_at_step(1);
#$state[56] = $obj->get_state_at_step(56);
#print STDERR Dumper ($state[1], $state[56]);
#my @task;
#for (1,56) {
#    $task[$_] = $state[$_]->{steps};
#}
#is_deeply($task[1], $task[56], "same task");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

04-trace.t - test Parrot::Configure::Trace

=head1 SYNOPSIS

    % prove t/postconfigure/04-trace.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.
Certain of the modules C<use>d by F<Configure.pl> have functionality which is
only meaningful I<after> F<Configure.pl> has actually been run and
Parrot::Config::Generated has been created.  So certain tests need to be run
when your Parrot filesystem is in a "pre-F<make>, post-F<Configure.pl>" state.

The tests in this file test Parrot::Configure::Trace methods.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure::Trace, Parrot::Configure, Parrot::Configure::Options, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
