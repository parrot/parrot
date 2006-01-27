
package Lua::parser;

use strict;

use Lua::opcode;
use Lua::symbtab;

sub new_tmp {
	my ($parser, $type, $subtype) = @_;
	my $idf = "tmp_" . $parser->YYData->{idx_tmp}++;
	return new defn($idf, "tmp", $type, $subtype);
}

sub new_label {
	my ($parser) = @_;
	my $idf = "L" . $parser->YYData->{idx_lbl}++;
	return new defn($idf, "label");
}

sub new_fct {
	my ($parser) = @_;
	my $idf = "fct_" . $parser->YYData->{idx_fct}++;
	return new defn($idf, "fct");
}

sub get_global {
	my ($parser) = @_;
	my @opcodes = ();
	unless ($parser->YYData->{_G}) {
		$parser->YYData->{_G} = new_tmp($parser, "pmc");
		push @opcodes, new LocalDir($parser,
			'result'				=>	$parser->YYData->{_G},
		);
		push @opcodes, new FindGlobalOp($parser,
			'result'				=>	$parser->YYData->{_G},
			'arg1'					=>	"_G",
		);
	}
	return [$parser->YYData->{_G}, \@opcodes];
}

sub get_cond {
	my ($parser, $expr) = @_;
	my ($defn, $opcodes) = @{$expr};
	if (${$opcodes}[-1]->isa("ToBoolOp")) {
		my $tobool = pop @{$opcodes};
		my $decl = pop @{$opcodes};
		$defn = ${$opcodes}[-1]->{result};
	}
	return [$defn, $opcodes];
}

sub get_void {
	my ($parser, $expr) = @_;
	my ($defn, $opcodes) = @{$expr};
	my $call = pop @{$opcodes};
	my $ass = pop @{$opcodes};
	my $decl = pop @{$opcodes};
	delete $call->{result};
	push @{$opcodes}, $call;
	return $opcodes;
}

sub PushScope {
	my ($parser) = @_;

#	push @{$parser->YYData->{scope}}, $parser->YYData->{_G};
	delete $parser->YYData->{_G};
	push @{$parser->YYData->{scope}}, $parser->YYData->{symbtab};
	$parser->YYData->{symbtab} = new SymbTabVar($parser);
	push @{$parser->YYData->{scope}}, $parser->YYData->{symbtab_cst};
	$parser->YYData->{symbtab_cst} = new SymbTabConst($parser);
}

sub PopScope {                 
	my ($parser) = @_;

	my $symbtab = pop @{$parser->YYData->{scope}};
	$parser->YYData->{symbtab_cst} = $symbtab;
	$symbtab = pop @{$parser->YYData->{scope}};
	$parser->YYData->{symbtab} = $symbtab;
#	my $g = pop @{$parser->YYData->{scope}};
#	$parser->YYData->{_G} = $g if ($g); 
	delete $parser->YYData->{_G};
}

sub BuildLiteral {
	my ($parser, $value, $type) = @_;

	my $name = "cst_" . $parser->YYData->{idx_cst}++;
	my $defn = $parser->YYData->{symbtab_cst}->Lookup($type . $value);
	if ($defn) {
		return [$defn, []];
	} else {
		my @opcodes = ();
		$defn = new defn($name, "const", "pmc", $type);
		$parser->YYData->{symbtab_cst}->Insert($type . $value, $defn);
		if      ($type eq 'key') {
			push @opcodes, new ConstDir($parser,
				'result'				=>	$defn,
				'arg1'					=>	$value,
				'type'					=>	"LuaString",
			);
		} else {
			push @opcodes, new LocalDir($parser,
					'result'				=>	$defn,
			);
			if      ($type eq 'string') {
				my $str = "";
				for (split//, $value) {
					if (ord $_ < 32) {
						$str .= sprintf("\\x%02x", ord $_);
					} elsif (ord $_ >= 128) {
						$str .= sprintf("\\u%04x", ord $_);
					} elsif ($_ eq '"') {
						$str .= '\"';
					} else {
						$str .= $_;
					}
				}
				$value = "\"$str\"";
			} elsif ($type eq 'boolean') {
				$value = ($value eq "true") ? 1 : 0;
			}
			unless ($type eq "nil") {
				my $expr = new defn($value, "literal", "pmc", $type);
				push @opcodes, new AssignOp($parser,
						'arg1'					=>	$expr,
						'result'				=>	$defn,
				);
			}
		}
		return [$defn, \@opcodes];
	}
}

sub BuildTable {
	my ($parser, $fields) = @_;
	my @opcodes1 = ();
	my @opcodes2 = ();
	my $result = new_tmp($parser, "pmc", "table");
	push @opcodes1, new LocalDir($parser,
			'result'				=>	$result,
	);
	my $num_key;
	while (my $field = shift @{$fields}) {
		my ($val, $key);
		if (scalar(@{$field}) == 1) {
			$val = $field->[0];
			if (defined $num_key) {
				my $incr = new IncrOp($parser,
						'result'				=>	$num_key,
				);
				$key = [$num_key, [$incr]];
			} else {
				my $unit = BuildLiteral($parser, 1, "number");
				my @opcodes3 = @{$unit->[1]};
				$num_key = new_tmp($parser, "pmc");
				push @opcodes3, new LocalDir($parser,
						'result'				=>	$num_key,
				);
				push @opcodes3, new CloneOp($parser,
						'arg1'					=>	$unit->[0],
						'result'				=>	$num_key,
				);
				$key = [$num_key, \@opcodes3];
			}
			if (        scalar @{$fields} == 0
					and scalar @{$val->[1]} != 0
					and ${$val->[1]}[-1]->isa("CallOp") 
					and !exists ${$val->[1]}[-1]->{result}[0]->{pragma} ) {
				my $callop = ${$val->[1]}[-1]; 
				$callop->{result}[0]->{pragma} = "multi";
				push @opcodes1, @{$val->[1]};
				push @opcodes2, @{$key->[1]};
				my $fct = new defn("tconstruct", "util");
				push @opcodes2, new CallOp($parser,
						'result'				=>	[$result],
						'arg1'					=>	$fct,
						'arg2'					=>	[$result, $num_key, $callop->{result}[0]],
				);
				push @opcodes2, new NoOp($parser);
				push @opcodes1, @opcodes2;
				return [$result, \@opcodes1];
			}
		} else {
			$key = $field->[0];
			$val = $field->[1];
		}
		push @opcodes1, @{$val->[1]};
		push @opcodes2, @{$key->[1]};
		push @opcodes2, new KeyedSetOp($parser,
				'arg1'					=>	$key->[0],
				'arg2'					=>	$val->[0],
				'result'				=>	$result,
		);
	}
	push @opcodes1, @opcodes2;
	return [$result, \@opcodes1];
}

sub BuildVariable {
	my ($parser, $var) = @_;
	my @opcodes = ();
	my $idf = shift(@{$var});
	my $name = "var_" . $idf;
	my $defn = $parser->YYData->{symbtab}->Lookup($name);
	if (defined $defn) {
		my $assign = new AssignOp($parser,
				'arg1'					=>	undef,
				'result'				=>	$defn,
		);
		return [$defn, [], $assign];
	} else {
		my $global = get_global($parser);
		push @opcodes, @{$global->[1]};
		my $key = BuildLiteral($parser, $idf, "key");
		push @opcodes, @{$key->[1]};
		my $result = $global->[0];
		foreach my $key2 (@{$var}) {
			my $result2 = new_tmp($parser, "pmc");
			push @opcodes, new LocalDir($parser,
					'result'				=>	$result2,
			);
			push @opcodes, new KeyedGetOp($parser,
					'result'				=>	$result2,
					'arg1'					=>	$result,
					'arg2'					=>	$key->[0],
			);
			$result = $result2;
			$key = $key2;
			push @opcodes, @{$key->[1]};
		}
		my $assign = new KeyedSetOp($parser,
				'arg1'					=>	$key->[0],
				'arg2'					=>	undef,
				'result'				=>	$result,
		);
		return [$result, \@opcodes, $assign];
	}
}

sub BuildAssigns {
	my ($parser, $vars, $exprs) = @_;
	my @opcodes1 = ();
	my @opcodes2 = ();
	my @opcodes3 = ();
	while (my $var = shift @{$vars}) { 
		push @opcodes1, @{$var->[1]};
		my $expr = shift @{$exprs};
		unless (defined $expr) {
			$expr = BuildLiteral($parser, 'nil', 'nil');
		}
		if (        scalar(@{$exprs}) == 0
				and scalar(@{$vars}) != 0
				and scalar(@{$expr->[1]}) != 0 
				and ${$expr->[1]}[-1]->isa("CallOp") ) {
			my $result;
			my $callop = pop @{$expr->[1]};
			my $nil = BuildLiteral($parser, 'nil', 'nil');
			push @{$expr->[1]}, @{$nil->[1]};
			my $n = scalar(@{$vars});
			while ($n--) {
				$result = new_tmp($parser, "pmc");
				push @{$expr->[1]}, new LocalDir($parser,
						'result'				=>	$result,
				);
				push @{$expr->[1]}, new AssignOp($parser,
						'result'				=>	$result,
						'arg1'					=>	$nil->[0],
				);
				push @{$exprs}, [$result, []];
				push @{$callop->{result}}, $result;
			}
			push @{$expr->[1]}, $callop;
		}
		push @opcodes2, @{$expr->[1]};
		my $assign = $var->[2];
		if ($assign->isa("AssignOp")) {
			$assign->configure(
					'arg1'					=>	$expr->[0],
			);
		} else {
			$assign->configure(
					'arg2'					=>	$expr->[0],
			);
		}
		push @opcodes3, $assign;
	}
	push @opcodes1, @opcodes2, @opcodes3;
	return \@opcodes1;
}

sub BuildCallVariable {
	my ($parser, $var) = @_;
	my $result;
	my @opcodes = ();
	my $idf = shift(@{$var});
	my $name = "var_" . $idf;
	my $defn = $parser->YYData->{symbtab}->Lookup($name);
	if (defined $defn) {
		$result = $defn;
	} else {
		my $global = get_global($parser);
		push @opcodes, @{$global->[1]};
		my $key = BuildLiteral($parser, $idf, "key");
		push @opcodes, @{$key->[1]};
		$result = new_tmp($parser, "pmc");
		push @opcodes, new LocalDir($parser,
				'result'				=>	$result,
		);
		push @opcodes, new KeyedGetOp($parser,
				'result'				=>	$result,
				'arg1'					=>	$global->[0],
				'arg2'					=>	$key->[0],
		);
	}
	foreach my $key (@{$var}) {
		push @opcodes, @{$key->[1]};
		my $result2 = new_tmp($parser, "pmc");
		push @opcodes, new LocalDir($parser,
				'result'				=>	$result2,
		);
		push @opcodes, new KeyedGetOp($parser,
				'result'				=>	$result2,
				'arg1'					=>	$result,
				'arg2'					=>	$key->[0],
		);
		$result = $result2;
	}
	return [$result, \@opcodes];
}

sub BuildCallFunction {
	my ($parser, $fct, $args) = @_;
	my $result;
	my @opcodes = ();
	my @params = ();
	my @returns = ();
	for my $arg (@{$args}) {
		push @opcodes, @{$arg->[1]};
		push @params, $arg->[0];
	}
	if (scalar(@opcodes) and $opcodes[-1]->isa("CallOp")) {
		unless (exists $params[-1]->{pragma}) { 
			$params[-1]->{pragma} = "multi";
		}
	}
	push @opcodes, @{$fct->[1]};
	my $nil = BuildLiteral($parser, 'nil', 'nil');
	push @opcodes, @{$nil->[1]};
	$result = new_tmp($parser, "pmc");
	push @opcodes, new LocalDir($parser,
			'result'				=>	$result,
	);
	push @opcodes, new AssignOp($parser,
			'result'				=>	$result,
			'arg1'					=>	$nil->[0],
	);
	push @returns, $result;
	push @opcodes, new CallOp($parser,
			'result'				=>	\@returns,
			'arg1'					=>	$fct->[0],
			'arg2'					=>	\@params,
	);
	return [$result, \@opcodes];
}

sub BuildUnop {
	my ($parser, $op, $expr) = @_;
	my %type = (
		"-"		=> "number",
		"not"	=> "boolean",
	);
	my %opcode = (
		"-"		=> "neg",
		"not"	=> "not",
	);
	my @opcodes = ();
	my $result = new_tmp($parser, "pmc", $type{$op});
	push @opcodes, @{$expr->[1]};
	push @opcodes, new LocalDir($parser,
			'result'				=>	$result,
	);
	push @opcodes, new UnaryOp($parser,
			'op'					=>	$opcode{$op},
			'arg1'					=>	$expr->[0],
			'result'				=>	$result,
	);
	return [$result, \@opcodes];
}

sub BuildBinop {
	my ($parser, $expr1, $op, $expr2) = @_;
	my %type = (
		"+"		=> "number",
		"-"		=> "number",
		"*"		=> "number",
		"/"		=> "number",
		"^"		=> "number",
		".."	=> "string",
	);
	my %opcode = (
		"+"		=> "add",
		"-"		=> "sub",
		"*"		=> "mul",
		"/"		=> "div",
		"^"		=> "pow",
		".."	=> "concat",
	);
	my @opcodes = ();
	my $result = new_tmp($parser, "pmc", $type{$op});
	push @opcodes, @{$expr1->[1]};
	push @opcodes, @{$expr2->[1]};
	push @opcodes, new LocalDir($parser,
			'result'				=>	$result,
	);
	push @opcodes, new BinaryOp($parser,
			'op'					=>	$opcode{$op},
			'arg1'					=>	$expr1->[0],
			'arg2'					=>	$expr2->[0],
			'result'				=>	$result,
	);
	return [$result, \@opcodes];
}

sub BuildRelop {
	my ($parser, $expr1, $op, $expr2) = @_;
	my %opcode = (
		"<"		=> "islt",
		"<="	=> "isle",
		">"		=> "isgt",
		">="	=> "isge",
		"=="	=> "iseq",
		"~="	=> "isne",
	);
	my @opcodes = ();
	my $flag = new_tmp($parser, "int");
	push @opcodes, @{$expr1->[1]};
	push @opcodes, @{$expr2->[1]};
	push @opcodes, new LocalDir($parser,
			'result'				=>	$flag,
	);
	push @opcodes, new RelationalOp($parser,
			'op'					=>	$opcode{$op},
			'arg1'					=>	$expr1->[0],
			'arg2'					=>	$expr2->[0],
			'result'				=>	$flag,
	);
	my $result = new_tmp($parser, "pmc", "boolean");
	push @opcodes, new LocalDir($parser,
			'result'				=>	$result,
	);
	push @opcodes, new ToBoolOp($parser,
			'arg1'					=>	$flag,
			'result'				=>	$result,
	);
	return [$result, \@opcodes];
}

sub BuildLogop {
	my ($parser, $expr1, $op, $expr2) = @_;
	my @opcodes = ();
	my $result = new_tmp($parser, "pmc");
	push @opcodes, @{$expr1->[1]};
	push @opcodes, @{$expr2->[1]};
	push @opcodes, new LocalDir($parser,
			'result'				=>	$result,
	);
	my $lbl1 = new_label($parser);
	if ($op eq "and") {
		push @opcodes, new BranchIfOp($parser,
				'arg1'					=>	$expr1->[0],
				'result'				=>	$lbl1,
		);
	} else { # "or"
		push @opcodes, new BranchUnlessOp($parser,
				'arg1'					=>	$expr1->[0],
				'result'				=>	$lbl1,
		);
	}
	push @opcodes, new AssignOp($parser,
			'result'				=>	$result,
			'arg1'					=>	$expr1->[0],
	);
	my $lbl2 = new_label($parser);                        
	push @opcodes, new BranchOp($parser,
			'result'				=>	$lbl2,
	);
	push @opcodes, new LabelOp($parser,
			'arg1'					=>	$lbl1,
	);
	push @opcodes, new AssignOp($parser,
			'result'				=>	$result,
			'arg1'					=>	$expr2->[0],
	);
	push @opcodes, new LabelOp($parser,
			'arg1'					=>	$lbl2,
	);
	return [$result, \@opcodes];
}

sub BuildParenthesedExpression {
	my ($parser, $expr) = @_;
	my ($defn, $opcodes) = @{$expr};
	if (scalar(@{$opcodes}) and $opcodes->[-1]->isa("CallOp")) {
		$defn->{pragma} = "first";
	}
	return $expr;
}

sub  BuildLocalVariable {
	my ($parser, $idf) = @_;
	my @opcodes = ();
	my $defn;
	my $name;
	$name = "var_" . $idf;
	$defn = new defn($name, "local", "pmc");
	$parser->YYData->{symbtab}->Insert($name, $defn);
	push @opcodes, new LocalDir($parser,
			'result'				=>	$defn,
	);
	push @opcodes, new LexDir($parser,
			'result'				=>	$idf,
			'arg1'					=>	$defn,
	);
	my $assign = new AssignOp($parser,
			'arg1'					=>	undef,
			'result'				=>	$defn,
	);
	return [$defn, \@opcodes, $assign];
}

sub BuildIf {
	my ($parser, $expr, $then, $elseifs, $else) = @_;
	my @opcodes = ();
	my $cond = get_cond($parser, $expr);
	push @opcodes, @{$cond->[1]};
	my $l_end = new_label($parser);
	my $l_next = new_label($parser);
	push @opcodes, new BranchUnlessOp($parser,
			'arg1'					=>	$cond->[0],
			'result'				=>	$l_next,
	);
	push @opcodes, @{$then};
	push @opcodes, new BranchOp($parser,
			'result'				=>	$l_end,
	);
	push @opcodes, new LabelOp($parser,
			'arg1'					=>	$l_next,
	);
	for my $elseif (@{$elseifs}) {
		$cond = get_cond($parser, $elseif->[0]);
		$l_next = new_label($parser);
		push @opcodes, @{$cond->[1]};
		push @opcodes, new BranchUnlessOp($parser,
				'arg1'					=>	$cond->[0],
				'result'				=>	$l_next,
		);
		push @opcodes, @{$elseif->[1]};
		push @opcodes, new BranchOp($parser,
				'result'				=>	$l_end,
		);
		push @opcodes, new LabelOp($parser,
				'arg1'					=>	$l_next,
		);
	}
	if (defined $else) {
		push @opcodes, @{$else};
	}
	push @opcodes, new LabelOp($parser,
			'arg1'					=>	$l_end,
	);
	return \@opcodes;
}

sub BuildWhile {
	my ($parser, $expr, $block) = @_;
	my @opcodes = ();
	my $l_continue = new_label($parser);
	my $l_break = new_label($parser);
	push @opcodes, new LabelOp($parser,
			'arg1'					=>	$l_continue,
	);
	my $cond = get_cond($parser, $expr);
	push @opcodes, @{$cond->[1]};
	push @opcodes, new BranchUnlessOp($parser,
			'arg1'					=>	$cond->[0],
			'result'				=>	$l_break,
	);
	foreach my $op (@{$block}) {
		if ($op and $op->isa('BranchOp')) {
			if ($op->{result} eq 'break') {
				$op->{result} = $l_break;
			}
		}
	}
	push @opcodes, @{$block};
	push @opcodes, new BranchOp($parser,
			'result'				=>	$l_continue,
	);
	push @opcodes, new LabelOp($parser,
			'arg1'					=>	$l_break,
	);
	return \@opcodes;
}

sub BuildRepeat {
	my ($parser, $block, $expr) = @_;
	my @opcodes = ();
	my $l_continue = new_label($parser);
	my $l_break = new_label($parser);
	push @opcodes, new LabelOp($parser,
			'arg1'					=>	$l_continue,
	);
	foreach my $op (@{$block}) {
		if ($op and $op->isa('BranchOp')) {
			if ($op->{result} eq 'break') {
				$op->{result} = $l_break;
			}
		}
	}
	push @opcodes, @{$block};
	my $cond = get_cond($parser, $expr);
	push @opcodes, @{$cond->[1]};
	push @opcodes, new BranchIfOp($parser,
			'arg1'					=>	$cond->[0],
			'result'				=>	$l_break,
	);
	push @opcodes, new BranchOp($parser,
			'result'				=>	$l_continue,
	);
	push @opcodes, new LabelOp($parser,
			'arg1'					=>	$l_break,
	);
	return \@opcodes;
}

sub BuildForNum {
	my ($parser, $idf, $e_start, $e_limit, $e_step, $block) = @_;
	my @opcodes = ();
	unless (defined $e_step) {
		$e_step = BuildLiteral($_[0], 1, 'number');
	}
	push @opcodes, @{$e_start->[1]};
	push @opcodes, @{$e_limit->[1]};
	push @opcodes, @{$e_step->[1]};
	my $global = get_global($parser);
	push @opcodes, @{$global->[1]};
	my $key_tonumber = BuildLiteral($parser, "tonumber", "key");
	push @opcodes, @{$key_tonumber->[1]};
	my $fct_tonumber = new_tmp($parser, "pmc");
	push @opcodes, new LocalDir($parser,
			'result'				=>	$fct_tonumber,
	);
	push @opcodes, new KeyedGetOp($parser,
			'result'				=>	$fct_tonumber,
			'arg1'					=>	$global->[0],
			'arg2'					=>	$key_tonumber->[0],
	);
	my $var = BuildLocalVariable($parser, $idf);
	push @opcodes, @{$var->[1]};
	push @opcodes, new CallOp($parser,
			'result'				=>	[ $var->[0] ],
			'arg1'					=>	$fct_tonumber,
			'arg2'					=>	[ $e_start->[0]],
	);
	my $limit = new_tmp($parser, "pmc", "number");
	push @opcodes, new LocalDir($parser,
			'result'				=>	$limit,
	);
	push @opcodes, new CallOp($parser,
			'result'				=>	[ $limit ],
			'arg1'					=>	$fct_tonumber,
			'arg2'					=>	[ $e_limit->[0]],
	);
	my $step = new_tmp($parser, "pmc", "number");
	push @opcodes, new LocalDir($parser,
			'result'				=>	$step,
	);
	push @opcodes, new CallOp($parser,
			'result'				=>	[ $step ],
			'arg1'					=>	$fct_tonumber,
			'arg2'					=>	[ $e_step->[0]],
	);
	my $lbl_err = new_label($parser);
	push @opcodes, new BranchUnlessOp($parser,
			'arg1'					=>	$var->[0],
			'result'				=>	$lbl_err,
	);
	push @opcodes, new BranchUnlessOp($parser,
			'arg1'					=>	$limit,
			'result'				=>	$lbl_err,
	);
	push @opcodes, new BranchUnlessOp($parser,
			'arg1'					=>	$step,
			'result'				=>	$lbl_err,
	);
	my $lbl_loop = new_label($parser);
	push @opcodes, new BranchOp($parser,
			'result'				=>	$lbl_loop,
	);
	push @opcodes, new LabelOp($parser,
			'arg1'					=>	$lbl_err,
	);
	my $key_error = BuildLiteral($parser, "error", "key");
	push @opcodes, @{$key_error->[1]};
	my $fct_error = new_tmp($parser, "pmc");
	push @opcodes, new LocalDir($parser,
			'result'				=>	$fct_error,
	);
	push @opcodes, new KeyedGetOp($parser,
			'result'				=>	$fct_error,
			'arg1'					=>	$global->[0],
			'arg2'					=>	$key_error->[0],
	);
	push @opcodes, new CallOp($parser,
			'arg1'					=>	$fct_error,
	);
	push @opcodes, new LabelOp($parser,
			'arg1'					=>	$lbl_loop,
	);
	my $lbl_end = new_label($parser);

	push @opcodes, new BranchUnlessOp($parser,
			'arg1'					=>	$var->[0],
			'op'					=>	"<=",
			'arg2'					=>	$limit,
			'result'				=>	$lbl_end,
	);

	push @opcodes, @{$block};
	push @opcodes, new BinaryOp($parser,
			'op'					=>	"add",
			'arg1'					=>	$var->[0],
			'arg2'					=>	$step,
			'result'				=>	$var->[0],
	);
	push @opcodes, new BranchOp($parser,
			'result'				=>	$lbl_loop,
	);
	push @opcodes, new LabelOp($parser,
			'arg1'					=>	$lbl_end,
	);
	return \@opcodes;
}

sub BuildBreak {
	my ($parser) = @_;
	my @opcodes = ();
	push @opcodes, new BranchOp($parser,
			'result'				=>	'break',
	);
	return \@opcodes;
}

sub BuildReturn {
	my ($parser, $exprs) = @_;
	my @opcodes = ();
	my @returns = ();
	for my $expr (@{$exprs}) {
		push @opcodes, @{$expr->[1]};
		push @returns, $expr->[0];
	}
	if (scalar(@opcodes) and $opcodes[-1]->isa("CallOp")) {
		unless (exists $returns[-1]->{pragma}) { 
			$returns[-1]->{pragma} = "multi";
		}
	}
	push @opcodes, new ReturnDir($parser,
			'result'				=>	\@returns,
	);
	return \@opcodes;
}

sub  BuildParam {
	my ($parser, $idf) = @_;
	my @opcodes1 = ();
	my @opcodes2 = ();
	my $defn;
	my $name;
	if ($idf eq "...") {
		my $argv = new defn("argv", "local", "pmc");
		push @opcodes1, new ParamDir($parser,
				'result'				=>	$argv,
				'pragma'				=>	":slurpy",
		);
		$name = "var_arg";
		$defn = new defn($name, "local", "pmc");
		push @opcodes1, new LocalDir($parser,
				'result'				=>	$defn,
		);
		my $fct = new defn("mkarg", "util");
		push @opcodes1, new CallOp($parser,
				'result'				=>	[$defn],
				'arg1'					=>	$fct,
				'arg2'					=>	[$argv],
		);
	} else {
		$name = "var_" . $idf;
		$defn = new defn($name, "local", "pmc");
		push @opcodes1, new ParamDir($parser,
				'result'				=>	$defn,
		);
		my $nil = BuildLiteral($parser, 'nil', 'nil');
		push @opcodes2, @{$nil->[1]};
		push @opcodes2, new LexDir($parser,
				'result'				=>	$idf,
				'arg1'					=>	$defn,
		);
		my $lbl = new_label($parser);
		push @opcodes2, new BranchUnlessNullOp($parser,
				'arg1'					=>	$defn,
				'result'				=>	$lbl,
		);
		push @opcodes2, new AssignOp($parser,
				'result'				=>	$defn,
				'arg1'					=>	$nil->[0],
		);
		push @opcodes2, new LabelOp($parser,
				'arg1'					=>	$lbl,
		);
	}
	$parser->YYData->{symbtab}->Insert($name, $defn);
	return [$defn, \@opcodes1, \@opcodes2];
}

sub BuildFunctionBody {
	my ($parser, $params, $block) = @_;
	PopScope($parser);
	my @opcodes1 = ();
	my @opcodes2 = ();
	my $fct = new_fct($parser);
	push @opcodes2, new SubDir($parser,
			'result'				=>	$fct,
	);
	for my $param (@{$params}) {
		push @opcodes2, @{$param->[1]};
	}
	for my $param (@{$params}) {
		push @opcodes2, @{$param->[2]};
	}
	push @opcodes2, @{$block};
	push @opcodes2, new EndDir($parser
	);
	push @{$parser->YYData->{functs}}, \@opcodes2;
	my $result = new_tmp($parser, "pmc", "function");
	push @opcodes1, new LocalDir($parser,
			'result'				=>	$result,
	);
	push @opcodes1, new ConstDir($parser,
			'result'				=>	$fct,
			'arg1'					=>	$fct->{symbol},
			'type'					=>	"Sub",
	);
	push @opcodes1, new AssignOp($parser,
			'result'				=>	$result,
			'arg1'					=>	$fct,
	);
	return [$result, \@opcodes1];
}

sub BuildMain {
	my ($parser, $stat) = @_;
	if (scalar @{$stat}) {
		my @opcodes = ();
		my $main = new defn('_main', "funct");
		push @opcodes, new SubDir($parser,
				'result'				=>	$main,
		);
		push @opcodes, @{$stat};
		push @opcodes, new EndDir($parser);
		push @{$parser->YYData->{functs}}, \@opcodes;
	}
}

1;

