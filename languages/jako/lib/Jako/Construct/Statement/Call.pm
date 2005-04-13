#
# Call.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Statement::Call;

use Carp;

use base qw(Jako::Construct::Statement);

sub new
{
  my $class = shift;
  my ($block, $ident, @args) = @_;

  confess("Block (" . ref($block) . ") is not!") unless UNIVERSAL::isa($block, 'Jako::Construct::Block');
  confess("Ident (" . ref($ident) . ") is not!") unless UNIVERSAL::isa($ident, 'Jako::Construct::Expression::Value::Identifier');

  my $name = $ident->value;

  my $self = bless {
    BLOCK => $block,

    NAME  => $name,
    ARGS  => [ @args ],

    DEBUG => 1,
    LINE  => $ident->line,
    FILE  => $ident->file
  }, $class;

  $block->push_content($self);

  return $self;
}

sub name { return shift->{NAME};  }
sub args { return @{shift->{ARGS}}; }


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($compiler) = @_;

  my $name  = $self->name;

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
      my $temp = $compiler->temp_reg($formal_arg_type);
      my $value = $args[$i]->compile($compiler);
      $compiler->emit("  $temp = $value");
      $args[$i] = $temp;
    }
    else {
      $args[$i] = $args[$i]->compile($compiler);
    }
  }

  if (exists $props{fn} or exists $props{fnlib}) {
    foreach my $arg (@args) {
      $compiler->emit("  .arg $arg");
    }

    $name =~ s/::/__/g;

    $compiler->emit("  call _${name}_THUNK");
  }
  elsif (exists $props{op}) {
    my $op = $props{op};

#    $self->DEBUG(0, "Calling %s%s...", $name, ($op ? ' (op $op)' : ' as op'));

    if (defined $op) {
      $name = $op->value;
      $name =~ s/(^"|"$)//g;
    }

    $name =~ s/^.*:://; # Strip namespaces off ops.

    $compiler->emit("  $name ", join(", ", @args));
  }
  else {
#    $self->DEBUG(0, "Calling '%s' as regular sub (props = %s)...", $name, join(", ", %props));

    foreach my $arg (@args) {
      $compiler->emit("  .arg $arg");
    }

    $name =~ s/::/__/;

    $compiler->emit("  call _${name}");
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

  $handler->start_element({ Name => 'call', Attributes => { name => $self->name } });
  $_->sax($handler) foreach $self->args;
  $handler->end_element({ Name => 'call' });
}


1;
