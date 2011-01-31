# Copyright (C) 2001-2007, Parrot Foundation.
package Parrot::Configure::Trace;
use strict;
use warnings;
use Carp;
use Storable qw(nstore retrieve);

sub new {
    my $class = shift;
    my $argsref = shift || {};
    croak "Constructor correctly failed due to non-hashref argument"
        unless ref($argsref) eq 'HASH';
    my $self = bless( [], $class );
    my $sto = $argsref->{storable} || q{.configure_trace.sto};
    eval { @{$self} = @{ retrieve($sto) }; };
    if ($@) {
        croak "Unable to retrieve storable file of configuration step data";
    }
    else {
        return $self;
    }
}

sub list_steps {
    my $self = shift;
    return $self->[0];
}

sub index_steps {
    my $self  = shift;
    my @steps = @{ $self->list_steps() };
    my %index = ();
    for ( my $i = 0 ; $i <= $#steps ; $i++ ) {
        $index{ $steps[$i] } = $i + 1;
    }
    return \%index;
}

sub trace_options_c {
    my ( $self, $argsref ) = @_;
    my @data = @{$self};
    my @c    = ();
    for ( my $step = 1 ; $step <= $#data ; $step++ ) {
        my $value = $data[$step]->{options}->{c}->{ $argsref->{attr} };
        if ( $argsref->{verbose} ) {
            push @c, { $self->[0]->[ $step - 1 ] => $value };
        }
        else {
            push @c, $value;
        }
    }
    return \@c;
}

sub trace_options_triggers {
    my ( $self, $argsref ) = @_;
    my @data     = @{$self};
    my @triggers = ();
    for ( my $step = 1 ; $step <= $#data ; $step++ ) {
        my $value = $data[$step]->{options}->{triggers}->{ $argsref->{trig} };
        if ( $argsref->{verbose} ) {
            push @triggers, { $self->[0]->[ $step - 1 ] => $value };
        }
        else {
            push @triggers, $value;
        }
    }
    return \@triggers;
}

sub trace_data_c {
    my ( $self, $argsref ) = @_;
    my @data = @{$self};
    my @c    = ();
    for ( my $step = 1 ; $step <= $#data ; $step++ ) {
        my $value = $data[$step]->{data}->{c}->{ $argsref->{attr} };
        if ( $argsref->{verbose} ) {
            push @c, { $self->[0]->[ $step - 1 ] => $value };
        }
        else {
            push @c, $value;
        }
    }
    return \@c;
}

sub diff_data_c {
    my ( $self, $argsref ) = @_;
    $argsref->{verbose} = 1;
    my @traces = @{ $self->trace_data_c($argsref) };
    my @results = ();
    for (my $i = 1; $i < scalar(@traces); $i++) {
        my %prior = %{$traces[$i - 1]};
        my %this  = %{$traces[$i]};
        my ($prior_key, $prior_value)   = each %prior;
        my ($this_key,  $this_value)    = each %this;
        $prior_value = q{} unless defined $prior_value;
        $this_value  = q{} unless defined $this_value;
        if ($prior_value ne $this_value) {
            push @results, {
                number  => $i,
                name    => $this_key,
                before  => $prior_value,
                after   => $this_value,
            };
        }
    }
    return \@results;
}

sub trace_data_triggers {
    my ( $self, $argsref ) = @_;
    my @data     = @{$self};
    my @triggers = ();
    for ( my $step = 1 ; $step <= $#data ; $step++ ) {
        my $value = $data[$step]->{data}->{triggers}->{ $argsref->{trig} };
        if ( $argsref->{verbose} ) {
            push @triggers, { $self->[0]->[ $step - 1 ] => $value };
        }
        else {
            push @triggers, $value;
        }
    }
    return \@triggers;
}

sub get_state_at_step {
    my $self = shift;
    my $step = shift;
    my $state;
    if ( $step =~ /^\d+$/ ) {
        croak "Must supply positive integer as step number"
            unless $step > 0 and $step <= $#{ $self->[0] };
        return $self->[$step];
    }
    else {
        my $index = $self->index_steps();
        croak "Must supply valid step name"
            unless $index->{$step};
        return $self->[ $index->{$step} ];
    }
}

################### DOCUMENTATION ###################

=head1 NAME

Parrot::Configure::Trace - Trace development of Parrot::Configure object through the configuration steps

=head1 SYNOPSIS

When calling F<perl Configure.pl>:

    $ perl Configure.pl --configure_trace

After configuration has completed:

    use Parrot::Configure::Trace;

    $obj = Parrot::Configure::Trace->new();

    $steps_list = $obj->list_steps();

    $steps_index = $obj->index_steps();

    $attr = $obj->trace_options_c( {
        attr        => 'some_attr',
        verbose     => 1,               # optional
    } );

    $attr = $obj->trace_options_triggers( {
        trig        => 'some_trig',
        verbose     => 1,               # optional
    } );

    $attr = $obj->trace_data_c( {
        attr        => 'some_attr',
        verbose     => 1,               # optional
    } );

    $list_diff_steps = $obj->diff_data_c( {
        attr        => 'some_attr',
    } );

    $attr = $obj->trace_data_triggers( {
        trig        => 'some_trig',
        verbose     => 1,               # optional
    } );

    $state = $obj->get_state_at_step($step_no);

    $state = $obj->get_state_at_step('some::step');

=head1 DESCRIPTION

This module provides ways to trace the evolution of the data structure within
the Parrot::Configure object over the various steps in the configuration
process.  An understanding of this data structure's development may be useful
to Parrot developers working on the configuration process or its results.

To make use of Parrot::Configure::Trace's methods, first configure with the
C<--configure_trace> option.  As configuration proceeds through what are
currently 65 individual steps, the state of the Parrot::Configuration object
is recorded in a Perl array reference.  That array ref is stored on disk via
the Storable module in a file called F<.configure_trace.sto> found in the
top-level of your Parrot sandbox directory.

Once that storable file has been created, you can write programs which
retrieve its data into a Parrot::Configure::Trace object and then call methods
on that object.

=head1 METHODS

=head2 C<new()>

    $obj = Parrot::Configure::Trace->new();

=over 4

=item * Purpose

Parrot::Configure::Trace constructor.  Retrieve configuration data recorded on
disk over the course of the configuration steps and populate a
Parrot::Configure::Trace object with that data.

=item * Arguments

None currently required.  However, to provide for future extensibility, you
may provide a reference to a hash in which various attributes are set which
will affect the Parrot::Configure::Trace object.  Currently, the only such
attribute is C<storable>, whose value is the name of the Storable file holding
configuration data if that file is named something other than
F<.configure_trace.sto>.

=item * Return Value

Parrot::Configure::Trace object.

=item * Comment

The Parrot::Configure::Trace object is a blessed array reference.  Element
C<0> of that array is a reference to an array holding the names of the
individual configuration steps; elements C<1> through C<$#array> hold the
state of the Parrot::Configure object at the conclusion of each step.

Since the purpose of Parrot::Configure::Trace is to track the B<evolution> of
the Parrot::Configure object through the configuration steps, there is no
point in recording information about those parts of the Parrot::Configure
object which are invariant.  The C<steps> element is set in F<Configure.pl>
before the configuration steps are run and does not change during those steps.
Hence, no information about the C<steps> element is recorded and no methods
are provided herein to retrieve that information.  Since the C<options> and
(especially) C<data> elements of the Parrot::Configure object do change over
the course of configuration, methods are provided to access that data.

=back

=head2 C<list_steps()>

    $steps_list = $obj->list_steps();

=over 4

=item * Purpose

Provide list of the names of the configuration steps.

=item * Arguments

None.

=item * Return Value

Array reference:

    [
        'init::manifest',
        'init::defaults',
        ...
        'gen::config_pm'
    ]

=back

=head2 C<index_steps()>

    $steps_index = $obj->index_steps();

=over 4

=item * Purpose

Provide lookup table showing which step number a given configuration step is.

=item * Arguments

None.

=item * Return Value

Hash reference:

    {
        'inter::ops'        => 19,
        'init::optimize'    => 13,
        ...
        'init::defaults'    =>  2,
    }

=back

=head2 C<trace_options_c()>

=over 4

=item * Purpose

Provide a list of the values which a given attribute in the C<{options}-E<gt>{c}>
part of the Parrot::Configure object takes over the course of the
configuration steps.

=item * Arguments

Hash reference.  Key C<attr> is mandatory; it is the key whose value you wish
to trace over the course of the configuration steps.  Key C<verbose> is
optional.

=item * Return Value

Array reference.  Element C<n> of this array holds the value of the attribute
in the C<{options}-E<gt>{c}> part of the Parrot::Configure object at configuration
step C<n + 1>.

If, however, C<verbose> is set, each element C<n> of the array holds a hash
reference where the hash key is the name of configuration step C<n + 1> and
the value is the value of the attribute at step C<n + 1>.

=back

=head2 C<trace_data_triggers()>

=over 4

=item * Purpose

Provide a list of the values which a given attribute in the
C<{options}-E<gt>{triggers}> part of the Parrot::Configure object takes over the
course of the configuration steps.

=item * Arguments

Hash reference.  Key C<attr> is mandatory; it is the key whose value you wish
to trace over the course of the configuration steps.  Key C<verbose> is
optional.

=item * Return Value

Array reference.  Element C<n> of this array holds the value of the attribute
in the C<{options}-E<gt>{triggers}> part of the Parrot::Configure object at
configuration step C<n + 1>.

If, however, C<verbose> is set, each element C<n> of the array holds a hash
reference where the hash key is the name of configuration step C<n + 1> and
the value is the value of the attribute at step C<n + 1>.

=back

=head2 C<trace_data_c()>

=over 4

=item * Purpose

Provide a list of the values which a given attribute in the C<{data}-E<gt>{c}>
part of the Parrot::Configure object takes over the course of the
configuration steps.

=item * Arguments

Hash reference.  Key C<attr> is mandatory; it is the key whose value you wish
to trace over the course of the configuration steps.  Key C<verbose> is
optional.

=item * Return Value

Array reference.  Element C<n> of this array holds the value of the attribute
in the C<{data}-E<gt>{c}> part of the Parrot::Configure object at configuration
step C<n + 1>.

If, however, C<verbose> is set, each element C<n> of the array holds a hash
reference where the hash key is the name of configuration step C<n + 1> and
the value is the value of the attribute at step C<n + 1>.

=back

=head2 C<diff_data_c()>

=over 4

=item * Purpose

Provide a list of those configuration steps where the value of a given
attribute in the C<{data}-E<gt>{c}> part of the Parrot::Configure object changed
from that in effect at the conclusion of the previous configuration step.

=item * Arguments

Hash reference.  Key C<attr> is mandatory; it is the key whose changes in
value between various steps you wish to trace over the course of
configuration.

=item * Return Value

Array reference.  Each element of the array is a reference to a hash holding
information about those configuration steps where the value of a given
attribute changed from the previous configuration step.  The hash has the
following key-value pairs:

=over 4

=item * number

Index position of the configuration step where the value of the given attribute
changed.  Example:  C<init::defaults> has index position C<1>.

=item * name

Name of the configuration step where the value of the given attribute changed.

=item * before

For step C<n>, the value of the attribute at step C<n-1>.

=item * after

For step C<n>, the value of the attribute at step C<n>.

=back

=item * Comment

The array whose reference is the return value of this method only contains
elements for those configuration steps where the value of the given attribute
changed.  Nothing is reported if nothing changed.

=back

=head2 C<trace_data_triggers()>

=over 4

=item * Purpose

Provide a list of the values which a given attribute in the
C<{data}-E<gt>{triggers}> part of the Parrot::Configure object takes over the
course of the configuration steps.

=item * Arguments

Hash reference.  Key C<attr> is mandatory; it is the key whose value you wish
to trace over the course of the configuration steps.  Key C<verbose> is
optional.

=item * Return Value

Array reference.  Element C<n> of this array holds the value of the attribute
in the C<{data}-E<gt>{triggers}> part of the Parrot::Configure object at
configuration step C<n + 1>.

If, however, C<verbose> is set, each element C<n> of the array holds a hash
reference where the hash key is the name of configuration step C<n + 1> and
the value is the value of the attribute at step C<n + 1>.

=back

=head2 C<get_state_at_step()>

=over 4

=item * Purpose

Get a snapshot of the data structure in the Parrot::Configure object at the
conclusion of a given configuration step.

=item * Arguments

Either a positive integer corresponding to the step number:

    $state = $obj->get_state_at_step(54);

... or the C<x::y> string corresponding to the step's name in
Parrot::Configure::Step::List.

    $state = $obj->get_state_at_step('gen::makefiles');

=item * Return Value

Hash reference.

=back

=head1 AUTHOR

James E Keenan (jkeenan@cpan.org)

=head1 SEE ALSO

L<Parrot::Configure>, L<Parrot::Configure::Options>, F<Configure.pl>.

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
