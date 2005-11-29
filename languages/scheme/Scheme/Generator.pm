# $Id$

package Scheme::Generator;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
use Carp;

$VERSION   = '0.01';
@ISA       = qw(Exporter);
@EXPORT_OK = qw(generate);

use Data::Dumper;
use Scheme::Builtins;

sub _gensym {
  return sprintf "G%04d",shift->{gensym}++;
}

sub _add_inst {
  my $self = shift;
  push @{$self->{instruction}},[@_];
}

#------------------------------------

sub _new_regs {
     return
  {
    I => { map { $_ => 0 } (0..31) },
    N => { map { $_ => 0 } (0..31) },
    S => { map { $_ => 0 } (0..31) },
    P => { map { $_ => 0 } (0..31) },
  };
};

sub _save {
  my $self  = shift;
  my $count = shift;
  my $type  = shift || 'I';

  die "No registers to save"
    unless $count and $count>0;
  die "Illegal register type"
    unless $type and $type=~/^[INPS]$/;
  my @temp;
  for(0..31) {
    next if $self->{regs}->{$type}{$_} == 1;
    last if $count<=0;
    push @temp,"$type$_";
    $self->{regs}->{$type}{$_}=1;
    $count--;
  }
  @temp;
}

sub _save_set {
  my $self = shift;
  my %regs = %{$self->{regs}};
  for my $type (keys %regs) {
    for my $count (0..31) {
      $self->_add_inst ('', 'save', ["$type$count"])
	if $regs{$type}->{$count};
    }
  }
}

sub _save_1 {
  my $self = shift;
  my $type = shift || 'I';
  my @temp = $self->_save(1, $type);
  $temp[0];
}

sub _restore {
  my $self = shift;

  die "Nothing to restore"
    unless defined @_;
  foreach my $reg (@_) {
    next if grep { $_ eq $reg } qw (none);
    $reg =~ /^(\w)(\d+)/;
    die "Missing register type"
      unless defined $1;
    if ($self->{regs}->{$1}{$2}) {
      $self->{regs}->{$1}{$2} = 0;
    }
  }
}

sub _restore_set {
  my $self = shift;
  my %regs = %{$self->{regs}};

  for my $type (reverse keys %regs) {
    for (my $count=31; $count>=0; $count--) {
      $self->_add_inst ('','restore',["$type$count"])
	if $regs{$type}->{$count};
    }
  }
}

sub _num_arg {
  my ($node, $expected, $name) = @_;

  my $args = scalar @{$node->{children}} - 1;

  confess "$name: Wrong number of arguments (expected $expected, got $args).\n"
    if ($args != $expected);
}

sub _get_arg {
  my ($node, $num) = @_;
  $node->{children}->[$num];
}

sub _get_args {
  my ($node, $num) = @_;
  $num = 1 unless defined $num;

  my @args = splice @{$node->{children}}, $num;

  return @args;
}

# until there is a working find_lex/store_lex
sub _find_lex {
  my ($self, $symbol) = @_;
  my $return = $self->_save_1 ('P');
  $self->_add_inst ('','find_lex',[$return,"\"$symbol\""]);

  return $return;
}

sub _store_lex {
  my ($self, $symbol,$value) = @_;
  $self->_add_inst ('','store_lex',["\"$symbol\"",$value]);
}

sub _new_lex {
  my ($self, $symbol, $value) = @_;
  $self->_add_inst ('','store_lex',[-1,"\"$symbol\"",$value]);
  $self->{scope}->{$symbol} = $value;
}

sub _new_pair {
  my ($self) = @_;
  my $return = $self->_save_1('P');

  $self->_add_inst('', 'new', [$return,'.Array']);
  $self->_add_inst('', 'set', [$return, 2]);

  return $return;
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

sub _constant {
  my ($self, $value) = @_;
  my $return;

  if ($value =~ /^[-+]?\d+$/) {
    $return = $self->_save_1 ('I');
    $self->_add_inst ('', 'set', [$return,$value]);
  }
  elsif ($value =~ /^[-+]?((\d+\.\d*)|(\.d+))([eE][-+]?\d+)?$/) {
    $return = $self->_save_1 ('N');
    $self->_add_inst ('', 'set', [$return,$value]);
  }
  else {
    $return = $self->_save_1 ('I');
    $self->_add_inst ('', 'set', [$return,0]);
  }

  return $return;
}

sub _morph {
  my ($self, $to, $from) = @_;

  if ($to =~ /P/) {
    if ($from =~ /P/) {
      $self->_add_inst ('', 'clone',[$to,$from]);
    } elsif ($from =~ /I/) {
      $self->_add_inst ('', 'new',[$to,'.PerlInt']);
      $self->_add_inst ('', 'set',[$to,$from]);
    } elsif ($from =~ /N/) {
      $self->_add_inst ('', 'new',[$to,'.PerlNum']);
      $self->_add_inst ('', 'set',[$to,$from]);
    }
  }
}

#---- Section 4 ----

sub __quoted {
  my ($self, $node, $return, $special) = @_;

  if (exists $node->{value}) {
    my $value = $node->{value};
    if ($value =~ /^[-+]?\d+$/) {
      $self->_add_inst ('', 'new',[$return,'.PerlInt']);
      $self->_add_inst ('', 'set',[$return,$value]);
    }
    elsif ($value =~ /^[-+]?((\d+\.\d*)|(\.d+))([eE][-+]?\d+)?$/) {
      $self->_add_inst ('', 'new',[$return,'.PerlNum']);
      $self->_add_inst ('', 'set',[$return,$value]);
    }
    else { # assume its a symbol
      $self->_add_inst ('', 'new',[$return,'.PerlString']);
      $self->_add_inst ('', 'set',[$return,"\"$value\""]);
    }
  }
  elsif (exists $node->{children}) {
    my $children = $node->{children};
 
    $self->_add_inst ('', 'new', [$return,'.PerlUndef']);
    for (reverse @$children) {
      if (exists $_->{children}) {
        my $arg0 = _get_arg($_, 0);
        if (exists $arg0->{value}) {
          my $value = $arg0->{value};
          if (exists $special->{$value}) {
            _num_arg($_, 1);
            $special->{$value}->($self, _get_arg($_, 1), $return);
            next;
          }
        }
      }
      my $item = $self->_save_1 ('P');

      __quoted ($self, $_, $item, $special);

      my $pair = $self->_new_pair();

      $self->_add_inst ('', 'set', [$pair.'[0]',$item]);
      $self->_add_inst ('', 'set', [$pair.'[1]',$return]);
      $self->_add_inst ('', 'set', [$return,$pair]);
      $self->_restore ($item, $pair);
    }
  }

  return $return;
}

sub _op_quote {
  my ($self, $node) = @_;
  my $return = $self->_save_1 ('P');

  _num_arg ($node, 1, 'quote');

  my $item = _get_arg($node,1);

  return __quoted ($self, $item, $return, {});
}

sub _op_quasiquote {
  my ($self, $node) = @_;
  my $return = $self->_save_1 ('P');
  my $special = { 
		  unquote => \&_qq_unquote,
		  'unquote-splicing' => \&_qq_unquote_splicing
		};

  _num_arg ($node, 1, 'quote');

  my $item = _get_arg($node,1);

  __quoted ($self, $item, $return, $special);
}

# helper functions for quasiquote

sub _qq_unquote {
  my ($self, $node, $return) = @_;

  my $item = $self->_generate($node);

  if ($item =~ /^[INS]/) {
    my $temp = $self->_save_1('P');
    $self->_morph($temp, $item);
    $self->_restore($item);
    $item = $temp;
  }
  my $pair = $self->_new_pair;
  $self->_add_inst('', 'set', [$pair.'[0]',$item]);
  $self->_add_inst('', 'set', [$pair.'[1]',$return]);
  $self->_add_inst('', 'set', [$return,$pair]);
  $self->_restore($item, $pair);

  return $return;
}

sub _qq_unquote_splicing {
  my ($self, $node, $return) = @_;

  my $list = $self->_generate($node);

  die "unquote-splicing called on no list" if ($list =~ /^[INS]/);

  my $type = $self->_save_1('I');
  my $head = $self->_save_1('P');
  my $label = $self->_gensym;

  # check for empty list
  $self->_add_inst('', 'typeof', [$type, $list]);
  $self->_add_inst('', 'eq', [$type,'.PerlUndef',"DONE_$label"]);

  my $copy = $self->_new_pair;

  $self->_add_inst('', 'set', [$head, $copy]);

  # maybe ensure that $type is a pair here
  my $temp = $self->_save_1('P');
  $self->_add_inst("ITER_$label", 'set', [$temp,$list.'[0]']);
  $self->_add_inst('', 'set', [$copy.'[0]',$temp]);
  $self->_restore($temp);

  $self->_add_inst('', 'set', [$list,$list.'[1]']);
  $self->_add_inst('', 'typeof', [$type,$list]);
  $self->_add_inst('', 'eq', [$type,'.PerlUndef',"FINISH_$label"]);

  $temp = $self->_new_pair;
  $self->_add_inst('', 'set', [$copy.'[1]',$temp]);
  $self->_add_inst('', 'set', [$copy,$temp]);
  $self->_add_inst('', 'branch', ["ITER_$label"]);
  $self->_restore($temp);

  # append the rest to the end of list
  $self->_add_inst("FINISH_$label", 'set', [$copy.'[1]',$return]);
  $self->_add_inst('', 'set', [$return,$head]);
  $self->_add_inst("DONE_$label");

  $self->_restore($list, $copy, $head, $type);
  return $return;
}

sub _op_lambda {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();
  my $temp;

  $return = $self->_save_1 ('P');

  $self->_add_inst ('', 'newsub',[$return,'.Closure',"LAMBDA_$label"]);

  $self->_add_inst ('', 'branch',["DONE_$label"]);
  $self->_add_inst ("LAMBDA_$label");

  # caller saved => start a new frame
  push @{$self->{frames}}, $self->{regs};
  $self->{regs} = _new_regs;
  # P1 is the return contination
  $self->{regs}{P}{1} = 1;
  
  # expand the lexical scope
  $self->_add_inst('', '# new_pad', [-1]);
  my $oldscope = $self->{scope};
  $self->{scope} = { '*UP*' => $oldscope };

  my $num = 5;
  my @args = @{_get_arg($node,1)->{children}};
  for (@args) {
    my $arg = $_->{value};
    $self->_new_lex($arg, "P$num");
    $num++
  }

  $temp = 'none';
  for (_get_args($node,2)) {
    $self->_restore ($temp);
    $temp = $self->_generate($_);
  }

  $self->_add_inst('', 'set', ['P5', $temp]);

  $self->_add_inst('', '# pop_pad');
  $self->_add_inst('', 'returncc');
  $self->_add_inst("DONE_$label");

  $self->{regs} = pop @{$self->{frames}};
  $self->{scope} = $self->{scope}->{'*UP*'};

  return $return;
}

sub _op_if {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  my $cond = $self->_generate(_get_arg($node,1));
  $self->_add_inst('','eq',[$cond,0,"FALSE_$label"]);
  $self->_restore($cond);
  $return = $self->_save_1 ('P');

  my $true = $self->_generate(_get_arg($node,2));
  $self->_morph($return,$true);
  $self->_add_inst('','branch',["DONE_$label"]);
  $self->_restore($true);

  $self->_add_inst("FALSE_$label");
  my $false = $self->_generate(_get_arg($node,3));
  $self->_morph($return,$false);
  $self->_restore($false);

  $self->_add_inst("DONE_$label");
  return $return;
}

sub _op_define {
  my ($self, $node) = @_;

  _num_arg ($node, 2, 'define');

  my ($symbol, $lambda, $value);

  if (exists _get_arg($node,1)->{children}) {
    my @formals;
    ($symbol, @formals) = @{_get_arg($node,1)->{children}};
    $symbol = $symbol->{value};
    $lambda = { children => [ { value => 'lambda' },
                              { children => [ @formals ] },
                              _get_args ($node, 2) ] };
  }
  else {
    $symbol = _get_arg($node,1)->{value};
    $lambda = _get_arg($node,2);
  }

  if (exists $self->{scope}->{$symbol}) {
    die "define: $symbol is already defined\n";
  }
  else {
    $self->{scope}->{$symbol} = '*unknown*';
  }

  $value = $self->_generate($lambda);

  if ($value !~ /^P/) {
    my $pmc = $self->_save_1 ('P');
    $self->_morph ($pmc, $value);
    $self->_restore ($value);
    $value = $pmc;
  }

  $self->_new_lex ($symbol,$value);

  return $value;
}

sub _op_set_bang {
  my ($self, $node) = @_;

  _num_arg ($node, 2, 'set!');

  my $symbol = _get_arg ($node, 1)->{value};
  my $temp = $self->_generate(_get_arg($node,2));
  if ($temp !~ /^P/) {
    my $pmc = $self->_save_1 ('P');
    $self->_morph ($pmc, $temp);
    $self->_restore ($temp);
    $temp = $pmc;
  }
  $self->_store_lex ($symbol,$temp);

  return $temp;
}

sub _op_cond {
  my ($self, $node) = @_;

  my @clauses = _get_args($node);

  my $transnode;

  if ($clauses[-1]->{children}->[0]->{value} eq 'else') {
    my $elseclause = pop @clauses;
    $transnode = { children => [ { value => 'begin'},
				 _get_args($elseclause) ] };
  }
  else {
    $transnode = { value => '#f' };
  }

  for my $clause ( reverse @clauses ) {
    $transnode = { children => [ { value => 'if' },
				 _get_arg($clause,0),
				 { children => [ { value => 'begin' },
						 _get_args($clause,1) ] },
				 $transnode ] };
  }

  $self->_generate($transnode);
}

sub _op_case {
}

sub _op_and {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);
  for(_get_args($node)) {
    my $temp = $self->_generate($_);
    $self->_add_inst(''         ,'eq' ,[$temp,0,"DONE_$label"]);
    $self->_restore($temp);
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
  for(_get_args($node)) {
    my $temp = $self->_generate($_);
    $self->_add_inst(''         ,'eq' ,[$temp,1,"DONE_$label"]);
    $self->_restore($temp);
  }
  $self->_add_inst(''           ,'set',[$return,0]);
  $self->_add_inst("DONE_$label");
  return $return;
}

sub _op_let {
  my ($self, $node) = @_;
  my $return;

  my ($locals, @body) = _get_args ($node,1);
  my (@variables, @values);
  for (@{$locals->{children}}) {
    _num_arg ($_, 1, 'let locals');
    my ($var, $val) = _get_args ($_, 0);
    push @variables, $var;
    push @values, $val;
  }

  my $let = { children => [
			   { children => [ { value => 'lambda' },
					   { children => [ @variables ] },
					   @body ]},
			   @values
			  ]};

  $return = $self->_generate($let);

  return $return;
}

sub _op_let_star {
}

sub _op_letrec {
}

sub _op_begin {
  my ($self, $node) = @_;
  my $temp = 'none';

  my @args = _get_args ($node);

  for (@args) {
    $self->_restore ($temp);
    $temp = $self->_generate ($_);
  }
  return $temp;
}

sub _op_do {
}

sub _op_delay {
}

#---- Section 6 ----

sub _op_not {
  my ($self,$node) = @_;

  my $return = $self->_save_1 ('I');
  $self->_generate(_get_arg($node,1));
  $self->_add_inst('','not',[$return,$return]);

  $return;
}

sub _op_boolean_p {
}

sub _op_eqv_p {
}

sub _op_eq_p {
}

sub _op_equal_p {
}

sub _op_pair_p {
  my ($self, $node) = @_;
  my $return;
  my $label = $self->_gensym();

  _num_arg ($node, 1, 'pair?');

  my $item = $self->_generate(_get_arg($node,1));

  $return = $self->_save_1 ('I');

  if ($item =~ /^[INS]/) {
    $self->_add_inst ('', 'set', [$return,0]);
  }
  else {
    $self->_add_inst ('', 'typeof', [$return,$item]);
    $self->_add_inst ('', 'ne', [$return,'.Array',"FAIL_$label"]);
    $self->_add_inst ('', 'set', [$return,$item]);
    $self->_add_inst ('', 'ne', [$return,2,"FAIL_$label"]);
    $self->_add_inst ('', 'set', [$return,1]);
    $self->_add_inst ('', 'branch', ["DONE_$label"]);
    $self->_add_inst ("FAIL_$label", 'set', [$return,0]);
    $self->_add_inst ("DONE_$label");
  }

  return $return;
}

sub _op_cons {
  my ($self, $node) = @_;
  my $return;

  _num_arg ($node, 2, 'cons');

  my $car = $self->_generate(_get_arg($node,1));
  $return = $self->_save_1('P');

  $self->_add_inst ('', 'new', [$return,'.Array']);
  $self->_add_inst ('', 'set', [$return,2]);
  $self->_add_inst ('', 'set', [$return.'[0]',$car]);
  $self->_restore ($car);

  my $cdr = $self->_generate(_get_arg($node,2));
  $self->_add_inst ('', 'set', [$return.'[1]', $cdr]);
  $self->_restore ($cdr);

  return $return;
}

sub _op_car {
  my ($self, $node) = @_;

  _num_arg ($node, 1, 'car');

  my $return = $self->_generate (_get_arg($node,1));
  die "car: Element not pair\n" unless $return =~ /^P/;
  $self->_add_inst ('', 'set', [$return,$return.'[0]']);

  return $return;
}

sub _op_cdr {
  my ($self, $node) = @_;

  _num_arg ($node, 1, 'cdr');

  my $return = $self->_generate (_get_arg($node,1));
  die "cdr: Element not pair\n" unless $return =~ /^P/;
  $self->_add_inst ('', 'set', [$return,$return.'[1]']);

  return $return;
}

sub _op_set_car_bang {
  my ($self, $node) = @_;

  _num_arg ($node, 2, 'set-car!');

  my $return = $self->_generate (_get_arg($node,1));
  die "set-car!: Element not pair\n" unless $return =~ /^P/;
  my $value = $self->_generate (_get_arg($node,2));
  $self->_add_inst ('', 'set', [$return.'[0]',$value]);
  $self->_restore ($value);

  return $return;
}

sub _op_set_cdr_bang {
  my ($self, $node) = @_;

  _num_arg ($node, 2, 'set-cdr!');

  my $return = $self->_generate (_get_arg($node,1));
  die "set-cdr!: Element not pair\n" unless $return =~ /^P/;
  my $value = $self->_generate (_get_arg($node,2));
  $self->_add_inst ('', 'set', [$return.'[1]',$value]);
  $self->_restore ($value);

  return $return;
}

sub _op_null_p {
  my ($self, $node) = @_;
  my $return = $self->_save_1 ('I');
  my $label = $self->_gensym();

  _num_arg ($node, 1, 'null?');

  my $temp = $self->_generate(_get_arg($node,1));
  $self->_add_inst ('', 'typeof',[$return,$temp]);
  $self->_add_inst ('', 'ne', [$return,'.PerlUndef',"FAIL_$label"]);
  $self->_add_inst ('', 'set', [$return,1]);
  $self->_add_inst ('', 'branch', ["DONE_$label"]);
  $self->_add_inst ("FAIL_$label", 'set', [$return,0]);
  $self->_add_inst ("DONE_$label");
  $self->_restore ($temp);

  return $return;
}

sub _op_list_p {
}

sub _op_list {
  my ($self, $node) = @_;
  my $label = $self->_gensym ();
  my $return = $self->_save_1 ('P');

  $self->_add_inst ('', 'new',[$return,'.PerlUndef']);

  my @reverse = reverse _get_args($node);

  for (@reverse) {
    my $item = $self->_generate($_);
    my $pair = $self->_save_1 ('P');

    $self->_add_inst ('', 'new',[$pair,'.Array']);
    $self->_add_inst ('', 'set',[$pair,2]);
    $self->_add_inst ('', 'set',[$pair.'[0]',$item]);
    $self->_add_inst ('', 'set',[$pair.'[1]',$return]);
    $self->_add_inst ('', 'set',[$return,$pair]);

    $self->_restore($item, $pair);
  }

  return $return;
}

sub _op_length {
  my ($self, $node) = @_;
  my $label = $self->_gensym ();
  my $return = $self->_save_1 ('I');

  _num_arg ($node, 1, 'length');

  my $list = $self->_generate(_get_arg($node,1));

  $self->_add_inst ('', 'set',[$return,'0']);
  my $type = $self->_save_1 ('I');
  $self->_add_inst ("NEXT_$label", 'typeof',[$type,$list]);
  $self->_add_inst ('', 'eq',[$type,'.PerlUndef', "DONE_$label"]);
  $self->_add_inst ('', 'ne',[$type,'.Array', "ERR_$label"]);
  $self->_add_inst ('', 'inc',[$return]);
  $self->_add_inst ('', 'set',[$list,$list.'[1]']);
  $self->_add_inst ('', 'branch',["NEXT_$label"]);
  # XXX Use exceptions here
  $self->_add_inst ("ERR_$label", 'print',['"Object is not a list\n"']);

  $self->_add_inst ("DONE_$label");

  return $return;
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
  my $temp_0 = $self->_generate($node->{children}[1]);
  for(2..$#{$node->{children}}) {
    my $temp_1 = $self->_generate($node->{children}[$_]);
    if (substr ($temp_0, 0, 1) ne substr ($temp_1, 0, 1)) {
      my $temp_2 = $self->_save_1(substr ($temp_0, 0, 1));
      $self->_morph($temp_2, $temp_1);
      $self->_restore ($temp_1);
      $temp_1 = $temp_2;
    }
    $self->_add_inst ('', 'ne', [$temp_0,$temp_1,"DONE_$label"]);
    $self->_restore($temp_1);
  }
  $self->_add_inst('','set',[$return,1]);
  $self->_add_inst("DONE_$label");
  $self->_restore($temp_0);
  return $return;
}

sub _op_lt {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);
  my $temp_0 = $self->_generate($node->{children}[1]);
  for(2..$#{$node->{children}}) {
    my $temp_1 = $self->_generate($node->{children}[$_]);
    $self->_add_inst('','ge',[$temp_0,$temp_1,"DONE_$label"]);
    $self->_restore($temp_1);
  }
  $self->_add_inst('','set',[$return,1]);
  $self->_add_inst("DONE_$label");
  $self->_restore($temp_0);
  return $return;
}

sub _op_gt {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);
  my $temp_0 = $self->_generate($node->{children}[1]);
  for(2..$#{$node->{children}}) {
    my $temp_1 = $self->_generate($node->{children}[$_]);
    $self->_add_inst('','le',[$temp_0,$temp_1,"DONE_$label"]);
    $self->_restore($temp_1);
  }
  $self->_add_inst('','set',[$return,1]);
  $self->_add_inst("DONE_$label");
  $self->_restore($temp_0);
  return $return;
}

sub _op_leq {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);
  my $temp_0 = $self->_generate($node->{children}[1]);
  for(2..$#{$node->{children}}) {
    my $temp_1 = $self->_generate($node->{children}[$_]);
    $self->_add_inst('','gt',[$temp_0,$temp_1,"DONE_$label"]);
    $self->_restore($temp_1);
  }
  $self->_add_inst('','set',[$return,1]);
  $self->_add_inst("DONE_$label");
  $self->_restore($temp_0);
  return $return;
}

sub _op_geq {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);
  my $temp_0 = $self->_generate($node->{children}[1]);
  for(2..$#{$node->{children}}) {
    my $temp_1 = $self->_generate($node->{children}[$1]);
    $self->_add_inst('','lt',[$temp_0,$temp_1,"DONE_$label"]);
    $self->_restore($temp_1);
  }
  $self->_add_inst('','set',[$return,1]);
  $self->_add_inst("DONE_$label");
  $self->_restore($temp_0);
  return $return;
}

sub _op_zero_p {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(0);

  $self->_add_inst(''           ,'set'   ,[$return,1]);
  my $temp = $self->_generate($node->{children}[1]);
  $self->_add_inst(''           ,'eq'    ,[$temp,0,"DONE_$label"]);
  $self->_restore($temp);
  $self->_add_inst(''           ,'set'   ,[$return,0]);
  $self->_add_inst("DONE_$label");
  return $return;
}

sub _op_positive_p {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(1);
  my $temp = $self->_generate($node->{children}[1]);
  $self->_add_inst(''           ,'gt'    ,[$temp,0,"DONE_$label"]);
  $self->_restore($temp);
  $self->_add_inst(''           ,'set'   ,[$return,0]);
  $self->_add_inst("DONE_$label");
  return $return;
}

sub _op_negative_p {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_constant(1);
  my $temp = $self->_generate($node->{children}[1]);
  $self->_add_inst(''           ,'lt'    ,[$temp,0,"DONE_$label"]);
  $self->_restore($temp);
  $self->_add_inst(''           ,'set'   ,[$return,0]);
  $self->_add_inst("DONE_$label");
  return $return;
}

sub _op_odd_p {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  my $temp_0 = $self->_generate($node->{children}[1]);
  $return = $self->_constant(1);
  my $temp_1 = $self->_constant(2);
  $self->_add_inst(''           ,'mod'   ,[$temp_0,$temp_0,$temp_1]);
  $self->_add_inst(''           ,'eq'    ,[$temp_0,1,"DONE_$label"]);
  $self->_add_inst(''           ,'set'   ,[$return,0]);
  $self->_add_inst("DONE_$label");
  $self->_restore($temp_0,$temp_1);
  return $return;
}

sub _op_even_p {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  my $temp_0 = $self->_generate($node->{children}[1]);
  $return = $self->_constant(1);
  my $temp_1 = $self->_constant(2);
  $self->_add_inst(''           ,'mod'   ,[$temp_0,$temp_0,$temp_1]);
  $self->_add_inst(''           ,'eq'    ,[$temp_0,0,"DONE_$label"]);
  $self->_add_inst(''           ,'set'   ,[$return,0]);
  $self->_add_inst("DONE_$label");
  $self->_restore($temp_0,$temp_1);
  return $return;
}

sub _op_max {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_generate($node->{children}[1]);
  for(2..$#{$node->{children}}) {
    my $temp = $self->_generate($node->{children}[$_]);
    my $label = $self->_gensym();
    $self->_add_inst('','gt', [$return,$temp,"NEXT_$label"]);
    $self->_add_inst('','set',[$return,$temp]);
    $self->_add_inst("NEXT_$label");
    $self->_restore($temp);
  }
  return $return;
}

sub _op_min {
  my ($self,$node) = @_;
  my $return;
  my $label = $self->_gensym();

  $return = $self->_generate($node->{children}[1]);
  for(2..$#{$node->{children}}) {
    my $temp = $self->_generate($node->{children}[$_]);
    my $label = $self->_gensym();
    $self->_add_inst('','lt', [$return,$temp,"NEXT_$label"]);
    $self->_add_inst('','set',[$return,$temp]);
    $self->_add_inst("NEXT_$label");
    $self->_restore($temp);
  }
  return $return;
}

sub _op_plus {
  my ($self,$node) = @_;
  my $return;
  my $num_children = defined $node->{children} ? @{$node->{children}} - 1 : 0;
  if($num_children==0) {
    $return = $self->_constant(0);
  } elsif($num_children==1) {
    $return = $self->_generate($node->{children}[1]);
    if ($return =~ /^P/) {
      my $temp = $self->_save_1 ('P');
      $self->_morph ($temp, $return);
      $self->_restore ($return);
      $return = $temp;
    }
  } else {
    $return = $self->_generate($node->{children}[1]);
    if ($return =~ /^P/) {
      my $temp = $self->_save_1 ('P');
      $self->_morph ($temp, $return);
      $self->_restore ($return);
      $return = $temp;
    }
    for(2..$#{$node->{children}}) {
      my $temp = $self->_generate($node->{children}[$_]);
      $self->_add_inst('','add',[$return,$return,$temp]);
      $self->_restore($temp);
    }
  }
  return $return;
}

sub _op_minus {
  my ($self,$node) = @_;
  my $return;
  my $num_children = defined $node->{children} ? @{$node->{children}} - 1 : 0;

  if($num_children==0) {
    $return = $self->_constant(0);
  } elsif($num_children==1) {
    $return = $self->_generate($node->{children}[1]);
    if ($return =~ /^P/) {
      my $temp = $self->_save_1 ('P');
      $self->_morph ($temp, $return);
      $self->_restore ($return);
      $return = $temp;
    }
    my $temp   = $self->_constant(0);
    $self->_add_inst('','sub',[$return,$temp,$return]);
    $self->_restore($temp);
  } else {
    $return = $self->_generate($node->{children}[1]);
    if ($return =~ /^P/) {
      my $temp = $self->_save_1 ('P');
      $self->_morph ($temp, $return);
      $self->_restore ($return);
      $return = $temp;
    }
    for(2..$#{$node->{children}}) {
      my $temp = $self->_generate($node->{children}[$_]);
      $self->_add_inst('','sub',[$return,$return,$temp]);
      $self->_restore($temp);
    }
  }
  return $return;
}

sub _op_times {
  my ($self,$node) = @_;
  my $return;
  my $num_children = defined $node->{children} ? @{$node->{children}} - 1: 0;

  if($num_children==0) {
    $return = $self->_constant(0);
  } elsif($num_children==1) {
    $return = $self->_generate($node->{children}[1]);
    if ($return =~ /^P/) {
      my $temp = $self->_save_1 ('P');
      $self->_morph ($temp, $return);
      $self->_restore ($return);
      $return = $temp;
    }
  } else {
    $return = $self->_generate($node->{children}[1]);
    if ($return =~ /^P/) {
      my $temp = $self->_save_1 ('P');
      $self->_morph ($temp, $return);
      $self->_restore ($return);
      $return = $temp;
    }
    for(2..$#{$node->{children}}) {
      my $temp = $self->_generate($node->{children}[$_]);
      $self->_add_inst('','mul',[$return,$return,$temp]);
      $self->_restore($temp);
    }
  }
  return $return;
}

sub _op_divide {
  my ($self,$node) = @_;
  my $return;
  my $num_children = defined $node->{children} ? @{$node->{children}} - 1 : 0;

  if($num_children==0) {
    $return = $self->_constant(0);
  } elsif($num_children==1) {
    $return = $self->_generate($node->{children}[1]);
    if ($return =~ /^P/) {
      my $temp = $self->_save_1 ('P');
      $self->_morph ($temp, $return);
      $self->_restore ($return);
      $return = $temp;
    }
    my $temp = $self->_constant(1);
    $self->_add_inst('','div',[$return,$temp,$return]);
    $self->_restore($temp);
  } else {
    $return = $self->_generate($node->{children}[1]);
    if ($return =~ /^P/) {
      my $temp = $self->_save_1 ('P');
      $self->_morph ($temp, $return);
      $self->_restore ($return);
      $return = $temp;
    }
    for(2..$#{$node->{children}}) {
      my $temp = $self->_generate($node->{children}[$_]);
      $self->_add_inst('','div',[$return,$return,$temp]);
      $self->_restore($temp);
    }
  }
  return $return;
}

sub _op_abs {
  my ($self,$node) = @_;
  my $return;
  my $label     = $self->_gensym();

  $return = $self->_generate($node->{children}[1]);
  $self->_add_inst('',           'gt', [$return,0,"DONE_$label"]);
  my $temp = $self->_constant(-1);
  $self->_add_inst('',           'mul',[$return,$return,$temp]);
  $self->_restore($temp);
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
  my ($self, $node) = @_;
  my $return;

  _check_num_arg ($node, 1, 'procedure?');

  $return = $self->_constant(0);

  my $temp = $self->_generate(_get_arg($node,1));
  if ($temp =~ /^P/) {
  }

  return $return;
}

sub _op_apply {
  my ($self, $node) = @_;
  my $return;

  my $func = $self->_generate(_get_arg ($node, 1));
  my @args = _get_args ($node, 2);
  die "apply: wrong number of args\n" unless @args;

  $return = $self->_call_function_sym('apply');

  return $return;
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
  my $temp = 'none';

  for(_get_args($node)) {
    $self->_restore ($temp);
    $temp = $self->_generate($_);
    if ($temp =~ /[INS]/) {
      $self->_add_inst('','print',[$temp]);
    }
    else {  
      $self->_call_function_sym('write',$temp);
    }
  }
  return $temp; # We need to return something
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

#----------------------
#
# Section 4 Expressions
#
#----------------------

  'quote'      => \&_op_quote,
  'lambda'     => \&_op_lambda,
  'if'         => \&_op_if,
  'define'     => \&_op_define,
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

sub _call_function_sym {
  my $self = shift;
  my $symbol = shift;
  my $func_obj = $self->_find_lex($symbol);

  my $scope = $self->{scope};

  while ($scope && !exists $scope->{$symbol}) {
    $scope = $scope->{'*UP*'};
  }
  if (!$scope) {
    push @{$self->{functions}}, $symbol
      unless grep { $_ eq $symbol} @{$self->{functions}};
  }

  my $return = $self->_call_function_obj($func_obj, @_);
  $self->_restore($func_obj);

  return $return;
}

sub _call_function_obj {
  my $self = shift;
  my $func_obj = shift;

  my $return = $self->_save_1 ('P');
  $self->_restore($return); # dont need to save this
  $self->_save_set;

  my $count = 5;
  my $empty = $return;
  while (my $arg = shift) {
    if ($arg ne "P$count") {
      if ($arg =~ /^[INS]/) {
	$self->_morph("P$count", $arg);
	$count++;
	next;
      }
      # Check if any later argument needs the old value of P$count
      my $moved;
      for (@_) {
	if ($_ eq "P$count") {
	  $moved = $_;
	  $_ = $empty;
	}
      }
      if ($moved) {
	$self->_add_inst ('', 'set',[$empty,"P$count"]);
	$empty = $moved;
      }
      $self->_add_inst ('','set',["P$count",$arg]);
    }
    $count++;
  }

  $self->_add_inst('', 'set', ['P0', $func_obj]) unless $func_obj eq 'P0';
  $self->_add_inst('', 'set', ['I0', 0]);        # Pass all args in Px registers
  $self->_add_inst('', 'set', ['I3', $count-5]); # Tell about number of registers
  $self->_add_inst('', 'invokecc');
  $self->_add_inst('', 'set', [$return,'P5']) unless $return eq 'P5';
  $self->_restore_set;

  $return =~ /(\w)(\d+)/;
  $self->{regs}->{$1}->{$2} = 1;

  return $return;
}

sub _format_columns {
  my $self    = shift;
  my $colref  = $self->{instruction};
  my @max_len = __max_lengths($colref);

  $self->{code} = '';

  for my $row(@$colref) {
    my $label;
    $label = $row->[0]; $label .= ":" if $label;
    $self->{code} .= $label . ' ' x ($max_len[0]-length($label)+2);
    if(defined $row->[1]) {
      $label = $row->[1];
      $self->{code} .= $label . ' ' x ($max_len[1]-length($label)+2);
      $label = $row->[2];
      $self->{code} .= join ", ",@$label if $label;
    }
    $self->{code} .= "\n";
  }
}

sub new {
  my $class = shift;
  my $tree  = shift;
  my $self = {
    tree     => $tree,
    regs     => _new_regs,
    frames => [],
    gensym   => 0,
    functions=> [],
    scope    => {},
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

  if (exists $node->{children}) {
    my $func = _get_arg ($node, 0);
    if (exists $func->{value}) {
      my $symbol = $func->{value};
      if (exists $global_ops{$symbol}) {
	$return = $global_ops{$symbol}->($self, $node);
      } else {
	my @args = map { $self->_generate($_); } _get_args($node);
	$return = $self->_call_function_sym($symbol, @args);
	$self->_restore(@args);
      }
    } else {
      my @args = map { $self->_generate($_); } _get_args($node, 0);
      $return = $self->_call_function_obj(@args);
      $self->_restore(@args);
    }
  } else {
    my $value = $node->{value};
    if ($value =~ /^[a-zA-Z]/) {
      $return = $self->_find_lex($value);
    }
    else {
      $return = $self->_constant($node->{value});
    }
  }

  return $return;
}

sub generate {
  my $tree = shift;

  my $self = Scheme::Generator->new({});
  my $temp;

  $self->{scope} = {};

  $temp = $self->_generate($tree);

  $self->_restore($temp);
  $self->_add_inst('',"end");

  $self->_format_columns;

  # not need any more
  $self->{instruction} = undef;
  $self->{regs} = undef;

  return $self;
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

Jeffrey Goff, drforr@hargray.com

=head1 SEE ALSO

L<Scheme>, L<Scheme::Tokenizer>

=cut
