#! perl -w
# $Id$

=head1 NAME

Parrot::PackFile::Constant - A Parrot Constant

=head1 SYNOPSIS

  use Parrot::PackFile::Constant;

=head1 DESCRIPTION

Instances of C<Parrot::PackFile::Constant> are used to represent
constants in Parrot packfiles.

=head2 Functions

Note that these functions are not exported.

=over 4

=cut

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

=item C<type_name($query)>

Return the type name for C<$query>.

=cut

sub type_name
{
    my $query = pop; # Look up last arg (in case first arg is class name)

    return $type_names{$query};
}

=item C<type_code($query)>

Return the type code for C<$query>.

=cut

sub type_code
{
    my $query = pop; # Look up last arg (in case first arg is class name)

    return $type_codes{$query};
}

=back

=head2 Class Methods

=over 4

=item C<new()>

Returns a new instance of type C<PFC_NONE>.

=cut

sub new
{
  my $class = shift;

  my $self = bless {
    TYPE     => $type_codes{'PFC_NONE'},
    VALUE    => undef,
  }, $class;

  return $self;
}

=item C<new_integer()>

Returns a new integer constant instance.

=cut

sub new_integer
{
  my $class = shift;

  my $self = bless {
    TYPE     => $type_codes{'PFC_INTEGER'},
    VALUE    => shift,
  }, $class;

  return $self;
}

=item C<new_number()>

Returns a new floating-point number constant instance.

=cut

sub new_number
{
  my $class = shift;

  my $self = bless {
    TYPE     => $type_codes{'PFC_NUMBER'},
    VALUE    => shift,
  }, $class;

  return $self;
}

=item C<new_string()>

Returns a new Parrot string constant instance.

=cut

sub new_string
{
  my $class = shift;

  my $self = bless {
    TYPE     => $type_codes{'PFC_STRING'},
    VALUE    => Parrot::String->new(@_),
  }, $class;

  return $self;
}

=back

=head2 Instance Methods

=over 4

=item C<clear()>

Sets the constant type to C<PFC_NONE>.

=cut

sub clear
{
  my $self = shift;

  $self->{TYPE}  = $type_codes{'PFC_NONE'};
  $self->{VALUE} = undef;

  return;
}

=item C<type()>

Returns the type of the constant.

=cut

sub type
{
  my $self = shift;
  return $self->{TYPE};
}

=item C<value()>

Returns the value of the constant.

=cut

sub value
{
  my $self = shift;
  return $self->{VALUE};
}

=item C<unpack($string)>

Unpack from the string and return the number of characters that should
be removed from the packed string.

=cut

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

=item C<packed_size()>

Returns the packed size of the constant.

=cut

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

=item C<pack()>

Packs the constant.

=cut

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

=back

=head1 SEE ALSO

=over

=item C<Parrot::PackFile>

=item C<Parrot::PackFile::ConstTable>

=item C<Parrot::PackFile::FixupTable>

=item F<build_tools/pbc2c.pl>

=back

=head1 HISTORY

Author: Gregor N. Purdy E<lt>gregor@focusresearch.comE<gt>

=cut

1;

__END__

# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same
# license as Perl itself.

=begin TODO

=head1 COPYRIGHT

Copyright (C) 2001 Gregor N. Purdy. All rights reserved.

=head1 LICENSE

This program is free software. It is subject to the same
license as Perl itself.

=end TODO

