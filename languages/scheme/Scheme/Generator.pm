package Scheme::Generator;

use strict;
use Data::Dumper;

sub _gensym {
  return sprintf "G%04d",shift->{gensym}++;
}

sub _add_inst {
  my $self = shift;
  push @{$self->{instruction}},[@_];
}

#------------------------------------

my $regs = {
  I => { map { $_ => 0 } (0..31) },
  N => { map { $_ => 0 } (0..31) },
  S => { map { $_ => 0 } (0..31) },
  P => { map { $_ => 0 } (0..31) },
};

sub _save {
  my $count = shift;
  my $type  = shift || 'I';
  die "No registers to save"
    unless $count and $count>0;
  die "Illegal register type"
    unless $type and $type=~/^[INPS]$/;
  my @temp;
  for(0..31) {
    next if $regs->{$type}{$_} == 1;
    last if $count<=0;
    push @temp,"$type$_";
    $regs->{$type}{$_}=1;
    $count--;
  }
  @temp;
}

sub _restore {
  die "Nothing to restore"
    unless defined @_;
  for(@_) {
    s/^(\w)//;
    die "Missing register type"
      unless defined $1;
    $regs->{$1}{$_}=0;
  }
}

#------------------------------------

my $type_map = {
  INTEGER  => [ 1, 'I' ],
  RATIONAL => [ 2, 'I' ],
  REAL     => [ 1, 'N' ],
  COMPLEX  => [ 2, 'I' ],
  STRING   => [ 1, 'S' ],
};

#------------------------------------

sub _op_constant {
  my ($self,$node) = @_;
  my ($num_registers,$type) = @{$type_map->{$node->{type}}};
  my @register = _save($num_registers,$type);
  for(@register) {
    $self->_add_inst('','set',[$_,$node->{value}]);
  }
  return $register[0];
}

sub _constant {
  my ($self,$value) = @_;
  return $self->_generate({value=>$value,type=>'INTEGER'});
}

#------------------------------------

#---- Section 4 ----

sub _op_quote {
}

sub _op_lambda {
}

sub _op_if {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = "I"._save(1,'I');
  my $cond = $self->_generate($node->{children}[0]);
  $self->_add_inst('','eq',[$cond,0,"FALSE_$label"]);
  my $true = $self->_generate($node->{children}[1]);
  $self->_add_inst('','set',[$return,$true]);
  $self->_add_inst('','branch',["DONE_$label"]);
  $self->_add_inst("FALSE_$label");
  _restore($true);
  _restore($cond);
  my $false = $self->_generate($node->{children}[2]);
  $self->_add_inst('','set',[$return,$false]);
  _restore($false);
  $self->_add_inst("DONE_$label");
  return $return;
}

sub _op_set_bang {
}

sub _op_cond {
}

sub _op_case {
}

sub _op_and {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);
  for(@{$node->{children}}) {
    my $temp = $self->_generate($_);
    $self->_add_inst(''         ,'eq' ,[$temp,0,"DONE_$label"]);
    _restore($temp);
  }
  $self->_add_inst(''           ,'set',[$return,1]);
  $self->_add_inst("DONE_$label");
  return $return;
}

sub _op_or {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(1);
  for(@{$node->{children}}) {
    my $temp = $self->_generate($_);
    $self->_add_inst(''         ,'eq' ,[$temp,1,"DONE_$label"]);
    _restore($temp);
  }
  $self->_add_inst(''           ,'set',[$return,0]);
  $self->_add_inst("DONE_$label");
  return $return;
}

sub _op_let {
}

sub _op_let_star {
}

sub _op_letrec {
}

sub _op_begin {
}

sub _op_do {
}

sub _op_delay {
}

sub _op_quasiquote {
}

#---- Section 6 ----

sub _op_not {
  my ($self,$node,$return) = @_;

  my @temp = _save(1);
  $self->_generate($node->{children}[0],$temp[0]);
  $self->_add_inst('','not',[$temp[0],$temp[0]]);
  $self->_add_inst('','and',[$return,$temp[0],1]);
  _restore(@temp);
}

sub _op_boolean_p {
}

sub _op_eqv_p {
}

sub _op_eq_p {
}

sub _op_equal_p {
}

sub _op_pair {
}

sub _op_cons {
}

sub _op_car {
}

sub _op_cdr {
}

sub _op_set_car {
}

sub _op_set_cdr {
}

sub _op_null {
}

sub _op_list_p {
}

sub _op_list {
}

sub _op_length {
}

sub _op_append {
}

sub _op_reverse {
}

sub _op_list_ref {
}

sub _op_memq {
}

sub _op_memv {
}

sub _op_member {
}

sub _op_assq {
}

sub _op_assv {
}

sub _op_assoc {
}

sub _op_symbol_p {
}

sub _op_symbol_string {
}

sub _op_string_symbol {
}

sub _op_number_p {
}

sub _op_complex_p {
}

sub _op_real_p {
}

sub _op_rational_p {
}

sub _op_integer_p {
}

sub _op_exact_p {
}

sub _op_inexact_p {
}

sub _op_eq {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);
  my $temp_0 = $self->_generate($node->{children}[0]);
  for(1..$#{$node->{children}}) {
    my $temp_1 = $self->_generate($node->{children}[1]);
    $self->_add_inst('','ne',[$temp_0,$temp_1,"DONE_$label"]);
    _restore($temp_1);
  }
  $self->_add_inst('','set',[$return,1]);
  $self->_add_inst("DONE_$label");
  _restore($temp_0);
  return $return;
}

sub _op_lt {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);
  my $temp_0 = $self->_generate($node->{children}[0]);
  for(1..$#{$node->{children}}) {
    my $temp_1 = $self->_generate($node->{children}[1]);
    $self->_add_inst('','ge',[$temp_0,$temp_1,"DONE_$label"]);
    _restore($temp_1);
  }
  $self->_add_inst('','set',[$return,1]);
  $self->_add_inst("DONE_$label");
  _restore($temp_0);
  return $return;
}

sub _op_gt {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);
  my $temp_0 = $self->_generate($node->{children}[0]);
  for(1..$#{$node->{children}}) {
    my $temp_1 = $self->_generate($node->{children}[1]);
    $self->_add_inst('','le',[$temp_0,$temp_1,"DONE_$label"]);
    _restore($temp_1);
  }
  $self->_add_inst('','set',[$return,1]);
  $self->_add_inst("DONE_$label");
  _restore($temp_0);
  return $return;
}

sub _op_leq {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);
  my $temp_0 = $self->_generate($node->{children}[0]);
  for(1..$#{$node->{children}}) {
    my $temp_1 = $self->_generate($node->{children}[1]);
    $self->_add_inst('','gt',[$temp_0,$temp_1,"DONE_$label"]);
    _restore($temp_1);
  }
  $self->_add_inst('','set',[$return,1]);
  $self->_add_inst("DONE_$label");
  _restore($temp_0);
  return $return;
}

sub _op_geq {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);
  my $temp_0 = $self->_generate($node->{children}[0]);
  for(1..$#{$node->{children}}) {
    my $temp_1 = $self->_generate($node->{children}[1]);
    $self->_add_inst('','lt',[$temp_0,$temp_1,"DONE_$label"]);
    _restore($temp_1);
  }
  $self->_add_inst('','set',[$return,1]);
  $self->_add_inst("DONE_$label");
  _restore($temp_0);
  return $return;
}

sub _op_zero_p {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);
  my @temp = _save(1);

  $self->_add_inst(''           ,'set'   ,[$return,1]);
  my $temp = $self->_generate($node->{children}[0]);
  $self->_add_inst(''           ,'eq'    ,[$temp,0,"DONE_$label"]);
  _restore($temp);
  $self->_add_inst(''           ,'set'   ,[$return,0]);
  $self->_add_inst("DONE_$label");
  return $return;
}

sub _op_positive_p {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(1);
  my $temp = $self->_generate($node->{children}[0]);
  $self->_add_inst(''           ,'gt'    ,[$temp,0,"DONE_$label"]);
  _restore($temp);
  $self->_add_inst(''           ,'set'   ,[$return,0]);
  $self->_add_inst("DONE_$label");
  return $return;
}

sub _op_negative_p {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(1);
  my $temp = $self->_generate($node->{children}[0]);
  $self->_add_inst(''           ,'lt'    ,[$temp,0,"DONE_$label"]);
  _restore($temp);
  $self->_add_inst(''           ,'set'   ,[$return,0]);
  $self->_add_inst("DONE_$label");
  return $return;
}

sub _op_odd_p {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  my $temp_0 = $self->_generate($node->{children}[0]);
  $return = $self->_constant(1);
  my $temp_1 = $self->_constant(2);
  $self->_add_inst(''           ,'mod'   ,[$temp_0,$temp_0,$temp_1]);
  $self->_add_inst(''           ,'eq'    ,[$temp_0,1,"DONE_$label"]);
  $self->_add_inst(''           ,'set'   ,[$return,0]);
  $self->_add_inst("DONE_$label");
  _restore($temp_0,$temp_1);
  return $return;
}

sub _op_even_p {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  my $temp_0 = $self->_generate($node->{children}[0]);
  $return = $self->_constant(1);
  my $temp_1 = $self->_constant(2);
  $self->_add_inst(''           ,'mod'   ,[$temp_0,$temp_0,$temp_1]);
  $self->_add_inst(''           ,'eq'    ,[$temp_0,0,"DONE_$label"]);
  $self->_add_inst(''           ,'set'   ,[$return,0]);
  $self->_add_inst("DONE_$label");
  _restore($temp_0,$temp_1);
  return $return;
}

sub _op_max {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_generate($node->{children}[0]);
  for(1..$#{$node->{children}}) {
    my $temp = $self->_generate($node->{children}[$_]);
    my $label = $self->_gensym();
    $self->_add_inst('','gt', [$return,$temp,"NEXT_$label"]);
    $self->_add_inst('','set',[$return,$temp]);
    $self->_add_inst("NEXT_$label");
    _restore($temp);
  }
  return $return;
}

sub _op_min {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_generate($node->{children}[0]);
  for(1..$#{$node->{children}}) {
    my $temp = $self->_generate($node->{children}[$_]);
    my $label = $self->_gensym();
    $self->_add_inst('','lt', [$return,$temp,"NEXT_$label"]);
    $self->_add_inst('','set',[$return,$temp]);
    $self->_add_inst("NEXT_$label");
    _restore($temp);
  }
  return $return;
}

sub _op_plus {
  my ($self,$node) = @_;
  my $return;
  my $num_children = defined $node->{children} ? @{$node->{children}} : 0;
  if($num_children==0) {
    $return = $self->_constant(0);
  } elsif($num_children==1) {
    $return = $self->_generate($node->{children}[0]);
  } else {
    $return = $self->_generate($node->{children}[0]);
    for(1..$#{$node->{children}}) {
      my $temp = $self->_generate($node->{children}[$_]);
      $self->_add_inst('','add',[$return,$return,$temp]);
      _restore($temp);
    }
  }
  return $return;
}

sub _op_minus {
  my ($self,$node) = @_;
  my $return;
  my $num_children = defined $node->{children} ? @{$node->{children}} : 0;

  if($num_children==0) {
    $return = $self->_constant(0);
  } elsif($num_children==1) {
    $return = $self->_generate($node->{children}[0]);
    my $temp   = $self->_constant(0);
    $self->_add_inst('','sub',[$return,$temp,$return]);
    _restore($temp);
  } else {
     $return = $self->_generate($node->{children}[0]);
     for(1..$#{$node->{children}}) {
       my $temp = $self->_generate($node->{children}[$_]);
       $self->_add_inst('','sub',[$return,$return,$temp]);
       _restore($temp);
     }
  }
  return $return;
}

sub _op_times {
  my ($self,$node) = @_;
  my $return;
  my $num_children = defined $node->{children} ? @{$node->{children}} : 0;

  if($num_children==0) {
    $return = $self->_constant(0);
  } elsif($num_children==1) {
    $return = $self->_generate($node->{children}[0]);
  } else {
    $return = $self->_generate($node->{children}[0]);
    for(1..$#{$node->{children}}) {
      my $temp = $self->_generate($node->{children}[$_]);
      $self->_add_inst('','mul',[$return,$return,$temp]);
      _restore($temp);
    }
  }
  return $return;
}

sub _op_divide {
  my ($self,$node) = @_;
  my $return;
  my $num_children = defined $node->{children} ? @{$node->{children}} : 0;

  if($num_children==0) {
    $return = $self->_constant(0);
  } elsif($num_children==1) {
    $return = $self->_generate($node->{children}[0]);
    my $temp = $self->_constant(1);
    $self->_add_inst('','div',[$return,$temp,$return]);
    _restore($temp);
  } else {
    $return = $self->_generate($node->{children}[0]);
    for(1..$#{$node->{children}}) {
      my $temp = $self->_generate($node->{children}[$_]);
      $self->_add_inst('','div',[$return,$return,$temp]);
      _restore($temp);
    }
  }
  return $return;
}

sub _op_abs {
  my ($self,$node) = @_;
  my $return;
  my $label     = $self->_gensym();

  $return = $self->_generate($node->{children}[0]);
  $self->_add_inst('',           'gt', [$return,0,"DONE_$label"]);
  my $temp = $self->_constant(-1);
  $self->_add_inst('',           'mul',[$return,$return,$temp]);
  _restore($temp);
  $self->_add_inst("DONE_$label");
  return $return;
}

sub _op_quotient {
}

sub _op_remainder {
}

sub _op_modulo {
}

sub _op_gcd {
}

sub _op_lcm {
}

sub _op_numerator {
}

sub _op_denominator {
}

sub _op_floor {
}

sub _op_ceiling {
}

sub _op_truncate {
}

sub _op_round {
}

sub _op_rationalize {
}

sub _op_exp {
}

sub _op_log {
}

sub _op_sin {
}

sub _op_cos {
}

sub _op_tan {
}

sub _op_asin {
}

sub _op_acos {
}

sub _op_atan {
}

sub _op_sqrt {
}

sub _op_expt {
}

sub _op_make_rectangular {
}

sub _op_make_point {
}

sub _op_real_part {
}

sub _op_imag_part {
}

sub _op_magnitude {
}

sub _op_angle {
}

sub _op_exact_inexact {
}

sub _op_inexact_exact {
}

sub _op_number_string {
}

sub _op_string_number {
}

sub _op_char_p {
}

sub _op_char_eq_p {
}

sub _op_char_lt_p {
}

sub _op_char_gt_p {
}

sub _op_char_le_p {
}

sub _op_char_ge_p {
}

sub _op_char_ci_eq_p {
}

sub _op_char_ci_lt_p {
}

sub _op_char_ci_gt_p {
}

sub _op_char_ci_le_p {
}

sub _op_char_ci_ge_p {
}

sub _op_char_alphabetic_p {
}

sub _op_char_numeric_p {
}

sub _op_char_whitespace_p {
}

sub _op_char_upper_case_p {
}

sub _op_char_lower_case_p {
}

sub _op_char_integer {
}

sub _op_integer_char {
}

sub _op_char_upcase {
}

sub _op_char_downcase {
}

sub _op_string_p {
}

sub _op_make_string {
}

sub _op_string {
}

sub _op_string_length {
}

sub _op_string_ref {
}

sub _op_string_set_bang {
}

sub _op_string_eq_p {
}

sub _op_string_lt_p {
}

sub _op_string_gt_p {
}

sub _op_string_le_p {
}

sub _op_string_ge_p {
}

sub _op_string_ci_eq_p {
}

sub _op_string_ci_lt_p {
}

sub _op_string_ci_gt_p {
}

sub _op_string_ci_le_p {
}

sub _op_string_ci_ge_p {
}

sub _op_substring {
}

sub _op_string_append {
}

sub _op_string_list {
}

sub _op_list_string {
}

sub _op_string_copy {
}

sub _op_string_fill_bang {
}

sub _op_vector_p {
}

sub _op_make_vector {
}

sub _op_vector {
}

sub _op_vector_length {
}

sub _op_vector_ref {
}

sub _op_vector_set_bang {
}

sub _op_vector_list {
}

sub _op_list_vector {
}

sub _op_vector_fill_bang {
}

sub _op_procedure_p {
}

sub _op_apply {
}

sub _op_map {
}

sub _op_for_each {
}

sub _op_force {
}

sub _op_call_with_current_continuation {
}

sub _op_call_with_input_file {
}

sub _op_call_with_output_file {
}

sub _op_input_port_p {
}

sub _op_output_port_p {
}

sub _op_current_input_port {
}

sub _op_current_output_port {
}

sub _op_with_input_to_file {
}

sub _op_with_output_from_file {
}

sub _op_open_input_file {
}

sub _op_open_output_file {
}

sub _op_close_input_port {
}

sub _op_close_output_port {
}

sub _op_read {
}

sub _op_read_char {
}

sub _op_peek_char {
}

sub _op_eof_object_p {
}

sub _op_char_ready_p {
}

sub _op_write {
  my ($self,$node) = @_;
  for(@{$node->{children}}) {
    my $temp = $self->_generate($_);
    $self->_add_inst('','print',[$temp]);
    _restore($temp);
  }
}

sub _op_display {
}

sub _op_newline {
}

sub _op_write_char {
}

sub _op_load {
}

sub _op_transcript_on {
}

sub _op_transcript_off {
}

sub _op_let_syntax {
}

sub _op_letrec_syntax {
}

sub _op_define_syntax {
}

sub _op_syntax_rules {
}

sub _op_syntax {
}

sub _op_identifier_p {
}

sub _op_unwrap_syntax {
}

sub _op_free_identifier_eq_p {
}

sub _op_bound_identifier_eq_p {
}

sub _op_identifier_symbol {
}

sub _op_generate_identifier {
}

sub _op_construct_identifier {
}

#------------------------------------------------------------------------------

my %global_ops = (

  'CONSTANT'   => \&_op_constant,

#----------------------
#
# Section 4 Expressions
#
#----------------------

  'quote'      => \&_op_quote,
  'lambda'     => \&_op_lambda,
  'if'         => \&_op_if,
  'set!'       => \&_op_set_bang,
  'cond'       => \&_op_cond,
  'case'       => \&_op_case,
  'and'        => \&_op_and,
  'or'         => \&_op_or,
  'let'        => \&_op_let,
  'let*'       => \&_op_let_star,
  'letrec'     => \&_op_letrec,
  'begin'      => \&_op_begin,
  'do'         => \&_op_do,
  'delay'      => \&_op_delay,
  'quasiquote' => \&_op_quasiquote,

#----------------------
#
# Section 6 Expressions
#
#----------------------

###
### Logical expression
###

  'not' => \&_op_not,

###
### Equivalency
###

  'boolean' => \&_op_boolean_p,
  'eqv?'    => \&_op_eqvp,
  'eq?'     => \&_op_eqp,
  'equal?'  => \&_op_equalp,

###
### Pairs and Lists
###

  'pair?'    => \&_op_pair_p,
  'cons'     => \&_op_cons,
  'car'      => \&_op_car,
  'cdr'      => \&_op_cdr,
  'set-car!' => \&_op_set_car_bang,
  'set-cdr!' => \&_op_set_cdr_bang,
  # Not adding caar/cadr/cdar/whatever
  'null?'    => \&_op_null_p,
  'list?'    => \&_op_list_p,
  'list'     => \&_op_list,
  'length'   => \&_op_length,
  'append'   => \&_op_append,
  'reverse'  => \&_op_reverse,
  'list-ref' => \&_op_list_ref,
  'memq'     => \&_op_memq,
  'memv'     => \&_op_memv,
  'member'   => \&_op_member,
  'assq'     => \&_op_assq,
  'assv'     => \&_op_assv,
  'assoc'    => \&_op_assoc,

###
### Symbols
###

  'symbol?'        => \&_op_symbol_p,
  'symbol->string' => \&_op_symbol_string,
  'string->symbol' => \&_op_string_symbol,
    
###
### Numerics
###

  'number?'          => \&_op_number_p,
  'complex?'         => \&_op_complex_p,
  'real?'            => \&_op_real_p,
  'rational?'        => \&_op_rational_p,
  'integer?'         => \&_op_integer_p,
  'exact?'           => \&_op_exact_p,
  'inexact?'         => \&_op_inexact_p,
  '='                => \&_op_eq,
  '<'                => \&_op_lt,
  '>'                => \&_op_gt,
  '<='               => \&_op_leq,
  '>='               => \&_op_geq,
  'zero?'            => \&_op_zero_p,
  'positive?'        => \&_op_positive_p,
  'negative?'        => \&_op_negative_p,
  'odd?'             => \&_op_odd_p,
  'even?'            => \&_op_even_p,
  'max'              => \&_op_max,
  'min'              => \&_op_min,
  '+'                => \&_op_plus,
  '-'                => \&_op_minus,
  '*'                => \&_op_times,
  '/'                => \&_op_divide,
  'abs'              => \&_op_abs,
  'quotient'         => \&_op_quotient,
  'remainder'        => \&_op_remainder,
  'modulo'           => \&_op_modulo,
  'gcd'              => \&_op_gcd,
  'lcm'              => \&_op_lcm,
  'numerator'        => \&_op_numerator,
  'denominator'      => \&_op_denominator,
  'floor'            => \&_op_floor,
  'ceiling'          => \&_op_ceiling,
  'truncate'         => \&_op_truncate,
  'round'            => \&_op_round,
  'rationalize'      => \&_op_rationalize,
  'exp'              => \&_op_exp,
  'log'              => \&_op_log,
  'sin'              => \&_op_sin,
  'cos'              => \&_op_cos,
  'tan'              => \&_op_tan,
  'asin'             => \&_op_asin,
  'acos'             => \&_op_acos,
  'atan'             => \&_op_atan,
  'sqrt'             => \&_op_sqrt,
  'expt'             => \&_op_expt,
  'make-rectangular' => \&_op_make_rectangular,
  'make-polar'       => \&_op_make_point,
  'real-part'        => \&_op_real_part,
  'imag-part'        => \&_op_imag_part,
  'magnitude'        => \&_op_magnitude,
  'angle'            => \&_op_angle,
  'exact->inexact'   => \&_op_exact_inexact,
  'inexact->exact'   => \&_op_inexact_exact,

###
### Numerical input and output
###

  'number->string' => \&_op_number_string,
  'string->number' => \&_op_string_number,

###
### Character
###

  'char?'            => \&_op_char_p,
  'char=?'           => \&_op_char_eq_p,
  'char<?'           => \&_op_char_lt_p,
  'char>?'           => \&_op_char_gt_p,
  'char<=?'          => \&_op_char_le_p,
  'char>=?'          => \&_op_char_ge_p,
  'char-ci=?'        => \&_op_char_eq_p,
  'char-ci<?'        => \&_op_char_ci_lt_p,
  'char-ci>?'        => \&_op_char_ci_gt_p,
  'char-ci<=?'       => \&_op_char_ci_le_p,
  'char-ci>=?'       => \&_op_char_ci_ge_p,
  'char-alphabetic?' => \&_op_char_alphabetic_p,
  'char-numeric?'    => \&_op_char_numeric_p,
  'char-whitespace?' => \&_op_char_whitespace_p,
  'char-upper-case?' => \&_op_char_upper_case_p,
  'char-lower-case?' => \&_op_char_lower_case_p,
  'char->integer'    => \&_op_char_integer,
  'integer->char'    => \&_op_integer_char,
  'char-upcase'      => \&_op_char_upcase,
  'char-downcase'    => \&_op_char_downcase,

###
### Strings
###

  'string?'       => \&_op_string_p,
  'make-string'   => \&_op_make_string,
  'string'        => \&_op_string,
  'string-length' => \&_op_string_length,
  'string-ref'    => \&_op_string_ref,
  'string-set!'   => \&_op_string_set_bang,
  'string=?'      => \&_op_string_eq_p,
  'string<?'      => \&_op_string_lt_p,
  'string>?'      => \&_op_string_gt_p,
  'string<=?'     => \&_op_string_le_p,
  'string>=?'     => \&_op_string_ge_p,
  'string-ci=?'   => \&_op_string_ci_eq_p,
  'string-ci<?'   => \&_op_string_ci_lt_p,
  'string-ci>?'   => \&_op_string_ci_gt_p,
  'string-ci<=?'  => \&_op_string_ci_le_p,
  'string-ci>=?'  => \&_op_string_ci_ge_p,
  'substring'     => \&_op_substring,
  'string-append' => \&_op_string_append,
  'string->list'  => \&_op_string_list,
  'list->string'  => \&_op_list_string,
  'string-copy'   => \&_op_string_copy,
  'string-fill!'  => \&_op_string_fill_bang,

###
### Vector
###

  'vector?'       => \&_op_vector_p,
  'make-vector'   => \&_op_make_vector,
  'vector'        => \&_op_vector,
  'vector-length' => \&_op_vector_length,
  'vector-ref'    => \&_op_vector_ref,
  'vector-set!'   => \&_op_vector_set_bang,
  'vector->list'  => \&_op_vector_list,
  'list->vector'  => \&_op_list_vector,
  'vector-fill!'  => \&_op_vector_fill_bang,

###
### Control features
###

  'procedure?'                      => \&_op_procedure_p,
  'apply'                           => \&_op_apply,
  'map'                             => \&_op_map,
  'for-each'                        => \&_op_for_each,
  'force'                           => \&_op_force,
  'call-with-currrent-continuation' => \&_op_call_with_current_continuation,

###
### Input and Output
###

####
#### Ports
####

  'call-with-input-file'  => \&_op_call_with_input_file,
  'call-with-output-file' => \&_op_call_with_output_file,
  'input-port?'           => \&_op_input_port_p,
  'output-port?'          => \&_op_output_port_p,
  'current-input-port'    => \&_op_current_input_port,
  'current-output-port'   => \&_op_current_output_port,
  'with-input-to-file'    => \&_op_with_input_to_file,
  'with-output-from-file' => \&_op_with_output_from_file,
  'open-input-file'       => \&_op_open_input_file,
  'open-output-file'      => \&_op_open_output_file,
  'close-input-port'      => \&_op_close_input_port,
  'close-output-port'     => \&_op_close_output_port,

####
#### Input
####

  'read' => \&_op_read,
  'read-char' => \&_op_read_char,
  'peek-char' => \&_op_peek_char,
  'eof-object?' => \&_op_eof_object_p,
  'char-ready?' => \&_op_char_ready_p,
  'write' => \&_op_write,
  'display' => \&_op_display,
  'newline' => \&_op_newline,
  'write-char' => \&_op_write_char,

####
#### System Interface
####

  'load'           => \&_op_load,
  'transcript-on'  => \&_op_transcript_on,
  'transcript-off' => \&_op_transcript_off,

#--------------------
#
# Macros
#
#--------------------

  'let-syntax'          => \&_op_let_syntax,
  'letrec-syntax'       => \&_op_letrec_syntax,
  'define-syntax'       => \&_op_define_syntax,
  'syntax-rules'        => \&_op_syntax_rules,
  'let-syntax'          => \&_op_let_syntax,
  'syntax'              => \&_op_syntax,
  'identifer?'          => \&_op_identifier_p,
  'unwrap-syntax'       => \&_op_unwrap_syntax,
  'bound-identfier=?'   => \&_op_bound_identifier_eq_p,
  'identifier->symbol'  => \&_op_identifier_symbol,
  'free-identfier=?'    => \&_op_free_identifier_eq_p,
  'generate-identfier'  => \&_op_generate_identifier,
  'construct-identfier' => \&_op_construct_identifier,
);

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

sub prettyprint {
  my $node  = shift;
  my $depth = shift;

  print ' ' x $depth; print "($node->{value}\n";
  if(defined $node->{children}) {
    for(@{$node->{children}}) {
      prettyprint($_,$depth+1);
    }
  }
  print ' ' x $depth; print ")\n";
}

sub _generate {
  my ($self,$node) = @_;
  my $return;

  if($node->{value} =~ /\d/) {
    $return = $global_ops{CONSTANT}->($self,$node);
  } else {
    $return = $global_ops{$node->{value}}->($self,$node);
  }
  $return;
}

sub generate {
  my $self = shift;
  my @temp = _save(1);
  $self->_generate($self->{tree},$temp[0]);
#die Dumper($self->{tree});
  _restore(@temp);
  $self->_add_inst('',"end");
  $self->_format_columns();
}

1;
__END__

=head1 NAME

Scheme::Generator - The Scheme code generator

=head1 SYNOPSIS

  use Scheme:Generator;

  my @code = Scheme::Generator->new($code_tree)->generate();

=head1 DESCRIPTION

The code generator reads in a tree structure, and walks that to generate the
output.

=head1 AUTHOR

Jeffrey Goff, jgoff@speakeasy.net

=head1 SEE ALSO

L<Scheme>, L<Scheme::Tokenizer>

=cut
