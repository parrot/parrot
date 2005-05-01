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
  ['',             'save', 'P1'],
  ['',             '.include', '"interpinfo.pasm"'],
  ['',             'interpinfo', 'P0', '.INTERPINFO_CURRENT_SUB'],
  ['',             'invokecc'],
  ['',             'restore', 'P1'],
  ['',             'restore', 'P6'],
  ['',             'set', 'P5', 'P6[1]'],
  ['',             'typeof', 'I0', 'P5'],
  ['',             'eq', 'I0', '.PerlUndef', 'write_KET'],
  ['',             'ne', 'I0', '.Array', 'write_DOT'],
  ['',             'print', '" "'],
  ['',             'branch', 'write_NEXT'],
  ['write_DOT',    'print', '" . "'],
  ['',             'save', 'P1'],
  ['',             'invokecc'],
  ['',             'restore', 'P1'],
  ['write_KET',    'print', '")"'],
  ['write_RET',    'returncc'],
 ],
 apply => 
 [['# Apply function'],
  ['apply_ENTRY', 'set', 'P0', 'P5'],
  ['',            'set', 'P16', 'P6'],
  ['',            'typeof', 'I16', 'P16'],
  ['',            'set', 'I1', 0],
  ['',            'set', 'I2', 0],
  ['',            'eq', 'I16', '.PerlUndef', 'apply_CALL'],
  ['',            'set', 'P5', 'P16[0]'],
  ['',            'bsr', 'apply_HELP'],
  ['',            'eq', 'I16', '.PerlUndef', 'apply_CALL'],
  ['',            'set', 'P6', 'P16[0]'],
  ['',            'bsr', 'apply_HELP'],
  ['',            'eq', 'I16', '.PerlUndef', 'apply_CALL'],
  ['',            'set', 'P7', 'P16[0]'],
  ['',            'bsr', 'apply_HELP'],
  ['',            'eq', 'I16', '.PerlUndef', 'apply_CALL'],
  ['',            'set', 'P8', 'P16[0]'],
  ['',            'bsr', 'apply_HELP'],
  ['',            'eq', 'I16', '.PerlUndef', 'apply_CALL'],
  ['',            'set', 'P9', 'P16[0]'],
  ['',            'bsr', 'apply_HELP'],
  ['',            'eq', 'I16', '.PerlUndef', 'apply_CALL'],
  ['',            'set', 'P10', 'P16[0]'],
  ['',            'bsr', 'apply_HELP'],
  ['',            'eq', 'I16', '.PerlUndef', 'apply_CALL'],
  ['',            'set', 'P11', 'P16[0]'],
  ['',            'bsr', 'apply_HELP'],
  ['',            'eq', 'I16', '.PerlUndef', 'apply_CALL'],
  ['',            'set', 'P12', 'P16[0]'],
  ['',            'bsr', 'apply_HELP'],
  ['',            'eq', 'I16', '.PerlUndef', 'apply_CALL'],
  ['',            'set', 'P13', 'P16[0]'],
  ['',            'bsr', 'apply_HELP'],
  ['',            'eq', 'I16', '.PerlUndef', 'apply_CALL'],
  ['',            'set', 'P14', 'P16[0]'],
  ['',            'bsr', 'apply_HELP'],
  ['',            'eq', 'I16', '.PerlUndef', 'apply_CALL'],
  ['',            'set', 'P15', 'P16[0]'],
  ['',            'bsr', 'apply_HELP'],
  ['',            'eq', 'I16', '.PerlUndef', 'apply_CALL'],
  ['',            'set', 'P17', 'P16'],
  ['apply_COUNT', 'ne', 'I16', '.PerlUndef', 'apply_ARRAY'],
  ['',            'inc', 'I2'],
  ['',            'set', 'P17', 'P17[1]'],
  ['',            'typeof', 'I16', 'P17'],
  ['',            'branch', 'apply_COUNT'],
  ['apply_ARRAY', 'new', 'P3', '.Array'],
  ['',            'set', 'P3', 'I2'],
  ['',            'set', 'I16', 0],
  ['apply_ITER',  'set', 'P3[I16]', 'P16[0]'],
  ['',            'set', 'P16', 'P16[1]'],
  ['',            'inc', 'I16'],
  ['',            'ne', 'I16', 'I2', 'apply_ITER'],
  ['apply_CALL',  'set', 'I0', 0],
  ['',            'invoke'],
  ['apply_HELP',  'P16', 'P16[1]'],
  ['',            'inc', 'I1'],
  ['',            'typeof', 'I16', 'P16'],
  ['',            'ret'],
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
