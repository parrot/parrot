#!/usr/bin/perl -w
#
# Key.pm
#
# Parrot Key Constants.
#
# This program is free software. It is subject to the same
# license as Perl itself.
#
# $Id$
#

use strict;

package Parrot::Key;
use Parrot::Types;
use Data::Dumper;


#
# new()
#

sub new
{
  my $class = shift;
  my $components = shift;

  my $self = bless {
      COMPONENTS => $components,
      COMPONENT_COUNT => scalar @$components
  }, $class;

  return $self;
}


#
# components()
#

sub components
{
  my $self = shift;
  if (@_) {
    $self->{COMPONENTS} = shift;
    $self->{COMPONENTS_COUNT} = @{$self->{COMPONENTS}};
  }
  else { 
    return $self->{COMPONENTS};
  }
}


#
# unpack()
#
# Unpack from the string and return the number of characters that should
# be removed from the packed string.
#

sub unpack
{
  my ($self, $key) = @_;

  $self->{COMPONENT_COUNT} = shift_op($key);
  $self->{COMPONENTS} = [];

  for (1 .. $self->{COMPONENT_COUNT}) {
    my $component = {};

    $component->{TYPE} = shift_op($key);
    $component->{VALUE} = shift_op($key);

    push(@{$self->{COMPONENTS}}, $component);
  }

  return sizeof("op") + $self->{COMPONENT_COUNT}*2*sizeof("op");
}


#
# packed_size()
#

sub packed_size
{
  my $self = shift;

  return $self->{COMPONENT_COUNT}*2*sizeof("op");
}


#
# pack()
#

sub pack
{
  my $self = shift;
  my $packed = pack_op($self->{COMPONENT_COUNT});

  for my $component (@{$self->{COMPONENTS}}) {
    $packed .= pack_op($component->{TYPE}) . pack_op($component->{VALUE});
  }

  return $packed;
}


#
# dump()
#

sub dump
{
  my $self = shift;
  my $const_table = shift;
  my @constants = $const_table->constants;
  my @values;

  for my $component (@{$self->{COMPONENTS}}) {
    if ($component->{TYPE} == 1) {
      push @values, $component->{VALUE};
    }
    elsif ($component->{TYPE} == 2) {
      push @values, Dumper($constants[$component->{VALUE}]->value);
    }
    elsif ($component->{TYPE} == 4) {
      push @values, Dumper($constants[$component->{VALUE}]->value->data);
    }
    elsif ($component->{TYPE} == 7) {
      push @values, "I" . $component->{VALUE};
    }
    elsif ($component->{TYPE} == 8) {
      push @values, "N" . $component->{VALUE};
    }
    elsif ($component->{TYPE} == 9) {
      push @values, "P" . $component->{VALUE};
    }
    elsif ($component->{TYPE} == 10) {
      push @values, "S" . $component->{VALUE};
    }
    else {
      die;
    }
  }

  return "[" . join(";", @values) . "]";
}


1;

__END__

=head1 NAME

Parrot::Key

=head1 SYNOPSIS

  use Parrot::Key;

=head1 DESCRIPTION

=head2 components COMPONENTS

=head2 components

=head2 new COMPONENTS

=head2 packed_size

=head2 pack

=head2 unpack KEY

=head2 unpack

=head2 dump

=head1 LICENSE

This program is free software. It is subject to the same
license as Perl itself.

