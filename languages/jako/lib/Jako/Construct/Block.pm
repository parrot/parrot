#
# Block.pm
#
# Jako Blocks.
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Block;

use base qw(Jako::Construct);

use Carp;


#
# CONSTRUCTOR:
#

sub new
{
  my $class = shift;
  my ($block, $kind, $type, $prefix) = @_;

  confess "Use Jako::Construct::Block::Bare, not Jako::Construct::Block"
    if $class eq 'Jako::Construct::Block';

  return bless {
    BLOCK   => $block,  # Parent block

    PEER    => undef,   # Peer block (if any).
    KIND    => $kind,   # One of file, sub, if, else, while, etc.
    TYPE    => $type,   # Return type, if any.
    PREFIX  => $prefix, # Prefix, if given in source code.
    SYMBOLS => { },     # Identifiers
    CONTENT => [ ]      # Constructs
  }, $class;
}


#
# ACCESSORS:
#

sub peer      { return shift->{PEER};  }
sub kind      { return shift->{KIND};  }
sub type   { return shift->{TYPE};   }

sub left      { return shift->{LEFT};  }
sub op        { return shift->{OP};    }
sub right     { return shift->{RIGHT}; }

sub prefix
{
  my $self = shift;
  $self->{PREFIX} = shift if @_;
  return $self->{PREFIX};
}



#
# symbol()
#

sub symbol
{
  my $self = shift;
  my ($name, $sym) = @_;

  $self->{SYMBOLS}{$name} = $sym if defined $sym;

  return $self->{SYMBOLS}{$name};
}


#
# symbols()
#

sub symbols
{
  my $self = shift;

  return keys %{$self->{SYMBOLS}};
}


#
# dump_symbols()
#

sub dump_symbols
{
  my $self = shift;

  my $block = $self;

  my %table = ();

  my $level = 0;

  while ($block) {
    foreach my $symbol ($block->symbols) {
      next if exists $table{$symbol};
      $table{$symbol} = $level;
    }

    $block = $block->block;
    $level++;
  }

  foreach my $symbol (sort keys %table) {
    printf STDERR "%s: %d\n", $symbol, $table{$symbol};
  }
}


#
# find_symbol()
#

sub find_symbol
{
  my $self = shift;
  my ($name) = @_;

  my $sym = $self->symbol($name); # Return the identifier if defined here.
  return $sym if defined $sym;

  return undef unless defined $self->block; # Terminate recursion

  return $self->block->find_symbol($name); # Recurse
}


#
# find_block()
#

sub find_block
{
  my $self = shift;
  my ($kind, $label) = @_;

  if ($self->kind eq $kind) {
    if (defined $label) {
      return $self if $self->prefix eq $label;
    }
    else {
      return $self;
    }
  }

  return undef unless $self->block;

  return $self->block->find_block($kind, $label);
}


#
# type_of_ident()
#

sub type_of_ident
{
  my $self = shift;
  my ($name) = @_;

  my $found = $self->find_symbol($name);

  return $found ? $found->type : undef;
}


#
# access_of_ident()
#

sub access_of_ident
{
  my $self = shift;
  my ($name) = @_;

  my $found = $self->find_symbol($name);

  return $found ? $found->kind : undef;
}


#
# content()
#

sub content
{
  my $self = shift;

  return @{$self->{CONTENT}};
}


#
# push_content()
#

sub push_content
{
  my $self = shift;

  push @{$self->{CONTENT}}, @_;
}


#
# compile()
#

sub compile
{
  my $self = shift;
  my ($compiler, $filter) = @_;

  foreach my $construct ($self->content) {
    next if $filter and not &$filter($construct);

    $construct->compile($compiler);
  }
}


1;
