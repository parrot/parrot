#! perl -w
#
# Constant.pm
#
# Parrot Constants.
#
# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same
# license as Perl itself.
#
# $Id$
#

use strict;

package Parrot::PackFile::Constant;
use Parrot::Types;
use Parrot::String;

my %type_names = (
  ord('\0') => 'PFC_NONE',
  ord('i')  => 'PFC_INTEGER',
  ord('n')  => 'PFC_NUMBER',
  ord('s')  => 'PFC_STRING',
  ord('k')  => 'PFC_KEY',
);

my %type_codes = (
  'PFC_NONE'    => ord('\0'),
  'PFC_INTEGER' => ord('i'),
  'PFC_NUMBER'  => ord('n'),
  'PFC_STRING'  => ord('s'),
  'PFC_KEY'     => ord('k'),
);


#
# type_name()
#
# CLASS METHOD / STRAIGHT SUB
#

sub type_name
{
    my $query = pop; # Look up last arg (in case first arg is class name)

    return $type_names{$query};
}


#
# type_code()
#
# CLASS METHOD / STRAIGHT SUB
#

sub type_code
{
    my $query = pop; # Look up last arg (in case first arg is class name)

    return $type_codes{$query};
}


#
# new()
#

sub new
{
  my $class = shift;

  my $self = bless {
    TYPE     => $type_codes{'PFC_NONE'},
    VALUE    => undef,
  }, $class;

  return $self;
}


#
# new_integer()
#

sub new_integer
{
  my $class = shift;

  my $self = bless {
    TYPE     => $type_codes{'PFC_INTEGER'},
    VALUE    => shift,
  }, $class;

  return $self;
}


#
# new_number()
#

sub new_number
{
  my $class = shift;

  my $self = bless {
    TYPE     => $type_codes{'PFC_NUMBER'},
    VALUE    => shift,
  }, $class;

  return $self;
}


#
# new_string()
#

sub new_string
{
  my $class = shift;

  my $self = bless {
    TYPE     => $type_codes{'PFC_STRING'},
    VALUE    => Parrot::String->new(@_),
  }, $class;

  return $self;
}



#
# clear()
#

sub clear
{
  my $self = shift;

  $self->{TYPE}  = $type_codes{'PFC_NONE'};
  $self->{VALUE} = undef;

  return;
}


#
# type()
#

sub type
{
  my $self = shift;
  return $self->{TYPE};
}


#
# value()
#

sub value
{
  my $self = shift;
  return $self->{VALUE};
}


#
# unpack()
#
# Unpack from the string and return the number of characters that should
# be removed from the packed string.
#

sub unpack
{
  my ($self, $string) = @_;

  my $type = shift_op($string);
  my $size = shift_op($string);

  my $value;

  if ($type == $type_codes{'PFC_NONE'}) {
    $value = undef;
  } elsif ($type == $type_codes{'PFC_INTEGER'}) {
    $value = shift_op($string);
  } elsif ($type == $type_codes{'PFC_NUMBER'}) {
    $value = shift_floatval($string);
  } elsif ($type == $type_codes{'PFC_STRING'}) {
    $value = shift_sv($string);
  } elsif ($type == $type_codes{'PFC_KEY'}) {
    $value = shift_key($string);
  } else {
    die "Unrecognized constant type code '$type'!";
  }

  $self->{TYPE}  = $type;
  $self->{VALUE} = $value;

  return $size + 2 * sizeof('op');
}


#
# packed_size()
#

sub packed_size
{
  my $self = shift;

  my $size = 2 * sizeof('op'); # For type and size

  if ($self->type == $type_codes{'PFC_NONE'}) {
    $size += 0;
  } elsif ($self->type == $type_codes{'PFC_INTEGER'}) {
    $size += sizeof('op');
  } elsif ($self->type == $type_codes{'PFC_NUMBER'}) {
    $size += sizeof('floatval');
  } elsif ($self->type == $type_codes{'PFC_STRING'}) {
    if (!ref $self->value) { print $self->value, "\n"; die; }
    $size += $self->value->packed_size;
  } elsif ($self->type == $type_codes{'PFC_KEY'}) {
    if (!ref $self->value) { print $self->value, "\n"; die; }
    $size += $self->value->packed_size;
  } else {
    die;
  }
 
  return $size;
}


#
# pack()
#

sub pack
{
  my $self = shift;
  my $packed = '';
  
  $packed .= pack_op($self->type);

  if ($self->type == $type_codes{'PFC_NONE'}) {
    $packed .= pack_op(0);
  } elsif ($self->type == $type_codes{'PFC_INTEGER'}) {
    $packed .= pack_op(sizeof("op"));
    $packed .= pack_op($self->value);
  } elsif ($self->type == $type_codes{'PFC_NUMBER'}) {
    $packed .= pack_op(sizeof("floatval"));
    $packed .= pack_floatval($self->value);
  } elsif ($self->type == $type_codes{'PFC_STRING'}) {
    $packed .= pack_op($self->value->packed_size);
    $packed .= pack_sv($self->value);
  } elsif ($self->type == $type_codes{'PFC_KEY'}) {
    $packed .= pack_op($self->value->packed_size);
    $packed .= pack_key($self->value);
  } else {
    die;
  }
 
  return $packed;
}


1;

__END__

=head1 NAME

Parrot::PackFile::Constant

=head1 SYNOPSIS

  use Parrot::PackFile::Constant;

=head1 DESCRIPTION

=head2 data DATA

=head2 data

=head2 encoding ENCODING

=head2 encoding

=head2 flags FLAGS

=head2 flags 

=head2 new FLAGS ENCODING TYPE SIZE DATA

=head2 pack

=head2 packed_size

=head2 size SIZE

=head2 size

=head2 type TYPE

=head2 type

=head2 unpack STRING

=head2 unpack

=head1 AUTHOR

Gregor N. Purdy E<lt>gregor@focusresearch.comE<gt>

=head1 COPYRIGHT

Copyright (C) 2001 Gregor N. Purdy. All rights reserved.

=head1 LICENSE

This program is free software. It is subject to the same
license as Perl itself.

