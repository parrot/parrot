#! perl -w
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::PackFile - A Parrot Bytecode File

=head1 SYNOPSIS

  use Parrot::PackFile;

=head1 DESCRIPTION

C<Parrot::PackFile> contains all the functions required to process a
Parrot bytecode file. It is not intended to understand the contents of
the bytecode file's segments, but merely to dissect and reconstruct data
from the various segments. See F<docs/parrotbyte.pod> for information
about the structure of the frozen bycode.

=head2 Class Methods

=over 4

=cut

use strict;

package Parrot::PackFile;

use Parrot::PackFile::FixupTable;
use Parrot::PackFile::ConstTable;
use Parrot::Types;
use Parrot::Config;
use Digest::MD5 qw(md5_hex);

use FileHandle;

my $PARROT_MAGIC = 0x13155a1;

my $template = "l l/a* l/a* l/a*";

sub _fingerprint {
  my $fingerprint = md5_hex join "\n", map {
    join '_', $_->{NAME}, @{$_->{ARGS}}
  } @$Parrot::OpLib::core::ops;
  my @arr = ();
  for my $i (0..9) {
    push @arr, hex substr ($fingerprint, $i*2, 2);
  }
  return @arr;
}

=item C<new()>

Returns a new instance.

=cut

sub new
{
  my $class = shift;

  my $self = bless {
    WORDSIZE => sizeof("op"),
    BYTEORDER => $PConfig{bigendian},
    MAJOR => $PConfig{MAJOR},
    MINOR => $PConfig{MINOR} | $PConfig{PATCH},
    FLAGS => 0,
    FLOATTYPE => 0,
    PAD => [ _fingerprint ],
    MAGIC => $PARROT_MAGIC,
    OPCODETYPE => 0x5045524c,
    FIXUP => Parrot::PackFile::FixupTable->new(),
    CONST => Parrot::PackFile::ConstTable->new(),
    PROG  => '',
  }, $class;

  return $self;
}

=back

=head2 Instance Methods

=over 4

=item C<magic()>

Get the magic number.

=cut

sub magic
{
  return $PARROT_MAGIC;
}

=item C<wordsize()>

Returns the packfiles wordsize.

=cut

sub wordsize
{
  my $self = shift;

  return $self->{WORDSIZE};
}

=item C<byteorder()>

Returns the packfiles byte order.

=cut

sub byteorder
{
  my $self = shift;

  return $self->{BYTEORDER};
}

=item C<major()>

Returns the packfiles major version number.

=cut

sub major
{
  my $self = shift;

  return $self->{MAJOR};
}

=item C<minor()>

Returns the packfiles minor version number.

=cut

sub minor
{
  my $self = shift;

  return $self->{MINOR};
}

=item C<flags()>

Returns the packfiles flags.

=cut

sub flags
{
  my $self = shift;

  return $self->{FLAGS};
}

=item C<pad()>

Returns an MD5 hex fingerprint of the ops.

=cut

sub pad
{
  my $self = shift;

  return $self->{PAD};
}

=item C<floattype()>

Returns the packfiles float type.

=cut

sub floattype
{
  my $self = shift;

  return $self->{FLOATTYPE};
}

=item C<opcodetype()>

Returns the packfiles opcode type.

=cut

sub opcodetype
{
  my $self = shift;

  return $self->{OPCODETYPE};
}

=item C<fixup_table()>

Returns an instance of C<Parrot::PackFile::FixupTable>.

=cut

sub fixup_table
{
  my $self = shift;

  return $self->{FIXUP};
}

=item C<const_table()>

Returns an instance of C<Parrot::PackFile::ConstTable>.

=cut

sub const_table
{
  my $self = shift;

  return $self->{CONST};
}

=item C<byte_code($code)>

=item C<byte_code()>

Gets/sets the byte code.

=cut

sub byte_code
{
  my $self = shift;

  if (@_) { $self->{BCODE} = shift; }
  else    { return $self->{BCODE};  }
}

=item C<unpack($string)>

Unpack the contents from the string.

    Magic: 4-byte signed integer
    Fixup: 4-byte length N + N bytes
    Const: 4-byte length N + N bytes
    BCode: N bytes

TODO - Now that we have a portable bytecode format, with file specified
wordsize, this routine is inherently broken since it uses the native
sizes.

=cut

sub unpack
{
  my ($self, $string) = @_;

#  printf "Input string is %d bytes long\n", length($string);

  $self->{WORDSIZE} = shift_byte($string);
  $self->{BYTEORDER} = shift_byte($string);
  $self->{MAJOR} = shift_byte($string);
  $self->{MINOR} = shift_byte($string);
  $self->{FLAGS} = shift_byte($string);
  $self->{FLOATTYPE} = shift_byte($string);
  $self->{PAD} = substr($string, 0, 10);
  $string = substr($string, 10);

  my $magic = shift_op($string);

  $self->{MAGIC} = $magic;

  die "Bad PARROT_MAGIC: got [$magic]" unless $magic == $PARROT_MAGIC;

  $self->{OPCODETYPE} = shift_op($string);

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

=item C<unpack_filehandle($filehandle)>

Unpack the contents from the filehandle.

=cut

sub unpack_filehandle
{
  my ($self, $fh) = @_;

  return unless $fh;

  my @lines  = $fh->getlines();
  my $string = join('', @lines);

#  printf "Read %d lines, %d bytes.\n", scalar(@lines), length($string);

  return $self->unpack($string);
}

=item C<unpack_file($file)>

Unpack the contents from the named file.

=cut

sub unpack_file
{
  my $self = shift;

  my $fh = new FileHandle(shift);

  return unless $fh;

  binmode $fh;

  return $self->unpack_filehandle($fh);
}

=item C<pack()>

Pack the contents to a string.

=cut

sub pack
{
  my $self = shift;

  my $string = '';

  $string .= pack_byte($self->wordsize);
  $string .= pack_byte($self->byteorder);
  $string .= pack_byte($self->major);
  $string .= pack_byte($self->minor);
  $string .= pack_byte($self->flags);
  $string .= pack_byte($self->floattype);
  $string .= $self->pad;

#  print STDERR "sizeof header: ", length($string), "\n";

  $string .= pack_op($self->magic);
  $string .= pack_op($self->opcodetype);

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

=item C<pack_filehandle($filehandle)>

Pack the contents to a string and write it to the filehandle.

=cut

sub pack_filehandle
{
  my ($self, $fh) = @_;

  print($fh $self->pack);
}

=item C<pack_file($file)>

Pack the contents to a string and write it to the named file.

=cut

sub pack_file
{
  my $self = shift;
  my $fh = new FileHandle('>' . shift);

  return unless $fh;

  return $self->pack_filehandle($fh);
}

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::PackFile::ConstTable>

=item C<Parrot::PackFile::Constant>

=item C<Parrot::PackFile::FixupTable>

=item F<build_tools/pbc2c.pl>

=back

=head1 HISTORY

Author: Gregor N. Purdy E<lt>gregor@focusresearch.comE<gt>

Gregor writes:

I<"Packfile" is a proposed term based on the fact that the file contains
more than just byte code, and another language (Java) calls its binary
files by a broader notion of what's in them (Class Files). Since Perl
has packages, and since we use C<pack()> to write them, we'll call them
PackFiles (at least for now).>

I<That does, however, beg the question of file extension. Should we name
the files "foo.pack" instead of "foo.pbc"?>

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
