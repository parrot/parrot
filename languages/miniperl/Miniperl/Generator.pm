package Generator;

use strict;
use vars qw($VERSION);
use Data::Dumper;

$VERSION = '0.01';

sub _init {
  my $self = shift;
  $self->{p} = {};
  $self->{p_count} = 0;
  $self->{s} = {};
  $self->{s_count} = 0;
  $self->{code} = [];
  $self->{gen_register} = 0;
}

sub new {
  my $class = shift;
  my $self = { };
  $self->{tree} = $_[0] if defined $_[0];
  bless $self,$class;
  $self->_init;
  $self;
}

#------------------------------------------------------------------------------

sub __allocate_s {
  my ($self,$value) = @_;

  warn "Tried to allocate an array at line: ".(caller(1))[2]."\n";
  push @{$self->{code}},[
    '', 'new_key', $self->{s}{$value}, "# $value"
  ];
}

sub __allocate_p {
  my ($self,$value) = @_;

  push @{$self->{code}},[
    '', 'new', $self->{p}{$value}, 'PerlInt', "# $value"
  ];
}

sub _temp_register {
  my $self = shift;
  return $self->_register(
    '$__TEMP'.sprintf("%04d",$self->{gen_register}++)
  );
}

sub _register {
  my ($self,$value) = @_;

  if($value =~ /^\$/) {
    return $self->{p}{$value} if defined $self->{p}{$value};

    $self->{p}{$value}='P'.$self->{p_count}++;
    $self->__allocate_p($value);
    return $self->{p}{$value};
  }
  return $self->{s}{$value} if defined $self->{s}{$value};

  $self->{s}{$value}='S'.$self->{s_count}++;
  $self->__allocate_s($value);
  return $self->{s}{$value};
}

#------------------------------------------------------------------------------

my %operators = (
  '=' => \&__assign,
  '+' => \&__binop,
  '-' => \&__binop,
  '*' => \&__binop,
  '/' => \&__binop,
  '%' => \&__binop,
  '_' => \&__binop,
);

my %op_names = (
  '+' => 'add',
  '-' => 'sub',
  '*' => 'mul',
  '/' => 'div',
  '%' => 'mod',
  '_' => 'concat',
);

sub __expression {
  my $self = shift;
  my $rhs  = shift;

  if($rhs->[1] =~ /^[\$@]/) {
    $rhs = $self->_register($rhs->[1]);
  }
  elsif($rhs->[1] =~ /^[0-9'"]|-?\d/) {
    $rhs = $rhs->[1];
  }
  else {
    my $temp = $self->_temp_register();
    $operators{$rhs->[1]}->($self,$rhs,$temp);
    $rhs = $temp;
  }
  $rhs;
}

sub __assign {
  my ($self,$expr) = @_;
  my $lhs = $expr->[2];
  my $rhs = $expr->[3];

  if($lhs->[1] =~ /^[\$@]/) {
    $lhs = $self->_register($lhs->[1]);
  }
  elsif($lhs->[1] =~ /^[0-9'"]|-?\d/) {
    print STDERR "*** Attempt to assign to a constant\n";
    return;
  }

  $rhs = $self->__expression($rhs);

  if($rhs =~ /^P/) {
    push @{$self->{code}},[ '', 'clone', $lhs, $rhs ];
  }
  else {
    push @{$self->{code}},[ '', 'set', $lhs, $rhs ];
  }
}

sub __binop {
  my ($self,$expr,$reg) = @_;
  my $lhs = $self->__expression($expr->[2]);
  my $rhs = $self->__expression($expr->[3]);

  push @{$self->{code}},[ '', $op_names{$expr->[1]}, $reg, $lhs, $rhs, ];
  return $reg;
}

#------------------------------------------------------------------------------

sub _prettyprint {
  my $self = shift;

  warn "\n";
  for(@{$self->{code}}) {
    warn join("\t",@$_)."\n";
  }
}

#------------------------------------------------------------------------------

sub generate {
  my $self = shift;
  $self->{tree} = $_[0] if defined $_[0];
  $self->_init;

  for(@{$self->{tree}}) {
    $operators{$_->[1]}->($self,$_);
  }
  push @{$self->{code}},[ '', 'end' ];

#  $self->_prettyprint;

  $self->{code};
}

1;
__END__

=head1 NAME

Generator - Perl extension for Miniperl code generator

=head1 SYNOPSIS

  use Generator;
  my $generator = Generator->new($tree);
  my $code_ref = $generator->generate();

=head1 DESCRIPTION

This walks the tree and generates code

=head1 AUTHOR

Jeffrey Goff, drforr@hargray.com

=head1 SEE ALSO

perl6(1).

=cut
