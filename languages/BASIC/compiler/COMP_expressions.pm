#!/usr/bin/perl -w

use subs qw(fetchvar);
use vars qw(@builtins @keywords);
use strict;

@builtins=qw( 	abs      	asc      	atn
	      	cdbl		chr$		cint
		clng		command$	cos
		csng		csrlin		cvd
		cvdmbf		cvi		cbl
		cvs		cvsmbf		date$
		environ$	eof		erdev
		erdev$		erl		err
		exp	    	fileattr	fix
		fre		freefile	hex$
		inkey_NOTYET$
		space_NOTYET$
		time_NOTYET$
		inp		input$
		instr		int		ioctl$
		    lbound lcase$ left$ len loc lof log lpos ltrim$
		    mid$ mkd$ mkdmbf$ mki$ mkl$ mks$ mksmbf$
		    peek pen play pmap point pos
		    right$ rnd rtrim$
		    sadd screen seek setmem sgn sin spc sqr
			stick str$ strig string$
		    tab tan timer
		    ubound ucase$ val varptr varptr$ varseg
		   );
@keywords=qw(	access alias any append as
			base beep binary bload bsave byval
			call calls absolute interrupt base chain circle clear
				close cls color com common const 
			data declare def fn seg defdbl defint deflng defsng defstr
				dim do loop double draw
			else elseif end endif environ erase error exit
			field files for next function
			get gosub goto
			if then input integer ioctl is
			key kill
			let line input list local locate lock unlock long loop
				lprint lset
			mid$ mkdir
			name next
			off on com error key pen play strig timer gosub goto com
				option base out open
			paint palette pcopy pen play poke preset print using
				pset put
			random randomize read redim rem reset restore resume
				return rmdir rset run
			screen seek select case shared shell single sleep
				sound static stop sub swap system step
			then 
			time_NOTYET$ 
			timer troff tron type to
			uevent unlock until using
			view
			wait while wend width window write
		);

sub dumpq {
	print "Upcoming: $type[0] $syms[0]\n";
	print "Current : $type[1] $syms[1]\n";
	print "Previous: $type[2] $syms[2]\n";
}
sub isbuiltin {		# Built in functions
	return 1 if (grep /^\Q$_[0]\E$/i, @builtins );
	return 0;
}
sub isuserfunc {
	return 1 if (grep /^\Q$_[0]\E$/i, keys %functions );
	return 0
}
sub isarray {
	$_ =(grep /^\Q$_[0]\E$/i, keys %arrays );
	return $_;
}

sub hasargs {
	return(isbuiltin($_[0]) or isuserfunc($_[0]) or isarray($_[0]));
}

sub iskeyword { 
	return 1 if (grep /^\Q$_[0]\E$/i, @keywords);
	return 0;
}
sub precedence {
	my ($op, $next)=@_;
	#print STDERR "Precedence with '$op' and '$next'\n";

	return 5  if ($op eq "and");
	return 5  if ($op eq "eqv");
	return 5  if ($op eq "imp");
	return 5  if ($op eq "or");
	return 5  if ($op eq "xor");
	return 7  if ($op eq "not");
	return 10 if ($op eq "=");
	return 10 if ($op eq ">=");
	return 10 if ($op eq "<=");
	return 10 if ($op eq "<>");
	return 10 if ($op eq ">");
	return 10 if ($op eq "<");
	return 15 if ($op eq ",");
	return 20 if ($op eq "+");
	return 20 if ($op eq "-");
	return 30 if ($op eq "mod");
	return 40 if ($op eq '\\');
	return 50 if ($op eq "*");
	return 50 if ($op eq "/");
	return 60 if ($op eq "^");
	return 70 if ($op eq ".");

	return 99 if ($op eq "UNARYMINUS");
	
	return 100 if (isbuiltin $op);
	return 100 if (isuserfunc $op);
	return 100 if (isarray $op and 
				(($next and $next eq "(") or ! $next));

	return 0;  # Not an operator

}
my %opsubs=(
	'+' => "EXPR_ADD",
	'-' => "EXPR_SUB",
	'*' => "EXPR_MUL",
	'/' => "EXPR_DIV",
	'=' => "EXPR_EQ",
	'<=' => "EXPR_LE",
	'>=' => "EXPR_GE",
	'<>' => "EXPR_NE",
	'<' => "EXPR_LT",
	'>' => "EXPR_GT",
	'and' => "AND",
	'or' => "OR",
	'not' => "NOT",
	'xor' => "XOR",
	'eqv' => "EQV",
	'imp' => "IMP",
	'.' => "NULL",
	'mod' => "MOD",
	'^' => "POW",	
);
sub convert_to_rpn {
	my(@expr)=@_;

	#print STDERR "In RPN Convert...\n";
	# Convert to RPN
	my (@stack,@stream);
	my $i=-1;
	foreach my $item (@expr) {
		die "Expression too complex at line $sourceline" if $i++ > 100;  # Arbitrary.
		my($sym,$type)=@$item;
		#print "Got a $sym...\n";
		if ($sym eq "(") {
			push @stack, $item;
			next;
		}
		if ($sym eq ")") {
			push @stream, pop @stack
				while(@stack and $stack[-1]->[0] ne "(");
			pop @stack;
			next;
		}

		if (	$type eq "STRING" or
			not precedence($sym, exists $expr[$i+1]?$expr[$i+1]->[0]:"NOTARR")) {
			push @stream, $item;  # Operands, etc..
			next;
		}
		#print "It's an op!\n";
		$item->[2]="OP";
		if (! @stack) {
			push @stack, $item;
			next;
		}
		while(@stack and precedence($stack[-1]->[0]) >= precedence($item->[0])) {
			push @stream, pop @stack;
		}
		push @stack, $item;
		
	}
	push @stream, reverse @stack;	
	#print STDERR "Outta RPN convert\n";
	return(@stream);
}

sub fixup {
	my(@expr)=@_;

	# Do the fixup.  Unary minus, functions, etc.
	my @foo=@expr;
	@expr=();
	for my $t (0..@foo-1) {
		my($unary,$argthing)=(0,0);
		my($prev, $this, $next)=(
			(($t-1 >= 0)?$foo[$t-1]:undef),
			$foo[$t], 
			(($t+1 <= $#foo)?$foo[$t+1]:undef) );
		if ($this->[0] eq '-' and $this->[1] eq "PUN") {
			if (! defined $prev->[0] or $prev->[0] eq "(") {
				$unary=1;
			} elsif (precedence($prev->[0],$next->[0])) {
				$unary=1;
			} elsif (iskeyword($syms[PREV]) and not isbuiltin($syms[PREV]) ) {
				$unary=1;
			}
		}
		if (
			$this->[0] eq "("    and 
			hasargs($prev->[0])	# This works, but damned if I know why. 
			#and $next->[0] ne ")"  
			){
#			print "Argthing $prev->[0]\n";
			$argthing=1;
		}

		if ($unary) {
			push(@expr, [ "-1", "INT" ],
				    [ "*", "PUN"] );
			next;
		}

		push(@expr, $foo[$t]);
		
		# Functions, array lookups, and builtins are converted 
		# from a(b,d) 
		# to   a(,b,d)
		# and commas become a low-precedence unary operator that means
		# "Push the top of the stack onto the function's call stack"
		# No-arg funcs are simply left alone.
		if ($argthing) {
			push(@expr, [ "STARTARG", "STARTARG" ] );
		}
	}
	return(@expr);
}
sub get_expression {
	my(%opts)=@_;
	my $parens;
	my @expr;

	goto PROCEXP_NOFEED if $opts{lhs};
	goto PROCEXP_NOFEED if $opts{nofeed};
	feedme();

PROCEXP_NOFEED:
	while(1) {
		$parens++ if ($syms[CURR] eq "(");
		$parens-- if ($syms[CURR] eq ")");
		#print "Read $syms[CURR]...";
		last if (not $parens  and
			$syms[CURR] eq "=" and $opts{lhs});
		#print "ok\n";
		last if ( $type[CURR] eq "STMT"
				or
			$type[CURR] eq "COMP"
				or
			$type[CURR] eq "COMM"
				or
			($type[CURR] eq "BARE" and (iskeyword($syms[CURR])
					and !isbuiltin($syms[CURR] ))));
		last if (not $parens and not $opts{ignorecomma} and 
			($syms[CURR] eq ',' and $type[CURR] ne "STRING"));
		last if ($syms[CURR] eq ';');
		push(@expr, [ $syms[CURR], $type[CURR] ]);
		if (hasargs($syms[CURR]) and $syms[NEXT] ne "(") {
			push(@expr, [ "(", "PUN" ]); # Make sure no-arg funcs have at
			push(@expr, [ ")", "PUN" ]); # least token parenthesis...
		}
		feedme();
	}
	barf();
	return(@expr);
}
sub pushthing {
	my($code, $toreg, $sym, $type,$lhs)=@_;
	my $ts="INVALID";

	if ($type ne "RESULT") {
		if ($type=~/STRING|INT|FLO|BARE/) {
			$sym=qq{"$sym"} if $type =~ /BARE|STRING/;
			push @$code, qq{\tnew $toreg, .PerlHash};
			push @$code, qq{\tset $toreg\["type"], "$type"};
			push @$code, qq{\tset $toreg\["value"], $sym};
		}  elsif ($type eq "STARTARG") {
			return;
		} else {
			die "Bad type for $sym?";
		}
	} else {
		if (@$code[-1] eq "\tpush P9, $toreg") {
			pop @$code;
		} else {
			push @$code, qq{\tpop $toreg, P9};
		}
	}
}
sub pushargs {
	my($code,$work)=@_;

	return unless @$work;

#	print "Work has ", scalar @$work, " things on it.\n";
	while($$work[-1]->[0] ne "STARTARG") {
		my $item=pop @$work;
		if ($item->[1] eq "RESULT") {
			push @$code, qq{\tpop P0, P9\t# (arg) Result of $item->[0]};
			push @$code, qq{\tpush P8, P0};
		} else {
			pushthing($code, "P1", @$item);
			push @$code, qq{\tpush P8, P1\t# (arg) $item->[0]};
		}

	}
	pop @$work;  # REmove startarg tag...
}
sub generate_code {
	my($lhs,@stream)=@_;
	my(@code,@work);

	my $oneop=0;
	my $result;		# Result from prior operation
	push @code, "\tbsr EXPRINIT\t# Set P9 properly";
	foreach my $token (@stream) {
		my($sym,$type,$op)=@$token;
		#print "Dealing with $sym $type $op\n";

		if (! $op) {
			push @work, $token;
			next;
		}
		next if ($sym eq ",");  # Commas get ignored, args to stack

		if (hasargs($sym)) {
			#print "It has args?\n";
			pushargs(\@code, \@work);
			if (isarray($sym)) {
				push @code, qq{\tset S0, "$sym"};
				push @code, "\tbsr ARRAY_LOOKUP";
				push @work, [ "result of $sym()", "RESULT" ];
				push @code, "\tpush P9, P0\t# Result of $sym()";
			} elsif (isbuiltin($sym)) {
				$_=$sym;
				s/\$//g; tr/a-z/A-Z/;
				push @code, "\tbsr REVERSEARGS";
				push @code, qq{\tbsr BUILTIN_$_};
				push @work, [ "result of $sym()", "RESULT" ];
				push @code, "\tpush P9, P6\t# Result of $sym() ";
			} else {
				push @code, qq{set S0, "$sym"};
				push @code, "\tbsr REVERSEARGS";
				push @code, "\tbsr USERFUNC";
				push @work, [ "result of $sym()", "RESULT" ];
				push @code, "\tpush P9, P6\t# Result of $sym()";
			}
		} else {
			my($op1,$op2)=(pop @work, pop @work);

			pushthing(\@code, "P6", @$op1);
			pushthing(\@code, "P7", @$op2);
			if (exists $opsubs{$sym}) {
				push @code, "\tbsr $opsubs{$sym}";
			} else {
				die "Op $sym not implemented?";
			}
			push @work, [ "($op1->[0] $sym $op2->[0])", "RESULT" ];
			push @code, "\tpush P9, P6";
		}
	}
	if (@work) {
		$_=pop @work;
		pushthing(\@code, "P6", $_->[0], $_->[1],$lhs);
		push @code, "** Dummy **";
	}
	pop @code;
	push @code, "\t# Result is in P6";

	s/$/\n/ for @code;

	return @code;
}
sub EXPRESSION {
	my(%opts);
	%opts=%{$_[0]} if @_;
	
	my(@expr, @stream);
	@expr=get_expression(%opts);	# Get expression tokens
	@expr=fixup(@expr);		# Repair unary -, functions, etc...

#	print "Evaluating: ";foreach(@expr) { print $_->[0];" " } print "\n";
#	foreach(@expr) { print $_->[1]," " } print "\n";

	@stream=convert_to_rpn(@expr);	# Get infix into RPN

#	print "Evaluation stream: "; foreach(@stream) {	print $_->[0]," "; } print "\n";

	@stream=generate_code($opts{lhs},@stream);	# Generate PASM code stream

	return(@stream);
}
1;
