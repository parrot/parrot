#! perl -w
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::String - Parrot String

=head1 SYNOPSIS

  use Parrot::String;

=head1 DESCRIPTION

C<Parrot::String> represents a Parrot string.

=head2 Class Methods

=over 4

=cut

use strict;

package Parrot::String;
use Parrot::Types;

=item C<new($flags, $encoding, $type, $size, $data)>

Returns a new instance of C<Parrot::String>.

=cut

sub new
{
  my $class = shift;
  my ($flags, $encoding, $type, $size, $data) = @_;

  my $self = bless {
    FLAGS    => $flags,
    ENCODING => $encoding,
    TYPE     => $type,
    SIZE     => $size,
    DATA     => $data
  }, $class;

  return $self;
}

=back

=head2 Instance Methods

=over 4

=item C<flags($flags)>

=item C<flags()>

Sets/gets the string's flags.

=cut

sub flags
{
  my $self = shift;
  if (@_) { $self->{FLAGS} = shift; }
  else    { return $self->{FLAGS};  }
}

=item C<encoding($encoding)>

=item C<encoding()>

Sets/gets the string's encoding.

=cut

sub encoding
{
  my $self = shift;
  if (@_) { $self->{ENCODING} = shift; }
  else    { return $self->{ENCODING};  }
}

=item C<type($type)>

=item C<type()>

Sets/gets the string's type.

=cut

sub type
{
  my $self = shift;
  if (@_) { $self->{TYPE} = shift; }
  else    { return $self->{TYPE};  }
}

=item C<size($size)>

=item C<size()>

Sets/gets the string's size.

=cut

sub size
{
  my $self = shift;
  if (@_) { $self->{SIZE} = shift; }
  else    { return $self->{SIZE};  }
}

=item C<data($data)>

=item C<data()>

Sets/gets the string's data.

=cut

sub data
{
  my $self = shift;
  if (@_) { $self->{DATA} = shift; }
  else    { return $self->{DATA};  }
}

=item C<unpack($string)>

Unpack from the string and return the number of characters that should
be removed from the packed string.

=cut

sub unpack
{
  my ($self, $string) = @_;
  my $flags = shift_op($string);
  my $encoding = shift_op($string);
  my $type = shift_op($string);
  my $size = shift_op($string);

  my $align = sizeof("op");

  my $under      = ($size % $align) ? $align - ($size % $align) : 0;
  my $block_size = $size + $under;
  my $data       = substr($string, 0, $block_size);

  $self->{FLAGS}    = $flags;
  $self->{ENCODING} = $encoding;
  $self->{TYPE}     = $type;
  $self->{SIZE}     = $size;
  $self->{DATA}     = substr($data, 0, $size);

  return 4*sizeof("op") + $block_size;
}

=item C<packed_size()>

Returns the packed size of the string.

=cut

sub packed_size
{
  my $self = shift;
  my $size = $self->size;
  my $align = sizeof("op");
  my $under      = ($size % $align) ? $align - ($size % $align) : 0;
  my $block_size = $size + $under;
  return 4*sizeof("op") + $block_size;
}

=item C<pack()>

Packs the string.

=cut

sub pack
{
  my $self = shift;
  
  my $align = sizeof("op");

  my $size  = $self->size;
  my $under = ($size % $align) ? $align - ($size % $align) : 0;
  my $block = $self->data . ("\0" x $under);

  return pack_op($self->flags).
         pack_op($self->encoding).
         pack_op($self->type).
         pack_op($self->size).
         $block;
}

=back

=head1 SEE ALSO

=over

=item C<Parrot::Types>

=item C<Parrot::Key>

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

=cut
