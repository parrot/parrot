#! perl -w
# $Id$
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.

=head1 NAME

Parrot::PackFile::ConstTable - Packfile Constant Tables

=head1 SYNOPSIS

  use Parrot::PackFile::ConstTable;

=head1 DESCRIPTION

Instances of C<Parrot::PackFile::ConstTable> are used to represent
constant tables from Parrot packfiles.

=head2 Class Methods

=over 4

=cut

use strict;

package Parrot::PackFile::ConstTable;

use Carp;

use Parrot::PackFile::Constant;
use Parrot::Types;

my $template = "l/(l l l l/a*)*";

=item C<new($string)>

Returns a new instance.

=cut

sub new
{
  my $class = shift;
  my $self = bless { CONST => [ ] }, $class;

  if (@_) {
    $self->unpack(shift);
  }

  return $self;
}

=back

=head2 Instance Methods

=over 4

=item C<clear()>

Empties the constant table.

=cut

sub clear
{
  my $self = shift;

  $self->{CONST} = [ ];

  return;
}

=item C<unpack($string)>

Unpacks the string.

=cut

sub unpack
{
  my ($self, $string) = @_;

  my $count = shift_op($string);
  my $total_used = 0;

  for (1..$count) {
    my $const = new Parrot::PackFile::Constant;
    my $used = $const->unpack($string);

    confess "PackFile::ConstTable: Internal error: Unpacked Constant returned bad byte count '$used'!"
      unless defined($used) and $used > 0 and $used <= length $string;
    
    $string = substr($string, $used);
    $total_used += $used;

    push @{$self->{CONST}}, $const;
  }

  return $total_used + sizeof('op');
}

=item C<packed_size()>

Returns the packed size of the constant table.

=cut

sub packed_size
{
  my $self = shift;

  my $size = sizeof('op');

  foreach (@{$self->{CONST}}) {
    $size += $_->packed_size;
  }

  return $size;
}

=item C<pack()>

Packs the constant table.

=cut

sub pack
{
  my $self = shift;
  my $packed = '';

  $packed .= pack_op($self->const_count);

  foreach (@{$self->{CONST}}) {
    $packed .= $_->pack;
  }

  return $packed;
}

=item C<const_count()>

Returns the number of constants in the table.

=cut

sub const_count
{
  my $self = shift;

  return scalar(@{$self->{CONST}});
}

=item C<constant($index)>

Returns the constant at C<$index>.

=cut

sub constant
{
  my ($self, $index) = @_;

  return $self->{CONST}[$index];
}

=item C<constants()>

Returns a reference to the constants array.

=cut

sub constants
{
  my $self = shift;

  return @{$self->{CONST}};
}
 
=item C<add($const)>

Adds the constant (an instance of C<Parrot::PackFile::Constant>) to the
table.

=cut

sub add
{
  my $self = shift;
  my $const = shift;
  die unless ref $const eq "Parrot::PackFile::Constant";
  push @{$self->{CONST}}, $const;
}

=back

=head1 SEE ALSO

=over

=item C<Parrot::PackFile>

=item C<Parrot::PackFile::Constant>

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