#
# Loop.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Construct::Block::Loop;

use Carp;

use base qw(Jako::Construct::Block);

my %inverted_ops = (
  '==' => '!=',
  '!=' => '==',
  '<=' => '>',
  '<'  => '>=',
  '>=' => '<',
  '>'  => '<='
);

=no

my %comp_ops = (
  'eq' => sub { $_[0] == $_[1] },
  'ne' => sub { $_[0] != $_[1] },
  'le' => sub { $_[0] <= $_[1] },
  'lt' => sub { $_[0] <  $_[1] },
  'ge' => sub { $_[0] >= $_[1] },
  'gt' => sub { $_[0] >  $_[1] },

  '==' => '',
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

=cut

sub left      { return shift->{LEFT};      }
sub op        { return shift->{OP};        }
sub right     { return shift->{RIGHT};     }
sub kind      { return shift->{KIND};      }
sub namespace { return shift->{NAMESPACE}; }
sub prefix    { return shift->{PREFIX};    }

sub compile
{
  my $self = shift;
  my ($fh) = @_;

  my $namespace = $self->namespace;
  my $prefix    = $self->prefix;
  my $kind      = $self->kind;

  my $left;
  my $op;
  my $right;

  if ($kind eq 'while' or $kind eq 'until') {
    $left  = $self->left->value;
    $op    = $self->op;
    $right = $self->right->value;
  }

  if ($kind eq 'while') {
    $op = $inverted_ops{$op}; # Invert the sense for 'while' loops.
  }

  if ($kind eq 'while' or $kind eq 'until') {
    print $fh "${prefix}_NEXT:\n";
    print $fh ".namespace $namespace\n";
    print $fh "  if $left $op $right goto ${prefix}_LAST\n";
    print $fh "${prefix}_REDO:\n";

    $self->SUPER::compile($fh);

    print $fh ".endnamespace $namespace\n";
  }
  elsif ($kind eq 'continue') {
    print $fh "${prefix}_CONT:\n";
    print $fh ".namespace $namespace\n";

    $self->SUPER::compile($fh);

    print $fh ".endnamespace $namespace\n";
    print $fh "  goto ${prefix}_NEXT\n";
    print $fh "${prefix}_LAST:\n";
  }
  else {
    $self->INTERNAL_ERROR("Unrecognized kind of block '%s'", $kind);
  }

  return 1;
}

=no

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
      return "  branch $true\n";
    } else {
      return "  branch $false\n";
    }
  }

  #
  # CONVERT const-reg comparisons to reg-const comparisons:
  #
  # We do this by reversing the operand order and inverting the comparison.
  #

  if (UNIVERSAL::isa($a, 'Jako::Construct::Expression::Value::Literal')
    and UNIVERSAL::isa($b, 'Jako::Construct::Expression::Value::Identifier')
  ) {
    ($a, $op, $b) = ($b, $comp_ops{"!$op"}, $a);
  }

  #
  # CONVERT num-int and int-num comparisons to num-num comparisons:
  #

  if (UNIVERSAL::isa($b, 'Jako::Construct::Expression::Value::Literal')) {
    #
    # reg-const comparisons:
    #
    # NOTE: We count on the assembler to promote the integer constant
    # in the case of num-reg-to-int-const comparisons.
    #

    if (UNIVERSAL::isa($a, 'Jako::Construct::Expression::Value::Literal::Integer')
      and UNIVERSAL::isa($b, 'Jako::Construct::Expression::Value::Literal::Number')
    ) {
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

=cut


1;

