package Scheme::Builtins;

use strict;

my %built_ins = 
(
 write =>
 [['# Write function', ''],
  ['write_ENTRY',  'save', 'I0'],
  ['',             'typeof', 'I0', 'P5'],
  ['',             'ne', 'I0', '.PerlUndef', 'write_N_UNDEF'],
  ['',             'print', '"()"'],
  ['',             'branch', 'write_RET0'],
  ['write_N_UNDEF','eq', 'I0', '.Array', 'write_ARRAY'],
  ['',             'print', 'P5'],
  ['',             'branch', 'write_RET0'],
  ['write_ARRAY',  'save', 'P5'],
  ['',             'save', 'P6'],
  ['',             'print', '"("'],
  ['write_NEXT',   'set', 'P6', 'P5'],
  ['',             'set', 'P5', 'P6[0]'],
  ['',             'bsr', 'write_ENTRY'],
  ['',             'set', 'P5', 'P6[1]'],
  ['',             'typeof', 'I0', 'P5'],
  ['',             'eq', 'I0', '.PerlUndef', 'write_KET'],
  ['',             'ne', 'I0', '.Array', 'write_DOT'],
  ['',             'print', '" "'],
  ['',             'branch', 'write_NEXT'],
  ['write_DOT',    'print', '" . "'],
  ['',             'bsr', 'write_ENTRY'],
  ['write_KET',    'print', '")"'],
  ['',             'restore', 'P6'],
  ['',             'restore', 'P5'],
  ['write_RET0',   'restore', 'I0'],
  ['',             'ret'],
 ]
);

sub generate {
  my ($self, $name) = @_;

  die "$name: Unknown buildin\n" unless exists $built_ins{$name};

  for (@{$built_ins{$name}}) {
    my ($label, $op, @args) = @$_;
    $self->_add_inst ($label, $op, [ @args ]);
  }
}

1;
