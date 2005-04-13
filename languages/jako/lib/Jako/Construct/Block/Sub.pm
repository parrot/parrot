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

package Jako::Construct::Block::Sub;

use Carp;

use base qw(Jako::Construct::Block);

sub kind { return 'sub'; }

sub new
{
  my $class = shift;

  confess "Expected 5 args!" unless @_ == 5;
  my ($block, $type, $ident, $props, $args) = @_;

  confess "Block is not!" unless UNIVERSAL::isa($block, 'Jako::Construct::Block');
  confess "Type is not!" if defined $type and not UNIVERSAL::isa($type, 'Jako::Construct::Type');
  confess "Ident is not!" unless UNIVERSAL::isa($ident, 'Jako::Construct::Expression::Value::Identifier');
  confess "Props are not hash!" if defined $props and ref($props) ne "HASH";
  confess "Args are not hash!" if defined $args and ref($args) ne "ARRAY";

  my $self = bless {
    BLOCK => $block,

    TYPE  => $type,
    NAME  => $ident->value,
    PROPS => $props,
    ARGS  => $args,

    DEBUG => 1,
    FILE  => $ident->file,
    LINE  => $ident->line
  }, $class;

  $block->push_content($self);

  foreach my $arg (@$args) {
    my ($arg_type, $arg_name, $arg_token) = @$arg;
    my $sym = Jako::Symbol->new($self, 'arg', $arg_type, $arg_name, undef, undef, undef, $arg_token->file, $arg_token->line );
    $self->set_symbol($arg_name, $sym);
  }

  return $self;
}


#
# ACCESSORS:
#

sub type      { return shift->{TYPE};      }
sub name      { return shift->{NAME};      }
sub props     { return %{shift->{PROPS}};  }
sub args      { return @{shift->{ARGS}};   }


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($compiler) = @_;

  my $type  = $self->type;
  my $name  = $self->name;
  my %props = $self->props;
  my @args  = $self->args;

  my $subname = $name;

  $subname =~ s/::/__/g;

  my $namespace = "_SUB_$subname";

  $compiler->emit(".sub _${subname}");
  $compiler->emit(".namespace $namespace");
  $compiler->emit("saveall");

  foreach my $arg (reverse @args) {
    my ($arg_type, $arg_name) = @$arg;
    my $imcc_type = $arg_type->imcc;

    $compiler->emit("  .param $imcc_type $arg_name");
  }

  $compiler->indent;
  $self->SUPER::compile($compiler);
  $compiler->outdent;

  $compiler->emit("_${name}_LEAVE:");
  $compiler->emit("  restoreall");
  $compiler->emit("  ret");
  $compiler->emit("  .endnamespace $namespace");
  $compiler->emit(".end");

  return 1;
}


#
# sax()
#

sub sax
{
  my $self = shift;
  my ($handler) = @_;

  my $type  = $self->type;
  my $name  = $self->name;
  my @args  = $self->args;

  if ($type) {
    $handler->start_element({ Name => 'sub', Attributes => { name => $name, type => $type } });
  }
  else {
    $handler->start_element({ Name => 'sub', Attributes => { name => $name } });
  }

  foreach my $arg (@args) {
    my ($arg_type, $arg_name) = @$arg;

    $handler->start_element({ Name => 'arg', Attributes => { name => $arg_name, type => $arg_type } });
    $handler->end_element({ Name => 'arg' });
  }

  foreach my $content ($self->content) {
    $content->sax($handler);
  }

  $handler->end_element({ Name => 'sub' });
}


1;

