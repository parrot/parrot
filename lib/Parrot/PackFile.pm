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
use Parrot::Types;

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

  my $magic = shift_op($string);

  $self->{MAGIC} = $magic;

  die "Bad PARROT_MAGIC" unless $magic == $PARROT_MAGIC;

  #
  # Read the fixup table:
  #
 
  my $fixup = '';

  my $fixup_length = shift_op($string);

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

  my $const_length = shift_op($string);

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

  my $byte_code_length = shift_op($string);
  my $byte_code = '';

  if($byte_code_length) {
    $byte_code = unpack("a$byte_code_length", $string);
  }

  $self->{BCODE} = $byte_code;
  $string = substr($string, $byte_code_length);

  #
  # Report on what we found:
  #

#  printf "  * %6d bytes magic\n", 4;
#  printf "  * %6d bytes fixup segment header\n", 4;
#  printf "  * %6d bytes fixup\n", length($fixup);
#  printf "  * %6d bytes const segment header\n", 4;
#  printf "  * %6d bytes const\n", length($const);
#  printf "  * %6d bytes bcode segment header\n", 4;
#  printf "  * %6d bytes bcode\n", length($byte_code);

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

  $string .= pack_op($self->magic);

  my $fixup = $self->fixup_table->pack;
  my $const = $self->const_table->pack;

  $string .= pack_op(length($fixup));
  $string .= $fixup;

  $string .= pack_op(length($const));
  $string .= $const;

  $string .= pack_op(length($self->byte_code));
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

Currently there are three segment types defined, and they must occur
in precisely the order: FIXUP, CONSTANT TABLE, BYTE CODE. Every
segment must be present, even if empty.


=head2 FIXUP SEGMENT

  << The format for the FIXUP segment is not yet defined. >>


=head2 CONSTANT TABLE SEGMENT

  0 (relative)
  +----------+----------+----------+----------+
  |            Constant Count (N)             |
  +----------+----------+----------+----------+

For each constant:

  +----------+----------+----------+----------+
  |             Constant Type (T)             |
  +----------+----------+----------+----------+
  |             Constant Size (S)             |
  +----------+----------+----------+----------+
  |                                           |
  |        S bytes of constant content        |
  :       appropriate for representing        :
  |              a value of type T            |
  |                                           |
  +----------+----------+----------+----------+


=head2 CONSTANTS

For integer constants:

  << integer constants are represented as manifest constants in
     the byte code stream currently, limiting them to 32 bit values. >>

For number constants (S is constant, and is equal to C<sizeof(FLOATVAL)>):

  +----------+----------+----------+----------+
  |                                           |
  |             S' bytes of Data              |
  |                                           |
  +----------+----------+----------+----------+

where

  S' = S + (S % 4) ? (4 - (S % 4)) : 0

If S' E<gt> S, then the extra bytes are filled with zeros.
 

For string constants (S varies, and is the size of the particular string):

  4, 4 + (16 + S'0), 4 + (16 + S'0) + (16 + S'1)
  +----------+----------+----------+----------+
  |                   Flags                   |
  +----------+----------+----------+----------+
  |                  Encoding                 |
  +----------+----------+----------+----------+
  |                   Type                    |
  +----------+----------+----------+----------+
  |                  Size (S)                 |
  +----------+----------+----------+----------+
  |                                           |
  :             S' bytes of Data              :
  |                                           |
  +----------+----------+----------+----------+

where

  S' = S + (S % 4) ? (4 - (S % 4)) : 0

If S' E<gt> S, then the extra bytes are filled with zeros.
 

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
  |    Integer Argument (Manifest Constant)   |
  +----------+----------+----------+----------+

  +----------+----------+----------+----------+
  |   String Argument (Constant Table Index)  |
  +----------+----------+----------+----------+

  +----------+----------+----------+----------+
  |   Number Argument (Constant Table Index)  |
  +----------+----------+----------+----------+

The number and types for each argument can be determined by
consulting Parrot::Opcode.


=head2 SOURCE CODE SEGMENT

Currently there are no utilities that use this segment, even
though it is mentioned in some of the early Parrot documents.

Eventually there will be a more complete and useful PackFile
specification, but this simple format works well enough for
now (c. Parrot 0.0.2).


=head1 AUTHOR

Gregor N. Purdy E<lt>gregor@focusresearch.comE<gt>

=head1 COPYRIGHT

Copyright (C) 2001 Gregor N. Purdy. All rights reserved.

=head1 LICENSE

This program is free software. It is subject to the same
license as Perl itself.

