#! perl -w
# $Id$

=head1 NAME

Parrot::PackFile::FixupTable - A Parrot Fix-Up Table

=head1 SYNOPSIS

  use Parrot::PackFile::FixupTable;

=head1 DESCRIPTION

Instances of C<Parrot::PackFile::FixupTable> are used to represent
fixup tables in Parrot packfiles.

=head2 Class Methods

=over 4

=cut

use strict;

package Parrot::PackFile::FixupTable;

=item C<new($string)>

Returns a new instance.

=cut

sub new
{
  my $class = shift;
  my $self = bless { }, $class;

  if (@_) {
    $self->unpack(shift);
  }

  return $self;
}

=back

=head2 Instance Methods

=over 4

=item C<clear()>

Does nothing.

=cut

sub clear
{
  my $self = shift;

  return;
}

=item C<unpack()>

Does nothing.

=cut

sub unpack
{
  my $self = shift;
}

=item C<packed_size()>

Returns C<0>.

=cut

sub packed_size
{
  return 0;
}

=item C<pack()>

Returns an empty string.

=cut

sub pack
{
  my $self = shift;

  return '';
}

=back

=head1 SEE ALSO

=over

=item C<Parrot::PackFile>

=item C<Parrot::PackFile::Constant>

=item C<Parrot::PackFile::ConstTable>

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