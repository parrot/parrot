#!/usr/bin/perl -w
#
# PackFile.pm
#
# Parrot::PackFile Perl package. Functions for reading, writing and manipulating
# Parrot Pack Files. NOTE: This is a proposed term based on the fact that the
# file contains more than just byte code, and another language (Java) calls
# its binary files by a broader notion of what's in them (Class Files). Since
# Perl has packages, and since we use pack() to write them, we'll call them
# PackFiles (at least for now).
#
# That does, however, beg the question of file extension. Should we name the
# files "foo.pack" instead of "foo.pbc"?
#
# Copyright (C) 2001 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same
# license as Perl itself.
#
# $Id$
#

use strict;

package Parrot::PackFile;

use Parrot::PackFile::FixupTable;
use Parrot::PackFile::ConstTable;

use FileHandle;

my $PARROT_MAGIC = 0x13155a1;

my $template = "l l/a* l/a* l/a*";


#
# new()
#

sub new
{
  my $class = shift;

  my $self = bless {
    MAGIC => $PARROT_MAGIC,
    FIXUP => Parrot::PackFile::FixupTable->new(),
    CONST => Parrot::PackFile::ConstTable->new(),
    PROG  => '',
  }, $class;

  return $self;
}

#
# magic()
#

sub magic
{
  return $PARROT_MAGIC;
}


#
# fixup_table()
#

sub fixup_table
{
  my $self = shift;

  return $self->{FIXUP};
}


#
# const_table()
#

sub const_table
{
  my $self = shift;

  return $self->{CONST};
}


#
# byte_code()
#

sub byte_code
{
  my $self = shift;

  if (@_) { $self->{BCODE} = shift; }
  else    { return $self->{BCODE};  }
}


#
# unpack()
#
# Magic: 4-byte signed integer
# Fixup: 4-byte length N + N bytes
# Const: 4-byte length N + N bytes
# BCode: N bytes
#

sub unpack
{
  my ($self, $string) = @_;

#  printf "Input string is %d bytes long\n", length($string);

  my $magic = unpack("l", $string);
  $string = substr($string, 4);

  $self->{MAGIC} = $magic;

  die "Bad PARROT_MAGIC" unless $magic == $PARROT_MAGIC;

  #
  # Read the fixup table:
  #
 
  my $fixup = '';

  my $fixup_length = unpack('l', $string);
  $string = substr($string, 4);

  if($fixup_length) {
    $fixup = unpack("a$fixup_length", $string);
    $string = substr($string, $fixup_length);
    $self->{FIXUP}->unpack($fixup);
  } else {
    $self->{FIXUP}->clear;
  }

  #
  # Read the constant table:
  #
 
  my $const = '';

  my $const_length = unpack('l', $string);
  $string = substr($string, 4);

  if($const_length) {
    $const = unpack("a$const_length", $string);
    $self->{CONST}->unpack($const);
  } else {
    $self->{CONST}->clear;
  }
  $string = substr($string, $const_length);

  #
  # Read the byte code:
  #
  # TODO: This is wrong. It should be a length-payload pair like the
  # rest of the segments, but the assembler and interpreter and
  # disassembler all agree on this implementation despite the docs.
  #

  $self->{BCODE} = $string;

  #
  # Report on what we found:
  #

#  printf "  * %6d bytes magic\n", 4;
#  printf "  * %6d bytes fixup segment header\n", 4;
#  printf "  * %6d bytes fixup\n", length($fixup);
#  printf "  * %6d bytes const segment header\n", 4;
#  printf "  * %6d bytes const\n", length($const);
#  printf "  * %6d bytes bcode\n", length($string);

#  printf "Parsed string with %d bytes of fixup, %d bytes of const and %d bytes of prog.\n", length($fixup), length($const), length($prog);

#  my $packed = pack($template, $magic, $fixup, $const, $bcode);

#  printf "Packed is %d bytes long\n", length($packed);

  return $self;
}


#
# unpack_filehandle()
#

sub unpack_filehandle
{
  my ($self, $fh) = @_;

  return unless $fh;

  my @lines  = $fh->getlines();
  my $string = join('', @lines);
 
#  printf "Read %d lines, %d bytes.\n", scalar(@lines), length($string);

  return $self->unpack($string);
}


#
# unpack_file()
#

sub unpack_file
{
  my $self = shift;

  my $fh = new FileHandle(shift);

  return unless $fh;

  return $self->unpack_filehandle($fh);
}


#
# pack()
#

sub pack
{
  my $self = shift;

  my $string = '';

  $string .= pack('l', $self->magic);

  my $fixup = $self->fixup_table->pack;
  my $const = $self->const_table->pack;

  $string .= pack('l', length($fixup));
  $string .= $fixup;

  $string .= pack('l', length($const));
  $string .= $const;

  #
  # TODO: It is wrong not to write this length, because then we can't have
  # another source-code segment, which the docs say we should be able to
  # have.
  #

#  $string .= pack('l', length($self->byte_code));
  $string .= $self->byte_code;

  return $string;
}


#
# pack_filehandle()
#

sub pack_filehandle
{
  my ($self, $fh) = @_;

  print($fh $self->pack);
}


#
# pack_file()
#

sub pack_file
{
  my $self = shift;
  my $fh = new FileHandle('>' . shift);

  return unless $fh;

  return $self->pack_filehandle($fh);
}


1;

__END__


=head1 NAME

Parrot::PackFile

=head1 SYNOPSIS

  use Parrot::PackFile;

=head1 DESCRIPTION

This package contains all the functions required to process a Parrot bytecode
file. It is not intended to understand the contents of the bytecode file's
segments, but merely to dissect and reconstruct data from the various
segments. See L<parrotbyte> for information about the structure of the frozen
bycode.

=head2 byte_code
=head2 byte_code CODE

Get or set the byte code.

=head2 const_table

Get the constant table, and instance of the L<Parrot::PackFile::ConstTable>
class.

=head2 fixup_table

Get the fixup table, and instance of the L<Parrot::PackFile::FixupTable>
class.

=head2 magic

Get the magic number.

=head2 new

Make a new instance.

=head2 pack

Pack the contents to a string.

=head2 pack_file FILENAME

Pack the contents to a string and write it to the named file.

=head2 pack_filehandle FILEHANDLE

Pack the contents to a string and write it to the filehandle.

=head2 unpack STRING

Unpack the contents from the string.

=head2 unpack_file FILENAME

Unpack the contents from the named file.

=head2 unpack_filehandle FILEHANDLE

Unpack the contents from the filehandle.


=head1 FORMAT

  0
  +----------+----------+----------+----------+
  |         Parrot Magic = 0x 13155a1         |
  +----------+----------+----------+----------+
  
  For each segment:

  4, 4 + (4 + S0), 4 + (4 + S0) + (4 + S1)
  +----------+----------+----------+----------+
  |       Segment length in bytes (S)         |
  +----------+----------+----------+----------+
  |                                           |
  :        S bytes of segment content         :
  |                                           |
  +----------+----------+----------+----------+
  
NOTE: Despite the documentation, current implementations consist
of two actual segments (fixup and const) followed by a block of
byte code, which is not in a proper segment.


=head2 FIXUP SEGMENT

TODO: Segment format undefined.

=head2 CONSTANTS SEGMENT

  0 (relative)
  +----------+----------+----------+----------+
  |            Constant Count (N)             |
  +----------+----------+----------+----------+

For each constant:

  4, 4 + (16 + S'0), 4 + (16 + S'0) + (16 + S'1)
  +----------+----------+----------+----------+
  |                   Flags                   |
  +----------+----------+----------+----------+
  |                  Encoding                 |
  +----------+----------+----------+----------+
  |                   Type                    |
  +----------+----------+----------+----------+
  |                   Size S                  |
  +----------+----------+----------+----------+
  |                                           |
  : S' bytes of Data (w/ S % 4 pad \0 bytes)  |
  |                                           |
  +----------+----------+----------+----------+
 
=head2 BYTE CODE SEGMENT

The pieces that can be found in the byte code segment are as
follows:

  +----------+----------+----------+----------+
  |              Operation Code               |
  +----------+----------+----------+----------+

  +----------+----------+----------+----------+
  |             Register Argument             |
  +----------+----------+----------+----------+

  +----------+----------+----------+----------+
  |        Integer Constant Argument          |
  +----------+----------+----------+----------+

  +----------+----------+----------+----------+
  |         String Constant Argument          |
  +----------+----------+----------+----------+

  +----------+----------+----------+----------+
  |         Number Constant Argument          |
  +                                           +
  |                                           |
  +----------+----------+----------+----------+

  +----------+----------+----------+----------+
  |              Constant Argument            |
  +----------+----------+----------+----------+

The number and types for each argument can be determined by
consulting Parrot::Opcode.

=head2 SOURCE CODE SEGMENT

=head1 AUTHOR

Gregor N. Purdy E<lt>gregor@focusresearch.comE<gt>

=head1 COPYRIGHT

Copyright (C) 2001 Gregor N. Purdy. All rights reserved.

=head1 LICENSE

This program is free software. It is subject to the same
license as Perl itself.

