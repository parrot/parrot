#! perl -w

use subs qw(fetchvar);
use vars qw(@builtins @keywords);
use strict;

my $retcount=200;
my $currentexpr;

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
		inkey$
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
		    tab$ tan timer
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
			keys
		);

sub dumpq {
	print "Upcoming: $type[0] $syms[0]\n";
	print "Current : $type[1] $syms[1]\n";
	print "Previous: $type[2] $syms[2]\n";
}
sub isbuiltin {		# Built in functions
	return 0 unless defined $_[0];
	return 1 if (grep /^\Q$_[0]\E$/i, @builtins );
	return 0;
}
sub isuserfunc {
#	print "Isuserfunc $_[0] and $funcname..";
	return 0 unless defined $_[0];
	return 0 if $funcname and $funcname eq $_[0];  # We're processing this, don't count!
	if (grep /^\Q$_[0]\E$/i, keys %functions ) {
#		print "Yes\n";
		return 1;
	}
#	print "No\n";
	return 0
}
sub isarray {
	#print STDERR "Looking up $_[0]$seg...\n";
	$_ =(grep /^\Q$_[0]$seg\E$/i, keys %arrays );
	#print "$_\n";
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
sub false {
	my($type)=@_;
	if ($type eq "N") {
		return "0.0";
	} else {
		return qq{""};
	}
}
my $eqnum=0;
my %opsubs=(
	'+' => sub { 
		my ($a1, $a2, $result)=@_;
		if ($result=~/S/) {
			return("\tconcat $result, $a2, $a1", $result);
		} else {
			return("\t$result = $a1 + $a2", $result);
		}
	},
	'-' => sub {
		return("\t$_[2] = $_[1] - $_[0]", $_[2]);
	},
	'*' => sub {
		return("\t$_[2] = $_[0] * $_[1]", $_[2]);
	},
	'/' => sub {
		return("\t$_[2] = $_[1] / $_[0]", $_[2]);
	},
	'=' => sub {
		my ($a1, $a2, $result, $op)=@_;
		$op="eq" unless $op;
		$result=~s/S/N/;
		$eqnum++;
		return(<<CODE, $result); 
	set $result, 1.0
	$op $a2, $a1, EQ_$eqnum
	set $result, 0.0
EQ_$eqnum: noop
CODE
	},
	'and' => sub {
		my($a1,$a2,$result,$op,$ot1,$ot2)=@_;
		$result=~s/S/N/;
		$eqnum++;
		$ot1=false($ot1);
		$ot2=false($ot2);
		return(<<CODE, $result);
	set $result, 0.0
	eq $a1, $ot1, EQ_$eqnum
	eq $a2, $ot2, EQ_$eqnum
	set $result, 1.0
EQ_$eqnum: noop
CODE
	},
	'or' => sub {
		my($a1,$a2,$result,$op,$ot1,$ot2)=@_;
		$result=~s/S/N/;
		$eqnum++;
		$ot1=false($ot1);
		$ot2=false($ot2);
		return(<<CODE, $result);
	# OR $a1, $a2
	set $result, 0.0
	ne $a1, $ot1, EQ_$eqnum
	ne $a2, $ot2, EQ_$eqnum
	branch EQ_${eqnum}_false
EQ_$eqnum: set $result, 1.0
EQ_${eqnum}_false: noop
CODE
	},
	'not' => sub {
		my($a1,$a2,$result,$op,$ot1,$ot2)=@_;
		$result=~s/S/N/;
		$eqnum++;
		$ot1=false($ot1);
		return(<<CODE, $result);
	# FIXME
	eq $a1, $ot1, TRUE_${eqnum}
	set $result, 0.0
	branch NOT_${eqnum}
TRUE_${eqnum}: set $result, 1.0
NOT_${eqnum}: noop
CODE
		die "$a1,$a2,$result,$op,$ot1,$ot2\n";
	},
	'xor' => sub {
		my($a1,$a2,$result,$op,$ot1,$ot2)=@_;
		$result=~s/S/N/;
		$eqnum++;
		$ot1=false($ot1);
		$ot2=false($ot2);
		return(<<CODE, $result);
	# XOR $a1, $a2
	set $result, 0.0
	eq $a1, $ot1, EQ_${eqnum}_a
	inc $result
EQ_${eqnum}_a:
	eq $a2, $ot2, EQ_$eqnum
	inc $result
EQ_$eqnum: ne $result, 2.0, EQ_${eqnum}_end
	set $result, 0.0
EQ_${eqnum}_end: noop
CODE
	},
	'eqv' => sub {
		my($a1,$a2,$result,$op,$ot1,$ot2)=@_;
		$result=~s/S/N/;
		$eqnum++;
		$ot1=false($ot1);
		$ot2=false($ot2);
		return(<<CODE, $result);
	# EQV $a1, $a2
	set $result, 0.0
	eq $a1, $ot1, EQ_${eqnum}_a
	inc $result
EQ_${eqnum}_a:
	eq $a2, $ot2, EQ_$eqnum
	dec $result
EQ_$eqnum: eq $result, 0.0, EQ_${eqnum}_ok
	set $result, 0.0
	branch EQ_${eqnum}_end
EQ_${eqnum}_ok: set $result, 1.0
EQ_${eqnum}_end: noop
CODE
	},
	'imp' => sub {
		my($a1,$a2,$result,$op,$ot1,$ot2)=@_;
		$result=~s/S/N/;
		$eqnum++;
		$ot1=false($ot1);
		$ot2=false($ot2);
		($a1,$a2,$ot1,$ot2)=($a2,$a1,$ot2,$ot1);
		return(<<CODE, $result);
	# IMP $a1, $a2
	set $result, 1.0
	eq $a1, $ot1, EQ_${eqnum}_end
	ne $a2, $ot2, EQ_${eqnum}_end
	set $result, 0.0
EQ_${eqnum}_end: noop
CODE
	},
	'.' => "NULL",
	'mod' => sub {
		my($a1,$a2,$result)=@_;
		return(<<CODE, $result);
	cmod $result, $a2, $a1
CODE
	},
	'^' => "POW",	
);
%opsubs=(%opsubs, 
	'<=' => sub { &{$opsubs{"="}}(@_[0..2], "le") },
	'>=' => sub { &{$opsubs{"="}}(@_[0..2], "ge") },
	'<>' => sub { &{$opsubs{"="}}(@_[0..2], "ne") },
	'<' => sub { &{$opsubs{"="}}(@_[0..2], "lt") },
	'>' => sub { &{$opsubs{"="}}(@_[0..2], "gt") });

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
			} elsif (precedence($prev->[0],$next->[0]) 
				  and not isarray($prev->[0])) { 
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
		if ($this->[0] eq 'not' and $this->[1] ne "STRING") {
			push(@expr, [ "0.0", "INT"],   # Cheating, making not a binary op
				[ "not", "PUN"] );
			next;
		}

		if ($unary) {
			push(@expr, [ "-1.0", "INT" ],
				    [ "*", "PUN"] );
			next;
		}
		# Sadly, IMCC wants INTs to be INTs.
		if ($this->[1] eq "INT") {
			$this->[0].=".0";
		}

		if ($this->[1] eq "BARE") {
			$this->[0]=changename($this->[0]);
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
		if ( (isbuiltin($syms[CURR]) or isuserfunc($syms[CURR]))
			and $syms[NEXT] ne "(" and $type[CURR] ne "STRING") {
			push(@expr, [ "(", "PUN" ]); # Make sure no-arg funcs have at
			push(@expr, [ ")", "PUN" ]); # least token parenthesis...
		}
		feedme();
	}
	barf();
	$currentexpr=join(' ', map { $_->[0] } @expr);
	return(@expr);
}
sub pushthing {
	my($code, $optype, $sym, $type, $oldresult)=@_;
	my $ts="INVALID";

	if ($type ne "RESULT") {
		if ($type=~/STRING|INT|FLO|BARE/) {
			$$optype="N";
			if ($type=~/STRING/) {
				$$optype="S";
				$sym=qq{"$sym"};
			}
			if ($type=~/BARE/) {
				if ($sym=~s/\$$/_string/) {	
					$$optype="S";
				} else {
					$$optype="N";
				}
				$main::code{$main::seg}->{declarations}->{$sym}=1
					unless $main::code{$main::seg}->{declarations}->{$sym};
			}
			return $sym;
		} elsif ($type eq "STARTARG") {
			return;
		} else {
			die "Bad type for $sym? in expression '$currentexpr'";
		}
	} else {
		return $oldresult;
	}
}
sub pushargs {
	my($code,$optype,$work)=@_;

	return unless @$work;
	my @args=();

	while($$work[-1]->[0] ne "STARTARG") {
		my $item=pop @$work;
		my $a1=pushthing($code, $optype, @$item);
		push @args, [ $a1, @$item ];
	}
	#foreach(@args) {
		#push @$code, qq{\t.arg $_->[0]\t\t# $_->[0]};
	#}
	pop @$work;  # REmove startarg tag...
	return(scalar @args, @args);
}
sub optype_of {
	my($func, $extra)=@_;
	if ($extra and $extra->[2] eq "STRING") {
		return "S";
	}
	if ($func=~/\$$/) {
		return "S";
	} else {
		return "N";
	}
}
sub generate_code {   # Will return a result register, or something.
	my($lhs,@stream)=@_;
	my(@code,@work);

	my $oneop=0;
	my $optype="N";
	my $result="";
	foreach my $token (@stream) {
		my($sym,$type,$op)=@$token;
		#print "Dealing with $sym $type $op\n";

		if (! $op) {
			push @work, $token;
			next;
		}
		next if ($sym eq ",");  # Commas get ignored, args to stack
		my($ac, @args, $extern, $pir_args);
		if (isarray($sym) and $lhs) {
			($ac,@args)=pushargs(\@code, \$optype, \@work);
			$pir_args = join(",", map {$_->[0]} @args);
			$pir_args = ",$pir_args" if $pir_args;
			$extern=$sym;
			$optype=optype_of($extern);
			goto NEST_ARRAY_ASSIGN if (@work); # Ugly, yeah sue me.
			push @code, qq{\t_ARRAY_ASSIGN("$extern$seg",INSERT NEW VALUE HERE,$ac$pir_args)};
			return("~Array", "$optype", @code);
		} elsif (hasargs($sym)) {
			($ac,@args)=pushargs(\@code, \$optype, \@work);
			$pir_args = join(",", map {$_->[0]} @args);
			$pir_args = ",$pir_args" if $pir_args;
			$extern=$sym;
			$optype=optype_of($extern);
			if (isarray($sym)) {
NEST_ARRAY_ASSIGN:
				if ($ac == 0) {
					$optype="P";
				}
				push @code, qq{\t\$$optype$retcount = _ARRAY_LOOKUP_$optype("$extern$seg",$ac$pir_args)};
				push @work, [ "result of $extern()", "RESULT",  "\$$optype$retcount"];
			} elsif (isbuiltin($sym)) {
				$extern=~s/\$/_string/g; $extern=~tr/a-z/A-Z/;
				push @code, qq{\$$optype$retcount = _BUILTIN_$extern($ac$pir_args)};
				push @work, [ "result of $extern()", "RESULT",  "\$$optype$retcount"];
			} else {
				$extern=~s/\$/_string/g; $extern=~tr/a-z/A-Z/;
				push @code, qq{\$$optype$retcount = _USERFUNC_${extern}_run($ac$pir_args)};
				push @work, [ "result of $extern()", "RESULT",  "\$$optype$retcount"];
				$retcount++;
				# External functions return their arguments, 
				# except for PMC types.  Figure if you want to locally
				# modify those, go ahead.  This simulates pass-by-reference.
				foreach my $arg (@args) {
					next if $arg->[0] =~ /^\$P\d+$/;
					if ($arg->[2] eq "BARE") {
						push @code, "\t.result $arg->[0]";
					} else {
						push @code, "\t.result \$"
						. optype_of($arg->[0], $arg) 
						. "$retcount\t# Dummy, thrown away";
						$retcount++;
					}
				}
			}
			$retcount++;
		} else {
			my($op1,$op2)=(pop @work, pop @work);
			my($a1, $a2, $ot1, $ot2);
			$ot1=$ot2=$optype;
			$a1=pushthing(\@code, \$ot1, @$op1);
			$a2=pushthing(\@code, \$ot2, @$op2);
			$optype=$ot2;
			if (exists $opsubs{$sym}) {
				if (! ref $opsubs{$sym}) {
					die "No op code yet for $sym\n";
				} else {
					my($code, $return)=&{$opsubs{$sym}}($a1, $a2, "\$$optype$retcount", "", $ot1, $ot2);
					($optype)=$return=~/([N|S])/;
					push @code, $code;
				}
			} else {
				die "Op $sym not implemented?";
			}
			push @work, [ "($op1->[0] $sym $op2->[0])", "RESULT", "\$$optype$retcount" ];
			$retcount++;
		}
	}

	if (@work) {
		$_=pop @work;
		$result=pushthing(\@code, \$optype, @$_);
	}

	return( $result, $optype, @code );
}
sub build_assignment {
	my($left, $leftexpr, $right, $rightexpr, $righttype)=@_;
	my(@ass);

	if ($left =~ /^\w+$/) {
		if ($left =~ /(_percent|_amp)$/) {
			my $ti="\$I" . ++$retcount;
			my $tn="\$N" . ++$retcount;
			@ass=(
				@$rightexpr,
				"\tset $ti, $right\t# Truncate",
				"\tset $tn, $ti",
				"\t$left = $tn",
			);
		} else {
			# Simple a=expr case.
			@ass=(
				@$rightexpr,
				"\t$left = $right",
				
			);
		}
	} else {
		s/INSERT NEW VALUE HERE/$right/g for @$leftexpr;
		s/--TYPE--/$righttype/g for @$leftexpr;

		@ass=(
			@$rightexpr,
			@$leftexpr,
		);
	}

	return @ass;
}
sub EXPRESSION {
	my(%opts);
	%opts=%{$_[0]} if @_;
	my(@expr, @stream, @left, $whole);
	my($assignto, $result);
	$whole="";
	$retcount=0;
	my $type="";

	if ($opts{assign}) {
		#print STDERR "Assign\n";
		$opts{lhs}=1;
		@expr=get_expression(%opts);	# Get expression tokens
		$whole.=join(' ', map { $_->[0] } @expr);
		@expr=fixup(@expr);		# Repair unary -, functions, etc...
		@stream=convert_to_rpn(@expr);	# Get infix into RPN
		($assignto, $type, @left)=generate_code($opts{lhs},@stream);	# Generate PASM code stream
		feedme();  # Eat the =
		$whole.=" = ";

		$opts{lhs}=0;
		@expr=get_expression(%opts);	# Get expression tokens
		$whole.=join(' ', map { $_->[0] } @expr);
		@expr=fixup(@expr);		# Repair unary -, functions, etc...
		@stream=convert_to_rpn(@expr);	# Get infix into RPN
		($result,$type,@stream)=generate_code(0, @stream);	# Generate PASM code stream

		@stream=build_assignment($assignto, \@left, $result, \@stream, $type);
		$result=$assignto;
	} elsif ($opts{stuff}) {
		#print STDERR "Stuff\n";
		$opts{lhs}=1;
		feedme();
		# Do the left-hand side
		@expr=get_expression(%opts);	# Get expression tokens
		#print STDERR Dumper(\@expr);
		$whole.=join(' ', map { $_->[0] } @expr);
		@expr=fixup(@expr);		# Repair unary -, functions, etc...
		@stream=convert_to_rpn(@expr);	# Get infix into RPN
		#print STDERR "Stream:", join(' ', map { $_->[0] } @stream), "\n";
		($assignto, $type, @left)=generate_code($opts{lhs},@stream);	# Generate PASM code stream
		#print STDERR "Left: @left \n";
		if ($opts{choose}) {
			$opts{stuff}=~s/X/$type/g;
		}
		# The rhs was passed in
		@stream=build_assignment($assignto, \@left, $opts{stuff}, [], $type);
		
		$result=$assignto;
	} else {
		#print STDERR "Extract\n";
		@expr=get_expression(%opts);	# Get expression tokens
		$whole.=join(' ', map { $_->[0] } @expr);
		@expr=fixup(@expr);		# Repair unary -, functions, etc...
		@stream=convert_to_rpn(@expr);	# Get infix into RPN
		($result,$type,@stream)=generate_code(0, @stream);	# Generate PASM code stream
	}
	s/$/\n/ for @stream;
	@stream=("\t#\n", "\t# Evaluating   $whole\n", "\t# Result in $result of type $type\n", @stream);		
	return($result, $type, @stream);
}
sub changename {
	my($name)=@_;
	my %lookup = ( '#' => "_hash",
				  	'!' => "",
					'&' => "_amp",
					'%' => "_percent",
					);
	$name=~s/(%|!|\#|&)$/$lookup{$1}/e;
	$name=~tr/A-Z/a-z/;
	return $name;
}
1;
