#
# Block.pm
#
# Jako Blocks.
#

package Jako::Parser::Block;

use base Jako::Parser::Element;


#
# CONSTRUCTOR:
#

sub new
{
  my $class = shift;
  my ($block, $kind, $type, $prefix) = @_;

  return bless {
    BLOCK  => $block,  # Parent block
    KIND   => $kind,   # (need one for 'root' or 'file'?), sub, if, else, while, etc.
    TYPE   => $type,   # Return type
    PREFIX => $prefix, # label?

    CONT   => undef,   # line # of continue block (to prevent multiples)
    ELSE   => undef,   # line # of else block (to prevent multiples)
    SCOPE  => undef,   # The IMCC name for the block's scope
    IDENT  => { },     # Identifiers
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

sub identifier
{
  my $self = shift;
  my ($name, $ident) = @_;

  $self->{IDENT}{$name} = $ident if defined $ident;

  return $self->{IDENT}{$name};
}

sub find_identifier
{
  my $self = shift;
  my ($name) = @_;

  my $ident = $self->identifier($name); # Return the identifier if defined here.
  return $ident if defined $ident;

  return undef unless defined $self->block; # Terminate recursion

  return $self->block->find_identifier($name); # Recurse
}


1;

