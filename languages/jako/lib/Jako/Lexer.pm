#
# Lexer.pm
#
# Copyright (C) 2001-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Lexer;

use Carp;
use FileHandle;

use Jako::Token;

use base qw(Jako::Processor);


#
# CONSTRUCTOR:
#

sub new
{
  my $class = shift;
  my ($compiler) = @_;

  return bless {
    FILE     => undef,
    LINE     => undef,
    TOKENS   => [ ],
    POS      => -1
  }, $class;
}


#
# scan_line()
#

sub scan_line
{
  my $self = shift;
  my ($text, $file, $line) = @_;

  my $temp = $text; chomp $temp;
#  $self->DEBUG(0, "Scanning line %5d: %s", $line, $temp);

  my @tokens;

  if ($text =~ m{^(\s*([a-zA-Z][a-zA-Z0-9_]*)\s*:)(.*)$}) {
    push @tokens, Jako::Token->new(
      $file, $line, 'label', 'N', $2);
    $text = $3;
  }

  while (defined $text and $text ne '') {
    next if $text =~ s{^\s+}{};   # Skip all whitespace between tokens
    next if $text =~ s{^#.*?$}{}; # Skip comments between tokens

    #
    # Numeric literals:
    #

    if ($text =~ m{^(-?[0-9]+\.[0-9]+)($|\W.*$)}x) {
      push @tokens, Jako::Token->new(
        $file, $line, 'literal', 'N', $1);
      $text = $2;
      next;
    }

    #
    # Integer literals:
    #

    if ($text =~ m{^( 0 | (-?[1-9][0-9]*))($|\W.*$)}x) {
      push @tokens, Jako::Token->new(
        $file, $line, 'literal', 'I', $1);
      $text = $3;
      next;
    }

    if ($text =~ m{^( 0x[0-9a-fA-F]+ )($|\W.*$)}x) {
      push @tokens, Jako::Token->new(
        $file, $line, 'literal', 'I', $1);
      $text = $2;
      next;
    }

    #
    # String literals:
    #

=no

    if ($text =~ m{^((?:\'(?:\\\'|(?!\').)*\'))(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, 'literal', 'S', $1);
      $text = $2;
      next;
    }

=cut

    if ($text =~ m{^((?:\"(?:\\\"|(?!\").)*\"))(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, 'literal', 'S', $1);
      $text = $2;
      next;
    }

    #
    # Declarators:
    #

    if ($text =~ m{^(sub)(?!\w)(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, 'sub', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^(var|const)(?!\w)(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, $1, undef, $1);
      $text = $2;
      next;
    }

    #
    # Type:
    #

    if ($text =~ m{^(int|num|obj|str)(?!\w)(.*)$}) {
      my $type = $1 eq 'obj' ? 'P' : uc substr($1, 0, 1);
      push @tokens, Jako::Token->new(
        $file, $line, 'type', $type, $1);
      $text = $2;
      next;
    }

    #
    # Separating:
    #

    if ($text =~ m{^([,])(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, 'comma', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^([;])(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, 'semicolon', undef, $1);
      $text = $2;
      next;
    }

    #
    # Grouping:
    #

    if ($text =~ m{^([\(\)])(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, $1 eq '(' ? 'open-paren' : 'close-paren', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^([\[\]])(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, $1 eq '[' ? 'open-bracket' : 'close-bracket', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^([\{\}])(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, $1 eq '{' ? 'open-brace' : 'close-brace', undef, $1);
      $text = $2;
      next;
    }

    #
    # Control:
    #

    if ($text =~ m{^(if|else|elsif|unless)(?!\w)(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, $1, undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^(while|until|for|continue)(?!\w)(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, $1, undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^(next|last|redo|goto|return)(?!\w)(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, $1, undef, $1);
      $text = $2;
      next;
    }

    #
    # Ops:
    #

    if ($text =~ m{^( \|= | &= | <<= | >>= )(.*)$}x) {
      push @tokens, Jako::Token->new(
        $file, $line, 'bit-assign', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^( \| | & | << | >> )(.*)$}x) {
      push @tokens, Jako::Token->new(
        $file, $line, 'infix-bit', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^( == | >= | <= | != | < | > )(.*)$}x) {
      push @tokens, Jako::Token->new(
        $file, $line, 'infix-rel', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^( = )(.*)$}x) {
      push @tokens, Jako::Token->new(
        $file, $line, 'assign', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^( \+\+ | -- )(.*)$}x) {
      push @tokens, Jako::Token->new(
        $file, $line, 'exfix-arith', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^( \+= | \*= | -= | /= | %= )(.*)$}x) {
      push @tokens, Jako::Token->new(
        $file, $line, 'arith-assign', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^( \+ | - | \* | / | % )(.*)$}x) {
      push @tokens, Jako::Token->new(
        $file, $line, 'infix-arith', undef, $1);
      $text = $2;
      next;
    }

    #
    # Identifiers:
    #

    if ($text =~ m{^([a-zA-Z][a-zA-Z0-9_]*)(.*)$}) {
      push @tokens, Jako::Token->new(
        $file, $line, 'ident', undef, $1);
      $text = $2;
      next;
    }
   
    #
    # Anything else is a syntax error:
    #

    $self->PARSE_ERROR("Unrecognized text '$text'.");
  }

#  $self->DEBUG(0, "Tokens: %s", join(", ", map { "'" . $_->text . "'" } @tokens))
#    if @tokens;

  push @{$self->{TOKENS}}, @tokens;
}


#
# scan_file()
#

sub scan_file
{
  my $self = shift;
  my ($file) = @_;

#  $self->DEBUG(0, "Scanning file '$file'...");

  my $line = 0;

  my $fh = FileHandle->new($file);

  die "$0: IO Error. Unable to open file '$file' for reading.\n"
    unless $fh;

  while(<$fh>) {
    $line++;
    last if m/^__EOF__\s*$/;
    $self->scan_line($_, $file, $line);
  }

  push @{$self->{TOKENS}}, Jako::Token->new_eof($file, $line);

#  $self->DEBUG(0, "Scanned %d tokens", scalar(@{$self->{TOKENS}}));
}

1;

