#
# Module.pm
#
# Copyright (C) 2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Block::Module;

use Carp;

use Jako::Compiler;

use base qw(Jako::Construct::Block);

sub kind { return 'module'; }

sub new
{
  my $class = shift;

  confess "Expected 3 args!" unless @_ == 3;
  my ($block, $ident, $props) = @_;

  confess "Block is not!" unless UNIVERSAL::isa($block, 'Jako::Construct::Block');
  confess "Ident is not!" unless UNIVERSAL::isa($ident, 'Jako::Construct::Expression::Value::Identifier');
  confess "Props are not hash!" if defined $props and ref($props) ne "HASH";

  my $self = bless {
    BLOCK => $block,

    TYPE  => undef,
    NAME  => $ident->value,
    PROPS => $props,
    ARGS  => undef,

    DEBUG => 1,
    FILE  => $ident->file,
    LINE  => $ident->line
  }, $class;

  $block->push_content($self);

  return $self;
}


#
# ACCESSORS:
#

sub type      { return shift->{TYPE};      }
sub name      { return shift->{NAME};      }
sub props     { return %{shift->{PROPS}};  }


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($compiler) = @_;

  my $namespace = "MODULE"; # TODO: Don't we need to do better than this?

  #
  # Import our symbols into our parent block:
  #

  foreach my $symbol ($self->symbols) {
    next if $self->block->symbol($symbol);

    $self->block->symbol($symbol, $self->symbol($symbol));
  }

  if ($self->content) {
    $compiler->emit(".namespace ${namespace}");
    $compiler->indent;
    $self->SUPER::compile($compiler);
    $compiler->outdent;
    $compiler->emit(".endnamespace ${namespace}");
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

  $handler->start_element({ Name => 'module', Attributes => { name => $self->name } });
  $_->sax($handler) foreach $self->content;
  $handler->end_element({ Name => 'module' });
}


1;
