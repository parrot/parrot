# Copyright (C) 2001-2005, The Perl Foundation.
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
    my $serialized = $data->dump(q{c}, q{*PConfig});
    $data->clean;
    $data->settrigger($key, $trigger, $cb);
    $data->gettriggers($key);
    $data->gettrigger($key, $trigger);
    $data->deltrigger($key, $trigger);

=head1 DESCRIPTION

This module provides methods by which other Parrot::Configure::* modules
can access configuration data.

The module supplies a constructor for Parrot::Configure::Data objects
and three kinds of accessors:

=over 4

=item 1  Main configuration data

=item 2  Triggers

=item 3  Data read from Perl 5's C<%Config> or Perl 5 special variables.

=back

=head1 USAGE

=cut

package Parrot::Configure::Data;

use strict;
use warnings;

use Data::Dumper ();

=head2 Constructor

=over 4

=item * C<new()>

=over 4

=item * Purpose

Basic object constructor.

=item * Arguments

None.

=item * Return Value

Parrot::Configure::Data object.

=back

=back

=cut

sub new {
    my $class = shift;

    my $self = {
        c        => {},
        triggers => {},
        p5       => {},
    };

    bless $self, ref $class || $class;
    return $self;
}

=head2 Methods for Main Configuration Data

=over 4

=item * C<get($key, ...)>

=over 4

=item * Purpose

Provides access to the values assigned to elements in the
Parrot::Configure object's main data structure.

=item * Arguments

List of elements found in the Parrot::Configure object's main data
structure.

=item * Return Value

List of values associated with corresponding arguments.

=back

=cut

sub get {
    my $self = shift;

    my $c = $self->{c};

    return @$c{@_};
}

=item * C<< set($key => $val, ...) >>

=over 4

=item * Purpose

Modifies or creates new values in the main part of the Parrot::Configure
object's data structure..

=item * Arguments

List of C<< key => value >> pairs.

=item * Return Value

Parrot::Configure::Data object.

=back

=cut

sub set {
    my $self = shift;

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "\nSetting Configuration Data:\n(\n" if $verbose;

    while ( my ( $key, $val ) = splice @_, 0, 2 ) {
        print "\t$key => ", defined($val) ? "'$val'" : 'undef', ",\n"
            if $verbose;
        $self->{c}{$key} = $val;

        foreach my $trigger ( $self->gettriggers($key) ) {
            print "\tcalling trigger $trigger for $key\n" if $verbose;
            my $cb = $self->gettrigger( $key, $trigger );

            &$cb( $key, $val );
        }
    }

    print ");\n" if $verbose;

    return $self;
}

=item * C<< add($delim, $key => $val, ...) >>

=over 4

=item * Purpose

Either creates a new key or appends to an existing key, with the previous/new
values joined together by C<$delim>.

=item * Arguments

Delimiter value followed by a list of C<< key => value >> pairs.

=item * Return Value

Parrot::Configure::Data object.

=back

=cut

sub add {
    my $self  = shift;
    my $delim = shift;

    while ( my ( $key, $val ) = splice @_, 0, 2 ) {
        my ($old) = $self->{c}{$key};
        if ( defined $old ) {
            $self->set( $key, "$old$delim$val" );
        }
        else {
            $self->set( $key, $val );
        }
    }

    return $self;
}

=item * C<keys()>

=over 4

=item * Purpose

Provides a list of names of elements in the Parrot::Configure object's
main data structure.

=item * Arguments

None.

=item * Return Value

List of elements in the Parrot::Configure object's main data structure.

=back

=cut

sub keys {
    my $self = shift;

    return keys %{ $self->{c} };
}

=item * C<get_PConfig()>

=over 4

=item * Purpose

Slurps in L<Parrot::Config> data from previous run of I<Configure.pl>.

=item * Arguments

None.

=item * Return Value

Reference to hash holding main Parrot::Configure data structure.

=back

=cut

sub get_PConfig {
    my $self = shift;
    my $res  = eval <<EVAL_CONFIG;
no strict;
use Parrot::Config;
\\%PConfig;
EVAL_CONFIG

    if ( not defined $res ) {
        die "You cannot use --step until you have completed the full configure process\n";
    }
    $self->{c} = $res;
}

=item * C<get_PConfig_Temp()>

=over 4

=item * Purpose

Slurps in L<Parrot::Config> temporary data from previous run of
Configure.pl.  Only to be used when running C<gen::makefiles> plugin.

=item * Arguments

None.

=item * Return Value

Reference to hash holding that part of the main Parrot::Configure data
structure holding temporary data.

=back

=cut

sub get_PConfig_Temp {
    my $self = shift;
    my $res  = eval <<EVAL_CONFIG_TEMP;
no strict;
use Parrot::Config::Generated;
\\%PConfig_Temp;
EVAL_CONFIG_TEMP

    if ( not defined $res ) {
        die "You cannot use --step until you have completed the full configure process\n";
    }
    $self->{c}{$_} = $res->{$_} for CORE::keys %$res;
}

=item * C<dump()>

=over 4

=item * Purpose

Provides a L<Data::Dumper> serialized string of the objects key/value pairs
suitable for being C<eval>ed.

=item * Arguments

Two scalar arguments:

=over 4

=item 1

Key in Parrot::Configure object's data structure which is being dumped.

=item 2

Name of the dumped structure.

=back

Example:

    $conf->data->dump(q{c}, q{*PConfig});
    $conf->data->dump(q{c_temp}, q{*PConfig_Temp});

=item * Return Value

String.

=back

=cut

# Data::Dumper supports Sortkeys since 2.12
# older versions will work but obviously not sorted
{
    if ( defined eval { Data::Dumper->can('Sortkeys') } ) {
        *dump = sub {
            my $self = shift;
            my ( $key, $structure ) = @_;
            Data::Dumper->new( [ $self->{$key} ], [$structure] )->Sortkeys(1)->Dump();
        };
    }
    else {
        *dump = sub {
            my $self = shift;
            my ( $key, $structure ) = @_;
            Data::Dumper->new( [ $self->{$key} ], [$structure] )->Dump();
        };
    }
}

=item * C<clean()>

=over 4

=item * Purpose

Deletes keys matching C</^TEMP_/> from the internal configuration store,
and copies them to a special store for temporary keys.
Keys using this naming convention are intended to be used only temporarily,
I<e.g.>  as file lists for Makefile generation.
Temporary keys are used B<only> to regenerate makefiles after configuration.

=item * Arguments

None.

=item * Return Value

Parrot::Configure::Data object.

=back

=back

=cut

sub clean {
    my $self = shift;

    $self->{c_temp}{$_} = delete $self->{c}{$_} for grep { /^TEMP_/ } CORE::keys %{ $self->{c} };

    return $self;
}

=head2 Triggers

=over 4

=item * C<settrigger($key, $trigger, $cb)>

=over 4

=item * Purpose

Set a callback on C<$key> named C<$trigger>.  Multiple triggers can be set on a
given key.  When the key is set via C<set> or C<add> then all callbacks that
are defined will be called.  Triggers are passed the key and value that was set
after it has been changed.

=item * Arguments

Accepts a key name, a trigger name, & a C<CODE> ref.

=item * Return Value

Parrot::Configure::Data object.

=back

=cut

sub settrigger {
    my ( $self, $key, $trigger, $cb ) = @_;

    return unless defined $key and defined $trigger and defined $cb;

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Setting trigger $trigger on configuration key $key\n",
        if $verbose;

    $self->{triggers}{$key}{$trigger} = $cb;

    return $self;
}

=item * C<gettriggers($key)>

=over 4

=item * Purpose

Get the names of all triggers set for C<$key>.

=item * Arguments

String holding single key name.

=item * Return Value

List of triggers set for that key.

=back

=cut

sub gettriggers {
    my ( $self, $key ) = @_;

    return unless defined $self->{triggers}{$key};

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Looking up all triggers on configuration key $key\n"
        if $verbose;

    return CORE::keys %{ $self->{triggers}{$key} };
}

=item * C<gettrigger($key, $trigger)>

=over 4

=item * Purpose

Get the callback set for C<$key> under the name C<$trigger>

=item * Arguments

Accepts a key name & a trigger name.

=item * Return Value

C<CODE> ref.

=back

=cut

sub gettrigger {
    my ( $self, $key, $trigger ) = @_;

    return
        unless defined $self->{triggers}{$key}
            and defined $self->{triggers}{$key}{$trigger};

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "Looking up trigger $trigger on configuration key $key\n"
        if $verbose;

    return $self->{triggers}{$key}{$trigger};
}

=item * C<deltrigger($key, $trigger)>

=over 4

=item * Purpose

Removes the trigger on C<$key> named by C<$trigger>

=item * Arguments

Accepts a key name & a trigger name.

=item * Return Value

Parrot::Configure::Data object.

=back

=cut

sub deltrigger {
    my ( $self, $key, $trigger ) = @_;

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

=head2 Methods for Perl 5 Data


=over 4

=item * C<get_p5($key, ...)>

=over 4

=item * Purpose

Retrieve data originally derived from the Perl 5 environment during
configuration step C<init::defaults> and stored in a special part of the
Parrot::Configure::Data object.

=item * Arguments

List of elements found in the Perl 5-related part of the
Parrot::Configure object's data structure.

=item * Return Value

List of values associated with corresponding arguments.

=item * Note

Once data from Perl 5's C<%Config> or special variables has been stored
in configuration step C<init::defaults>, C<%Config> and the special
variables should not be further accessed.  Use this method instead.

=back

=cut

sub get_p5 {
    my $self = shift;

    my $p5 = $self->{p5};

    return @$p5{@_};
}

=item * C<< set_p5($key => $val, ...) >>

=over 4

=item * Purpose

Looks up values from either (a) the C<%Config>, located in Config.pm
and imported via C<use Config;>, associated with the instance of Perl
(C<$^X>) used to run I<Configure.pl> and assigns those values to a
special part of the Parrot::Configure::Data object.

=item * Arguments

List of C<< key => value >> pairs.  If the key being set is from
C<%Config>, the corresponding value should have the same name.  If,
however, the key being set is a Perl 5 special variable (I<e.g.>,
C<%^O>), the corresponding value should be the 'English' name of that
special variable as documented in L<perlvar> (less the initial C<$>, of
course).

=item * Return Value

Parrot::Configure::Data object.

=item * Examples

=item * Note

This method should B<only> be used in configuration step
C<init::defaults>.  It is B<not> the method used to assign values to the
main Parrot::Configure data structure; use C<set()> (above) instead.

=back

=cut

sub set_p5 {
    my $self = shift;

    my $verbose = defined $self->get('verbose') && $self->get('verbose') == 2;

    print "\nSetting Configuration Data:\n(\n" if $verbose;

    while ( my ( $key, $val ) = splice @_, 0, 2 ) {
        print "\t$key => ", defined($val) ? "'$val'" : 'undef', ",\n"
            if $verbose;
        $self->{p5}{$key} = $val;

    }

    print ");\n" if $verbose;

    return $self;
}

=item * C<keys_p5()>

=over 4

=item * Purpose

Provides a list of names of elements in the Parrot::Configure object's
main data structure.

=item * Arguments

None.

=item * Return Value

List of elements in the part of the Parrot::Configure object's data
structure storing Perl 5 configuration data.

=back

=back

=cut

sub keys_p5 {
    my $self = shift;

    return CORE::keys %{ $self->{p5} };
}

=head1 CREDITS

Based largely on code written by Brent Royal-Gordon C<brent@brentdax.com>.

=head1 AUTHOR

Joshua Hoblitt C<jhoblitt@cpan.org>

=head1 SEE ALSO

F<docs/configuration.pod>, L<Parrot::Configure>, L<Parrot::Configure::Step>,
L<Parrot::Configure::Step>

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
