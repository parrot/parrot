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
#
# To guarantee unique labels for branching.
#

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
#
# This is not the correct approach to register allocation by any stretch
# of the imagination. The right way, however, will have to wait until we have
# true scopes.
#

my %vars;          # Register allocation
my $var_count = 0; # Keep track of the number of registers...

#
# %vars will map variable name to register name.
#
sub __allocate_register {
  my $name = shift;
  my $value = "P".$var_count++;
  $vars{$value}=$name;
  $value;
}

sub _allocate_registers {
  my $self = shift;
  my $tree = $self->{tree};
  for my $inst (@$tree) {
    next unless $inst->{instruction} eq 'allocate';
    for(@{$inst->{values}}) {
      my $var = __allocate_register($_);
      $self->_add_inst('','new',[$var,'PerlInt']);
    }
  }
}

#------------------------------------------------------------------------------

sub generate {
  my $self = shift;
  my $tree = $self->{tree};

  $self->_allocate_registers();

  for my $inst (@$tree) {
    my $instruction = $inst->{instruction};
    if($instruction eq 'print') {
      for(@{$inst->{values}}) {
        $self->_add_inst('','print',[$vars{$_}]);
      }
    }
    elsif($instruction eq 'assign') {
      $self->_add_inst('',
        'set',[ $vars{$inst->{values}[0]},
                $inst->{values}[1],
              ]
      );
    }
  }

  $self->_add_inst('','end');
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
