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

use Jako::Compiler::Message; # $file, $line, $debug
use Jako::Lexer::Token;

our @CARP_NOT = qw(Jako::Compiler::Message);

use FileHandle;


#
# CONSTRUCTOR:
#

sub new
{
  my $class = shift;

  return bless {
    TOKENS => [ ],
    POS    => -1
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
#  DEBUG(0, "Scanning line %5d: %s", $line, $temp);

  my @tokens;

  if ($text =~ m{^(\s*([a-zA-Z][a-zA-Z0-9_]*)\s*:)(.*)$}) {
    push @tokens, Jako::Lexer::Token->new(
      $file, $line, 'label', ['N'], $2);
    $text = $3;
  }

  while (defined $text and $text ne '') {
    next if $text =~ s{^\s+}{};   # Skip all whitespace between tokens
    next if $text =~ s{^#.*?$}{}; # Skip comments between tokens

    #
    # Numeric literals:
    #

    if ($text =~ m{^(-?[0-9]+\.[0-9]+)($|\W.*$)}x) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'literal', ['N'], $1);
      $text = $2;
      next;
    }

    #
    # Integer literals:
    #

    if ($text =~ m{^( 0 | (-?[1-9][0-9]*))($|\W.*$)}x) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'literal', 'I', $1);
      $text = $3;
      next;
    }

    if ($text =~ m{^( 0x[0-9a-fA-F]+ )($|\W.*$)}x) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'literal', 'I', $1);
      $text = $2;
      next;
    }

    #
    # String literals:
    #

=no

    if ($text =~ m{^((?:\'(?:\\\'|(?!\').)*\'))(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'literal', 'S', $1);
      $text = $2;
      next;
    }

=cut

    if ($text =~ m{^((?:\"(?:\\\"|(?!\").)*\"))(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'literal', 'S', $1);
      $text = $2;
      next;
    }

    #
    # Declarators:
    #

    if ($text =~ m{^(sub)(?!\w)(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'sub', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^(var|const)(?!\w)(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, $1, undef, $1);
      $text = $2;
      next;
    }

    #
    # Type:
    #

    if ($text =~ m{^(int|num|obj|str)(?!\w)(.*)$}) {
      my $type = $1 eq 'obj' ? 'P' : uc substr($1, 0, 1);
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'type', $type, $1);
      $text = $2;
      next;
    }

    #
    # Separating:
    #

    if ($text =~ m{^([,])(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'comma', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^([;])(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'semicolon', undef, $1);
      $text = $2;
      next;
    }

    #
    # Grouping:
    #

    if ($text =~ m{^([\(\)])(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, $1 eq '(' ? 'open-paren' : 'close-paren', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^([\[\]])(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, $1 eq '[' ? 'open-bracket' : 'close-bracket', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^([\{\}])(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, $1 eq '{' ? 'open-brace' : 'close-brace', undef, $1);
      $text = $2;
      next;
    }

    #
    # Control:
    #

    if ($text =~ m{^(if|else|elsif|unless)(?!\w)(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, $1, undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^(while|until|for|continue)(?!\w)(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, $1, undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^(next|last|redo|goto|return)(?!\w)(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, $1, undef, $1);
      $text = $2;
      next;
    }

    #
    # Ops:
    #

    if ($text =~ m{^( \|= | &= | <<= )(.*)$}x) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'bit-assign', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^( \| | & | << )(.*)$}x) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'infix-bit', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^( == | >= | <= | != | < | > )(.*)$}x) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'infix-rel', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^( = )(.*)$}x) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'assign', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^( \+\+ | -- )(.*)$}x) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'exfix-arith', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^( \+= | \*= | -= | /= | %= )(.*)$}x) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'arith-assign', undef, $1);
      $text = $2;
      next;
    }

    if ($text =~ m{^( \+ | - | \* | / | % )(.*)$}x) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'infix-arith', undef, $1);
      $text = $2;
      next;
    }

    #
    # Identifiers:
    #

    if ($text =~ m{^([a-zA-Z][a-zA-Z0-9_]*)(.*)$}) {
      push @tokens, Jako::Lexer::Token->new(
        $file, $line, 'ident', undef, $1);
      $text = $2;
      next;
    }
   
    #
    # Anything else is a syntax error:
    #

    PARSE_ERROR("Unrecognized text '$text'.");
  }

#  DEBUG(0, "Tokens: %s", join(", ", map { "'" . $_->text . "'" } @tokens))
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

#  DEBUG(0, "Scanning file '$file'...");

  my $line = 0;

  my $fh = FileHandle->new($file);

  die "$0: IO Error. Unable to open file '$file' for reading.\n"
    unless $fh;

  while(<$fh>) {
    $line++;
    last if m/^__EOF__\s*$/;
    $self->scan_line($_, $file, $line);
  }

  push @{$self->{TOKENS}}, Jako::Lexer::Token->new_eof($file, $line);

#  DEBUG(0, "Scanned %d tokens", scalar(@{$self->{TOKENS}}));
}


#
# count()
#
# Returns the number of tokens.
#

sub count
{
  my $self = shift;

  return scalar(@{$self->{TOKENS}});
}


#
# pos()
#
# Returns (or sets) the abolute position.
#

sub pos
{
  my $self = shift;
  my ($pos) = @_;

  if (defined $pos) {
    my $count = scalar(@{$self->{TOKENS}});

    $pos = -1 if $pos < 0;          # Just before the beginning
    $pos = $count if $pos > $count; # Just past the end (in case we get more tokens)

    $self->{POS} = $pos;

    $file = $self->at($pos)->file;
    $line = $self->at($pos)->line;
  }

  return $self->{POS};
}


#
# at()
#
# Without an argument, gives the current token. With an argument, gives the
# token at that absolute position. If a count is given, then that many tokens
# (at most, given the possibilitiy of running off the end) are returned. If
# a count is not given, 1 is inferred.
#

sub at
{
  my $self = shift;
  my ($index, $count) = @_;

  $index = $self->pos unless defined $index;

  $count = 1 unless defined $count;

  INTERNAL_ERROR("Attempt to get fewer than 1 token (%s)!", $count)
    if $count < 1;

  if ($count > 1) {
    return map { $self->at($index + $_) } (0..$count);
  }

  my $pos = $self->pos;

  INTERNAL_ERROR("Position is not defined") unless defined $pos;
  
  return Jako::Lexer::Token->BOF if $index < 0;
  return Jako::Lexer::Token->EOF if $index >= @{$self->{TOKENS}};

  return $self->{TOKENS}[$index];
}


#
# get()
#
# Without an argument, gives the current token. With an argument, gives the
# token at that offset from the current one. If a count is given, then that
# many tokens (at most, given the possibility of running of the end) are
# returned. If a count is not given, 1 is inferred.
#

sub get
{
  my $self = shift;
  my ($offset, $count) = @_;

  $offset = 0 unless defined $offset;

  my $pos = $self->pos;

  INTERNAL_ERROR("Position is not defined") unless defined $pos;
  INTERNAL_ERROR("Offset is not defined")   unless defined $offset;

#  DEBUG(0, "Current position is $pos");
  $pos += $offset;
#  DEBUG(0, "Getting token at $pos");
  
  return $self->at($pos, $count);
}


#
# forth()
#
# Moves the current token position $offset tokens forward. Returns the
# token at the new absolute position.
#

sub forth
{
  my $self = shift;
  my ($offset) = @_;

  $offset = 1 unless defined $offset;

  my $pos = $self->pos;

  INTERNAL_ERROR("Position is undefined") unless defined $pos;
#  DEBUG(0, "Position starts as $pos");

  $pos += $offset;

#  DEBUG(0, "Setting position to $pos");
  $self->pos($pos);
#  DEBUG(0, "forth(): Position is now %d", $self->pos);

  my $token = $self->get;

  $file = $token->file;
  $line = $token->line;

  return $token;
}


#
# back()
#
# Moves the current token position $offset tokens backward. Returns the new
# absolute position.
#

sub back
{
  my $self = shift;
  my ($offset) = @_;

  $offset = 1 unless defined $offset;

  return $self->forth(-$offset);
}


#
# dump()
#
# Dump the tokens.
#

sub dump
{
  my $self = shift;


  while (1) {
    my $tok = $self->forth;

    printf STDERR "%6d : %-30s : %5s : %-15s: %1s : %s\n",
      $self->pos,
      $tok->file || '<NO FILE>',
      $tok->line || '',
      $tok->kind,
      $tok->type || '',
      $tok->text;

    last if $tok->is_eof;
  }

=no

  foreach (my $i = 0; $i < scalar(@{$self->{TOKENS}}); $i++) {
    my $tok = $self->at($i);

    printf STDERR "%6d : %-30s : %5s : %-15s: %1s : %s\n",
      $i,
      $tok->file || '<NO FILE>',
      $tok->line || '',
      $tok->kind,
      $tok->type || '',
      $tok->text;

    last if $tok->is_eof;
  }

=cut

}


#
# require()
#
# Require consumes and returns the token if the requirement is met, otherwise
# a Syntax Error is raised.
#
# If more than one type is specified, the semantics are "or".
#

sub require
{
  my $self = shift;

#  DEBUG(0, "Requiring '$kind'");
  
  SYNTAX_ERROR("Expected %s, but found '%s'.", @_ > 1 ? "one of (" . join(", ", @_) . ")" : $_[0], $self->get(1)->text)
    unless grep { $self->get(1)->kind eq $_ } @_;

  return $self->forth;
}


#
# REQUIRES:
#

sub require_assign        { return shift->require('assign');        }
sub require_close_brace   { return shift->require('close-brace');   }
sub require_close_bracket { return shift->require('close-bracket'); }
sub require_close_paren   { return shift->require('close-paren');   }
sub require_comma         { return shift->require('comma');         }
sub require_ident         { return shift->require('ident');         }
sub require_literal       { return shift->require('literal');       }
sub require_open_brace    { return shift->require('open-brace');    }
sub require_open_bracket  { return shift->require('open-bracket');  }
sub require_open_paren    { return shift->require('open-paren');    }
sub require_infix_rel     { return shift->require('infix-rel');     }
sub require_semicolon     { return shift->require('semicolon');     }
sub require_type          { return shift->require('type');          }

sub require_value         { return shift->require('ident', 'literal'); }


#
# skip()
#
# Skips the token type specified if it is present. Returns undef if nothing
# was skipped, otherwise returns the token skipped.
#
# If more than one type is specified, the semantics are "or".
#

sub skip
{
  my $self = shift;
  my ($kind) = @_;
  
  return undef unless grep { $self->get(1)->kind eq $_ } @_;

  return $self->forth;
}


#
# SKIPS:
#

sub skip_assign        { return shift->skip('assign');        }
sub skip_comma         { return shift->skip('comma');         }
sub skip_close_brace   { return shift->skip('close-brace');   }
sub skip_close_bracket { return shift->skip('close-bracket'); }
sub skip_close_paren   { return shift->skip('close-paren');   }
sub skip_ident         { return shift->skip('ident');         }
sub skip_literal       { return shift->skip('literal');       }
sub skip_open_brace    { return shift->skip('open-brace');    }
sub skip_open_bracket  { return shift->skip('open-bracket');  }
sub skip_open_paren    { return shift->skip('open-paren');    }
sub skip_infix_rel     { return shift->skip('infix-rel');     }
sub skip_semicolon     { return shift->skip('semicolon');     }
sub skip_type          { return shift->skip('type');          }

sub skip_value         { return shift->skip('ident', 'literal'); }

1;

