package Miniperl::Parser;

use strict;
use vars qw($VERSION @ISA @EXPORT_OK);

$VERSION   = '0.01';
@ISA       = qw(Exporter);
@EXPORT_OK = qw(parse);

use Data::Dumper;

sub __scalar_value {
  my $token = shift;
  return 1 if $token =~ /[-]?\d+/;
  return 1 if $token =~ /[-]?\d+\.\d+/;
  return 1 if $token =~ /[-]?\d+\.\d+[eE][-]?\d+/;
  return 1 if $token =~ /^['"]/;
  return 1 if $token =~ /^q\(/;
  return undef;
}

sub __allocate {
  my ($tokens,$temp,$count) = @_;
  #
  # my $a
  # my ($foo)
  # my ($foo,@bar)
  #
  $count++;
  if($tokens->[$count] eq '(') { # Grab a comma-separated list of variables
    my @temp;
    $count++;
    while($tokens->[$count] ne ')') {
      push @temp,$tokens->[$count];
      $count++;
      $count++ if $tokens->[$count] eq ',';
    }
    push @$temp,{
      instruction => 'allocate',
      values => \@temp,
    };
  }
  else { # Grab the single variable
    push @$temp,{
      instruction => 'allocate',
      values => [
        $tokens->[$count++],
      ]
    };
  }
  $count;
}

sub __assign {
  my ($tokens,$temp,$count) = @_;
  my $val_1    = $tokens->[$count++];
  my $operator = $tokens->[$count++];
  my $val_2    = $tokens->[$count++];
  push @$temp,{
    instruction => 'assign',
    values => [ $val_1,
                $val_2
              ]
  };
  $count;
}

sub __print {
  my ($tokens,$temp,$count) = @_;
  $count++;
  my @temp = $tokens->[$count++];
  while($tokens->[$count] ne ';') {
    push @temp,$tokens->[$count++];
  }
  push @$temp,{
    instruction => 'print',
    values => \@temp,
  };
  $count++;
  $count;
}

sub _build_tree {
  my ($tokens,$count) = @_;
  my $temp   = [];

  while($count < @$tokens) {
    #
    # my $a;
    # my ($foo);
    # my ($foo,@bar);
    #
    if($tokens->[$count] eq 'my') {
      $count = __allocate($tokens,$temp,$count);
    }
    #
    # $foo = {scalar}
    #
    elsif($tokens->[$count]   =~ /^[\$]\w+/ and
          $tokens->[$count+1] eq '=' and
          __scalar_value($tokens->[$count+2])) {
      $count = __assign($tokens,$temp,$count);
    }
    #
    # print ;
    # print <foo>+ ;
    #
    elsif($tokens->[$count] eq 'print') {
      $count = __print($tokens,$temp,$count);
    }
    else {
    }
    $count++;
  }

  return ($count,$temp);
}

sub parse {
  my $tokens = shift;
  my (undef,$tree) = _build_tree($tokens,0);
  return $tree;
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
