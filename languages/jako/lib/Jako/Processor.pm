#
# Processor.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Processor;

use Carp;


#
# new()
#

sub new
{
  confess "Subclass responsibility";
}


#
# debug()
#

sub debug
{
  my $self = shift;

  if (@_) {
    $self->{DEBUG} = shift;
  }

  return $self->{DEBUG};
}


#
# file()
#

sub file
{
  my $self = shift;

  if (@_) { $self->{FILE} = shift; }

  return defined $self->{FILE} ? $self->{FILE} : '<NO FILE>';
}


#
# line()
#

sub line
{
  my $self = shift;

  if (@_) { $self->{LINE} = shift; }

  return defined $self->{LINE} ? $self->{LINE} : '';
}


###############################################################################
###############################################################################
##
## TOKEN PROCESSING:
##
###############################################################################
###############################################################################


#
# tokens()
#

sub tokens
{
  my $self = shift;

  if (@_) {
    $self->{TOKENS} = [ @_ ];
  }
  else {
    return @{$self->{TOKENS}};
  }
}


#
# token_count()
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

    $self->file($self->at($pos)->file);
    $self->line($self->at($pos)->line);
  }

  return defined $self->{POS} ? $self->{POS} : -1;
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

  $self->INTERNAL_ERROR("Attempt to get fewer than 1 token (%s)!", $count)
    if $count < 1;

  if ($count > 1) {
    return map { $self->at($index + $_) } (0..$count);
  }

  my $pos = $self->pos;

  $self->INTERNAL_ERROR("Position is not defined") unless defined $pos;
  
  return Jako::Token->BOF if $index < 0;
  return Jako::Token->EOF if $index >= @{$self->{TOKENS}};

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

  $self->INTERNAL_ERROR("Position is not defined") unless defined $pos;
  $self->INTERNAL_ERROR("Offset is not defined")   unless defined $offset;

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

  $self->INTERNAL_ERROR("Position is undefined") unless defined $pos;
#  DEBUG(0, "Position starts as $pos");

  $pos += $offset;

#  DEBUG(0, "Setting position to $pos");
  $self->pos($pos);
#  DEBUG(0, "forth(): Position is now %d", $self->pos);

  my $token = $self->get;

  $self->file($token->file);
  $self->line($token->line);

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
      $tok->file,
      $tok->line,
      $tok->kind,
      $tok->type || '',
      $tok->text;

    last if $tok->is_eof;
  }

=begin commented_out

  foreach (my $i = 0; $i < scalar(@{$self->{TOKENS}}); $i++) {
    my $tok = $self->at($i);

    printf STDERR "%6d : %-30s : %5s : %-15s: %1s : %s\n",
      $i,
      $tok->file,
      $tok->line,
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
  
  $self->SYNTAX_ERROR("Expected %s, but found '%s'.", @_ > 1 ? "one of (" . join(", ", @_) . ")" : $_[0], $self->get(1)->text)
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
sub skip_colon         { return shift->skip('colon');         }
sub skip_comma         { return shift->skip('comma');         }
sub skip_close_brace   { return shift->skip('close-brace');   }
sub skip_close_bracket { return shift->skip('close-bracket'); }
sub skip_close_paren   { return shift->skip('close-paren');   }
sub skip_ident         { return shift->skip('ident');         }
sub skip_literal       { return shift->skip('literal');       }
sub skip_new           { return shift->skip('new');           }
sub skip_open_brace    { return shift->skip('open-brace');    }
sub skip_open_bracket  { return shift->skip('open-bracket');  }
sub skip_open_paren    { return shift->skip('open-paren');    }
sub skip_infix_rel     { return shift->skip('infix-rel');     }
sub skip_semicolon     { return shift->skip('semicolon');     }
sub skip_type          { return shift->skip('type');          }

sub skip_value         { return shift->skip('ident', 'literal'); }


###############################################################################
###############################################################################
##
## MESSAGES:
##
###############################################################################
###############################################################################


#
# DEBUG()
#

sub DEBUG
{
  my ($self, $level, $format, @args) = @_;

  return unless defined $self->debug and $self->debug >= $level;

  my $message = $format ? sprintf($format, @args) : '<no message>';

  printf STDERR "%s [%s]: Debug message: %s\n", $self->file, $self->line, $message;
}


#
# WARNING()
#

sub WARNING
{
  my ($self, $format, @args) = @_;

  my $message = sprintf($format, @args);

  print STDERR "%s [%s]: Warning: %s", $self->file, $self->line, $message;
}


#
# ERROR()
#

sub ERROR
{
  my ($self, $kind, $format, @args) = @_;

  my $message = sprintf($format, @args);

  $message = sprintf("%s [%s]: %s error: %s", $self->file, $self->line, $kind, $message);

  if ($self->debug) { confess $message; }
  else              { die "$message\n"; }
}


#
# PARSE_ERROR()
#

sub PARSE_ERROR
{
  my ($self, $format, @args) = @_;
  $self->ERROR('Parse', $format, @args);
}


#
# SYNTAX_ERROR()
#

sub SYNTAX_ERROR
{
  my ($self, $format, @args) = @_;
  $self->ERROR('Syntax', $format, @args);
}


#
# INTERNAL_ERROR()
#

sub INTERNAL_ERROR
{
  my ($self, $format, @args) = @_;
  $self->ERROR('Internal', $format, @args);
}

1;

