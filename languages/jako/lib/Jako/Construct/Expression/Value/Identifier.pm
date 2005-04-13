#
# Identifier.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

use Carp;

package Jako::Construct::Expression::Value::Identifier;

use Carp;

use base qw(Jako::Construct::Expression::Value);

sub new
{
  my $class = shift;
  my ($block, $token) = @_;

  confess "Block is not!" unless UNIVERSAL::isa($block, 'Jako::Construct::Block');
  confess "Token is not!" unless UNIVERSAL::isa($token, 'Jako::Token');

  return bless {
    BLOCK  => $block,

    TOKEN  => $token,
    VALUE  => $token->text,
    ACCESS => $block->access_of_ident($token->text),
    TYPE   => $block->type_of_ident($token->text),

    DEBUG  => 1,
    FILE   => $token->file,
    LINE   => $token->line
  }, $class;
}


#
# sax()
#

sub sax
{
  my $self = shift;
  my ($handler) = @_;

  $handler->start_element({ Name => 'ident', Attributes => { name => $self->value } });
  $handler->end_element({ Name => 'ident' });
}


1;

