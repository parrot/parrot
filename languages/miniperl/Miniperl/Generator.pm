package Miniperl::Generator;

use strict;
use Data::Dumper;

sub new {
  my $class = shift;
  my $tree  = shift;
  my $self = {
    tree     => $tree,
    register => [(0) x 32],
    gensym   => 0,
  };
  bless $self,$class;
}

#------------------------------------------------------------------------------

sub _gensym {
  return sprintf "G%04d",shift->{gensym}++;
}

#------------------------------------------------------------------------------

sub __max_lengths {
  my $colref = shift;
  my @max_len=(0)x3;
  for my $row(@$colref) {
    for(0..$#{$row}) {
      $max_len[$_]=length($row->[$_]) if length $row->[$_] > $max_len[$_];
    }
  }
  @max_len;
}

sub _format_columns {
  my $self    = shift;
  my $colref  = $self->{instruction};
  my @max_len = __max_lengths($colref);

  for my $row(@$colref) {
    my $label;
    $label = $row->[0]; $label .= ":" if $label;
    print $label . ' ' x ($max_len[0]-length($label)+2);
    if(defined $row->[1]) {
      $label = $row->[1];
      print $label . ' ' x ($max_len[1]-length($label)+2);
      $label = $row->[2];
      print join ", ",@$label if $label;
    }
    print "\n";
  }
}

#------------------------------------------------------------------------------

sub _add_inst {
  my $self = shift;
  push @{$self->{instruction}},[@_];
}

#------------------------------------------------------------------------------

sub generate {
  my $self = shift;
  my $tree = $self->{tree};
  my $inst;
  my %vars;
  my $var_count;

  for $inst (@$tree) {
    next unless $inst->{instruction} eq 'allocate';
    for(@{$inst->{values}}) {
      my $var = "P".$var_count++;
      $self->_add_inst('','new',[$var,'PerlInt']);
      $vars{$_} = $var;
    }
  }

  for $inst (@$tree) {
    my $instruction = $inst->{instruction};
    if($instruction eq 'print') {
      for(@{$inst->{values}}) {
        $self->_add_inst('','print',[$vars{$_}]);
      }
    }
#    elsif($instruction eq 'allocate') {
#      $self->_add_inst('','set',[$_,$inst->{values}[0]]);
#    }
    elsif($instruction eq 'assign') {
      $self->_add_inst('','set',[ $vars{$inst->{values}[0]},
                                  $inst->{values}[1],
                                ]
                      );
    }
  }

  $self->_add_inst('',"end");
  $self->_format_columns();
}

1;
__END__

=head1 NAME

Miniperl::Generator - The Miniperl code generator

=head1 SYNOPSIS

  use Miniperl:Generator;

  my @code = Miniperl::Generator->new($code_tree)->generate();

=head1 DESCRIPTION

The code generator reads in a tree structure, and walks that to generate the
output.

=head1 AUTHOR

Jeffrey Goff, jgoff@speakeasy.net

=head1 SEE ALSO

L<Miniperl>, L<Miniperl::Tokenizer>

=cut
