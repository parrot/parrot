#
# File.pm
#
# Copyright: 2003-2005 The Perl Foundation.  All Rights Reserved.
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
  my $self     = shift; # Required:
  my $compiler = shift; # Required

#  my $namespace = "FILE"; # TODO: Don't we need to do better than this?

  return 1 unless $self->content;

  my $inline = 0;
  my $last_seen = 'sub';

  $compiler->emit(".sub ___MAIN");
  $compiler->indent;
  $compiler->emit("bsr __INLINE_0");
  $compiler->emit("end");
  $compiler->outdent;
  $compiler->emit(".end");

  foreach my $construct ($self->content) {
    if (
         $construct->isa("Jako::Construct::Block::Sub")
      or $construct->isa("Jako::Construct::Block::Module")
      or $construct->isa("Jako::Construct::Declaration::Sub")
    ) {
      if ($last_seen ne 'sub') {
        $compiler->emit("bsr __INLINE_" . $inline); # $inline is already the next one.
        $compiler->emit("ret"); # Return to the previous inline chunk.
        $compiler->outdent;
        $compiler->emit(".end");

        $last_seen = 'sub';
      }
    }
    else {
      if ($last_seen ne 'inline') {
        $compiler->emit(".sub __INLINE_" . $inline++);
        $compiler->indent;

        $last_seen = 'inline';
      }
    }

    $construct->compile($compiler);
  }

  if ($last_seen ne 'inline') {
    $compiler->emit(".sub __INLINE_" . $inline++);
    $compiler->indent;
  }

  $compiler->emit("ret");
  $compiler->outdent;
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

  $handler->start_element({ Name => 'block', Attributes => { kind => $self->kind } });
  $_->sax($handler) foreach $self->content;
  $handler->end_element({ Name => 'block' });
}


1;
