#
# Sub.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
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

  my $name = $self->name;

  my $sym = $block->find_symbol($name);

  #
  # If the identifier is already defined at ANY lexical scope, we want to complain
  # about the redefinition. Otherwise, we assume the programmer wanted to shadow the
  # previous definition.
  #

  if (defined $sym) {
    $self->SYNTAX_ERROR("Redeclaration of identifier '%s'. Previous declaration on line %d of file '%s'.",
      $name, $sym->line, $sym->file);
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
    $name,
    undef,            # No value
    $props,           # Parsed Properties
    $args,            # Parsed Properties
    $self->file,
    $self->line
  );

#  $self->DEBUG(0, "Remembering symbol '$name' as sub...");

  $block->set_symbol($name, $sym);

  $block->push_content($self);

  return $self;
}

# block handled by superclass?

sub kind  { return shift->{KIND};     }
sub type  { return shift->{TYPE};     }

sub name
{
  my $self = shift;
  my $name = $self->{NAME};

  return $name;
}

sub props { return %{shift->{PROPS}}; }
sub args  { return @{shift->{ARGS}};  }

sub file  { return shift->{FILE};     }
sub line  { return shift->{LINE};     }


#
# compile()
#

sub compile
{
  my $self     = shift; # Required
  my $compiler = shift; # Required
  my $options  = shift; # Optional

  my $name  = $self->name;

  if ($self->block->kind eq 'module') {
    $name = $self->block->name . "::" . $name;
  }

  my %reg = ('int' => 5, 'num' => 5, 'obj' => 5, 'str' => 5);

  my $sym = $self->block->find_symbol($name);

  my %props = $sym->props;

  if (exists $props{fn} or exists $props{fnlib}) {
    my $fnlib;

    if (exists $props{fnlib} and $props{fnlib}) {
      $fnlib = $props{fnlib}->value; # TODO: We should make sure its a string, somewhere.
    }
    else {
      $self->SYNTAX_ERROR("Sub declaration has no fnlib property, and parent block is not a module!")
        unless $self->block->kind eq 'module';

      my %module_props = $self->block->props;

      $self->SYNTAX_ERROR("Sub declaration has no fnlib property, and parent module has no fnlib property either!")
        unless $module_props{fnlib};

      $fnlib = $module_props{fnlib}->value;
    }

    my $fn = $props{fn} ? $props{fn}->value : "\"$name\"";

    my $thunk = "_${name}_THUNK";
    $thunk =~ s/::/__/g;

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

    my $fn_name = $fn;

    $fn_name =~ s/^.*::/"/;

    $compiler->emit("  .local pmc lib");
    $compiler->emit("  loadlib lib, $fnlib");
    $compiler->emit("  dlfunc P0, lib, $fn_name, \"$sig\"");
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


#
# sax()
#

sub sax
{
  my $self = shift;
  my ($handler) = @_;

  my $name  = $self->name;
  my $type  = $self->type;

  my %reg = ('int' => 5, 'num' => 5, 'obj' => 5, 'str' => 5);

  my $sym = $self->block->find_symbol($name);

  my %props = $sym->props;

  if (exists $props{op}) {
    my $oplib = $props{oplib} ? $props{oplib}->value : 'CORE'; # TODO: We should make sure its a string, somewhere.
    my $op    = $props{op}    ? $props{op}->value    : $name;

    if ($type) {
      $handler->start_element({
        Name       => 'sub',
        Attributes => {
          name  => $name,
          type  => $type,
          kind  => 'op',
          oplib => $oplib,
          op    => $op
        }
      });
    }
    else {
      $handler->start_element({
        Name       => 'sub',
        Attributes => {
          name  => $name,
          kind  => 'op',
          oplib => $oplib,
          op    => $op
        }
      });
    }
  }
  elsif (exists $props{fn} or exists $props{fnlib}) {
    my $fnlib;

    if (exists $props{fnlib} and $props{fnlib}) {
      $fnlib = $props{fnlib}->value; # TODO: We should make sure its a string, somewhere.
    }
    else {
      $self->SYNTAX_ERROR("Sub declaration has no fnlib property, and parent block is not a module!")
        unless $self->block->kind eq 'module';

      my %module_props = $self->block->props;

      $self->SYNTAX_ERROR("Sub declaration has no fnlib property, and parent module has no fnlib property either!")
        unless $module_props{fnlib};

      $fnlib = $module_props{fnlib}->value;
    }

    my $fn = $props{fn} ? $props{fn}->value : $name;

    $fn =~ s{(^")|("$)}{}g;
    $fnlib =~ s{(^")|("$)}{}g;
    $name =~ s/^.*:://;

    if ($type) {
      $handler->start_element({
        Name       => 'sub',
        Attributes => {
          name  => $name,
          type  => $type,
          kind  => 'fn',
          fnlib => $fnlib,
          fn    => $fn
        }
      });
    }
    else {
      $handler->start_element({
        Name       => 'sub',
        Attributes => {
          name  => $name,
          kind  => 'fn',
          fnlib => $fnlib,
          fn    => $fn
        }
      });
    }
  }
  else {
    return;
  }

  foreach my $arg ($self->args) {
    my ($arg_type_name, $arg_name) = @$arg;

    $handler->start_element({
      Name       => 'arg',
      Attributes => {
        type => $arg_type_name,
        name => $arg_name
      }
    });
    $handler->end_element({ Name => 'arg' });
  }

  $handler->end_element({ Name => 'sub' });
}


1;

