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
eval "use warnings";

package Jako::Parser;

use Carp;

use base qw(Jako::Processor);

use Jako::Construct::Block;
use Jako::Construct::Block::Bare;
use Jako::Construct::Block::Conditional::Else;
use Jako::Construct::Block::Conditional::If;
use Jako::Construct::Block::Conditional::Unless;
use Jako::Construct::Block::File;
use Jako::Construct::Block::Module;
use Jako::Construct::Block::Sub;
use Jako::Construct::Block::Loop::Continue;
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
use Jako::Construct::Statement::Bitwise;
use Jako::Construct::Statement::Call;
use Jako::Construct::Statement::Decrement;
use Jako::Construct::Statement::Goto;
use Jako::Construct::Statement::Increment;
use Jako::Construct::Statement::LoopControl;
use Jako::Construct::Statement::New;
use Jako::Construct::Statement::Return;


#
# new()
#

sub new
{
  my $class = shift;

  my $root = Jako::Construct::Block::File->new(
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
    # Modules:
    #
    #   module <ident> [:<prop>[=<value] ...] {
    #

    if ($token->is_module) {
      my $block = $self->current_block;

      my $ident = Jako::Construct::Expression::Value::Identifier->new($block, $self->require_ident);
      my $name = $ident->value;

      #
      # Allow there to be Properties:
      #

      my %props;

      while ($self->skip_colon) {
        my $prop = $self->require_ident->text;

        my $value;

        if ($self->skip_assign) {
          $value = Jako::Construct::Expression::Value::Literal->new($block, $self->require_literal);
        }

        $props{$prop} = $value;
      }

      $self->require_open_brace;

      my $module = Jako::Construct::Block::Module->new($block, $ident, { %props });
      push @{$self->{BLOCKS}}, $module;

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
    # Subroutines:
    #
    #   sub [<type>] <ident> [:<prop>[=<value] ...] (<arg>, <arg>, ...) {
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

      while ($self->skip_colon) {
        my $prop = $self->require_ident->text;
      
        my $value;

        if ($self->skip_assign) {
          $value = Jako::Construct::Expression::Value::Literal->new($block, $self->require_literal);
        }

        $props{$prop} = $value;
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
        $loop = Jako::Construct::Block::Loop::While->new($block, $prefix, $left, $op, $right);
      }
      elsif ($kind eq 'until') {
        $loop = Jako::Construct::Block::Loop::Until->new($block, $prefix, $left, $op, $right);
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
      my $op    = substr($self->forth->text, 0, -1);
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
      my $block = $self->current_block;

      my $ident = Jako::Construct::Expression::Value::Identifier->new($block, $token);
      my $op    = substr($self->forth->text, 0, -1);
      my $value = Jako::Construct::Expression::Value->new($block, $self->forth);

      $self->require_semicolon;

      my $bitwise = Jako::Construct::Statement::Bitwise->new($block, $ident, $ident, $op, $value);
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

      #
      # If we are not currently 'inside' a block, then we've got no business
      # seeing a close-brace.
      #

      $self->SYNTAX_ERROR("Closing brace without open block.")
        unless $self->block_depth();

      #
      # Remember the block we just closed, in case its the peer of a continuation
      # we are about to introduce.
      #

      my $peer_block = $self->pop_block;

      #
      # 'while' blocks:
      #
      # When we are ending the 'while' block, we might be beginning the 'continue'
      # block, so we check for that case.
      #
      # We *always* create a continue block, even when there is none in the source,
      # so that upon compilation all the appropriate labels can be generated for
      # the loop control statements to function properly.
      #
      # Put on an empty continue block and then pop it back off. It will be in the
      # parent block's content array, and it will have gotten its prefix, etc.
      # correct by virtue of initializing itself based on its peer block's info
      # (available by passing $block in as an argument).
      #

      if ($peer_block->kind eq 'while' or $peer_block->kind eq 'until') {
        my $parent_block = $peer_block->block;
        my $loop = Jako::Construct::Block::Loop::Continue->new($parent_block, $peer_block);
        $self->push_block($loop) if defined $cont;
      }
      elsif ($peer_block->kind eq 'continue') {
        if (defined $cont) {
          $self->SYNTAX_ERROR("No more than one continue block allowed.");
        }
      }

      #
      # 'if' blocks:
      #
      # Continuation of 'if' blocks happens by $continue being 'else'.
      #

      elsif ($peer_block->kind eq 'if' or $peer_block->kind eq 'unless') {
        my $parent_block = $peer_block->block;
        my $cond = Jako::Construct::Block::Conditional::Else->new($parent_block, $peer_block);
        $self->push_block($cond) if defined $cont;;
      }
      elsif ($peer_block->kind eq 'else') {
        if (defined $cont) {
          $self->SYNTAX_ERROR("No more than one else block allowed.");
        }
      }

      #
      # Handle the ending of subroutine blocks:
      #

      elsif ($peer_block->kind eq 'sub') {
        # DO NOTHING
      }

      #
      # Handle the ending of module blocks:
      #

      elsif ($peer_block->kind eq 'module') {
        # DO NOTHING
      }

      #
      # If there is any other kind of block, we have an internal compiler error.
      #

      else {
        $self->INTERNAL_ERROR("End of unknown kind of block '%s'!", $peer_block->kind);
      }

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
    #   a = b >> 4;
    #   a = b & c;
    #   a = b | c;
    #

    if ($token->is_ident
      and $self->get(1)->is_assign
      and $self->get(2)->is_value
      and $self->get(3)->is_infix_bit
      and $self->get(4)->is_value
    ) {
      my $block = $self->current_block();
      my $ident = Jako::Construct::Expression::Value::Identifier->new($block, $token);

      $self->require_assign;

      my $left  = Jako::Construct::Expression::Value->new($block, $self->forth);
      my $op    = $self->forth->text;
      my $right = Jako::Construct::Expression::Value->new($block, $self->forth);

      $self->require_semicolon;

      my $arith = Jako::Construct::Statement::Bitwise->new($block, $ident, $left, $op, $right);

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
    #   <ident> = new <ident>;
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

      my $constructing;
      my $right;

      if ($self->skip_new) {
        $constructing = 1;
        $right = Jako::Construct::Expression::Value::Identifier->new($block, $self->require_ident)
      }
      else {
        $constructing = 0;
        $right = Jako::Construct::Expression::Value->new($block, $self->require_value);
      }

      $self->require_semicolon;

      foreach my $left (@left) {
        if ($constructing) {
          my $new = Jako::Construct::Statement::New->new($block, $left, $right);
          $constructing = 0;
        }
        else {
          my $assign = Jako::Construct::Statement::Assign->new($block, $left, $right);
        }
        
        $right = $left;
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

      my $return = Jako::Construct::Statement::Return->new($block, $value, $cond, $left, $op, $right);
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
    # Conditional Blocks:
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

=begin commented_out

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
    # Conditional Continuations:
    #
    #   } elsif (<value> <op> <value>) {
    #

    if (m/^}\s*(elsif)\s*\(\s*(.*)\s*\)\s*{$/) {
      $self->begin_block(undef, $1, $2);
      # TODO
      next;
    }

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

=cut


    #
    # TODO: Implement other stuff and put it before this.
    #

    $self->SYNTAX_ERROR("Don't know what to do with token '%s'.", $token->text);
  }

  return $root;
}


1;
