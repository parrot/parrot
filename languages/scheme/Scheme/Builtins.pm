package Scheme::Builtins;

use strict;

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
 apply =>
 [['# apply Function',''],
  ['apply_ENTRY',  'set', 'P7', 'P5[0]'],
  ['',             'push_pad', 'P7'],
  ['',             'new_pad', '-1'],
  ['',             'set', 'P7', 'P5[2]'],
  ['apply_NEXT',   'typeof', 'I0', 'P6'],
  ['',             'eq', 'I0', '.PerlUndef', 'apply_LAST'],
  ['',             'set', 'S0', 'P7[0]'],
  ['',             'set', 'P8', 'P6[0]'],
  ['',             'store_lex', '-1', 'S0', 'P8'],
  ['',             'set', 'P6', 'P6[1]'],
  ['',             'set', 'P7', 'P7[1]'],
  ['',             'branch', 'apply_NEXT'],
  ['apply_LAST',   'set', 'I0', 'P5[1]'],
  ['',             'jump', 'I0'],
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
