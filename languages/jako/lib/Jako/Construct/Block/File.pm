#
# File.pm
#
# Copyright (C) 2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Block::File;

use Carp;

use Jako::Compiler;

use base qw(Jako::Construct::Block);


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($compiler) = @_;

  my $namespace = "BARE"; # TODO: Don't we need to do better than this?

  if ($self->content) {
    $compiler->emit(".sub ___MAIN");
    $compiler->indent;
    $compiler->emit("bsr __MAIN");
    $compiler->emit("end");
    $compiler->outdent;
    $compiler->emit(".end");

    $self->SUPER::compile($compiler, sub { my $obj = shift; $obj->isa("Jako::Construct::Block::Sub") or $obj->isa("Jako::Construct::Declaration::Sub"); } );

    $compiler->emit(".sub __MAIN");
    $self->SUPER::compile($compiler, sub { my $obj = shift; not ($obj->isa("Jako::Construct::Block::Sub") or $obj->isa("Jako::Construct::Declaration::Sub")); } );
    $compiler->emit("ret");
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

  $handler->start_element({ Name => 'block', Attributes => { kind => $self->kind } });
  $_->sax($handler) foreach $self->content;
  $handler->end_element({ Name => 'block' });
}


1;
