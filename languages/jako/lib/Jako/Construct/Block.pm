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

package Jako::Construct::Block;

use base qw(Jako::Construct);


#
# CONSTRUCTOR:
#

sub new
{
  my $class = shift;
  my ($block, $kind, $type, $prefix) = @_;

  return bless {
    BLOCK   => $block,  # Parent block
    KIND    => $kind,   # (need one for 'root' or 'file'?), sub, if, else, while, etc.
    TYPE    => $type,   # Return type
    PREFIX  => $prefix, # label?

    CONT    => undef,   # line # of continue block (to prevent multiples)
    ELSE    => undef,   # line # of else block (to prevent multiples)
    SCOPE   => undef,   # The IMCC name for the block's scope
    SYMBOLS => { },     # Identifiers
    CONTENT => [ ]      # Constructs
  }, $class;
}


#
# ACCESSORS:
#

sub kind   { return shift->{KIND};   }
sub type   { return shift->{TYPE};   }
sub prefix { return shift->{PREFIX}; }

sub cont   { my $self = shift; $self->{CONT} = shift if @_; return $self->{CONT}; }
sub else   { my $self = shift; $self->{ELSE} = shift if @_; return $self->{ELSE}; }

sub scope  { return shift->{SCOPE};  } # TODO: Better

sub symbol
{
  my $self = shift;
  my ($name, $sym) = @_;

  $self->{SYMBOLS}{$name} = $sym if defined $sym;

  return $self->{SYMBOLS}{$name};
}

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


sub type_of_ident
{
  my $self = shift;
  my ($name) = @_;

  my $found = $self->find_symbol($name);

  return $found ? $found->type : undef;
}

sub access_of_ident
{
  my $self = shift;
  my ($name) = @_;

  my $found = $self->find_symbol($name);

  return $found ? $found->kind : undef;
}

sub content
{
  my $self = shift;

  return @{$self->{CONTENT}};
}

sub push_content
{
  my $self = shift;

  push @{$self->{CONTENT}}, @_;
}

sub compile
{
  my $self = shift;
  my ($fh) = @_;

  if ($self->kind eq 'file') {
    print $fh ".sub ___MAIN\n";
    print $fh "  call __MAIN\n";
    print $fh "  end\n";
    print $fh ".end\n";
    print $fh "\n";
    print $fh "__MAIN:\n";
  }

  foreach my $construct ($self->content) {
    $construct->compile($fh);
  }

  print $fh "  ret\n" if $self->kind eq 'file';
}

1;

