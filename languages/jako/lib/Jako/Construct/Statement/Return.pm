#
# Return.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Construct::Statement::Return;

use Carp;

use base qw(Jako::Construct::Statement);


#
# new()
#

sub new
{
  my $class = shift;
  my ($block, $value) = @_;

  confess "Block is not!" unless UNIVERSAL::isa($block, 'Jako::Construct::Block');
  confess "Value is not!" if defined $value and not UNIVERSAL::isa($value, 'Jako::Construct::Expression::Value');

  my $self = bless {
    BLOCK => $block,

    VALUE => $value,

    DEBUG => 1,
    FILE  => $value->file,
    LINE  => $value->line
  }, $class;

  $block->push_content($self);

  return $self;
}


#
# ACCESSOR:
#

sub value { return shift->{VALUE}; }


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($fh) = @_;

  my $block = $self->block;
  my $value = $self->value;

  #
  # Find the enclosing sub block:
  #

  my $sub_block = $block->find_block('sub');

  $self->SYNTAX_ERROR("Cannot use 'return' outside of subroutine.")
    unless (defined $sub_block);

  my $sub_name = $sub_block->name;

  my $return_type = $sub_block->type;

  #
  # Compile the return value, if any:
  #

  if (defined $value) {
    $self->SYNTAX_ERROR("'return' with argument in subroutine that does not return a value.")
      unless defined $return_type;

    my $arg_type = $value->type;
    my $ret_val = $value->compile($fh);

    if ($arg_type->name ne $return_type->name) { # TODO: Yuck! should be able to compare directly.
      my $temp = Jako::Compiler::temp_reg($return_type);
      print $fh "  $temp = $ret_val\n";
      $ret_val = $temp;
    }

    print $fh "  .return $ret_val\n";
  }

  #
  # Go to the subroutine exit point:
  #

  print $fh "  goto _${sub_name}_LEAVE\n";

  return;
}


1;
