#
# Symbol.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings 'all';";

package Jako::Symbol;

use Carp;


#
# CONSTRUCTOR:
#

sub new
{
  my $class = shift;

  confess "Expected 9 args" unless @_ == 9;

  my ($block, $kind, $type, $name, $value, $props, $args, $file, $line) = @_;

  $props = { } unless defined $props;
  $args  = [ ] unless defined $args;

  confess("Undefined identifier block.")
    unless defined $block;

  confess "Block (" . ref($block) . ") is not!"  unless UNIVERSAL::isa($block, qw(Jako::Construct::Block));
  confess "Type (" . ref($type) . ") is not!"   if defined $type and not UNIVERSAL::isa($type, qw(Jako::Construct::Type));
  confess "Value (" . ref($value) . ") is not!"  if defined $value and not UNIVERSAL::isa($value, qw(Jako::Construct::Expression::Value));

  confess("Undefined identifier kind attribute.")
    unless defined $kind;
 
  confess("Unrecognized identifier kind attribute '" . $kind . "'.")
    unless $kind eq 'module' or $kind eq 'sub' or $kind eq 'var' or $kind eq 'arg' or $kind eq 'const';

  my $self = bless {
    BLOCK  => $block,

    KIND   => $kind,
    TYPE   => $type,
    NAME   => $name,
    VALUE  => $value,  # For constants (undef for variables)
    PROPS  => $props,
    ARGS   => $args,

    DEBUG  => 1,
    FILE   => $file,
    LINE   => $line
  }, $class;

  return $self;
}


#
# ACCESSORS:
#

sub block  { return shift->{BLOCK};    }

sub kind   { return shift->{KIND};     }
sub type   { return shift->{TYPE};     }
sub name   { return shift->{NAME};     }
sub value  { return shift->{VALUE};    }
sub props  { return %{shift->{PROPS}}; }
sub args   { return @{shift->{ARGS}}; }

sub file   { return shift->{FILE};     }
sub line   { return shift->{LINE};     }

sub is_constant { return shift->kind eq 'const'; }
sub is_variable { my $self = shift; return ($self->kind eq 'var') or ($self->kind eq 'arg'); }
sub is_sub      { my $self = shift; return $self->kind eq 'sub'; }
sub is_module   { my $self = shift; return $self->kind eq 'module'; }

1;

