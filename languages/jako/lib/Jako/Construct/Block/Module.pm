#
# Module.pm
#
# Copyright: 2003-2005 The Perl Foundation.  All Rights Reserved.
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

#  printf STDERR "%s: Created new module '%s'.\n", __PACKAGE__, $ident->value;

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
  my $self     = shift;
  my $compiler = shift; # Required
  my $options  = shift; # Optional

  my $namespace = "MODULE"; # TODO: Don't we need to do better than this?

#  printf STDERR "%s: Compiling module '%s'.\n", __PACKAGE__, $self->name;
  
  #
  # Import our symbols into our parent block:
  #

  my $name = $self->name;

#  printf STDERR "%s: About to copy symbol table to parent block.\n", __PACKAGE__;

  foreach my $symbol_name ($self->symbol_names) {
    # TODO: Warn here that we are skipping one already in the parent block?
    next if $self->block->get_symbol($symbol_name);

    my $new_name = $name . "::" . $symbol_name;

    $self->block->set_symbol($new_name, $self->get_symbol($symbol_name));
  }

#  printf STDERR "%s: Finished copying symbol table to parent block.\n", __PACKAGE__;

  return 1 unless $self->content;

#  if ($options->{PACKAGE}) {
#    $options->{PACKAGE} .= "::" . $self->name;
#  }
#  else {
#    $options->{PACKAGE} = $self->name;
#  }

  return $self->SUPER::compile($compiler, $options );

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
