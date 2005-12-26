# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id: data.pm 9910 2005-11-11 22:50:48Z jhoblitt $

=head1 NAME

Parrot::Configure::Data - Configuration data container

=head1 DESCRIPTION

This module contains configuration data for use by the other
L<Parrot::Configure::*> modules.

=head1 METHODS

=over 4

=cut

package Parrot::Configure::Data;

use strict;

use Data::Dumper;

=item Parrot::Configure::Data->new()

Ojbect constructor.

=cut

sub new {
    my $class = shift;

    my $self = {
        c           => {},
        triggers    => {},
    };

    bless $self, ref $class || $class;

    return $self;
}


=item Parrot::Configure::Data->get($key,...)

Return value or hash slice for key.

=cut

sub get {
    my $self = shift;

    my $c = $self->{c};

    return @$c{@_};
}

=item Parrot::Configure::Data->set($key,$val, ...)

Set config values

=cut

sub set {
    my $self = shift;

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Setting Configuration Data:\n(\n" if $verbose;

    while (my ($key, $val) = splice @_, 0, 2) {
        print "\t$key => ", defined($val) ? "'$val'" : 'undef', ",\n"
	        if $verbose;
        $self->{c}{$key}=$val;

        foreach my $trigger ($self->gettriggers($key)) {
            print "\tcalling trigger $trigger for $key\n" if $verbose;
            my $cb = $self->gettrigger($key, $trigger);

            &$cb($key, $val);
        }
    }

    print ");\n" if $verbose;

    return $self;
}

=item Parrot::Configure::Data->add($delim, $key,$val, ...)

Append values delimited by C<$delim> to existing keys or set values.

=cut

sub add {
    my ($self, $delim) = @_;

    while (my ($key, $val) = splice @_, 0, 2) {
        my ($old) = $self->{c}{$key};
        if (defined $old) {
            $self->set($key, "$old$delim$val");
        }
        else {
            $self->set($key, $val);
        }
    }

    return $self;
}

=item Parrot::Configure::Data->keys()

Return config keys.

=cut

sub keys {
    my $self = shift;

    return keys %{$self->{c}};
}

=item Parrot::Configure::Data->dump()

Dump config keys.

=cut

# Data::Dumper supports Sortkeys since 2.12
# older versions will work but obviously not sorted
{
    my $dd_version;
    if ($Data::Dumper::VERSION =~ /([\d.]+)/) {
        $dd_version = $1;
    }
    else {
        $dd_version = $Data::Dumper::VERSION;
    }

    if ($dd_version >= 2.12) {
        *dump=sub {
            my $self = shift;
            Data::Dumper->new([$self->{c}], ['*PConfig'])->Sortkeys(1)->Dump();
        };
    }
    else {
        *dump=sub {
            my $self = shift;
            Data::Dumper->new([$self->{c}], ['*PConfig'])->Dump();
        };
    }
}

=item Parrot::Configure::Data->clean()

Delete keys matching /^TEMP_/ from config. These are used only temporarly
e.g. as file lists for Makefile generation.

=cut

sub clean {
    my $self = shift;

    delete $self->{c}{$_} for grep { /^TEMP_/ } CORE::keys %{$self->{c}};
}

=item Parrot::Configure::Data->settrigger($key, $trigger, $cb)

Set a callback on C<$key> named C<$trigger>.  Multiple triggers can be
set on a given key.  When the key is set via C<set> or C<add> then all
callbacks that are defined will be called.  Triggers are passed the
key and value that was set after it has been changed.

=cut

sub settrigger {
    my ($self, $key, $trigger, $cb) = @_;

    return unless defined $key and defined $trigger and defined $cb;

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Setting trigger $trigger on configuration key $key\n",
        if $verbose;

    $self->{triggers}{$key}{$trigger} = $cb;

    return $self;
}

=item Parrot::Configure::Data->gettriggers($key)

Get the names of all triggers set for C<$key>.

=cut

sub gettriggers {
    my ($self, $key) = @_;

    return unless defined $self->{triggers}{$key};

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Looking up all triggers on configuration key $key\n"
        if $verbose;

    return CORE::keys %{$self->{triggers}{$key}};
}

=item Parrot::Configure::Data->gettrigger($key, $trigger)

Get the callback set for C<$key> under the name C<$trigger>

=cut

sub gettrigger {
    my ($self, $key, $trigger) = @_;

    return unless defined $self->{triggers}{$key}
        and defined $self->{triggers}{$key}{$trigger};

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Looking up trigger $trigger on configuration key $key\n"
        if $verbose;

    return $self->{triggers}{$key}{$trigger};
}

=item Parrot::Configure::Data->deltrigger($key, $trigger)

Removes the trigger on C<$key> named by C<$trigger>

=cut

sub deltrigger {
    my ($self, $key, $trigger) = @_;

    return unless defined $self->{triggers}{$key}
        and defined $self->{triggers}{$key}{$trigger};

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Removing trigger $trigger on configuration key $key\n"
        if $verbose;

    delete $self->{triggers}{$key}{$trigger};

    return $self;
}

=back

=cut

1;
