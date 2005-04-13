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
  my ($compiler) = @_;

  my $dest  = $self->dest->value;
  my $name  = $self->name->value;

#  $self->DEBUG(0, "Searching for symbol '$name'...");

  my $sym = $self->block->find_symbol($name);

  unless ($sym) {
#    $self->block->dump_symbols;
    $self->SYNTAX_ERROR("Call to unknown sub '%s'.", $name);
  }

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

    $name = $op->value if defined $op;
    $name =~ s/(^")|("$)//g; # Delete leading and trailing quotes;

    $name =~ s/^.*:://; # Delete namespaces from ops

    $compiler->emit("  $name ", join(", ", $dest, @args));
  }
  else {
#    $self->DEBUG(0, "Calling '%s' as regular sub (props = %s)...", $name, join(", ", %props));

    foreach my $arg (@args) {
      $compiler->emit("  .arg $arg");
    }

    $name =~ s/::/__/g;

    $compiler->emit("  call _${name}");
    $compiler->emit("  .result $dest");
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

  $handler->start_element({ Name => 'assign' });
  $self->dest->sax($handler);

  $handler->start_element({ Name => 'call', Attributes => { name => $self->name->value } });
  $_->sax($handler) foreach $self->args;
  $handler->end_element({ Name => 'call' });

  $handler->end_element({ Name => 'assign' });
}


1;
