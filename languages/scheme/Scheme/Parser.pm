package Scheme::Parser;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION   = '0.01';
@ISA       = qw(Exporter);
@EXPORT_OK = qw(parse);

use Data::Dumper;

sub _build_tree {
  my ($tokens,$count) = @_;
  my $temp   = {};

  $count++;

  while($tokens->[$count] ne ')') {
    if($tokens->[$count] eq '(') {
      my ($lcount,$ltemp) = _build_tree($tokens,$count);
      $count = $lcount;
      push @{$temp->{children}},$ltemp;
    } else {
      if(exists $temp->{value} or exists $temp->{children}) {
        push @{$temp->{children}},{value=>$tokens->[$count]};
      } else {
        $temp->{value} = $tokens->[$count];
      }
    }
    $count++;
  }

  return ($count,$temp);
}

sub _dataflow {
  my $node = shift;

  if(exists $node->{children}) {
    for(@{$node->{children}}) {
      _dataflow($_);
    }
    my $cur_type = $node->{children}[0]{type};
    for(@{$node->{children}}) {
      $cur_type = $_->{type} if $_->{type} eq 'REAL';
    }
    $node->{type} = $cur_type;#$node->{children}[0]{type};
  } else {
    $node->{type} = 'INTEGER' if $node->{value} =~ /^[-]?\d+$/;
    $node->{type} = 'REAL'    if $node->{value} =~
                                 /^[-]?\d+\.(\d+([-+]?[eE]\d+)?)?/;
    $node->{type} = 'REAL'    if $node->{value} =~
                                 /^[-]?\.(\d+([-+]?[eE]\d+)?)/;
    $node->{type} ||= 'EXPRESSION';
  }
}

sub parse {
  my $tokens = shift;
  my (undef,$tree) = _build_tree($tokens,0);
  _dataflow($tree);

  return $tree;
}

1;
__END__

=head1 NAME

Scheme::Parser - The Scheme token parser

=head1 SYNOPSIS

  use Scheme::Parser qw(parse);

  my @code = parse($tokens);

=head1 DESCRIPTION

The parser reads a list of tokens and turns it into a tree structure.

=head1 AUTHOR

Jeffrey Goff, jgoff@speakeasy.net

=head1 SEE ALSO

L<Scheme>, L<Scheme::Tokenizer>, L<Scheme::Generator>

=cut
