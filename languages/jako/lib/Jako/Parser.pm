#
# Parser.pm
#
# Copyright (C) 2001-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as Perl itself.
#
# $Id$
#

use strict;
use warnings;

package Jako::Parser;

use Carp;

use base qw(Jako::Processor);

use Jako::Symbol;

use Jako::Construct::Block;
use Jako::Construct::Block::Conditional::If;
use Jako::Construct::Block::Conditional::Unless;
use Jako::Construct::Block::Sub;
use Jako::Construct::Block::Loop::Until;
use Jako::Construct::Block::Loop::While;

use Jako::Construct::Declaration::Constant;
use Jako::Construct::Declaration::Sub;
use Jako::Construct::Declaration::Variable;

use Jako::Construct::Expression::Call;
use Jako::Construct::Expression::Value;
use Jako::Construct::Expression::Value::Identifier;

use Jako::Construct::Label;

use Jako::Construct::Statement::Arithmetic;
use Jako::Construct::Statement::Assign;
use Jako::Construct::Statement::Call;
use Jako::Construct::Statement::Decrement;
use Jako::Construct::Statement::Goto;
use Jako::Construct::Statement::Increment;
use Jako::Construct::Statement::LoopControl;
use Jako::Construct::Statement::Return;

my %block_types = (
  'while'    => { PREFIX => "_W", NEXT => 'CONT', REDO => 'REDO', LAST => 'LAST' },
  'if'       => { PREFIX => "_I", NEXT => 'TEST', REDO => 'THEN', LAST => 'ELSE' },
  'sub'      => { PREFIX => "_S", NEXT => 'TEST', REDO => 'THEN', LAST => 'ELSE' }, # TODO: fix these
);


#
# new()
#

sub new
{
  my $class = shift;

  my $root = Jako::Construct::Block->new(
    undef,  # No parent
    'file', # File scope
    undef,  # No return type
    undef   # No prefix
  );

  return bless {
    DEBUG            => 1,
    ANON_BLOCK_COUNT => 0,
    BLOCK_COUNT      => 0,
    BLOCKS           => [ $root ], # Block stack
    ROOT             => $root,
    TOKENS           => [ ]
  }, $class;
}


###############################################################################
###############################################################################
##
## The Block Stack
##
##   $block_count         The total number of blocks begun (used for labels)
##   @block_stack         The stack of active blocks. We keep a block on the
##                          stack for the file scope.
##
## NOTE: Do NOT access the block stack directly. Access it via routines in
## this section of code.
##
###############################################################################
###############################################################################


#
# blocks()
#

sub blocks
{
  my $self = shift;

  return @{$self->{BLOCKS}};
}


#
# block()
#

sub block
{
  my $self = shift;

  return $self->{BLOCKS}[shift];
}


#
# block_depth()
#
# Block depth zero is when the only block on the block stack is the file
# scope block. Therefore, we return one less than the number of blocks on
# the stack.
#

sub block_depth
{
  my $self = shift;

  return scalar($self->blocks) - 1;
}


#
# current_block()
#
# Returns the block on the top of the block stack.
#

sub current_block
{
  my $self = shift;

  $self->INTERNAL_ERROR("Attempt to reference top block with empty block stack!")
    if scalar($self->blocks) == 0;

  return  $self->block(-1);
}


#
# push_block()
#
# Push a block on the top of the block stack.
#

sub push_block
{
  my $self = shift;

  push @{$self->{BLOCKS}}, shift;
}


#
# pop_block()
#
# Pop the top block off the block stack and return it. Bounds checks the block
# stack to make sure we don't pop off the file scope block.
#

sub pop_block
{
  my $self = shift;

  $self->INTERNAL_ERROR("Attempt to pop file-scope block off block stack!")
    if scalar($self->blocks) == 1;

  return pop @{$self->{BLOCKS}};
}


#
# find_ident()
#
# Scans through the block stack, from the top down, looking for the identifier.
# If it is found, returns a hashref containing the number of levels away the
# identifier is declared and the definition of the identifier.
#

sub find_ident
{
  my $self = shift;

  my ($name) = @_;

  my $count = 0;

  foreach my $block (reverse $self->blocks) {
    my $ident = $block->identifier($name);
    return { LEVELS => $count, IDENT => $ident } if $ident;
    $count++;
  }

  return undef;
}


#
# find_block()
#
# Scans through the block stack, from the top down, looking for a block of
# the appropriate kind (and, if label is given, with a matching label. If
# it is found, returns a hashref containing the number of levels away the
# block was found and the block info hashref. If it is not found, then
# undef is returned.
#

sub find_block
{
  my $self = shift;

  confess "This should not be called any more!";

  my ($kind, $label) = @_;

  my $count = 0;

  foreach my $block (reverse $self->blocks) {
    next unless $block->kind eq $kind;
    next unless !defined($label) or $block->prefix eq $label;
 
    return { LEVELS => $count, BLOCK => $block };
  }

  return undef;
}


###############################################################################
###############################################################################
##
## Miscellany
##
###############################################################################
###############################################################################

=no

my %subs;

my %void_functions = (

);


my %assign_funcs = (
  pow    => [ 'N',    2, '[IN][IN]' ],
  substr => [ 'S',    3, 'SII'      ],
);

=cut


=no

###############################################################################
###############################################################################
##
## Typing Predicates
##
## These are used throughout the code to check the type of an argument.
##
###############################################################################
###############################################################################


#
# int_lit_q()
#

sub int_lit_q
{
  my ($value) = @_;

  return 'dec' if $value =~ m/^-?\d+$/;
  return 'hex' if $value =~ m/^0x[0-9a-f]+$/i;
  return 'oct' if $value =~ m/^0[0-7]+$/;
  return 'bin' if $value =~ m/^0b[01]+$/;

  return undef;
}


#
# num_lit_q()
#

sub num_lit_q
{
  my ($value) = @_;
  return $value =~ m/^-?\d+\.\d+$/;
}


#
# int_or_num_lit_q()
#

sub int_or_num_lit_q
{
  my ($value) = @_;
  return int_lit_q($value) || num_lit_q($value);
}


#
# str_lit_q()
#

sub str_lit_q
{
  my ($value) = @_;
  return $value =~ m/^"/;
}


#
# lit_q()
#

sub lit_q
{
  my ($value) = @_;
  return str_lit_q($value) || int_lit_q($value) || num_lit_q($value);
}


#
# int_reg_q()
#

sub int_reg_q
{
  my ($value) = @_;
  return $value =~ m/^(\$\$)?I\d+$/;
}


#
# num_reg_q()
#

sub num_reg_q
{
  my ($value) = @_;
  return $value =~ m/^(\$\$)?N\d+$/;
}


#
# obj_reg_q()
#

sub obj_reg_q
{
  my ($value) = @_;
  return $value =~ m/^(\$\$)?P\d+$/;
}


#
# str_reg_q()
#

sub str_reg_q
{
  my ($value) = @_;
  return $value =~ m/^(\$\$)?S\d+$/;
}


#
# reg_q()
#

sub reg_q
{
  my ($value) = @_;
  return $value =~ m/^(\$\$)?[INPS]\d+$/;
}


#
# var_q()
#

sub var_q
{
  my ($value) = @_;
  return $value =~ m/^\$[^\$]/;
}



#
# class_of()
#

sub class_of
{
  my $value = shift;

  return 'reg' if reg_q($value);
  return 'var' if var_q($value);
  return 'lit' if lit_q($value);

  $self->INTERNAL_ERROR("Cannot determine class of '$value'!");
}


#
# type_of()
#

sub type_of
{
  my $value = shift;

  return substr($value, 2, 1) if reg_q($value);

  if ($value =~ m/^\$\$([INPS])\d+$/) { # IMCC "VIRTUAL" REGISTERS ($$I99 to jakoc, $I99 to imcc)
    return $1;
  }

  return 'S' if str_lit_q($value);
  return 'N' if num_lit_q($value);
  return 'I' if int_lit_q($value);

  if ($value =~ m/^[a-zA-Z_][a-zA-Z0-9_]*$/) {
    my $block = $self->current_block();
    my $ident = $block->find_identifier($value);
    $self->INTERNAL_ERROR("Cannot find identifier '$value' to determine type!") unless defined $ident;
    return $ident->type;
  }

  $self->INTERNAL_ERROR("Cannot determine type of '$value'!");
}

sub int_q { return type_of(shift) eq 'I'; }
sub num_q { return type_of(shift) eq 'N'; }
sub str_q { return type_of(shift) eq 'S'; }

sub int_or_num_q { my $type = type_of(shift); return $type eq 'I' or $type eq 'N'; }

=cut

###############################################################################
###############################################################################
##
## Operation Support
##
###############################################################################
###############################################################################


#
# op_comp()
#
# There are three kinds of entries in the %comp_ops hash:
#
#   * Perl expressions to optimize all-constant ops to branches.
#
#   * Entries to map source tokens to the op name. This is used
#     in parsing conditionals.
#
#   * Entries to determine the opposite comparison operator if
#     we need to reverse the sense of the operator as it appears
#     in the source.
#
# TODO: Handle numeric comparisons, too!
#

my %comp_ops = (
  'eq' => sub { $_[0] == $_[1] },
  'ne' => sub { $_[0] != $_[1] },
  'le' => sub { $_[0] <= $_[1] },
  'lt' => sub { $_[0] <  $_[1] },
  'ge' => sub { $_[0] >= $_[1] },
  'gt' => sub { $_[0] >  $_[1] },

  '==' => 'eq',
  '!=' => 'ne',
  '<=' => 'le',
  '<'  => 'lt',
  '>=' => 'ge',
  '>'  => 'gt',

  '!eq' => 'ne',
  '!ne' => 'eq',
  '!le' => 'gt',
  '!lt' => 'ge',
  '!ge' => 'lt',
  '!gt' => 'le',
);

sub op_comp
{
  my $self = shift;
  my ($type, $op, $a, $b, $true, $false) = @_;

  $op = $comp_ops{$op} unless ref $comp_ops{$op}; # Map, e.g., '>=' to 'ge'

  #
  # OPTIMIZE const-const comparisons to unconditional branches:
  #

  if (int_or_num_lit_q($a) and int_or_num_lit_q($b)) {
    if (&{$comp_ops{$op}}($a, $b)) {
      $self->emit_code('branch', [$true]);
    } else {
      $self->emit_code('branch', [$false]);
    }

    return;
  }

  #
  # CONVERT const-reg comparisons to reg-const comparisons:
  #
  # We do this by reversing the operand order and inverting the comparison.
  #

  if (int_or_num_lit_q($a) and reg_q($b)) {
    ($a, $op, $b) = ($b, $comp_ops{"!$op"}, $a);
  }

  #
  # CONVERT num-int and int-num comparisons to num-num comparisons:
  #

  my $a_type = type_of($a);
  my $b_type = type_of($b);

  if (int_or_num_lit_q($b)) {
    #
    # reg-const comparisons:
    #
    # NOTE: We count on the assembler to promote the integer constant
    # in the case of num-reg-to-int-const comparisons.
    #

    if ($a_type eq 'I' and num_q($b)) {
      my $temp = temp_num();
      $self->emit_code('set', [$temp, $a]);
      $a = $temp;
    }
  } else {
    #
    # reg-reg comparisons:
    #

    if ($a_type ne $b_type) {
      if ($a_type eq 'I') {
        my $temp = temp_num();
        $self->emit_code('set', [$temp, $a]);
        $a = $temp;
      } elsif ($b_type eq 'I') {
        my $temp = temp_num();
        $self->emit_code('set', [$temp, $b]);
        $b = $temp;
      } else {
        $self->INTERNAL_ERROR("Expected to have to use iton op.");
      }
    }
  }

  #
  # EMIT code:
  #

  if (defined $true) {
    $self->emit_code($op, [$a, $b, $true]);
    if (defined $false) {
      $self->emit_code('branch', [$false]);
    }
  } else {
    if (defined $false) {
      op_comp($type, $comp_ops{"!$op"}, $a, $b, $false, $true);
    } else {
      $self->INTERNAL_ERROR("op_comp called without any destinations!");
    }
  }
}



###############################################################################
###############################################################################
##
## Identifier Declarations
##
###############################################################################
###############################################################################


#
# declare_var()
#
# Assign a register to the identifier within the scope of the current block.
#
# Access is one of 'const', 'var' or 'arg'.
#

sub declare_var
{
  my $self = shift;

  my ($name, $type, $access) = @_;

  #
  # Check for a few bad conditions.
  #
  # NOTE: These are compiler internal consistency checks. They really should not be
  # triggered in normal operation, even with bad source code as input.
  #

  $self->INTERNAL_ERROR("Variable declaration involves undefined access!")
    unless defined $access;

  $self->INTERNAL_ERROR("Variable declaration involves undefined type code!")
    unless defined $type;

  $self->INTERNAL_ERROR("Type is not!")
    unless UNIVERSAL::isa($type, 'Jako::Construct::Type');

  my $type_name = $type->name;

  $self->INTERNAL_ERROR("Variable declaration involves undefined type name!")
    unless defined $type_name;

  $self->INTERNAL_ERROR("Variable declaration involves undefined variable name!")
    unless defined $name;

  #
  # Lookup the identifier:
  #

  my $block = $self->current_block();

  my $ident = $block->find_identifier($name);

  #
  # If the identifier is already defined at this lexical scope, we want to complain
  # about the redefinition. Otherwise, we assume the programmer wanted to shadow the
  # previous definition.
  #

  if (defined $ident and $ident->block eq $block) {
    $self->SYNTAX_ERROR("Redeclaration of identifier '%s'. Previous declaration on line %d.",
      $name, $ident->line);
  }

  #
  # Now that we've decided to actually declare the variable, we will place its
  # definition into the block at the top of the block stack. First, we assign
  # it a register number, then we fill in the IDENT entry within the block,
  # and then we link the register to the identifier and the block.
  #

  $ident = Jako::Construct::Identifier->new(
    $block,
    $access,
    $type,
    $name,
    $self->file,
    $self->line,
    "\$$name"     # IMCC Name
  );

  $block->identifier($name, $ident);

  #
  # Push the source comment about the variable declaration.
  #

  my $imcc_type = $type->imcc;

  if ($access eq 'arg') {
=no
    $self->push_comment("(argument " . $name . ")");
    $self->emit_code('.param', [ "$imcc_type $name" ]);
=cut
  }
  elsif ($access eq 'const') {
=no
    $self->push_source("const $type_name $name = ...");
    $self->emit_code(".local", [ "$imcc_type $name" ]); # TODO: A better IMCC way?
=cut
  }
  elsif ($access eq 'var') {
=no
    $self->push_source("var $type_name $name;");
    $self->emit_code(".local", [ "$imcc_type $name" ]);
=cut
  }
  else {
    $self->INTERNAL_ERROR("Unrecognized access '$access' for identifier '$name'");
  }

  return 1;
}


###############################################################################
###############################################################################
##
## Variable Assignments
##
###############################################################################
###############################################################################


#
# assign_var()
#

sub assign_var
{
  my $self = shift;

  my ($name, $type, $value) = @_;

  #
  # Lookup the identifier:
  #
  # NOTE: This lookup doesn't give the info itself, but rather a hashref with
  # the LEVELS away the definition was found, and IDENT with the actual info
  # about the identifier.
  #

  my $block = $self->current_block();

  my $ident = $block->find_identifier($name);

  #
  # Reject cases where LHS isn't declared:
  #

  $self->SYNTAX_ERROR("Assignment to undeclared variable '%s'.", $ident)
    unless defined $ident;

  #
  # Now that we've confirmed we could find the identifier, we make sure it is
  # bound to a variable, not a constant.
  #

  $self->SYNTAX_ERROR("Cannot assign to constant '%s'.", $name)
    unless $ident->is_variable;

  #
  # Remember the source code:
  #

=no
  $self->push_source("$name = $value;");
=cut

  #
  # Handle var-const (for manifest constants) assignments:
  #
  # int_var = 1;
  # num_var = 2.0;
  # str_var = "foo";
  #

  if ($ident->type eq $type or (($ident->type eq 'N' or $ident->type eq 'I') and ($type eq 'N' or $type = 'I'))) {
    $self->emit_code("$name =", [ $value ]);
    return;
  }

  #
  # Catch incompatible assigns:
  #

  $self->SYNTAX_ERROR("Assignment of '%s' variable from '%s' value not allowed.", $ident->type, $type)
    if $type ne '*';

  #
  # If what remains is not an identifier we've seen, we've got trouble:
  #

  my $value_ident = $block->find_identifier($value);

  $self->SYNTAX_ERROR("Assignment from undeclared identifier '%s'.", $value)
    unless defined $value_ident;

  $self->INTERNAL_ERROR("Undefined name for identifier (%s)!", join(", ", %$value_ident))
    unless defined $value_ident->name;

  #
  # Emit code if the types are the same:
  #

  if ($ident->type eq $value_ident->type) {
    $self->emit_code("$name =", [ $value_ident->name ]);
    return;
  }

  #
  # Handle conversion cases:
  #

  if ($ident->type eq "N" and $value_ident->type eq "I") {
    $self->emit_code("$name =", [ $value_ident->name ]);
  } elsif ($ident->type eq "I" and $value_ident->type eq "N") {
    $self->emit_code("$name =", [ $value_ident->name ]);
  } else {
    $self->SYNTAX_ERROR("Cannot assign type '%s' to type '%s'.", $value_ident->type, $ident->type);
  }

  return;
}


#
# new_obj()
#

sub new_obj
{
  my $self = shift;
  my ($ident, $class) = @_;

  #
  # Lookup the identifier:
  #
  # NOTE: This lookup doesn't give the info itself, but rather a hashref with
  # the LEVELS away the definition was found, and IDENT with the actual info
  # about the identifier.
  #

  my $ident_info = find_ident($ident);

  #
  # Reject cases where LHS isn't a variable (either it is undeclared or a constant):
  #

  unless (defined $ident_info) {
    $self->SYNTAX_ERROR("Assignment to undeclared variable '%s'.", $ident);
  }

  $ident_info = $ident_info->{IDENT};

  #
  # Now that we've confirmed we could find the identifier, we make sure it is
  # bound to a variable, not a constant.
  #

  if ($ident_info->{CLASS} eq 'const') {
    $self->SYNTAX_ERROR("Cannot assign to constant '%s'.", $ident);
  }

  #
  # Now that we've confirmed its not a constant, we make sure it is an object
  # type
  #

  if ($ident_info->{TYPE} ne 'P') {
    $self->SYNTAX_ERROR("Cannot store new object in non-object variable '%s'.", $ident);
  }

  #
  # Remember the source code:
  #

=no
  $self->push_source("$ident = new $class");
=cut

  #
  # Emit the new code:
  #

  $self->emit_code('new', [$ident_info->{VALUE}, $class]);

  return;
}


###############################################################################
###############################################################################
##
## Function Calls
##
###############################################################################
###############################################################################


=no

#
# assign_func()
#

sub assign_func
{
  my $self = shift;
  my ($dest, $name, @args) = @_;

  $self->push_source("$dest = $name(" . join(", ", @args) . ");");

  if ($assign_funcs{$name}) {
    $self->emit_code($name, [$dest, @args]);
  } elsif (exists $subs{$name}) {
    #
    # First, we make sure everything is in order for the call:
    #

    $self->WARNING("Call to void function %s in non-void context.", $name)
      unless defined $subs{$name}{RETURN};

    my $dest_type   = type_of($dest);
    my $return_type = uc $subs{$name}{RETURN};

    $self->WARNING("Type mismatch in destination type (%s) and call to %s (returns %s).", $dest_type, $name, $return_type)
      if $dest_type ne $return_type;

    #
    # Now, we have to push (save) the arguments onto the stack in reverse
    # order. That way they can be pulled off by the subroutine in declaration
    # order, which will be convenient later for handling variable argument
    # subroutines.
    #
    # Arguments that are already in registers are easy. Constant arguments
    # have to be placed in the appropriate zero (temporary) register and then
    # saved.
    #

    foreach my $arg (reverse @args) {
      $self->emit_code('.arg', [ $arg ]);
    }

    #
    # Now, we can jump to the subroutine's entry point:
    #

    $self->emit_code('call', [ "_$name" ]);

    #
    # Our calling convention dictates that upon return from the subroutine,
    # the result will be on the top of the stack.
    #

    $self->emit_code('.result', [ $dest ]);
  } else {
    $self->SYNTAX_ERROR("Call to unrecognized assign function '%s' (Not in {%s}).",
      $name, join(", ", sort keys %assign_funcs));
  }
}

=cut

###############################################################################
###############################################################################
##
## Block Handling
##
###############################################################################
###############################################################################


#
# begin_cond_block()
#

sub begin_cond_block
{
  my $self = shift;
  my ($block, $prefix, $type, $left, $op, $right) = @_;

#  my $next   = $block_types{$type}{NEXT};
#  my $redo   = $block_types{$type}{REDO};
#  my $last   = $block_types{$type}{LAST};

=no

  $self->push_source("$prefix: $type ($left $op $right) {");

  $self->push_label("${prefix}_" . uc $type);

  if ($type eq 'while') {
    $self->push_label("${prefix}_NEXT");
  } elsif ($type eq 'if') {
    $self->push_label("${prefix}_TEST");
  } else {
    $self->INTERNAL_ERROR("Unrecognized conditional block type '$type'");
  }

  if ($type eq 'while') {
    op_comp($type, $op, $left, $right, undef, "${prefix}_LAST");
  } elsif ($type eq 'if') {
    op_comp($type, $op, $left, $right, undef, "${prefix}_ELSE");
  }

  $self->push_label("${prefix}_REDO");

=cut

}


#
# begin_sub_block()
#

sub begin_sub_block
{
  my $self = shift;
  my ($block, $name, $return_type, @formal_args) = @_;

  my $return_type_name = $return_type->name;

  #
  # Flush any pending comments or labels.
  #

=no

  $self->emit_code();

  #
  # Generate the source code comment for the assembly listing.
  #

  my $arg_source = join(', ', map({ join(' ', @$_) } @formal_args));

  if (defined $return_type) {
    $self->push_source("sub $return_type_name $name ($arg_source) {");
  } else {
    $self->push_source("sub $name ($arg_source) {");
  }

  #
  # Emit code to jump over the subroutine.
  #
  # NOTE: We do this because we don't have a calling convention for starting
  # the program anywhere other than the first byte code op. Therefore, since
  # subroutines have to be defined before being called, the main program
  # will be at the end of the file, and we need to jump over the subroutines
  # to get there.
  #
  # This also implies that we can actually have code interspersed with
  # subroutine definitions just like Perl.
  #

#  $self->push_label("${name}_BEFORE");
#  $self->emit_code('branch', [ "${name}_AFTER" ]);

  $self->emit_code('.sub', [ "_$name" ]);

  #
  # Here we have the actual subroutine entry point:
  #

#  $self->push_label("_$name");
  $self->push_label("${name}_ENTER");
  $self->emit_code("saveall");

=cut

  #
  # Record the subroutine information.
  #
  # We track the line number of definition, the return type, and the info
  # about the formal arguments.
  #

=no
  $subs{$name} = {
    LINE   => $self->line,
    RETURN => $return_type,
    ARGS   => \@formal_args
  };
=cut

  $block->{RETURN}    = $return_type;

  #
  # Declare the formal arguments as variables:
  #
  # We need to have registers assigned to the formal arguments just like we do
  # for any other variable, and they need to go out of scope at the end of the
  # subroutine, so we put them through the standard variable declaration
  # procedure.
  #
  # TODO: When we make declared variables auto-initialize to zero, this will
  # be inefficient, since we are going to grab the value from the stack as
  # our next step. So eventually, we'll want an internal way to declare the
  # variable uninitialized without having it auto initialize to zero.
  #

  foreach my $formal_arg (@formal_args) {
    my ($arg_type, $arg_name) = @$formal_arg;

    $self->declare_var($arg_name, uc substr($arg_type, 0, 1), 'arg');
  }
}


#
# begin_block()
#
# return_type is used by subroutines.
#

my %block_names = ( );

sub begin_block
{
  my $self = shift;
  my ($prefix, $kind, $cond, $type, @formal_args) = @_;
  
  my ($left, $op, $right) = @$cond if $cond;

  $self->{BLOCK_COUNT}++;

  if (defined $prefix) {
    if ($block_names{$prefix} and $kind ne 'sub') {
      $self->SYNTAX_ERROR("Loop named '%s' already defined at line %d (previously defined at line %d)!",
        $prefix, $self->line, $block_names{$prefix});
    }
  } else {
    $self->INTERNAL_ERROR("Undefined prefix for $kind blocks")
      unless defined $block_types{$kind}{PREFIX};

    $prefix = $block_types{$kind}{PREFIX} . $self->{BLOCK_COUNT};
  }

  $block_names{$prefix} = $self->line;

  my $parent = $self->current_block();

  my $block = Jako::Construct::Block->new(
    $parent,
    $kind,
    $type,
    $prefix
  );

  $self->push_block($block);

=no 

  $self->emit_code(".namespace", [ $kind eq 'sub' ? "_$prefix" : $prefix ]);

=cut

  if ($kind eq 'if') {
    $self->begin_cond_block($block, $prefix, $kind, $left, $op, $right);
  } elsif ($kind eq 'while') {
    $self->begin_cond_block($block, $prefix, $kind, $left, $op, $right);
  } elsif ($kind eq 'sub') {
    $self->begin_sub_block($block, $prefix, $type, @formal_args);
  } else {
    $self->INTERNAL_ERROR("Unknown block kind '$kind' in begin_block()!");
  }
}


#
# end_block()
#
# TODO: else (and elsif?) blocks.
#

sub end_block
{
  my $self = shift;
  my ($continue) = @_;

  #
  # If we are not currently 'inside' a block, then we've got no business
  # seeing a close-brace.
  #

  $self->SYNTAX_ERROR("Closing brace without open block.")
    unless $self->block_depth();

  #
  # Pop the block info off the block stack and cache its prefix for use
  # in what follows. At this point we are no longer 'inside' a block.
  # Although, we may re-enter the block in certain cases (see below).
  #

  my $block  = $self->pop_block();
  my $prefix = $block->{PREFIX};

  #
  # 'while' blocks:
  #
  # When we are ending the 'while' block, we might be beginning the
  # 'continue' block, so we check for that case. The while block and
  # the continue block form one logical block, with the identifiers
  # delcared in the former available in the latter. This means that
  # semantically, the 'continue' block is really like a 'continue'
  # label, since control falls through the 'while' block into the
  # 'continue' block by default, and we get to the 'continue' block
  # via a 'next' statement in the 'while' block's body, which is
  # essentially a 'goto my_continue' statement.
  #
  # NOTE: This is different from some languages. Some languages
  # treat the continue block as a truly separate block, and the
  # identifiers declared in the 'while' portion are *not* available
  # in the 'continue' portion.
  #

  if ($block->kind eq 'while') {
    if (defined $continue) {
      if (defined $block->cont) {
        $self->SYNTAX_ERROR("No more than one continue block allowed.");
      } else {
        $block->cont($self->line);
      }

=no
      $self->push_label("${prefix}_CONT");
      $self->push_source("} continue {");
=cut

      $self->push_block($block);        # Push it back on for a minute...
      undef $block;              # ... and forget about it.
    } else {
=no
      $self->push_source("}");
      $self->push_label("${prefix}_CONT") unless defined $block->cont;
      $self->emit_code('branch', ["${prefix}_NEXT"]);
      $self->push_label("${prefix}_LAST");
=cut
    }
  }

  #
  # 'if' blocks:
  #
  # Continuation of 'if' blocks happens by $continue being 'else'. In that
  # case, we push the block back on the stack.
  #

  elsif ($block->kind eq 'if') {
    if (defined $continue) { # for 'else'
      if (defined $block->else) {
        $self->SYNTAX_ERROR("No more than one else block allowed.");
      } else {
        $block->else($self->line);
      }

=no
      $self->emit_code("branch", [ "${prefix}_LAST" ]); # Jump over the 'else'.
      $self->push_label("${prefix}_ELSE");
      $self->push_source("} else {");
=cut

      #
      # We push the block back onto the block stack, since we are
      # ending up still in a block.
      #
      # NOTE: We are not doing 'undef $block' here because we want
      # the code below to undeclare the variables from the 'if' block.
      #
      # TODO: Should we really be allocating a whole new block? Its
      # nice to reuse this one (and we set ELSE in it to know we
      # can't have *another* else continuation).
      #

      $self->push_block($block);
    } else {
=no
      $self->push_source("}");
      $self->emit_code();
      $self->push_label("${prefix}_ELSE") unless defined $block->{ELSE};
      $self->push_label("${prefix}_LAST");
=cut
    }
  }

  #
  # Handle the ending of subroutine blocks:
  #

  elsif ($block->kind eq 'sub') {
=no
    $self->push_source("}");
    $self->push_label("${prefix}_LEAVE");
=cut

    #
    # TODO: Complain if we haven't seen 'return' statement in a
    # subroutine that returns results (else we are going to be
    # very unhappy later...)
    #

    #
    # Now, actually return.
    #

=no
    $self->emit_code("restoreall");
    $self->emit_code("ret", [ ]);

    $self->push_label("${prefix}_AFTER");
#    $self->emit_code('noop'); # XXX: Needed by IMCC
    $self->emit_code('.end');
=cut
  }

  #
  # If there is any other kind of block, we have an internal compiler error.
  #

  else {
    $self->INTERNAL_ERROR("End of unknown kind of block " . $block->kind . "!");
  }

  #
  # If $block is still defined, then we didn't push it back on the block
  # stack and we are ending the scope.
  #

  if (defined $block) {
=no
    $self->emit_code(".endnamespace", [ $block->kind eq 'sub' ? "_$prefix" : $prefix ]);
=cut
 
    if ($continue) { # Reopen the namespace for 'else'
=no
      $self->emit_code(".namespace", [ $block->kind eq 'sub' ? "_$prefix" : $prefix ]);
=cut
    }
  }
}

###############################################################################
###############################################################################
##
## Arithmetic Operations
##
###############################################################################
###############################################################################


#
# do_arith()
#

sub do_arith
{
  my $self = shift;
  my ($dest, $a, $op, $b) = @_;

  $self->INTERNAL_ERROR("Dest is not Jako Identifier")
    unless UNIVERSAL::isa($dest, 'Jako::Construct::Expression::Value::Identifier');

  $self->INTERNAL_ERROR("A is not Jako Value")
    unless UNIVERSAL::isa($a, 'Jako::Construct::Expression::Value');

  $self->INTERNAL_ERROR("B is not Jako Value")
    unless UNIVERSAL::isa($b, 'Jako::Construct::Expression::Value');

=no
  $self->push_source("$dest = $a $op $b;");
=cut

  #
  # Determine the type to use to calculate the result:
  #

  $self->SYNTAX_ERROR("Cannot perform arithmetic on strings")
    if grep { ref($_) eq 'Jako::Construct::Type::String' } map { $_->type } ($dest, $a, $b);

  my $calc_type = Jako::Construct::Type::Integer->new;

  $calc_type = Jako::Construct::Type::Number->new if grep { ref($_) eq 'Jako::Construct::Type::Number' } map { $_->type } ($dest, $a, $b);
  $calc_type = Jako::Construct::Type::Object->new if grep { ref($_) eq 'Jako::Construct::Type::Object' } map { $_->type } ($dest, $a, $b);

  my $dest_type = $dest->type;

  #
  # Convert the operands into the calculation type:
  #
  
  if ($a->type ne $calc_type) {
=no
    my $temp = temp_reg($calc_type);
    $self->emit_code('set', [$temp, $a]);
    $a = $temp;
=cut
  }
  
  if ($b->type ne $calc_type) {
=no
    my $temp = temp_reg($calc_type);
    $self->emit_code('set', [$temp, $b]);
    $b = $temp;
=cut
  }

  #
  # Perform the calculation:
  #

  if ($dest_type eq $calc_type) {
=no
    $self->emit_code("$dest =", [ "$a $op $b" ]);
=cut
  }
  else {
=no
    my $temp = temp_reg($calc_type);
    $self->emit_code("$temp =", [ "$a $op $b" ]);
    $self->emit_code("$dest =", [ "$temp" ]);
=cut
  }
}


#
# do_add()
#

sub do_add
{
  my $self = shift;
  my ($dest, $a, $b) = @_;
  $self->do_arith($dest, $a, '+', $b);
}


#
# do_inc()
#

sub do_inc
{
  my $self = shift;
  my ($dest, $amount) = @_;

  $self->INTERNAL_ERROR("Dest is not a Jako Identifier!")
    unless UNIVERSAL::isa($dest, "Jako::Construct::Expression::Value::Identifier");

  $self->INTERNAL_ERROR("Amount is not a Jako Value!")
    if defined $amount and not UNIVERSAL::isa($amount, "Jako::Construct::Expression::Value");

  $amount = 1 unless defined $amount;

  if (ref $amount) {
    if (ref($amount->type) eq 'Jako::Construct::Type::Integer') {

=no
      $self->push_source("$dest += $amount;");
      $self->emit_code('add', [$dest, $amount]);
=cut

    } else {
      $self->do_add($dest, $dest, $amount);
    }
  } else {

=no
    $self->push_source("$dest++;");
    $self->emit_code('inc', [$dest]);
=cut

  }
}


#
# do_dec()
#

sub do_dec
{
  my $self = shift;
  my ($dest, $amount) = @_;

  if (defined $amount) {
    if (ref $amount->type eq 'Jako::Construct::Type::Integer') {

=no
      $self->push_source("$dest -= $amount;");
      $self->emit_code('sub', [$dest, $amount]);
=cut

    } else {
      $self->do_arith($dest, $dest, '-', $amount);
    }
  } else {

=no
    $self->push_source("$dest--;");
    $self->emit_code('dec', [$dest]);
=cut

  }
}


#
# do_bit_and()
#

sub do_bit_and
{
  my $self = shift;
  my ($dest, $a, $b) = @_;

=no
  $self->emit_code("band", [$dest, $a, $b]);
=cut
}


#
# do_bit_or()
#

sub do_bit_or
{
  my $self = shift;
  my ($dest, $a, $b) = @_;
=no
  $self->emit_code("bor", [$dest, $a, $b]);
=cut
}


#
# do_shift()
#

sub do_shift
{
  my $self = shift;
  my $dir = shift;
  my ($dest, $a, $amount) = @_;
=no
  $self->emit_code("sh$dir", [$dest, $a, $amount]);
=cut
}


###############################################################################
###############################################################################
##
## Argument Handling
##
###############################################################################
###############################################################################


#
# interpolate_string()
#
# Converts a single string argument:
#
#     "Foo $a ${b}ar\n"
#
# to multiple arguments:
#
#     "Foo ", a, " ", b, "ar ", b, "\n"
#
# to effect string interpolation.
#

sub interpolate_string
{
  my $self = shift;
  my ($string) = @_;

  return $string unless $string =~ m/(^"|^".*?[^\\])\$/; # Double-quote with an unescaped '$'.

  $string = substr($string, 1, -1); # Without the surrounding double quotes.

  my $temp = temp_str();          # Allocate and clear a temporary string register
  $self->emit_code("set", [ $temp, '""' ]);

  while (1) {
    last unless defined $string and
      $string =~ m/(^|^.*?[^\\])\$((([A-Za-z][A-Za-z0-9_]*)\b)|({[A-Za-z][A-Za-z0-9_]*}))(.*)$/;

    $self->emit_code("concat", [ $temp, '"' . $1 . '"' ])
      if defined $1 and $1 ne '';

    my $interp = $2;
    $interp =~ s/^{(.*)}$/$1/; # Strip '{' and '}'.

    if (type_of($interp) ne 'S') {
      my $temp2 = temp_str();
      $self->emit_code("set", [ $temp2, $interp ]);
      $interp = $temp2;
    }

    $self->emit_code("concat", [ $temp, $interp ]);

    $string = $6;
  }

  $self->emit_code("concat", [ $temp, '"' . $string . '"' ])
    if defined $string and $string ne '';

  return $temp;
}


###############################################################################
###############################################################################
##
## MAIN PROGRAM
##
###############################################################################
###############################################################################


#
# Tokenize the input, and possibly dump the tokens.
#

sub parse
{
  my $self = shift;

  my $root = $self->block(0);

  my $last_token = $self->at(-1);
  my $token      = $self->at(-1);

  while(1) {
    $token      = $self->forth;
    $last_token = $self->get(-1);

    last if $token->is_eof;

    #
    # Labels:
    #
    #   <label>:
    #

    if ($token->is_label) {
      my $block = $self->current_block();
      my $ident = Jako::Construct::Expression::Value::Identifier->new($block, $token);
      my $label = Jako::Construct::Label->new($block, $ident);
      next;
    }

    #
    # Variable declarations:
    #
    #   var <type> <ident>;
    #   var <type> <ident> = <value>;
    #   var <type> <ident>, <ident>, ...;
    #   var <type> <ident>, <ident>, ... = <value>;
    #
    #   const <type> <ident> = <value>;               # TODO: SHOULD BE LIMITED TO LITERAL?
    #   const <type> <ident>, <ident>, ... = <value>; # TODO: SHOULD BE LIMITED TO LITERAL?
    #

    if ($token->is_var or $token->is_const) {
      my $access = $token->text; # 'const' or 'var'.

      my $type       = Jako::Construct::Type->new($self->require_type);

      $self->INTERNAL_ERROR("Could not determine type.") unless defined $type;

      $self->SYNTAX_ERROR("Cannot declare constants of type '%s'.", $type) # TODO: This can happen later.
        if ($access eq 'const' and $type->isa("Jako::Construct::Type::Object"));

      my @identifiers = ();

      my $block = $self->current_block();

      while (1) {
        my $ident = Jako::Construct::Expression::Value::Identifier->new($block, $self->require_ident);
        push @identifiers, $ident;
        last unless $self->skip_comma;
      }

      my $value;

      if ($self->skip_assign) {
        $value = Jako::Construct::Expression::Value->new($block, $self->require_literal);

=no
        $value = interpolate_string($value) # TODO: This should happen at compile time.
          if type_of($value) eq 'S';
=cut

      }

      $self->require_semicolon;

      $self->SYNTAX_ERROR("Cannot declare constant without assigning a value.") # TODO: This can happen later.
        if ($access eq 'const' and not defined $value);

      foreach my $ident (@identifiers) {
        if ($access eq 'var') {
          my $var    = Jako::Construct::Declaration::Variable->new($block, $type, $ident);
          my $assign = Jako::Construct::Statement::Assign->new($block, $ident, $value) if defined $value;
        }
        elsif ($access eq 'const') {
          my $const = Jako::Construct::Declaration::Constant->new($block, $type, $ident, $value);
        }
        else {
          $self->INTERNAL_ERROR("Unexpected access '$access'.");
        }
      }

      next;
    }

    #
    # Bare Blocks:
    #
    #   <label>: {
    #   {
    #
 
    if ($token->is_open_brace) {
      my $label = $last_token->text
        if $last_token->is_label;
    
      $self->begin_block($label, 'bare', undef);

      next;
    }

    #
    # Subroutines:
    #
    #   sub        <ident>          (<arg>, <arg>, ...) {
    #   sub <type> <ident>          (<arg>, <arg>, ...) {
    #   sub        <ident> {<prop>} (<arg>, <arg>, ...) {
    #   sub <type> <ident> {<prop>} (<arg>, <arg>, ...) {
    #

    if ($token->is_sub) {
      my $block = $self->current_block;

      my $type_token = $self->skip_type;

      my $type;
      $type = Jako::Construct::Type->new($type_token->type) if $type_token;

      my $ident = Jako::Construct::Expression::Value::Identifier->new($block, $self->require_ident);
      my $name = $ident->value;

      #
      # Allow there to be Properties:
      #

      my %props;

      if ($self->skip_open_brace and not $self->skip_close_brace) { # In case empty.
        while (1) {
          my $prop = $self->require_ident->text;
      
          my $value;

          if ($self->skip_assign) {
            $value = Jako::Construct::Expression::Value::Literal->new($block, $self->require_literal);
          }

          $props{$prop} = $value;
          last if $self->get(1)->is_close_brace;
          $self->require_comma;
        }

        $self->skip_close_brace;
      }

      #
      # Require there to be a formal arguments list:
      #

      $self->require_open_paren;

      my @formal_args;

      unless ($self->skip_close_paren) {
        while (1) {
          my $arg_type  = Jako::Construct::Type->new($self->require_type);
          my $arg_token = $self->require_ident;
          my $arg_name  = $arg_token->text;

          push @formal_args, [ $arg_type, $arg_name, $arg_token ];

          last if $self->skip_close_paren;

          $self->require_comma;
        }
      }

      my $decl = Jako::Construct::Declaration::Sub->new($block, $type, $ident, { %props }, [ @formal_args ]);

      unless ($self->skip_open_brace) { # DEFINITION
        $self->require_semicolon;
      }
      else {
        my $sub = Jako::Construct::Block::Sub->new($block, $type, $ident, { %props }, [ @formal_args ]);
        push @{$self->{BLOCKS}}, $sub;
      }

      next;
    }

    #
    # Loops:
    #
    #   <label>: until (<value> <op> <value>) {
    #            until (<value> <op> <value>) {
    #
    #   <label>: while (<value> <op> <value>) {
    #            while (<value> <op> <value>) {
    #
 
    if ($token->is_until or $token->is_while) {
      my $block = $self->current_block();
      my $kind = $token->text;

      my $prefix;

      if ($last_token->is_label) {
        $prefix = $last_token->text;
      }

      $self->require_open_paren;

      my $left  = Jako::Construct::Expression::Value->new($block, $self->require_value);
      my $op    = $self->require_infix_rel->text;
      my $right = Jako::Construct::Expression::Value->new($block, $self->require_value);

      $self->require_close_paren;
      $self->require_open_brace;

      my $loop;

      my $namespace = sprintf("_%s_%d", uc $kind, $self->{BLOCK_COUNT}++);

      $prefix = $namespace unless defined $prefix;

      if ($kind eq 'while') {
        $loop = Jako::Construct::Block::Loop::While->new($block, $namespace, $prefix, $left, $op, $right);
      }
      elsif ($kind eq 'until') {
        $loop = Jako::Construct::Block::Loop::Until->new($block, $namespace, $prefix, $left, $op, $right);
      }
      else {
        $self->INTERNAL_ERROR("Unexpected loop kind %s!", $kind);
      }

      push @{$self->{BLOCKS}}, $loop;

      next;
    }

    #
    # Increment and Decrement:
    #
    #   <var> <op>;
    #

    if ($token->is_ident and $self->get(1)->is_exfix_arith) {
      my $block = $self->current_block();
      my $ident = Jako::Construct::Expression::Value::Identifier->new($block, $token);
      my $op    = $self->forth->text;

      $self->require_semicolon;

      if ($op eq '++') {
        my $inc = Jako::Construct::Statement::Increment->new($block, $ident);
      }
      else {
        my $dec = Jako::Construct::Statement::Decrement->new($block, $ident);
      }

      next;
    }

    #
    # Arithmetic assigns:
    #
    #   <var> <op> <value>;
    #

    if ($token->is_ident and $self->get(1)->is_arith_assign) {
      my $block = $self->current_block;

      my $ident = Jako::Construct::Expression::Value::Identifier->new($block, $token);
      my $op    = substr($self->forth->text, 0, 1);
      my $value = Jako::Construct::Expression::Value->new($block, $self->forth);

      $self->require_semicolon;

      my $arith = Jako::Construct::Statement::Arithmetic->new($block, $ident, $ident, $op, $value);
      next;
    }

    #
    # Bitwise assigns:
    #
    #   <var> <op> <value>;
    #

    if ($token->is_ident and $self->get(1)->is_bit_assign) {
      my $ident = $token->text;
      my $op    = $self->forth->text;
      my $value = $self->forth->text;

      $self->require_semicolon;

      if ($op eq '<<=' or $op eq '>>=') {
=no
        $self->push_source("$ident $op $value");
        $self->do_bit_shift($op eq '<<=' ? 'l' : 'r', $ident, $ident, $value);
=cut
      }
      elsif ($op eq '|=') {
=no
        $self->push_source("$ident |= $value");
        $self->do_bit_or($ident, $ident, $value);
=cut
      }
      elsif ($op eq '&=') {
=no
        $self->push_source("$ident |= $value");
        $self->do_bit_and($ident, $ident, $value);
=cut
      }
      else {
        $self->INTERNAL_ERROR("Unrecognized bitwise op '$op'");
      }

      next;
    }

    #
    # Block Termination:
    #
    #   }
    #   } continue {
    #   } else {
    #
 
    if ($token->is_close_brace) {
      my $cont;
    
      if ($self->get(1)->is_continue or $self->get(1)->is_else) {
        $cont = $self->forth->text;
        $self->require_open_brace;
      }

      $self->end_block($cont);

      next;
    }

    #
    # Arithmetic Operators:
    #
    #   <var> = <value> <op> <value>;
    #
    # TODO: Can't really support shift amount as arg until sh[lr]_i_i ops are implemented.
    # TODO: Should we really be allowing the shift constant to be negative?
    #

    if ($token->is_ident
      and $self->get(1)->is_assign
      and $self->get(2)->is_value
      and $self->get(3)->is_infix_arith
      and $self->get(4)->is_value
    ) {
      my $block = $self->current_block();
      my $ident = Jako::Construct::Expression::Value::Identifier->new($block, $token);

      $self->require_assign;

      my $left  = Jako::Construct::Expression::Value->new($block, $self->forth);
      my $op    = $self->forth->text;
      my $right = Jako::Construct::Expression::Value->new($block, $self->forth);

      $self->require_semicolon;

      my $arith = Jako::Construct::Statement::Arithmetic->new($block, $ident, $left, $op, $right);

      next;
    }

    #
    # Bitwise Operators:
    #
    #   a = b << 4;
    #   a = b & c;
    #   a = b | c;
    #

    if ($token->is_ident
      and $self->get(1)->is_assign
      and $self->get(2)->is_value
      and $self->get(3)->is_infix_bit
      and $self->get(4)->is_value
    ) {
      my $ident = $token->text;

      $self->require_assign;

      my $left  = $self->forth->text;
      my $op    = $self->forth->text;
      my $right = $self->forth->text;

      $self->require_semicolon;

      if ($op eq '<<' or $op eq '>>') {
        $self->do_shift($op eq '<<' ? 'l' : 'r', $ident, $left, $right);
      }
      elsif ($op eq '&') {
=no
        $self->push_source("$ident = $left \& $right");
        $self->do_bit_and($ident, $left, $right);
=cut
      }
      elsif ($op eq '|') {
=no
        $self->push_source("$ident = $left | $right");
        $self->do_bit_or($ident, $left, $right);
=cut
      }
      else {
        $self->INTERNAL_ERROR("Unrecognized bitwise op '$op'");
      }

      next;
    }

    #
    # Subroutine Calls:
    #
    #     <ident>(<arg>, <arg>, ...);
    #
 
    if ($token->is_ident and $self->get(1)->is_open_paren) {
      my $block = $self->current_block();
      my $sub_name = Jako::Construct::Expression::Value::Identifier->new($block, $token);

      $self->require_open_paren;

      my @args = ();

      unless ($self->get(1)->is_close_paren) {
        while (1) {
          push @args, Jako::Construct::Expression::Value->new($block, $self->require_value);
          last if $self->get(1)->is_close_paren;
          $self->require_comma;
        }
      }

      $self->require_close_paren;
      $self->require_semicolon;

#      $self->DEBUG(0, "Assembling call to '%s()'...", $sub_name->value);

      my $call = Jako::Construct::Statement::Call->new($block, $sub_name, @args);
      next;
    }

    #
    # Function Calls:
    #
    # a = foo(...);
    #

    if ($token->is_ident
      and $self->get(1)->is_assign
      and $self->get(2)->is_ident
      and $self->get(3)->is_open_paren
    ) {
      my $block = $self->current_block();
      my $left = Jako::Construct::Expression::Value::Identifier->new($block, $token);

      $self->require_assign;

      my $func_name = Jako::Construct::Expression::Value::Identifier->new($block, $self->require_ident);

      $self->require_open_paren;

      my @args = ();

      unless ($self->get(1)->is_close_paren) {
        while (1) {
          push @args, Jako::Construct::Expression::Value->new($block, $self->require_value);
          last if $self->get(1)->is_close_paren;
          $self->require_comma;
        }
      }

      $self->require_close_paren;
      $self->require_semicolon;
     
      #
      # TODO: Call is really an expression, but here its treated as a statment with the assign.
      #

      my $call = Jako::Construct::Expression::Call->new($block, $left, $func_name, @args);
      next;
    }

    #
    # Variable Assignments:
    #
    #   <ident> = <value>;
    #   <ident> = <ident> = ... = <value>;
    #
 
    if ($token->is_ident and $self->get(1)->is_assign) {
      my $block = $self->current_block();
      my $left = Jako::Construct::Expression::Value::Identifier->new($block, $token);

      my @left = ($left);

      $self->require_assign;

      while ($self->get()->is_ident and $self->get(1)->is_assign) {
        my $left = Jako::Construct::Expression::Value::Identifier->new($block, $self->get());
        push @left, $left;
        $self->require_assign;
      }

      my $right = Jako::Construct::Expression::Value->new($block, $self->require_value);

      $self->require_semicolon;

      foreach my $left (@left) {
        my $assign = Jako::Construct::Statement::Assign->new($block, $left, $right);
      }
      next;
    }

    #
    # Subroutine Return Statements:
    #
    #   return;
    #   return <value>;
    #

    if ($token->is_return) {
      my $block = $self->current_block();

      my $value_token = $self->skip_value;
      my $value = Jako::Construct::Expression::Value->new($block, $value_token) if defined $value_token;

      $self->require_semicolon;

      my $return = Jako::Construct::Statement::Return->new($block, $value);
      next;
    }

    #
    # Goto Statements:
    #
    #   goto <label>;
    #   goto <label> if (<value> <op> <value>);
    #   goto <label> unless (<value> <op> <value>);
    #

    if ($token->is_goto) {
      my $block = $self->current_block;
      my $ident = Jako::Construct::Expression::Value::Identifier->new($block, $self->require_ident);

      my ($cond, $left, $op, $right);

      if ($self->get(1)->is_if or $self->get(1)->is_unless) {
        $cond = $self->forth->text;

        $self->require_open_paren;

        $left  = Jako::Construct::Expression::Value->new($block, $self->require_value);
        $op    = $self->require_infix_rel->text;
        $right = Jako::Construct::Expression::Value->new($block, $self->require_value);

        $self->require_close_paren;
      }

      $self->require_semicolon;
      
      my $goto = Jako::Construct::Statement::Goto->new($block, $ident, $cond, $left, $op, $right);
      next;
    }

    #
    # Loop Control Statements:
    #
    #   next;
    #   next if     (<value> <op> <value>);
    #   next unless (<value> <op> <value>);
    #
    #   next <label>;
    #   next <label> if     (<value> <op> <value>);
    #   next <label> unless (<value> <op> <value>);
    #
    #   last;
    #   last if     (<value> <op> <value>);
    #   last unless (<value> <op> <value>);
    #
    #   last <label>;
    #   last <label> if     (<value> <op> <value>);
    #   last <label> unless (<value> <op> <value>);
    #
    #   redo;
    #   redo if     (<value> <op> <value>);
    #   redo unless (<value> <op> <value>);
    #
    #   redo <label>;
    #   redo <label> if     (<value> <op> <value>);
    #   redo <label> unless (<value> <op> <value>);
    #

    if ($token->is_loop_control) {
      my $block = $self->current_block();
      my $kind = $token->text;

      my $target_token = $self->skip_ident;
      my $target;
      $target = Jako::Construct::Expression::Value::Identifier->new($block, $target_token) if $target_token;

      my ($cond, $left, $op, $right);

      if ($self->get(1)->is_if or $self->get(1)->is_unless) {
        $cond = $self->forth->text;

        $self->require_open_paren;
        $left  = Jako::Construct::Expression::Value->new($block, $self->require_value);
        $op    = $self->require_infix_rel->text;
        $right = Jako::Construct::Expression::Value->new($block, $self->require_value);
        $self->require_close_paren;
      }

      $self->require_semicolon;

      my $ctl = Jako::Construct::Statement::LoopControl->new($block, $kind, $target, $cond, $left, $op, $right);
      next;
    }

    #
    # Conditionals Blocks:
    #
    #   if     (<value> <op> <value>) {
    #   unless (<value> <op> <value>) {
    #

    if ($token->is_if or $token->is_unless) {
      my $block = $self->current_block();
      my $kind = $token->text;

      $self->require_open_paren;

      my $left  = Jako::Construct::Expression::Value->new($block, $self->require_value);
      my $op    = $self->require_infix_rel->text;
      my $right = Jako::Construct::Expression::Value->new($block, $self->require_value);

      $self->require_close_paren;
      $self->require_open_brace;
 
      my $cond;

      if ($kind eq 'if') {
        $cond = Jako::Construct::Block::Conditional::If->new($block, $left, $op, $right);
      }
      elsif ($kind eq 'unless') {
        $cond = Jako::Construct::Block::Conditional::Unless->new($block, $left, $op, $right);
      }

      push @{$self->{BLOCKS}}, $cond;
      next;
    }

    #
    # Conditional Continuations:
    #
    #   } elsif (<value> <op> <value>) {
    #

=no

    if (m/^}\s*(elsif)\s*\(\s*(.*)\s*\)\s*{$/) {
      $self->begin_block(undef, $1, $2);
      # TODO
      next;
    }

=cut




    #
    # TODO: Implement other stuff and put it before this.
    #

    $self->SYNTAX_ERROR("Don't know what to do with token '%s'.", $token->text);




    #
    # Object Construction:
    #
    # a = new Foo;
    #

    if (m/^([A-Za-z][A-Za-z0-9_]*)\s*=\s*new\s+([A-Za-z][A-Za-z0-9_]*)$/) {
      new_obj($1, $2);
      next;
    }

    #
    # Miscellany:
    #

    if (m/^end$/) {
      $self->emit_code('end');
      next;
    }

    $self->PARSE_ERROR("Unparsable line.");
  }

=no
  $self->emit_code('end') unless $self->last_op eq 'end';
=cut

  #$self->emit_code(".end");

  return $root;
}


1;
