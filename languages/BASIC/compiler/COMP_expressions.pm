#!/usr/bin/perl -w

use subs qw(fetchvar);
use vars qw(@builtins @keywords);

@builtins=qw( abs asc atn
		    cdbl chr$ cint clng command$ cos csng csrlin cvd 
		    	cvdmbf cvi cbl cvs cvsmbf 
		    date$
		    environ$ eof erdev erdev$ erl err exp
		    fileattr fix fre freefile
		    hex$
		    inkey$ inp input$ instr int ioctl$
		    lbound lcase$ left$ len loc lof log lpos ltrim$
		    mid$ mkd$ mkdmbf$ mki$ mkl$ mks$ mksmbf$
		    peek pen play pmap point pos
		    right$ rnd rtrim$
		    sadd screen seek setmem sgn sin space$ spc sqr
			stick str$ strig string$
		    tab tan time$ timer
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
			then time$ timer troff tron type to
			uevent unlock until using
			view
			wait while wend width window write
		);

sub dumpq {
	print "Upcoming: $type[0] $syms[0]\n";
	print "Current : $type[1] $syms[1]\n";
	print "Previous: $type[2] $syms[2]\n";
}
sub dumpe {
	foreach(@evalstack) {
		print "\t", $_->[0], "\t", $_->[1], " \n";
	}
}
sub isbuiltin {		# Built in functions
	return 1 if (grep /^\Q$_[0]\E$/i, @builtins);
		
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
sub iskeyword { 
	return 1 if (grep /^\Q$_[0]\E$/i, @keywords);
	return 0;
}
sub precedence {
	my ($op, $next)=@_;

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
{
	my @stack;
	sub SPUSH {
		push(@stack, $_[0]);
	}
	sub SPOP {
		return pop(@stack);
	}
	sub SINIT {
		$stack=();
	}
}

sub EXPRESSION {
	my(%opts);
	%opts=%{$_[0]} if @_;
	
	@workstack=();
	@evalstack=();
	SINIT;
	my $parens=0;
	print CODE "\t# Evaluating ";
	my $feeds=0;
	goto PROCEXP_NOFEED if $opts{lhs};
	goto PROCEXP_NOFEED if $opts{nofeed};
PROCEXP:
	#print "Expression feed\n";
	feedme();
	$feeds++;
PROCEXP_NOFEED:

	#print "Processing $syms[CURR] $type[CURR]\n" unless @ARGV;
	if ( $opts{lhs} and $syms[CURR] eq "=" and not $parens) {
		goto ENDEXPR;
	}
	
	if ( $type[CURR] eq "STMT"
			or
		$type[CURR] eq "COMP"
			or
		$type[CURR] eq "COMM"
			or
		($type[CURR] eq "BARE" and (iskeyword($syms[CURR])
				and !isbuiltin($syms[CURR] )))) {
		#print "Bailing on $type[CURR] $syms[CURR]\n";
		goto ENDEXPR;
	}
	if (not $opts{ignorecomma} and ($syms[CURR] eq ',' and $type[CURR] ne "STRING") and not $parens) {
		goto ENDEXPR;
	}
	if ($syms[CURR] eq ';') {
		goto ENDEXPR;
	}

	print CODE "$syms[CURR]";
		

	# Handle unary minus
	if ($syms[CURR] eq '-' and $type[CURR] eq "PUN")  {
	     if ( precedence($syms[PREV], $syms[NEXT])
		or $syms[PREV] eq ""
		or $syms[PREV] eq "("
		or $feeds < 1 or
		(iskeyword($syms[PREV]) and not isbuiltin($syms[PREV]) ) ) {
			push(@workstack, [ ( 'OP', 'UNARYMINUS' ) ]);
			goto PROCEXP;
	     }
	}


	if ($type[CURR] eq 'INT' 
		     or 
	    $type[CURR] eq 'FLO'
		     or
	    $type[CURR] eq 'STRING')  {
		push(@evalstack, [ ( $type[CURR], $syms[CURR] ) ]);
		goto PROCEXP;
	}
	if ( $syms[CURR] eq '(') {
		push(@workstack, [ ( $type[CURR], $syms[CURR] ) ]);
		$parens++;
		goto PROCEXP;
	}
	if ($syms[CURR] eq ')') {
		$parens--;
		while(@workstack) {
			($type,$op)=@{$workstack[-1]}[0,1];
			if ($op ne '(') {
				push(@evalstack, pop @workstack);
				next;
			} else {
				pop @workstack;
			}
			while (@workstack) {
				($type,$op)=@{$workstack[-1]}[0,1];
				if ($type eq 'FUNC') {
					push(@evalstack, pop @workstack);
					next;
				}
				last;
			}
			last;
		}
		goto PROCEXP;
	}
	if ($_=precedence($syms[CURR], $syms[NEXT]) and $_ < 100) { # and $type[CURR] ne 'BARE') {
		if (@workstack) {
			while(@workstack) {
				($type,$op)=@{$workstack[-1]}[0,1];
				if ( $op ne '(' and 
					precedence($op)>=$_) {
					push(@evalstack, pop @workstack);
				} else {
					last;
				}
			}
		} 
		push(@workstack, [ ( 'OP', $syms[CURR] ) ] );
		goto PROCEXP;
	}
	my $shuffleargs = sub {
		while(@workstack) {
			($type,$op)=@{$workstack[-1]}[0,1];
			if ($op ne '(' and 
				precedence($op)>=$_) {
				push(@evalstack, pop @workstack);
			} else {
				last;
			}
		}
	};
	if ($type[CURR] eq 'BARE') {
		if (isbuiltin($syms[CURR])) {
			&$shuffleargs;
			push(@workstack, [ ( 'FUNC', $syms[CURR] ) ] );
			push(@evalstack, [ ( 'ARG', 'ARG' ) ] );
		} elsif (isuserfunc($syms[CURR])) {
			&$shuffleargs;
			push(@workstack, [ ( 'FUNC', $syms[CURR] ) ] );
			push(@evalstack, [ ( 'ARG', 'ARG' ) ] );
		} elsif ($syms[NEXT] eq '(') {  # Arrays!  TBD...
			&$shuffleargs;
			push(@workstack, [ ( 'PUN', '(' ) ] );
			push(@workstack, [ ( 'SUBSCRIPT', $syms[CURR] ) ] );
			push(@evalstack, [ ( 'SUBS', 'SUBS' ) ] );
		} else {
			push(@evalstack, [ ( $type[CURR], $syms[CURR] ) ]);
		}
		goto PROCEXP;
	}

ENDEXPR:
	
	print CODE "   Options: ", join(',', keys %opts) if keys %opts;
	print CODE "\n";
	while(@workstack) {
		if ($workstack[-1]->[1] ne "(") {
			push(@evalstack, pop @workstack) 
		} else {
			pop @workstack;
		}
	}
	#dumpe;print"\n";

	# Now render the code as instructions
BUILDCODE:
	@code=();
	if (@evalstack==1) {   # Special case, optimize a bit.
		($type,$sym)=@{$evalstack[-1]};
		goto NEVERMIND if $type =~ /BARE/;
		die "Unexpected early termination of expression" unless $type =~ /STRING|INT|FLO/;
		push(@code, qq{\tnew P6, .PerlHash\t# Optimized, no eval\n});
		push(@code, qq{\tset P6["type"], "$type"\n});
		if ($type eq "STRING") {
			$sym=qq{"$sym"};
		}
		push(@code, qq{\tset P6["value"], $sym\n});
		pop @evalstack;  # Tidy.
	} else {
NEVERMIND:	push(@code, "\tbsr EXPRINIT\n");
		while(@evalstack) {
			($type,$sym)=@{pop @evalstack};
			if ($type eq "STRING" or $type eq "OP" or
				$type eq "BARE" or $type eq "ARG" or
					$type eq "FUNC" or $type eq "SUBS" or $type eq "SUBSCRIPT") {
				next if $sym eq "," and $type eq "OP";
				$sym="\\\\" if $sym eq '\\';
				push(@code, qq{\tpush P9, '$sym'\n});
			} else {
				push(@code, qq{\tpush P9, $sym\n});
			}
			push(@code, qq{\tpush P9, "$type"\n});
		}
		push(@code, "\tbsr EVALEXPR\n");
	}
	
ENDCOMPILE:
	#dumps();
	#print "-" x 70, "\n";
	barf();        # Move back one token.
	
	#dumps();
	#print "-" x 70, "\n";
	return @code;
}
1;
