# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=pod

=head1 NAME

Parrot::Configure::Data - Configuration data container

=head1 SYNOPSIS

    use Parrot::Configure::Data;

    my $data = Parrot::Configure::Data->new;
    my @values = $data->get(@keys);
    $data->set($key1 => $value1, $key2 => $value2);
    $data->add($delimiter, $key1 => $value1, $key2 => $value2);
    my @keys = $data->keys;
    my $serialized = $data->dump;
    $data->clean;
    $data->settrigger($key, $trigger, $cb);
    $data->gettriggers($key);
    $data->gettrigger($key, $trigger);
    $data->deltrigger($key, $trigger);

=pod

=head1 NAME

Parrot::Configure::Data - Configuration data container

=head1 SYNOPSIS

    use Parrot::Configure::Data;

    my $data = Parrot::Configure::Data->new;
    my @values = $data->get(@keys);
    $data->set($key1 => $value1, $key2 => $value2);

=head1 DESCRIPTION

This module contains configuration data for use by the other
L<Parrot::Configure::*> modules.

=head1 USAGE

=head2 Import Parameters

This module accepts no arguments to it's C<import> method and exports no
I<symbols>.

=cut

package Parrot::Configure::Data;

use strict;

use Data::Dumper;

=head2 Methods

=head3 Constructors

=over 4

=item C<new()>

Basic object constructor.

Accepts no arguments and returns a L<Parrot::Configure::Data> object.

=cut

sub new
{
    my $class = shift;

    my $self = {
        c        => {},
        triggers => {},
    };

    bless $self, ref $class || $class;

    return $self;
}

=back

=head3 Object Methods

=over 4

=item C<get($key, ...)>

Provides access to key values.

Accepts a list and returns a list.

=cut

sub get
{
    my $self = shift;

    my $c = $self->{c};

    return @$c{@_};
}

=item C<set($key => $val, ...)>

Modifies or creates a new value.

Accepts a list of C<key => value> pairs and returns a
L<Parrot::Configure::Data> object.

=cut

sub set
{
    my $self = shift;

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Setting Configuration Data:\n(\n" if $verbose;

    while (my ($key, $val) = splice @_, 0, 2) {
        print "\t$key => ", defined($val) ? "'$val'" : 'undef', ",\n"
            if $verbose;
        $self->{c}{$key} = $val;

        foreach my $trigger ($self->gettriggers($key)) {
            print "\tcalling trigger $trigger for $key\n" if $verbose;
            my $cb = $self->gettrigger($key, $trigger);

            &$cb($key, $val);
        }
    }

    print ");\n" if $verbose;

    return $self;
}

=item C<add($delim, $key => $val, ...)>

Either creates a new key or appends to an existing key, with the previous/new
values joined together by C<$delim>.

Accepts a delimiter value followed by a list of C<key => value> pairs and
returns a L<Parrot::Configure::Data> object.

=cut

sub add
{
    my $self = shift;
    my $delim = shift;
    
    while (my ($key, $val) = splice @_, 0, 2) {
        my ($old) = $self->{c}{$key};
        if (defined $old) {
            $self->set($key, "$old$delim$val");
        } else {
            $self->set($key, $val);
        }
    }

    return $self;
}

=item C<keys()>

Provides a list of keys.

Accepts no arguments and returns a list.

=cut

sub keys
{
    my $self = shift;

    return keys %{$self->{c}};
}

=item C<dump()>

Provides a L<Data::Dumper> serialized string of the objects key/value pairs
suitable for being C<eval>ed.  The variable name of the structure is
C<PConfig>.

Accepts no arguments and returns a string.

=cut

# Data::Dumper supports Sortkeys since 2.12
# older versions will work but obviously not sorted
{
    my $dd_version;
    if ($Data::Dumper::VERSION =~ /([\d.]+)/) {
        $dd_version = $1;
    } else {
        $dd_version = $Data::Dumper::VERSION;
    }

    if ($dd_version >= 2.12) {
        *dump = sub {
            my $self = shift;
            Data::Dumper->new([$self->{c}], ['*PConfig'])->Sortkeys(1)->Dump();
        };
    } else {
        *dump = sub {
            my $self = shift;
            Data::Dumper->new([$self->{c}], ['*PConfig'])->Dump();
        };
    }
}

=item C<clean()>

Deletes keys matching C</^TEMP_/>.  Keys using this naming convention are
intended to be used only temporally, e.g.  as file lists for Makefile
generation.

Accepts no arguments and returns a L<Parrot::Configure::Data> object.

=cut

sub clean
{
    my $self = shift;

    delete $self->{c}{$_} for grep { /^TEMP_/ } CORE::keys %{$self->{c}};

    return $self;
}

=item C<settrigger($key, $trigger, $cb)>

Set a callback on C<$key> named C<$trigger>.  Multiple triggers can be set on a
given key.  When the key is set via C<set> or C<add> then all callbacks that
are defined will be called.  Triggers are passed the key and value that was set
after it has been changed.

Accepts a key name, a trigger name, & a C<CODE> ref and returns a
L<Parrot::Configure::Data> object.

=cut

sub settrigger
{
    my ($self, $key, $trigger, $cb) = @_;

    return unless defined $key and defined $trigger and defined $cb;

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Setting trigger $trigger on configuration key $key\n",
        if $verbose;

    $self->{triggers}{$key}{$trigger} = $cb;

    return $self;
}

=item C<gettriggers($key)>

Get the names of all triggers set for C<$key>.

Accepts a key name and returns a list.

=cut

sub gettriggers
{
    my ($self, $key) = @_;

    return unless defined $self->{triggers}{$key};

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Looking up all triggers on configuration key $key\n"
        if $verbose;

    return CORE::keys %{$self->{triggers}{$key}};
}

=item C<gettrigger($key, $trigger)>

Get the callback set for C<$key> under the name C<$trigger>

Accepts a key name & a trigger name and returns a C<CODE> ref.

=cut

sub gettrigger
{
    my ($self, $key, $trigger) = @_;

    return
        unless defined $self->{triggers}{$key}
        and defined $self->{triggers}{$key}{$trigger};

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Looking up trigger $trigger on configuration key $key\n"
        if $verbose;

    return $self->{triggers}{$key}{$trigger};
}

=item C<deltrigger($key, $trigger)>

Removes the trigger on C<$key> named by C<$trigger>

Accepts a key name & a trigger name and returns a L<Parrot::Configure::Data>
object.

=cut

sub deltrigger
{
    my ($self, $key, $trigger) = @_;

    return
        unless defined $self->{triggers}{$key}
        and defined $self->{triggers}{$key}{$trigger};

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Removing trigger $trigger on configuration key $key\n"
        if $verbose;

    delete $self->{triggers}{$key}{$trigger};

    return $self;
}

=back

=head1 CREDITS

Based largely on code written by Brent Royal-Gordon C<brent@brentdax.com>.

=head1 AUTHOR

Joshua Hoblitt C<jhoblitt@cpan.org>

=head1 SEE ALSO

F<docs/configuration.pod>, L<Parrot::Configure>, L<Parrot::Configure::Step>,
L<Parrot::Configure::Step::Base>

=cut

1;
