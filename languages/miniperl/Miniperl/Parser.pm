package Parser;

use strict;
use vars qw($VERSION);

$VERSION = '0.01';

sub new {
  my $class = shift;
  my $self = { };
  $self->{tokens} = $_[0] if defined $_[0];
  bless $self,$class;
}

#------------------------------------------------------------------------------

sub _cur {
  my $self = shift;
  $self->{tokens}[$self->{index}];
}

sub _peek {
  my $self = shift;
  $self->{tokens}[$self->{index}+1];
}

sub _next {
  my $self = shift;
  $self->{tokens}[$self->{index}++];
}

#------------------------------------------------------------------------------

sub __minus {
  my $self = shift;
 
  $self->_next;              # Skip the minus sign
  if($self->_cur =~ /^\d/) { # Negative number
    return [ 'SCALAR', -$self->_next ];
  }
  return [ 'SCALAR', '-', $self->_value ];
}

sub __plus {
  my $self = shift;

  $self->_next;             # Skip the plus sign
  return $self->_value;
}

sub __scalar {
  my $self = shift;

  my $value = [ 'SCALAR', $self->_next ];
  if($self->_cur and $self->_cur =~ /^[-+*\/%=]/) {
    my $operator = $self->_next;
    return [ 'SCALAR', $operator, $value, $self->_value ];
  }
  return $value;
}

sub __list {
  my $self = shift;

  if($self->_peek and $self->_peek eq '[') {
    my $name = $self->_next;   # @foo
    $self->_next;              # [
    my $index = $self->_value; # {value}
    $self->_next;              # ]
    my $value = [ 'SCALAR', $name, $index ];
    if($self->_cur and $self->_cur =~ /^[-+*\/%=]/) {
      my $operator = $self->_next;
      return [ 'SCALAR', $operator, $value, $self->_value ];
    }
    return $value;
  }
  else {
    return [ 'LIST', $self->_next ];
  }
}

sub __scalar_value {
  my $self = shift;

  if($self->_peek and $self->_peek =~ /^[-+*\/%=]/) {
    my $value = [ 'SCALAR', $self->_next ];
    my $operator = $self->_next;
    return [ 'SCALAR', $operator, $value, $self->_value ];
  }
  return [ 'SCALAR', $self->_next ];
}

my %value_operations = (
  '-' => \&__minus,
  '+' => \&__plus,
  '$' => \&__scalar,
  '@' => \&__list,
  'DEFAULT' => \&__scalar_value,
);

sub _value {
  my $self = shift;

  $self->_cur =~ /^(.)/;
  if(exists $value_operations{$1}) {
    return $value_operations{$1}->($self);
  }
  else {
    return $value_operations{'DEFAULT'}->($self);
  }
}

#------------------------------------------------------------------------------

sub __print {
  my $self     = shift;
  my $operator = $self->_next;
  my $value    = $self->_value;
  $self->_next; # Skip the semicolon terminator
  return [ 'SCALAR', $operator, $value ];
}

sub __expression {
  my $self  = shift;
  my $value = $self->_value;

  $self->_next; # Skip the semicolon terminator
  return $value;
}

my %operations = (
  'print' => \&__print,
);

sub _parse {
  my $self = shift;
  $self->{tokens} = $_[0] if defined $_[0];

  if(exists $operations{$self->_cur}) {
    return $operations{$self->_cur}->($self);
  }
  else {
    return $self->__expression;
  }
}

#------------------------------------------------------------------------------

sub parse {
  my $self = shift;
  $self->{index} = 0;
  $self->{tokens} = $_[0] if defined $_[0];
  
  my $aref;
  while($self->{index} < @{$self->{tokens}}) {
    push @$aref,$self->_parse;
  }
  $aref;
}

1;
__END__

=head1 NAME

Parser - Perl extension for Miniperl parser

=head1 SYNOPSIS

  use Parser;
  my $parser = Parser->new([$token_ref]);
  my $tree = $parser->parse([$token_ref]);

=head1 DESCRIPTION

Either new() or parse() accepts a $token_ref, but of course at least one has to.

=head1 AUTHOR

Jeffrey Goff, drforr@hargray.com

=head1 SEE ALSO

perl6(1).

=cut
