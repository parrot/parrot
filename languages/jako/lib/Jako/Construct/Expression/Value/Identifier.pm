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
    SCOPE  => $block->scope_of_ident($token->text),
    ACCESS => $block->access_of_ident($token->text),
    TYPE   => $block->type_of_ident($token->text),
    KIND   => $block->kind_of_ident($token->text),

    DEBUG  => 1,
    FILE   => $token->file,
    LINE   => $token->line
  }, $class;
}

sub kind  { return shift->{KIND};  }
sub scope { return shift->{SCOPE}; }

#
# compile2
#

sub compile2
{
  my $class = shift;
  my ($compiler, $block, $ident_name, $kind, $scope, $type) = @_;

  confess "No \$compiler!" unless $compiler;

  my $sym = $block->find_symbol($ident_name);

  confess "No such symbol '$ident_name'!" unless defined $sym;

  if (($kind eq 'var') and ($scope eq 'global')) {
    my $imcc_code = $type->code();
    my $temp_reg = $compiler->temp_reg($imcc_code);

    my $pmc_type = $type->imcc_pmc();
    my $temp_pmc = $compiler->temp_pmc();

    $compiler->emit("  $temp_pmc = new $pmc_type");
    $compiler->emit("  $temp_pmc = global \"$ident_name\"");
    $compiler->emit("  $temp_reg = $temp_pmc");

    return $temp_reg;
  }
  else {
    return $ident_name;
  }
}


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($compiler) = @_;

  return Jako::Construct::Expression::Value::Identifier->compile2($compiler, $self->block, $self->value, $self->kind, $self->scope, $self->type);
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

