package Scheme::Builtins;

use strict;

# nice for debugging
use Data::Dumper;

my %built_ins = 
(
 write =>
 [['# Write function', ''],
  ['write_ENTRY',  'typeof', 'I0', 'P5'],
  ['',             'ne', 'I0', '.PerlUndef', 'write_N_UNDEF'],
  ['',             'print', '"()"'],
  ['',             'branch', 'write_RET'],
  ['write_N_UNDEF','ne', 'I0', '.Scratchpad', 'write_N_LAMBDA'],
  ['',             'print', '"lambda"'],
  ['',             'branch', 'write_RET'],
  ['write_N_LAMBDA','eq', 'I0', '.Array', 'write_ARRAY'],
  ['',             'print', 'P5'],
  ['',             'branch', 'write_RET'],
  ['write_ARRAY',  'print', '"("'],
  ['write_NEXT',   'set', 'P6', 'P5'],
  ['',             'set', 'P5', 'P6[0]'],
  ['',             'save', 'P6'],
  ['',             'bsr', 'write_ENTRY'],
  ['',             'restore', 'P6'],
  ['',             'set', 'P5', 'P6[1]'],
  ['',             'typeof', 'I0', 'P5'],
  ['',             'eq', 'I0', '.PerlUndef', 'write_KET'],
  ['',             'ne', 'I0', '.Array', 'write_DOT'],
  ['',             'print', '" "'],
  ['',             'branch', 'write_NEXT'],
  ['write_DOT',    'print', '" . "'],
  ['',             'bsr', 'write_ENTRY'],
  ['write_KET',    'print', '")"'],
  ['write_RET',    'ret'],
 ],
);

sub new {
  my $class = shift;
  my $self = {
    instruction => []
  };
  bless $self, $class;
}

sub _add_inst {
  my $self = shift;
  push @{$self->{instruction}}, [@_];
}

sub generate {
  my ($code, $name) = @_;

  die "$name: Unknown builtin\n" unless exists $built_ins{$name};

  my $self = Scheme::Builtins->new();

  for (@{$built_ins{$name}}) {
    my ($label, $op, @args) = @$_;
    $self->_add_inst($label, $op, [ @args ]);
  }

  $self;
}

1;
