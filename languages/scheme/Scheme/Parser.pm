package Scheme::Parser;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION   = '0.01';
@ISA       = qw(Exporter);
@EXPORT_OK = qw(parse);

use Data::Dumper;

my $ind = 0;
sub _build_tree {
  my ($tokens,$count) = @_;
  my $temp   = {};

  die "EOF reached" if $count >= $#$tokens;

  if ($tokens->[$count] eq '(') {
    $temp->{children} = [];
    $count++;
    while($tokens->[$count] ne ')') {
      my $expr;
      ($count, $expr) = _build_tree ($tokens, $count);
      push @{$temp->{children}}, $expr;
    }
    $count++;
  }
  elsif ($tokens->[$count] eq "'") {
    $temp = { children => [{ value => 'quote' }] };
    my $expr;
    $count++;
    ($count, $expr) = _build_tree ($tokens, $count);
    push @{$temp->{children}}, $expr;
  }
  elsif ($tokens->[$count] eq "`") {
    $temp = { children => [{ value => 'quasiquote' }] };
    my $expr;
    $count++;
    ($count, $expr) = _build_tree ($tokens, $count);
    push @{$temp->{children}}, $expr;
  }
  elsif ($tokens->[$count] eq ",") {
    $temp = { children => [{ value => 'unquote' }] };
    my $expr;
    $count++;
    ($count, $expr) = _build_tree ($tokens, $count);
    push @{$temp->{children}}, $expr;
  }
  elsif ($tokens->[$count] eq ",@") {
    $temp = { children => [{ value => 'unquote-splicing' }] };
    my $expr;
    $count++;
    ($count, $expr) = _build_tree ($tokens, $count);
    push @{$temp->{children}}, $expr;
  }
  else {
    $temp->{value} = $tokens->[$count++];
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
  my @tree;
  my $tree;

  my $count = 0;

  while ($count < scalar @$tokens) {
    #print Dumper $tokens;
    ($count,$tree) = _build_tree($tokens,$count);
    #_dataflow($tree);
    #print Data::Dumper->Dump ([$count, $tree]);
    push @tree, $tree;
  }

  # Implicit begin at toplevel
  if (@tree > 1) {
    $tree = { children => [ { value => 'begin' }, @tree ] };
  }
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

Jeffrey Goff, drforr@hargray.com

=head1 SEE ALSO

L<Scheme>, L<Scheme::Tokenizer>, L<Scheme::Generator>

=cut
