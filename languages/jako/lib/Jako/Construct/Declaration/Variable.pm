#
# Variable.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Declaration::Variable;

use Carp;

use base qw(Jako::Construct::Declaration);

use Jako::Construct::Type;


#
# new()
#

sub new
{
  my $class = shift;

  my ($block, $type, $ident) = @_;

  confess "Block (". ref($block) . ") is not!" unless UNIVERSAL::isa($block, qw(Jako::Construct::Block));
  confess "Type (". ref($type) . ") is not!" unless UNIVERSAL::isa($type, qw(Jako::Construct::Type));
  confess "Identifier (". ref($ident) . ") is not!"  unless UNIVERSAL::isa($ident, qw(Jako::Construct::Expression::Value::Identifier));

  my $self = bless {
    BLOCK  => $block,

    KIND   => 'const',
    TYPE   => $type,
    NAME   => $ident->value,
    FILE   => $ident->file,
    LINE   => $ident->line,
  }, $class;

  #
  # Check for a few bad conditions.
  #
  # NOTE: These are compiler internal consistency checks. They really should not be
  # triggered in normal operation, even with bad source code as input.
  #

  $self->INTERNAL_ERROR("Undefined block!")
    unless defined $block;

  $self->INTERNAL_ERROR("Undefined type!")
    unless defined $type;

  $self->INTERNAL_ERROR("Type is not a Jako::Construct::Type instance!")
    unless UNIVERSAL::isa($type, "Jako::Construct::Type");

  my $type_name = $type->name;

  $self->INTERNAL_ERROR("Variable definition involves undefined type name!")
    unless defined $type_name;

  #
  # Lookup the identifier:
  #

  my $sym = $block->find_symbol($self->name);

  #
  # If the identifier is already defined at this lexical scope, we want to complain
  # about the redefinition. Otherwise, we assume the programmer wanted to shadow the
  # previous definition.
  #

  if (defined $sym and $sym->block eq $block) {
    $self->SYNTAX_ERROR("Redeclaration of identifier '%s' in the same block. Previous declaration on line %d of file '%s'.",
      $self->name, $sym->line, $sym->file);
  }

  #
  # Now that we've decided to actually declare the constant, we will place its
  # definition into the block at the top of the block stack. We fill in the
  # IDENT entry within the block.
  #

  $sym = Jako::Symbol->new(
    $self->block,
    $self->kind,
    $self->type,
    $self->name,
    undef,            # No value
    undef,            # No properties
    undef,            # No args
    $self->file,
    $self->line
  );

  $block->set_symbol($self->name, $sym);

  $block->push_content($self);

  return $self;
}

# block handled by superclass?

sub kind { return shift->{KIND}; }
sub type { return shift->{TYPE}; }
sub name { return shift->{NAME}; }

sub file { return shift->{FILE}; }
sub line { return shift->{LINE}; }


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($compiler) = @_;

  confess "No compiler!" unless $compiler;

  my $type  = $self->type->imcc;
  my $name  = $self->name;

  $compiler->emit("  .local $type $name");

  return 1;
}


#
# sax()
#

sub sax
{
  my $self = shift;
  my ($handler) = @_;

  $handler->start_element({ Name => 'var', Attributes => { type => $self->type->name, name => $self->name } });
  $handler->end_element({ Name => 'var' });
}


1;

