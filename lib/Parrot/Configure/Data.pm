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

use vars qw( %c %triggers );

use Data::Dumper;

=item Parrot::Configure::Data->get($key,...)

Return value or hash slice for key.

=cut

sub get {
    my $self = shift;
    return @c{@_};
}

=item Parrot::Configure::Data->set($key,$val, ...)

Set config values

=cut

sub set {
    my $self = shift;

    my $verbose = $c{verbose} && $c{verbose} == 2;
    return unless (defined ($_[0]));
    print "Setting Configuration Data:\n(\n" if ($verbose);
    while (my ($key, $val) = splice @_, 0, 2) {
        print "\t$key => ", defined($val) ? "'$val'" : 'undef', ",\n"
	        if ($verbose);
        $c{$key}=$val;
        if (defined $self->gettrigger($key)) {
            while (my ($trigger, $cb) = each %{$self->gettriggers($key)}) {
                print "\tcalling trigger $trigger for $key\n" if $verbose;
                &$cb($key, $val);
            }
	    }
    }

    print ");\n" if ($verbose);
}

=item Parrot::Configure::Data->add($delim, $key,$val, ...)

Append values delimited by C<$delim> to existing keys or set values.

=cut

sub add {
    my ($self, $delim) = (shift, shift);

    while (my ($key, $val) = splice @_, 0, 2) {
        my ($old) = $c{$key};
        if (defined $old) {
            $self->set($key, "$old$delim$val");
        }
        else {
            $self->set($key, $val);
        }
    }
}

=item Parrot::Configure::Data->keys()

Return config keys.

=cut

sub keys {
    return keys %c;
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
            Data::Dumper->new([\%c], ['*PConfig'])->Sortkeys(1)->Dump();
        };
    }
    else {
        *dump=sub {
            Data::Dumper->new([\%c], ['*PConfig'])->Dump();
        };
    }
}

=item Parrot::Configure::Data->clean()

Delete keys matching /^TEMP_/ from config. These are used only temporarly
e.g. as file lists for Makefile generation.

=cut

sub clean {
    delete $c{$_} for grep { /^TEMP_/ } CORE::keys %c;
}

=item Parrot::Configure::Data->settrigger($key, $trigger, $cb)

Set a callback on C<$key> named C<$trigger>.  Multiple triggers can be
set on a given key.  When the key is set via C<set> or C<add> then all
callbacks that are defined will be called.  Triggers are passed the
key and value that was set after it has been changed.

=cut

sub settrigger {
    my ($self, $var, $trigger, $cb) = @_;
    if (defined $cb) {
        if (defined $self->get('verbose') and $self->get('verbose') == 2) {
            print "Setting trigger $trigger on configuration key $var\n";
        }
        $triggers{$var}{$trigger} = $cb;
    }
}

=item Parrot::Configure::Data->gettriggers($key)

Get the names of all triggers set for C<$key>.

=cut

sub gettriggers {
    my ($self, $key) = @_;
    return CORE::keys %{$triggers{$key}};
}

=item Parrot::Configure::Data->gettrigger($key, $trigger)

Get the callback set for C<$key> under the name C<$trigger>

=cut

sub gettrigger {
    my ($self, $key, $t) = @_;
    return undef if !defined $triggers{$key} or !defined $triggers{$key}{$t};
    return $triggers{$key}{$t};
}

=item Parrot::Configure::Data->deltrigger($key, $trigger)

Removes the trigger on C<$key> named by C<$trigger>

=cut

sub deltrigger {
    my ($self, $var, $t) = @_;
    return if !defined $triggers{$var} or !defined $triggers{$var}{$t};
    delete $triggers{$var}{$t};
    if (defined $self->get('verbose') and $self->get('verbose') == 2) {
        print "Removing trigger $t on configuration key $var\n";
    }
}

=back

=cut

1;
