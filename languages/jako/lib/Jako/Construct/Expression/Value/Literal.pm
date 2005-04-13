#
# Literal.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Expression::Value::Literal;

use Carp;

use base qw(Jako::Construct::Expression::Value);

sub new
{
  my $class = shift;
  my ($block, $token) = @_;

  return bless {
    BLOCK  => $block,

    TOKEN  => $token,
    TYPE   => Jako::Construct::Type->new($token->type),
    VALUE  => $token->text,

    DEBUG  => 1,
    FILE   => $token->file,
    LINE   => $token->line
  }, $class;
}


#
# compile()
#
# By default, compiling a literal does nothing, returning you
# the literal for you to use in other compilations. But, string
# literals are subject to interpolation, and so they go through
# compilation in such a way that a string register value results
# for use by further compilations. This register value is
# returned to the caller.
#
# Converts a single string argument:
#
#     "Foo $a ${b}ar\n"
#
# to multiple arguments:
#
#     "Foo ", a, " ", b, "ar ", b, "\n"
#
# to effect string interpolation.
#

sub compile
{
  my $self = shift;
  my ($compiler) = @_;

  confess "No Compiler!" unless defined $compiler;

  my $type = $self->type;

#  $self->DEBUG(0, "Compiling literal of type: '%s'...", ref $type);

  if (UNIVERSAL::isa($type, 'Jako::Construct::Type::String')) {
    my $string = $self->value;

#    $self->DEBUG(0, "Compiling string literal: '%s'...", $self->value);

    return $string unless $string =~ m/(^"|^".*?[^\\])\$/; # Double-quote with an unescaped '$'.

    $string = substr($string, 1, -1); # Without the surrounding double quotes.

    my $temp = $compiler->temp_str(); # Allocate and clear a temporary string register

    $compiler->emit("  $temp = \"\"");

    while (1) {
      last unless defined $string and
        $string =~ m/(^|^.*?[^\\])\$((([A-Za-z][A-Za-z0-9_]*)\b)|({[A-Za-z][A-Za-z0-9_]*}))(.*)$/;

      $compiler->emit("  concat $temp, \"$1\"")
        if defined $1 and $1 ne '';

      my $ident = $2;
      $ident =~ s/^{(.*)}$/$1/; # Strip '{' and '}'.

      my $sym = $self->block->find_symbol($ident);

      $self->SYNTAX_ERROR("Cannot interpolate '%s': symbol not found!", $ident)
        unless $sym;

      if (not UNIVERSAL::isa($sym->type, 'Jako::Construct::Type::String')) {
        my $temp2 = $compiler->temp_str();
        $compiler->emit("  $temp2 = $ident");
        $ident = $temp2;
      }

      $compiler->emit("  concat $temp, $ident");

      $string = $6;
    }

    $compiler->emit("  concat $temp, \"$string\"")
      if defined $string and $string ne '';

    return $temp;
  }
  else {
#    $self->DEBUG(0, "Compiling non-string literal: '%s'...", $self->value);

    return $self->value;
  }
}


#
# sax()
#
# TODO: Convert escapes. For example, "\n" should be an actual newline.
#

sub sax
{
  my $self = shift;
  my ($handler) = @_;

  my $type = $self->type;

  if (UNIVERSAL::isa($type, 'Jako::Construct::Type::String')) {
    my $string = $self->value;

    if ($string =~ m/(^"|^".*?[^\\])\$/) { # Double-quote with an unescaped '$'.
      $string = substr($string, 1, -1); # Without the surrounding double quotes.

      $handler->start_element({ Name => 'concat' });

      while (1) {
        last unless defined $string and
          $string =~ m/(^|^.*?[^\\])\$((([A-Za-z][A-Za-z0-9_]*)\b)|({[A-Za-z][A-Za-z0-9_]*}))(.*)$/;

        if (defined $1 and $1 ne '') {
          $handler->start_element({ Name => 'literal', Attributes => { type => $type->name } });
          $handler->characters({ Data => $1 });
          $handler->end_element({ Name => 'literal' });
        }

        my $ident = $2;
        $ident =~ s/^{(.*)}$/$1/; # Strip '{' and '}'.

        $handler->start_element({ Name => 'ident', Attributes => { name => $ident } });
        $handler->end_element({ Name => 'ident' });

        $string = $6;
      }

      if (defined $string and $string ne '') {
        $handler->start_element({ Name => 'literal', Attributes => { type => $type->name } });
        $handler->characters({ Data => $string });
        $handler->end_element({ Name => 'literal' });
      }

      $handler->end_element({ Name => 'concat' });
    }
    else {
      $string = substr($string, 1, -1); # Without the surrounding quotes.

      $handler->start_element({ Name => 'literal', Attributes => { type => $type->name } });
      $handler->characters({ Data => $string });
      $handler->end_element({ Name => 'literal' });
    }
  }
  else {
    $handler->start_element({ Name => 'literal', Attributes => { type => $type->name } });
    $handler->characters({ Data => $self->value });
    $handler->end_element({ Name => 'literal' });
  }
}


1;

