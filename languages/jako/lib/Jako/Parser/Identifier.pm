#
# Identifier.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#

use strict;
use warnings;

package Jako::Parser::Identifier;

use Carp qw(confess);

use base qw(Jako::Parser::Element);

#
# CONSTRUCTOR:
#

sub new
{
  my $class = shift;
  my ($block, $access, $type, $name, $file, $line, $value) = @_;
  
  confess "Unrecognized identifier access attribute '$access'"
    unless $access eq 'var' or $access eq 'arg' or $access eq 'const';
  
  confess "Unrecognized identifier type attribute '$type'"
    unless $type eq 'I' or $type eq 'N' or $type eq 'P' or $type eq 'S';
  
  confess "Undefined identifier name attribute"
    unless defined $name;

  return bless {
    BLOCK  => $block,
    ACCESS => $access, # Constant, Variable or Argument
    TYPE   => $type,   # Integer, Number, String or Object
    NAME   => $name,
    FILE   => $file,
    LINE   => $line
  }, $class;
}


#
# ACCESSORS:
#

sub block  { return shift->{BLOCK};  }
sub access { return shift->{ACCESS}; }
sub type   { return shift->{TYPE};   }
sub name   { return shift->{NAME};   }
sub file   { return shift->{FILE};   }
sub line   { return shift->{LINE};   }

sub is_constant { return shift->access eq 'const'; }
sub is_variable { my $self = shift; return $self->access eq 'var' or $self->access = 'arg'; }

1;

