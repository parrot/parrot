#! perl -w
#
# FixupTable.pm
#
# Parrot::FixupTable Perl package. Functions for manipulating Parrot
# bytecode fixup tables.
#
# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same
# license as Perl itself.
#
# $Id$
#

use strict;

package Parrot::PackFile::FixupTable;


#
# new()
#

sub new
{
  my $class = shift;
  my $self = bless { }, $class;

  if (@_) {
    $self->unpack(shift);
  }

  return $self;
}


#
# clear()
#

sub clear
{
  my $self = shift;

  return;
}


#
# unpack()
#

sub unpack
{
  my $self = shift;
}


#
# packed_size()
#

sub packed_size
{
  return 0;
}


#
# pack()
#

sub pack
{
  my $self = shift;

  return '';
}


1;

__END__

=head1 NAME

Parrot::PackFile::FixupTable

=head1 SYNOPSIS

  use Parrot::PackFile::FixupTable;

=head1 DESCRIPTION

Parrot fixup tables.

=head2 clear

=head2 new

=head2 pack

=head2 packed_size

=head2 unpack

=head1 AUTHOR

Gregor N. Purdy E<lt>gregor@focusresearch.comE<gt>

=head1 COPYRIGHT

Copyright (C) 2001 Gregor N. Purdy. All rights reserved.

=head1 LICENSE

This program is free software. It is subject to the same
license as Perl itself.

