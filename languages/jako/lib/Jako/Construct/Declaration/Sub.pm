#
# Sub.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Declaration::Sub;

use Carp;

use base qw(Jako::Construct::Declaration);

use Jako::Symbol;
use Jako::Construct::Type;


#
# new()
#

sub new
{
  my $class = shift;

  my ($block, $type, $ident, $props, $args) = @_;

  confess "Block (". ref($block) . ") is not!" unless UNIVERSAL::isa($block, qw(Jako::Construct::Block));
  confess "Type (". ref($type) . ") is not!" if defined $type and not UNIVERSAL::isa($type, qw(Jako::Construct::Type));
  confess "Identifier (". ref($ident) . ") is not!"  unless UNIVERSAL::isa($ident, qw(Jako::Construct::Expression::Value::Identifier));

  my $self = bless {
    BLOCK  => $block,

    KIND   => 'sub',
    TYPE   => $type,
    NAME   => $ident->value,
    PROPS  => $props,
    ARGS   => $args,

    DEBUG  => 1,
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

  #
  # Lookup the identifier:
  #

  my $sym = $block->find_symbol($self->name);

  #
  # If the identifier is already defined at ANY lexical scope, we want to complain
  # about the redefinition. Otherwise, we assume the programmer wanted to shadow the
  # previous definition.
  #

  if (defined $sym) {
    SYNTAX_ERROR("Redeclaration of identifier '%s'. Previous declaration on line %d of file '%s'.",
      $self->name, $sym->line, $sym->file);
  }

  #
  # Now that we've decided to actually declare the sub, we will place its
  # definition into the block at the top of the block stack (which is supposed
  # to always be the file block at the time subs are declared). We fill in the
  # IDENT entry within the block.
  #

  $sym = Jako::Symbol->new(
    $self->block,
    $self->kind,
    $self->type,
    $self->name,
    undef,            # No value
    $props,           # Parsed Properties
    $args,            # Parsed Properties
    $self->file,
    $self->line
  );

  my $name = $self->name;

#  $self->DEBUG(0, "Remembering symbol '$name' as sub...");

  $block->symbol($name, $sym);

  $block->push_content($self);

  return $self;
}

# block handled by superclass?

sub kind  { return shift->{KIND};     }
sub type  { return shift->{TYPE};     }
sub name  { return shift->{NAME};     }
sub props { return %{shift->{PROPS}}; }
sub args  { return @{shift->{ARGS}};  }

sub file  { return shift->{FILE};     }
sub line  { return shift->{LINE};     }


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($compiler) = @_;

  my $name  = $self->name;

  my %reg = ('int' => 5, 'num' => 5, 'obj' => 5, 'str' => 5);

  my $sym = $self->block->find_symbol($name);

  my %props = $sym->props;

  if (exists $props{fnlib}) {
    my $fnlib = $props{fnlib}->value; # TODO: We should make sure its a string, somewhere.
    my $fn    = $props{fn} ? $props{fn}->value : "\"$name\"";

    my $thunk = "_${name}_THUNK";

    $compiler->emit(".sub $thunk");
    $compiler->emit(".namespace $thunk");
    $compiler->emit("  saveall");

    my $sig = defined $self->type ? $self->type->code : 'v';
    my @params;
    foreach my $arg ($self->args) {
      my ($arg_type, $arg_name) = @$arg;
      push @params, $arg_type->code . $reg{$arg_type->name}++;
      $sig .= $arg_type->code;
    }

    $sig =~ tr[INPS][ifpt]; # Defaults.

    foreach my $param (reverse @params) {
      $compiler->emit("  restore $param");
    }

    my $return = defined $self->type ? -2 : 0; # -2 = one, 0 = none

    $compiler->emit("  #undef P1 # NO SUCH OP");     # No continuation
    $compiler->emit("  #undef P2 # NO SUCH OP");     # No object
    $compiler->emit("  I0 = 0");       # Not being called with prototyped parameters.
    $compiler->emit("  I1 = 0");       # Number of items on the stack.
    $compiler->emit("  I2 = 0");       # Number of parameters in PMC registers.
    $compiler->emit("  I3 = $return"); # What we expect in return

    $compiler->emit("  .local obj lib");
    $compiler->emit("  loadlib lib, $fnlib");
    $compiler->emit("  dlfunc P0, lib, $fn, \"$sig\"");
    $compiler->emit("  invoke");

    if ($self->type) {
      $compiler->emit("  save " . $self->type->code . '5');
    }

    $compiler->emit("  restoreall");
    $compiler->emit("  ret");
    $compiler->emit(".endnamespace $thunk");
    $compiler->emit(".end");
  }

  return 1;
}

1;

