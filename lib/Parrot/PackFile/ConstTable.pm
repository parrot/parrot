#!/usr/bin/perl -w
#
# ConstTable.pm
#
# Parrot::ConstTable Perl package. Functions for manipulating Parrot
# bytecode constant tables.
#
# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same
# license as Perl itself.
#
# $Id$
#

use strict;

package Parrot::PackFile::ConstTable;

use Parrot::PackFile::Constant;

my $template = "l/(l l l l/a*)*";


#
# new()
#

sub new
{
  my $class = shift;
  my $self = bless { CONST => [ ] }, $class;

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

  $self->{CONST} = [ ];

  return;
}


#
# unpack()
#

sub unpack
{
  my ($self, $string) = @_;

  my $count = unpack 'l', $string;
  $string = substr($string, 4);

  for (1..$count) {
    my $const = new Parrot::PackFile::Constant;
    my $used = $const->unpack($string);
    $string = substr($string, $used);

    push @{$self->{CONST}}, $const;
  }
}


#
# pack()
#

sub pack
{
  my $self = shift;
  my $string = '';

  $string .= pack('l', scalar(@{$self->{CONST}}));

  foreach (@{$self->{CONST}}) {
    $string .= $_->pack;
  }

  return $string;
}


1;

__END__

=head1 NAME

Parrot::PackFile::ConstTable

=head1 SYNOPSIS

  use Parrot::PackFile::ConstTable

=head1 DESCRIPTION

Constant tables from Parrot pack files.

=head2 clear

=head2 new

=head2 pack

=head2 unpack STRING

=head1 AUTHOR

Gregor N. Purdy E<lt>gregor@focusresearch.comE<gt>

=head1 COPYRIGHT

Copyright (C) 2001 Gregor N. Purdy. All rights reserved.

=head1 LICENSE

This program is free software. It is subject to the same
license as Perl itself.

