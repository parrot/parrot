#
# Call.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Construct::Expression::Call;

use Carp;

use base qw(Jako::Construct::Expression);

sub new
{
  my $class = shift;
  my ($block, $dest, $ident, @args) = @_;

  confess("Dest (" . ref($block) . ") not Identifer!") unless UNIVERSAL::isa($dest, 'Jako::Construct::Expression::Value::Identifier');
  confess("Ident (" . ref($block) . ") not Identifer!") unless UNIVERSAL::isa($ident, 'Jako::Construct::Expression::Value::Identifier');
  confess("Block (" . ref($block) . ") not!") unless UNIVERSAL::isa($block, 'Jako::Construct::Block');

  my $self = bless {
    BLOCK => $block, 

    DEST  => $dest, 
    NAME  => $ident, 
    ARGS  => [ @args ],

    DEBUG => 1,
    FILE  => $ident->file,
    LINE  => $ident->line
  }, $class;

  $block->push_content($self);

  return $self;
}


sub dest { return shift->{DEST};  }
sub name { return shift->{NAME};  }
sub args { return @{shift->{ARGS}}; }


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($fh) = @_;

  my $dest  = $self->dest->value;
  my $name  = $self->name->value;

#  $self->DEBUG(0, "Searching for symbol '$name'...");

  my $sym = $self->block->find_symbol($name);

  $self->SYNTAX_ERROR("Call to unknown sub '%s'.", $name) unless $sym;

  my %props = $sym->props;

  my @args  = $self->args;

  my @formal_args = $sym->args;

  $self->SYNTAX_ERROR("Wrong number of arguments (expected %d, got %d) in call to '%s'.",
    scalar(@formal_args), scalar(@args), $name)
    unless @formal_args == @args;

  for (my $i = 0; $i < @args; $i++) {
    my ($formal_arg_type, $formal_arg_name) = @{$formal_args[$i]};
    my $actual_arg_type;

    if (UNIVERSAL::isa($args[$i], 'Jako::Construct::Expression::Value::Identifier')) {
      my $arg_sym = $self->block->find_symbol($args[$i]->value);
      $self->SYNTAX_ERROR("Undefined identifier '%s'.", $args[$i]->value) unless $arg_sym;
      $actual_arg_type = $arg_sym->type; 
    }
    else {
      $actual_arg_type = $args[$i]->type;
    }

    $self->INTERNAL_ERROR("Can't determine type of formal argument (%s)!", $formal_arg_name) 
      unless defined $formal_arg_type;

    $self->INTERNAL_ERROR("Can't determine type of actual argument (%s)!", ref $args[$i])
      unless defined $actual_arg_type;

    if ($formal_arg_type->name ne $actual_arg_type->name) {
      my $temp = Jako::Compiler::temp_reg($formal_arg_type);
      my $value = $args[$i]->compile($fh);
      print $fh "  $temp = $value\n";
      $args[$i] = $temp;
    }
    else {
      $args[$i] = $args[$i]->compile($fh);
    }
  }

  if (exists $props{fnlib}) {
    foreach my $arg (@args) {
      print $fh "  .arg $arg\n";
    }
    print $fh "  call _${name}_THUNK\n";
  }
  elsif (exists $props{op}) {
    my $op = $props{op};

#    $self->DEBUG(0, "Calling %s%s...", $name, ($op ? ' (op $op)' : ' as op'));

    $name = $op if defined $op;

    print $fh "  $name ", join(", ", $dest, @args), "\n";
  }
  else {
#    $self->DEBUG(0, "Calling '%s' as regular sub (props = %s)...", $name, join(", ", %props));

    foreach my $arg (@args) {
      print $fh "  .arg $arg\n";
    }

    print $fh "  call _${name}\n";
    print $fh "  .result $dest\n";
  }

  return 1;
}

1;
