package Miniperl::Parser;

use strict;
use vars qw($VERSION @ISA @EXPORT_OK);

$VERSION   = '0.01';
@ISA       = qw(Exporter);
@EXPORT_OK = qw(parse);

use Data::Dumper;

sub new {
  my ($class) = @_;
  bless {
    index  => 0,
    tree   => [],
  },$class;
}

sub _cur {
  my $self = shift;
  my $offset = shift || 0;
  $self->{tokens}[$self->{index}+$offset];
}

sub _next {
  my $self = shift;
  $self->{tokens}[$self->{index}++];
}

sub _push {
  my $self = shift;
  my $href = shift;
  push @{$self->{tree}},$href;
}

#-------------------------------------

sub __scalar_value {
  my $token = shift;
  return 1 if $token =~ /[-]?\d+(\.\d+)?/;
  return 1 if $token =~ /^['"]/;
  return 1 if $token =~ /^q\(/;
  return undef;
}

sub __allocate {
  my $self = shift;
  $self->{index}++;
  if($self->_cur eq '(') { # Grab a comma-separated list of variables
    my @temp;
    $self->{index}++;
    while($self->_cur ne ')') {
      push @temp,$self->_next;
      $self->{index}++ if $self->_cur eq ',';
    }
    $self->_push({
      instruction => 'allocate',
      values      => \@temp,
    });
  }
  else { # Grab the single variable
    $self->_push({
      instruction => 'allocate',
      values      => [
        $self->_next,
      ]
    });
  }
}

sub __assign {
  my $self = shift;
  my $val_1    = $self->_next;
  my $operator = $self->_next;
  my $val_2    = $self->_next;
  $self->_push({
    instruction => 'assign',
    values => [ $val_1,
                $val_2
              ]
  });
}

sub __print {
  my $self = shift;
  $self->{index}++;
  my @temp = $self->_next;
  while($self->_cur ne ';') {
    push @temp,$self->_next;
  }
  $self->_push({
    instruction => 'print',
    values      => \@temp,
  });
}

sub _build_tree {
  my $self = shift;

  while($self->{index} < @{$self->{tokens}}) {
    if   ($self->_cur eq 'my')    { $self->__allocate(); }
    elsif($self->_cur eq 'print') { $self->__print(); }

    elsif($self->_cur    =~ /^[\$]\w+/ and
          $self->_cur(1) eq '=') {
      $self->__assign();
    }
    $self->{index}++;
  }
}

sub parse {
  my ($self,$tokens) = @_;

  $self->{tokens} = $tokens;
  $self->_build_tree();
  return $self->{tree};
}

1;
__END__

=head1 NAME

Miniperl::Parser - The Miniperl token parser

=head1 SYNOPSIS

  use Miniperl::Parser qw(parse);

  my @code = parse($tokens);

=head1 DESCRIPTION

The parser reads a list of tokens and turns it into a tree structure.

=head1 AUTHOR

Jeffrey Goff, jgoff@speakeasy.net

=head1 SEE ALSO

L<Miniperl>, L<Miniperl::Tokenizer>, L<Miniperl::Generator>

=cut
