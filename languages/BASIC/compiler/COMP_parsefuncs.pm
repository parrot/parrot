# Aux. functions needed by the parser.  (For cleanliness)
#

use warnings;

use vars qw( %usertypes );
use vars qw( %arrays );
use vars qw( $funcname $subname );
use vars qw( %labels $branchseq @selects);
use vars qw( @data $sourceline );

my @fors=();
my @whiles=();
my @dos=();
@selects=();
my $scopes=0;
my @data=();

sub parse_shared {		# Keyword only
	feedme();
	$loop=0;
	while($type[CURR] !~ /COMP|COMM|STMT/) {
		die if $loop++>20;
		$var=$syms[CURR];
		feedme;
		my $array=0;
		if ($syms[CURR] eq "(") {
			$array=1;
			while($syms[CURR] ne ")") {
				feedme;
			}
			feedme;
		}
		$stype="";
		$user=0;
		if ($syms[CURR] eq "as") {
			feedme;
			$stype=$syms[CURR];
			feedme; # N
			my %th=( single => 'FLO', double => 'FLO', long => 'INT', integer => 'INT', string => 'STRING');
			if (exists $th{$stype}) {
				$stype=$th{$stype};
			} else {
				unless (exists $usertypes{$stype}) {
					die "User type $stype not found at source line $sourceline";
				}
				$user=1
			}
		}
		unless ($stype) {
			$stype=typeof($var);
		}
		$arrays{$var}=1 if ($array);
		#print "Flagging (assumed) $var as array\n";
		if ($array) { 
			$stype="ARRAY"; 
		} else {
			$var=~s/\W$//g;
		}
		#print "Type: $stype  User: $user Var: $var  Array: $array\n";
		if ($user and ! $array ) {
			print CODE<<SHARINGU;
	# Sharing $stype (user) $var with main
	set P0, P10[0]
	set P1, P0["USER"]
	set P0, P1["$var"]	# Pull the original
	set P2, P10[I25]
	set P3, P2["USER"]
	set P3["$var"], P0	# Hack in the alias

SHARINGU
		} elsif ( $user and $array) {
			# TODO TODO TODO TODO
			print CODE<<SHARING;
	# Sharing $stype $var with main  (array=$array)
	set P0, P10[0]
	set P1, P0["$stype"]
	set P0, P1["$var"]	# Pull the original
	set P2, P10[I25]
	set P3, P2["$stype"]
	set P3["$var"], P0	# Hack in the alias

SHARING
		} else {
			print CODE<<SHARING;
	# Sharing $stype $var with main  (array=$array)
	set P0, P10[0]
	set P1, P0["$stype"]
	set P0, P1["$var"]	# Pull the original
	set P2, P10[I25]
	set P3, P2["$stype"]
	set P3["$var"], P0	# Hack in the alias

SHARING
		} 
	}
}

my $inputcounts=0;
sub input_read_assign {
	my($prompt,$filedesc,$noreloop)=@_;
	my @values=();
	$loop=0;
	while($type[CURR] !~ /COMP|COMM|STMT/) {
		die if $loop++>20;
		@lhs=EXPRESSION({ lhs => 1});
		push @values, [ @lhs ];
		feedme();
		if ($syms[CURR] eq ",") {
			feedme();
			next;
		}
	}
	die "No input values" unless @values;
	my $vars=@values;
	print CODE $prompt;
	my $sf=1;
	if ($filedesc) {
		print CODE qq{\tset I1, P17["$filedesc"]\n};
		print CODE qq{\teq I1, 0, ERR_BADF\n};
		$sf=0;
	} else {
		print CODE "\tset I1, $filedesc   # STDIN\n";
	}
	
	print CODE<<INP1;
	bsr READLINE
	set I0, $sf
	bsr SPLITLINE   # Array of values from input
	set I0, P1
INP1
	if ($noreloop) {
		print CODE "\tne I0, $vars, ERR_INPFIELDS\n";
	} else {
		print CODE "\tne I0, $vars, INPUT_$inputcounts  # Re-prompt\n";
	}

	print CODE "\tset P12, P1\n";
	foreach my $expr (reverse @values) {
	 	print CODE <<INP2;
@{$expr}
	pop P0, P12
	set P2, P6
	set P6, P0	      # Swap P0, P6
	set P0, P2
	bsr ASSIGNMENT        # P0 = P6
INP2
	}
}
sub parse_input {
	feedme();
	my $promptcode="";
	if ($syms[CURR] eq ";") {
		feedme();		# Ignore this form for now.
	}
	if ($syms[CURR] eq "#") {
		feedme();
		$fd=$syms[CURR];
		feedme();
		die "Expecting ," unless $syms[CURR] eq ",";
		feedme();
		input_read_assign($promptcode, $fd, 'noreprompt');
		return;
	}
	$promptcode="INPUT_$inputcounts:\n";
	# BASIC is unambiguous here.  The next thing must be a quoted string or
	#   no prompting is done.  However, QB says that if no prompt, use " ?"
	if ($type[CURR] eq "STRING") {
		$promptcode.=qq{\tprint "$syms[CURR]"\n};
		feedme();
		if ($syms[CURR] eq ",") {
			$promptcode.=qq{\tnoop  # No ?\n};
		} elsif ($syms[CURR] eq ";") {
			$promptcode.=qq{\tprint "?"\n};
		} else {
			die "Syntax error, expected ',' or ';'";
		}
		feedme();
	} else {
		$promptcode.=qq{\tprint "? "\n};
	}
	input_read_assign($promptcode, 0, 0);
	$inputcounts++;
}

my $ons=0;
sub parse_on {
	my(@expr)=EXPRESSION;  # The switch...
	feedme();
	my $branch=$syms[CURR];  # goto or gosub
	print CODE "\t# On X $branch...\n";
	feedme();
	$loop=0;
	@onlab=();
	while($type[CURR] !~ /COMP|COMM|STMT/) {
		die if $loop++>255;
		if ($syms[CURR] eq ",") {
			feedme();
			next;
		}
		die "Only labels/numbers allowed" unless ($type[CURR]=~/BARE|INT/);
		create_label();
		push(@onlab, $syms[CURR]);
		feedme();
	}
	print CODE<<ON;
@expr	bsr DEREF
	bsr UNSTUFF	# Sets S0/I0/N0 and S2 (type)
	set S1, S2
	bsr MAKEINT
	gt I0, 255, ERR_ON_RANGE
	lt I0,   0, ERR_ON_RANGE	
ON
	$i=1;
	for my $jumps (@onlab) {
		print CODE "\tne I0, $i, ON_${ons}_$i\n";
		if ($branch eq "gosub") {
			print CODE qq{\tbsr $labels{$jumps}\t# $branch $jumps\n};
			print CODE qq{\tne S0, "", RUNTIME_JUMP\n};
			print CODE qq{\tbranch ON_END_$ons\n};
		} elsif ($branch eq "goto") {
			print CODE qq{\tbranch $labels{$jumps}\t# $branch $jumps\n};
		} else {
			die "Illegal branch type, only GOSUB/GOTO allowed";
		}
		print CODE "ON_${ons}_$i:\n";
		$i++;
	}
	if ($branch eq "gosub") {
		print CODE "\tnoop\nON_END_${ons}:\n";
	}
	$ons++;
}
sub parse_randomize {
	if ($type[NEXT] =~ /STMT|COMM|COMP/) {  # No arg version
		feedme();
		print CODE<<PROMPTRND;
	print "Random-number seed (-32768 to 32767)?"
	bsr READLINE
	bsr CHOMP
	set I12, S0
PROMPTRND
	} else {
		@e=EXPRESSION();
		print CODE<<COMPRND;
@e	bsr DEREF
	bsr UNSTUFF
	set S1, S2
	bsr MAKEINT
	set I12, I0
COMPRND
		feedme();
	}
}
sub parse_locate {	# locate x,y   | locate x   | locate ,y
	my($x,$y);
	my(@e2);
	@e=();
	if ($type[NEXT] =~ /PUN/) {  # Y only
		feedme();
		@e2=EXPRESSION();   # Y (only)
	} else {
	    	@e=EXPRESSION();    # X
		if ($type[NEXT] =~ /PUN/) {
			feedme();
			@e2=EXPRESSION();
		}
	}
	if (@e and @e2) {  	# X and Y
	print CODE<<XANDY;
@e	bsr DEREF
	bsr CAST_TO_INT
	set P7, P6
	pushp		
@e2	bsr DEREF		# Got both
	bsr CAST_TO_INT
	save P6
	popp
	restore P6
	bsr SCREEN_LOCATE		
XANDY
	} elsif (@e2 and not @e) {
	print CODE<<YNOTX;
@e2	bsr DEREF
	bsr CAST_TO_INT
	bsr SCREEN_SETYCUR
YNOTX
	} elsif (@e and not @e2) {
	print CODE<<XNOTY;
@e	bsr DEREF
	bsr CAST_TO_INT
	bsr SCREEN_SETXCUR
XNOTY
	}
}
sub parse_color {
	my($f,$b);
	my(@e2);
	@e=();
	if ($type[NEXT] =~ /PUN/) {  # Back only
		feedme();
		@e2=EXPRESSION();   # Back (only)
	} else {
	    	@e=EXPRESSION();    # Fore
		if ($type[NEXT] =~ /PUN/) {
			feedme();
			@e2=EXPRESSION();
		}
	}
	if (@e and @e2) {  	# F and B
print CODE<<FANDB;
@e	bsr DEREF
	bsr CAST_TO_INT
	set P7, P6
	pushp
@e2	bsr DEREF		# Got both
	bsr CAST_TO_INT
	save P6
	popp
	restore P6
	bsr SCREEN_COLOR
FANDB
	} elsif (@e2 and not @e) {
	print CODE<<BNOTF;
	bsr SCREEN_GETFORE	# B and no F
	set P7, P6
@e2	bsr DEREF
	bsr CAST_TO_INT
	bsr SCREEN_COLOR
BNOTF
	} elsif (@e and not @e2) {
	print CODE<<FNOTB;
	bsr SCREEN_GETBACK	# F and no B
	set P8, P6
	pushp
@e	bsr DEREF
	bsr CAST_TO_INT
	save P6
	popp
	restore P6
	set P7, P6
	set P6, P8
	bsr SCREEN_COLOR
FNOTB
	}
}
sub parse_cls {
	if (! $type[NEXT] =~ /STMT|COMM|COMP/) {  # No arg version
		@e=EXPRESSION();
	}
	print CODE <<CLS;
	bsr SCREEN_CLEAR
CLS
	feedme();
}
sub parse_open {
	my(@filename)=EXPRESSION;
	feedme();
	die "Expecting FOR at $sourceline" unless $syms[CURR] eq "for";
	feedme();
	my $mode="";
	if ($syms[CURR] eq "input") {
		$mode="r";
	} elsif ($syms[CURR] eq "output") {
		$mode="w";
	} elsif ($syms[CURR] eq "random") {
		die "random file i/o not implemented yet at $sourceline"
	} else {
		die "Expected input/output/random at $sourceline"
	}
	feedme();
	die "Expecting AS" unless $syms[CURR] eq "as";
	feedme();
	die "Expecting #" unless $syms[CURR] eq "#";
	feedme();
	$fd=$syms[CURR];
	print CODE <<OPEN;
@filename
	bsr DEREF
	bsr UNSTUFF
	ne S2, "STRING", ERR_FN
	set S1, "$mode"
	bsr OPEN
	set P17["$fd"], I0
OPEN
}
sub parse_close {
	feedme();
	die "Expecting # at $sourceline" unless $syms[CURR] eq "#";
	feedme();
	$fd=$syms[CURR];
	print CODE<<CLOSE;
	set I0, P17["$fd"]
	bsr CLOSE
	set P17["$fd"], 0
CLOSE
}
sub fdprint {	
	my($fd, $string)=@_;
	if ($fd) {
		print CODE qq{\tset S0, "$string"\n};
		print CODE qq{\tset I1, P17["$fd"]\n};
		print CODE qq{\tbsr PRINTLINE\n};
	} else {
		print CODE qq{\tset S3,"$string"\n\tbsr DISP_SCREEN\n};
	}

}
sub parse_print {
	my $eol=0;
	my $expr=0;
	my $c=0;
	my $fd="";
	feedme();
	if ($syms[CURR] eq "#") { 
		feedme();
		$fd=$syms[CURR];
		feedme();
		feedme();
	}
	if ($syms[CURR] eq "using") {
		print "WARNING: PRINT USING not yet supported\n";
		feedme();	# "####"
		feedme();	# ;
	}
	while(1) {
		if ($type[CURR] eq "STMT" or $type[CURR] eq "COMP" or $type[CURR] eq "COMM") {
			last;
		}
		last if (iskeyword($syms[CURR]) and not isbuiltin($syms[CURR]));
		die "LOOP" if $c++>100;
		if ($type[CURR] eq "STRING" and not $fd) {
			$eol=0;
			fdprint($fd, $syms[CURR]);
			feedme();
			$expr=1;
			next;
		}
		if ($syms[CURR] eq ";") {
			$eol=1;
			feedme();
			$expr=0;
			next;
		}
		if ($syms[CURR] eq ",") {
			fdprint($fd, "\\t");
			$eol=1;
			feedme();
			$expr=0;
			next;
		}
		last if $expr;
		print CODE EXPRESSION({nofeed => 1});
		feedme();
		print CODE "\tbsr DEREF\n";
		print CODE qq{\tset S1, "$fd"\n};  # Either blank or an FD.
		print CODE "\tbsr DISPLAY_EXPRESSION\n";
		#print "After Expression have $type[CURR] $syms[CURR]\n";
		$eol=0;
		$expr=1;
		next;
	}
	unless ($eol) {
		fdprint($fd, "\\n");
	}
	barf();
}
sub parse_read {
	feedme();
	while($type[CURR] !~ /COMP|COMM|STMT/) {
		@lhs=EXPRESSION({ lhs => 1});
		feedme();
		print CODE<<EOASS;
@lhs
	bsr READ	      # Read into P0
	set P2, P6
	set P6, P0	      # Swap P0, P6
	set P0, P2
	bsr ASSIGNMENT        # P0 = P6
EOASS
		if ($syms[CURR] eq ",") {
			feedme();
			next;
		}
	}
}
sub parse_swap {
	my(@f, @s);
	feedme();
	@f=EXPRESSION({lhs => 1});
	feedme();
	die "Expected ',': $syms[CURR]" unless $syms[CURR] eq ",";
	feedme();
	@s=EXPRESSION({lhs => 1});
	print CODE<<SWAP;
	# The swap!
	# P0=P6
@f	
	set P12, P6	# Store me.
@s	
	set P13, P6	# Me too
	bsr SWAP
SWAP
}

sub parse_stop {
	feedme();
	print CODE<<STOP;
	print "Stopped at source line "
	print I11
	print "\\n"
	end
STOP
}
sub parse_data {
	my ($currline)=@_;
	$currline="" unless defined $currline;
	my @ld=();
	feedme();
OUTDATA:while($type[CURR] !~ /COMP|COMM|STMT/) {
		if ($syms[CURR] eq ",") {
			feedme();
			next;
		}
		if ($type[CURR] eq "PUN" and $syms[CURR] =~ /-/) {
			if ($type[NEXT] =~ /INT|FLO/) {
				feedme();
				$syms[CURR]="-$syms[CURR]";
			}
		}
		if ($type[CURR] =~ /STRING|BARE/) {
			push @ld, { type => "STRING", value => qq{"$syms[CURR]"} };
		} elsif ($type[CURR] =~ /INT|FLO/ ) {
			push @ld, { type => $type[CURR], value => $syms[CURR] };
		} elsif ($type[CURR] eq "PUN") {
			my $s=$syms[CURR];
			while(1) {
				feedme();
				if ($syms[CURR] eq ",") {
					push @ld, { type => "STRING", value=> qq{"$s"}};
					redo OUTDATA;
				}
				if ($type[CURR] =~ /COMP|COMM|STMT/) {
					push @ld, { type => "STRING", value=> qq{"$s"}};
					last OUTDATA;
				}
				$s.=$syms[CURR];
			}
		} else {
			die "Cannot use $type[CURR]/$syms[CURR] in DATA";
		}
		feedme();
	}
	push(@data, { line => $currline, data => \@ld });
}
sub parse_restore {
	if ($type[NEXT] eq "BARE" or $type[NEXT] eq "INT") {
		feedme();
		create_label();
		print CODE qq{\tset S0, "$labels{$syms[CURR]}"\n};
	} else {
		print CODE qq{\tset S0, ""\n};
	}
	feedme();
	print CODE "\tbsr RESTORE\n";
}

sub parse_exit {
	if ($syms[NEXT] eq "for") {
		feedme();
		$foo=$fors[$scopes]->[-1];
		print CODE "\tbranch AFTER_NEXT_$foo->{jump}\n";
	} elsif ($syms[NEXT] eq "function") {
		feedme();
		$_=english_func($funcname);
		print CODE "\tbranch FUNC_EXIT_$_\n";
	} elsif ($syms[NEXT] eq "sub") {
		feedme();
		print CODE "\tbranch SUB_EXIT_$subname\n";
	} elsif ($syms[NEXT] eq "do") {
		feedme();
		$foo=$dos[-1];
		print CODE "\tbranch AFTERDO_$foo->{jump}\n";
	} else {
		die "Unknown EXIT type source line $sourceline";
	}
}



$selectcounter=0;
sub parse_select {
	die "Expected 'case'" if ($syms[NEXT] ne "case");
	feedme();
	push(@selects, { jump => ++$selectcounter, incase => 0 });
	my @a=EXPRESSION();
	print CODE<<SELECTSTART;
	# Select case on
@a	bsr DEREF		       # De-reference variables and whatnot.
	set P0, P10[I25]
	set P1, P0["SELECTS"]
	set P1["$selectcounter"], P6   # Store for later.
	branch CASE_${selectcounter}_0
	
SELECTSTART
	# Honestly the next thing needs to be a case statement.
	# I don't enforce it though.  Honor system!  :)
}
sub parse_case {
	my @a;
	my $s=$selects[-1];
	my($jump, $incase)=($s->{jump}, $s->{incase});
	
	if ($syms[NEXT] eq "else") {
		feedme();
		print CODE "\t branch CASE_${jump}_FIN\n";
		print CODE "CASE_${jump}_${incase}:\t# Default\n";
		$selects[-1]->{incase}=$incase+1;
		return;
	}

	my $lambda=<<GL;
	
	set P0, P10[I25]
	set P1, P0["SELECTS"]
	set P5, P1["$jump"]      # Stored value.
GL
	print CODE<<CASE_SETUP;
	branch CASE_${jump}_FIN
CASE_${jump}_${incase}:
	new P12, .PerlArray   # OR
	new P13, .PerlArray   # TO
	new P14, .PerlArray   # Operators.  Op first, then value
CASE_SETUP
	my($ors,$tos,$ops)=(0,0,0);
	while(1) {
		if ($type[CURR] eq "COMM") {
			print CODE "\t#$syms[CURR]\n";
			last;
		}
		last if ($type[CURR] eq "STMT" or $type[CURR] eq "COMP");
		if ($syms[NEXT] =~ /^>|>=|<|<=|=|<>$/) {   # Relop
			feedme();
			$op=$syms[CURR];
			@a=EXPRESSION();
			feedme();
			print CODE<<OP;
	push P14, "$op"
@a	bsr DEREF
	push P14, P6
OP
			$ops++;
			next;
		}
		@a=EXPRESSION();   # CURR = "to", "," or EOL.
		feedme();
		if ($syms[CURR] eq "," or 
			$type[CURR] eq "STMT" or $type[CURR] eq "COMP") {
			print CODE<<EQ;
@a	bsr DEREF
	push P12, P6   # Save result for later.
EQ
			$ors++;
		}
		if ($syms[CURR] eq "to") {
			my @b=EXPRESSION();
			feedme();
			print CODE<<TO;
# From
@a	bsr DEREF
	push P13, P6
# To
@b	bsr DEREF
	push P13, P6
TO
			$tos++;
		}
		last if ($type[CURR] eq "STMT" or $type[CURR] eq "COMP");
	}
	print CODE "\tbsr EXPRINIT\n";
	print CODE $lambda;
	if ($ors) {
		print CODE <<ORS
	set I5, P12
CASE_${jump}_${incase}_STARTOR:
	eq I5, 1, CASE_${jump}_${incase}_NO_OR
	push P9, "or"
	push P9, "OP"
CASE_${jump}_${incase}_NO_OR:
	push P9, "="
	push P9, "OP"
	set P0, P5		# The "constant"
	bsr RUNTIME_PUSH
	pop P0, P12
	bsr RUNTIME_PUSH
	dec I5
	gt I5, 0, CASE_${jump}_${incase}_STARTOR
ORS
	}
	if ($ors and $tos) {
		print CODE qq{\tunshift P9, "OP"\n};
		print CODE qq{\tunshift P9, "or"\n};
	}
	if ($tos) {
		print CODE<<TOS;
	set I5, P13
	div I5, I5, 2
CASE_${jump}_${incase}_STARTTO:
	eq I5, 1, CASE_${jump}_${incase}_NO_TO
	push P9, "or"
	push P9, "OP"
CASE_${jump}_${incase}_NO_TO:
	push P9, "and"
	push P9, "OP"
	push P9, ">="
	push P9, "OP"
	set P0, P5
	bsr RUNTIME_PUSH
	pop P0, P13
	bsr RUNTIME_PUSH
	push P9, "<="
	push P9, "OP"
	set P0, P5
	bsr RUNTIME_PUSH
	pop P0, P13
	bsr RUNTIME_PUSH
	dec I5
	gt I5, 0, CASE_${jump}_${incase}_STARTTO	
TOS
	}
	if ($ops and ($tos or $ors)) {
		print CODE qq{\tunshift P9, "OP"\n};
		print CODE qq{\tunshift P9, "or"\n};
	}
	if ($ops) {
		print CODE<<OPS;
	set I5, P14
	div I5, I5, 2
CASE_${jump}_${incase}_STARTOPS:
	eq I5, 1, CASE_${jump}_${incase}_NO_OP
	push P9, "or"
	push P9, "OP"
CASE_${jump}_${incase}_NO_OP:
	pop P1, P14
	pop S0, P14
	push P9, S0
	push P9, "OP"
	set P0, P1
	bsr RUNTIME_PUSH
	set P0, P5
	bsr RUNTIME_PUSH
	dec I5
	gt I5, 0, CASE_${jump}_${incase}_STARTOPS
OPS
	}
	$incase++;
	print CODE<<ENDCASE;
	bsr EVALEXPR
	bsr TRUTH
	ne I1, 1, CASE_${jump}_${incase}
ENDCASE
	$selects[-1]->{incase}=$incase;
}




my $whilecounter=0;
sub parse_while {
	$whilecounter++;
	push(@whiles, { jump => $whilecounter });
	print CODE "WHILE_$whilecounter:\n";
	print CODE EXPRESSION;
	print CODE<<BRANCH
	bsr TRUTH
	eq I1, 0, AFTERWHILE_$whilecounter
BRANCH
}
sub parse_wend {
	$_=pop(@whiles);
	$_=$_->{jump};
	print CODE<<LOOPUP;
	branch WHILE_$_
AFTERWHILE_$_:
LOOPUP
}
my $docounter=0;
sub parse_do {
	$docounter++;
	if ($syms[NEXT] eq "until" or $syms[NEXT] eq "while") {
		feedme();  # At the while/until
		my $which=$syms[CURR];
		print CODE "DO_$docounter:\n";
		print CODE EXPRESSION, "\tbsr TRUTH\n";
		if ($which eq "while") {
			$_="eq I1, 0, AFTERDO_$docounter";
		} else {
			$_="eq I1, 1, AFTERDO_$docounter";
		}
		print CODE "\t$_\n";
		push(@dos, { jump => $docounter, needstmt => 0 });
	} else {
		print CODE "DO_$docounter:\n";
		push(@dos, { jump => $docounter, needstmt => 1 });
	}
}
sub parse_goto {
	feedme;
	create_label();
	print CODE "\tbranch $labels{$syms[CURR]}\t# Goto $syms[CURR]\n";
}
sub parse_gosub {
	feedme;
	create_label();
	print CODE<<GOSUB;
	bsr $labels{$syms[CURR]}\t# GOSUB $syms[CURR]
	ne S0, "", RUNTIME_JUMP
GOSUB
}
sub parse_return {
	if ($type[NEXT] ne "BARE") {
		print CODE<<RETURN1;
	set S0, ""
	ret
RETURN1
	} else {
		feedme();   # Special "Return Label"
		create_label();
		print CODE<<RETURN2;
	set S0, "$labels{$syms[CURR]}"  # Return $syms[CURR]
	ret
RETURN2
	}
}
sub parse_loop {
	my $do=pop @dos;
	if ($do->{needstmt} and not ( $syms[NEXT]=~/while|until/ ) ) {
		print CODE "\nbranch DO_$do->{jump}\t# Unconditional\n";
		print CODE "AFTERDO_$do->{jump}:\n";
		return;
	}
	if ($do->{needstmt}) {
		feedme();
		my $which=$syms[CURR];
		print CODE EXPRESSION, "\tbsr TRUTH\n";
		if ($which eq "while") {
			$_="eq I1, 1, DO_$do->{jump}";
		} else {
			$_="eq I1, 0, DO_$do->{jump}";
		}
		print CODE "\t$_\n";
	} else {
		print CODE "\tbranch DO_$do->{jump}\n";
	}
	print CODE "AFTERDO_$do->{jump}:\n";
}

sub parse_type {
		my(@types);
		feedme;
		my $typename=$syms[CURR];
		feedme;
		$sourceline++;
		feedme;
		while($syms[CURR] ne "end") {
			my($name,$type);
			die "Syntax error in type $type[CURR]/$syms[CURR] (source line $sourceline)" unless $type[CURR] eq "BARE";
			$name=$syms[CURR];
			feedme;
			die "Expected 'as' got $syms[CURR] (source line $sourceline)" unless $syms[CURR] eq 'as';
			feedme;
			$type=$syms[CURR];
			my %th=( single => 'FLO', double => 'FLO', long => 'INT', integer => 'INT', string => 'STRING');
			die "Unknown type $type (source line $sourceline)" unless ( exists $th{$type} or
							  exists $usertypes{$type});
			my $marker;
			if (exists $th{$type}) {
				$marker=$th{$type};
			} else {
				$marker='USER';
			}
			push(@types, [ $name, $type, $marker ]);
			feedme();
			if ($type[CURR] eq "PUN" and $syms[CURR] eq "*") {
				print "WARNING: * in TYPE not supported yet for $name\n";
				feedme;
				feedme;
			}
			while($type[CURR] eq "STMT" or $type[CURR] eq "COMM") {
				print CODE "\t# $syms[CURR]\n" if $type[CURR] eq "COMM";
				feedme;
			}
			$sourceline++;
		}
		feedme;   # Collect the "type"
		$usertypes{$typename}=[ @types ];
		print CODE <<TYPE;
	# Type definition for $typename
	new P0, .PerlArray
TYPE
		foreach(@types) {
			print CODE<<ADDT;
	new P1, .PerlHash
	set P1["name"], '$_->[0]'
	set P1["type"], '$_->[1]'
	push P0, P1
ADDT
		}
		print CODE<<TYPEE;
	set P1, P10[0]
	set P2, P1["types"]
	set P2["$typename"], P0
	branch OUTOF_$typename
DIM_$typename:
	#print "Dimensioning $typename\\n"
	pushp
	new P2, .PerlHash
TYPEE
		foreach(@types) {
			my %val=( INT => 0, FLO => '0.0', STRING => '""' );
			if ($_->[2] ne "USER") {
				print CODE<<NOTUSER;
	new P1, .PerlHash
	set P1["name"], '$_->[0]'
	set P1["type"], '$_->[2]'
	set P1["value"], $val{$_->[2]}
	set P2["$_->[0]"], P1
NOTUSER
			} else {
				print CODE<<USERTYPE;
	new P1, .PerlHash
	set P1["name"], '$_->[0]'
	set P1["type"], "USER"
	bsr DIM_$_->[1]
	set P1["storage"], P0
	set P1["_type"], '$_->[1]'
	set P2["$_->[0]"], P1
USERTYPE
			}
		}
	
		print CODE<<FINDIM;
	save P2
	popp
	restore P0
	ret
COPY_$typename:  		# Source in P6 Dest in P1 (don't trash P0)
	#print "--Copying a $typename\\n"
	pushp			# Makes an internal mess of P2, P3, P4, P5, P6 (popped)
	new P3, .PerlHash       # Uses S0, I0, N0
FINDIM
		
		foreach(@types) {
			my %val=( INT => 'I0', FLO => 'N0', STRING => 'S0' );
			if ($_->[2] ne "USER") {
				print CODE<<NOTUSER;
	new P2, .PerlHash
	set P2["name"], '$_->[0]'
	set P2["type"], '$_->[2]'
	set P4, P6["storage"]
	set P5, P4["$_->[0]"]
	set $val{$_->[2]}, P5["value"]
	set P2["value"], $val{$_->[2]}
	#print "-> Copied value for "
	#print $val{$_->[2]}
	#print "\\n"
	set P3["$_->[0]"], P2
NOTUSER
		} else {
				print CODE<<USER;
	new P2, .PerlHash
	set P2["name"], '$_->[0]'
	set P2["type"], "USER"
	set P5, P6		# Remember where we were...
	set P4, P6["storage"]
	set P6, P4["$_->[0]"]
	bsr COPY_$_->[1]
	set P2["storage"], P1
	set P6, P5		# Go back to where we were!
	set P2["_type"], '$_->[1]'
	set P3["$_->[0]"], P2
	#print "Finished substruct\\n"
USER
			}
		}

	print CODE<<OUTOF;
	#print "Out of copy $typename\\n"
	save P3
	popp
	restore P1
	ret
OUTOF_$typename: 

OUTOF

}

sub parse_dim {
		feedme;
ANOTHERDIM:
		if ($syms[NEXT] eq "as") {
			my $var=$syms[CURR];
			feedme;  # "as"
			feedme;  # type.
			die "Unknown type $syms[CURR]" unless exists $usertypes{$syms[CURR]};
			my $type=$syms[CURR];
			die "SIGIL not allowed here" unless ($var=~/\w$/);
			print CODE<<DIMTYPE;
	set P1, P10[I25]
	set P2, P1["USER"]
	bsr DIM_$type
	new P1, .PerlHash
	set P1["_type"], '$type'
	set P1["type"], "USER"
	set P1["storage"], P0
	set P2["$var"], P1
DIMTYPE
			if ($syms[NEXT] eq ",") {
				feedme();
				goto &parse_dim;
			}
		} elsif ($syms[NEXT] eq "(")  {
			my $var=$syms[CURR];
			while(1) {
				feedme;
				last if $syms[CURR] eq ")";
			}
			my $type;
			$type="FLO";
			my %th=( single => 'FLO', double => 'FLO', long => 'INT', integer => 'INT', string => 'STRING');
			my %sigilmap=( '%' => 'integer', '&' => 'long',
				       '!' => 'single',  '#' => 'double',
				       '$' => 'string'  );
			my $ut="";
			if ($syms[NEXT] eq "as") {
				feedme;	# "as"
				feedme; # type...
				if (exists $th{$syms[CURR]}) {
					$type=$th{$syms[CURR]};
				} elsif (exists $usertypes{$syms[CURR]}) {
					$type="USER";
					$ut=qq{\tset P2["usertype"], "$syms[CURR]"\n};
				} else {
					die "Unknown type $syms[CURR]";
				}
			} else {
				$_=substr($var, -1, 1);
				if (exists $sigilmap{$_}) {
					$type=$th{$sigilmap{$_}};
				}
			}
			$arrays{$var}=1;
			print CODE<<DIMARR;
	# Set aside storage for Array $var
	set P1, P10[I25]
	set P0, P1["ARRAY"]
	new P1, .PerlHash
	new P2, .PerlHash
	set P2["_type"], "$type"
	set P2["type"], "ARRAY"
$ut	set P2["elements"], P1
	new P1, .PerlArray
	set P2["keys"], P1
	set P0["$var"], P2
	#
DIMARR
			if ($syms[NEXT] eq ",") {
				feedme();
				goto &parse_dim;			
			}
		} elsif ($syms[CURR] eq "shared") {
			print "WARNING: SHARED keyword currently ignored\n";
			goto &parse_dim;
		} else  {
			die "Unknown dim type: $syms[CURR] at source line $sourceline";
		}
}
my $forcounter=0;
sub parse_for {   # for var = start to finish [step increment]
	feedme();
	my $counter=$syms[CURR];
	feedme();
	die "Expected = at source line $sourceline" if ($syms[CURR] ne "=");
	$counttype=typeof($counter);
	die "Only INT or FLO allowed at $sourceline" unless ($counttype =~ /INT|FLO/);
	
	my @start=EXPRESSION;
	feedme();
	die "Syntax err in for: $syms[CURR] at source line $sourceline" unless $syms[CURR] eq "to";
	my @end=EXPRESSION;
	feedme();
	
	my @step=(
qq{	new P6, .PerlHash
},qq{	set P6["type"], "INT"
},qq{	set P6["value"], 1
},);
	if ($syms[CURR] eq "step") {
		@step=EXPRESSION;
	}
	$ocounter=$counter;
	$counter=~s/%&!\#//g;
	$forcounter++;
	push(@{$fors[$scopes]}, { jump => $forcounter, variable => $ocounter} );
	
	print CODE<<EOFOR;
	# Set up for loop $counter.  Pre-evaluate everything.
@start	bsr DEREF
	set P0, P11[I25]
	set P1, P0["FOR"]
	set P0, P1["$counttype"]
	new P2, .PerlHash
	set P2["start"], P6
	set P0["$counter"], P2
	
@end	bsr DEREF
	set P0, P11[I25]
	set P1, P0["FOR"]
	set P0, P1["$counttype"]
	set P2, P0["$counter"]
	set P2["finish"], P6
	
@step	bsr DEREF
	set P0, P11[I25]
	set P1, P0["FOR"]
	set P0, P1["$counttype"]
	set P2, P0["$counter"]
	set P2["step"], P6
	
	# Set initial variable value as an assignment.
	bsr EXPRINIT
 	push P9, '$ocounter'
 	push P9, "BARE"
 	bsr EVALEXPR
 	set P0, P6		# Hold the RHS
 	
 	set P1, P11[I25]	# Fetch start
	set P2, P1["FOR"]
	set P1, P2["$counttype"]
	set P2, P1["$counter"]
	set P2["variable"], P0  # Save me for later!
	set P6, P2["start"]
	bsr ASSIGNMENT          # P0 = P6
	
	# Check sign
	set S0, "$counter"
	set S2, "$counttype"
	bsr FOR_SIGN            # Save for later...
	
 	set P1, P11[I25]	# Fetch start
	set P2, P1["FOR"]
	set P1, P2["$counttype"]
	set P2, P1["$counter"]
	set P2["direction"], I0 # Save sign for later.
	
	eq I0, 0, AFTER_NEXT_$forcounter
	
FOR_LOOP_$forcounter:
EOFOR
}
sub parse_next {    # next [a[,b[,c]...]
	feedme();
	my($var,$vartype,$ovar);
	my $ps;
	$ps=pop @{$fors[$scopes]};
	
	if ($type[CURR] ne "BARE") {   # next  (no variable)
		$var=$ps->{variable};
		$vartype=typeof($var);
		($ovar=$var)=~s/%&!\#//g;
		parse_next_helper($ovar, $var, $vartype, $ps);
	} else {    # next var
		while (1) {
		
			$var=$syms[CURR];
			$vartype=typeof($var);
			($ovar=$var)=~s/%&!\#//g;
			if ($ps->{variable} ne $ovar) {
				die "Cross-nested loops.  Expected '$ps->{variable}' got '$ovar'";
			}
			parse_next_helper($ovar, $var, $vartype, $ps);
			if ($syms[NEXT] eq ",") {
				feedme();
				feedme();
				$ps=pop @{$fors[$scopes]};
				next;
			}
			last;
		}
	}
}
sub parse_next_helper {
	my($ovar, $var, $vartype, $ps)=@_;
	print CODE<<EOINC
	#
	# NEXT $ovar
	#			
	bsr EXPRINIT
	push P9, "+"
	push P9, "OP"
	push P9, '$ovar'    # The variable
	push P9, "BARE"
	
	set S0, "step"
	set S1, "$var"
	set S2, "$vartype"
	bsr PUSHSTEP
	bsr EVALEXPR		# Variable + Step in P6
	
	set P1, P11[I25]
	set P2, P1["FOR"]
	set P1, P2["$vartype"]
	set P2, P1["$var"]
	set P0, P2["variable"]
	bsr ASSIGNMENT		# P0 = P6
	# Do we continue?
	bsr EXPRINIT
	push P8, P5		  # Where we're at.
	set P1, P11[I25]
	set P2, P1["FOR"]
	set P1, P2["$vartype"]
	set P2, P1["$var"]
	set I1, P2["direction"]   # -1/1
	bsr WHICH_COMPARE	  # Set S0 to comparison operator
	push P9, S0
	push P9, "OP"
	set S2, "$vartype"
	set S1, "$var"
	set S0, "finish"
	bsr PUSHSTEP
	bsr EVALEXPR		  # Continue is in P6
	
	set I0, P6["value"]
	eq I0, 1, FOR_LOOP_$ps->{jump}
		
AFTER_NEXT_$ps->{jump}:
EOINC
}
sub parse_call {
	# Subroutines are disguised as user-defined functions,
	# except that there's no return value to deal with.
	feedme();
	if (! exists $subs{$syms[CURR]}) {
		die "Subroutine $syms[CURR] not found at line $sourceline\n"
	}
	my $sub=$syms[CURR];
	my @e=EXPRESSION({ ignorecomma => 1});
	@e=grep !/bsr/, @e;
	print CODE<<CALLSUB;
	
	bsr EXPRINIT
	push P9, "$sub"
	push P9, "FUNC"
@e	push P9, "ARG"
	push P9, "ARG"
	bsr EVALEXPR
	
CALLSUB
}
sub parse_sub {
	# Deja-vu from functions.
	feedme();
	open(CODESAVE, ">&CODE") || die "Cannot save CODE: $!";
	open(CODE, ">&FUNC") || die "Cannot connect CODE to FUNC: $!";
	$subname=$syms[CURR];
	#print "Sub $subname  $syms[CURR] CURR\n";
	$subs{$subname}=1;
	CALL_BODY($subname, "SUB")
}

sub parse_function {
	feedme;
	open(CODESAVE, ">&CODE") || die "Cannot save CODE: $!";
	open(CODE, ">&FUNC") || die "Cannot connect CODE to FUNC: $!";
	$funcname=$syms[CURR];
	#print "Function $funcname  $syms[CURR] CURR\n";
	my $englishname=english_func($funcname);
	$functions{$funcname}=$englishname;
	CALL_BODY($englishname, "UF");
}

sub CALL_BODY {
	my($englishname, $prefix)=@_;		
	my @params;
	while(feedme()) {
		last if ($type[CURR] eq "STMT");
		last if ($type[CURR] eq "PUN" and $syms[CURR] eq ")");
		next if ($type[CURR] eq "PUN");
		if ($type[CURR] eq "BARE") {   # Variable name parameter
			$a=$syms[CURR];
			if ($syms[NEXT] eq "as") {
				feedme();  # Get the as
				feedme();
				push(@params, $syms[CURR], $a);
			} elsif ($syms[NEXT] eq "(") {
				feedme();
				while($syms[CURR] ne ")") {
					feedme();
				}
				push(@params, "ARRAY", $a);
			} else {
				push(@params, typeof($syms[CURR]), $a);
			}
		}
	}
	my $argcnt=@params;
	print CODE <<FUNC_PREAMBLE;
	#
	# Function setup for $englishname( @params )
${prefix}_$englishname:
	set S5, S0    # Remember the name of the function...
	bsr NEWFRAME
	restore I5    # Depth of arguments
	set I4, @{[ $argcnt/2 ]}     # Expected depth            <--- Compvar
	ne I5, I4, UF_ERRARGCNT
	new P5, .PerlArray
FUNC_PREAMBLE
		@params=reverse @params;
		for($_=0; $_<=$#params; $_++) {
			print CODE qq{\tset P5[$_], "$params[$_]"\n};
		}
		for(0..((@params-1)/2)) {
			print CODE qq{\tbsr UF_ARGLOAD\n};
		}
		print CODE <<F_PREAMBLE2;
	#destroy P5
	#
	# BEGIN $prefix code for $englishname
	#
F_PREAMBLE2
}

sub parse_endfunc {
	feedme;
	print CODE<<POSTSCRIPT;
FUNC_EXIT_@{[ english_func($funcname)]}:
	#
	# Teardown code for $funcname
	# 
	#print "Exiting the user function $funcname\\n"
	set S0, "$funcname"
	bsr VARLOOKUP
	bsr VARSTUFF		# Pack into P6
	set P6, P0		# Curly shuffle.
	bsr ENDFRAME
	set I1, 0		# Function found, exectued OK.
	branch UF_DISPATCH_END  # Return to caller.
	#
	#
POSTSCRIPT
	
	open(CODE, ">&CODESAVE") || die "Can't re-open code FH: $!";
	$funcname="";
}
sub parse_endsub {
	feedme;
	print CODE<<POSTSCRIPT;
SUB_EXIT_$subname:
	# 
	# Teardown code for $subname
	#
	bsr ENDFRAME
	set I1, 0
	branch SUB_DISPATCH_END
POSTSCRIPT
	open(CODE, ">&CODESAVE") || die "Can't re-open code FH: $!";
	$subname="";
}

sub parse_function_dispatch {
			print FUNC<<FUNCDISP;
				
	#
	# User function dispatch routine
	#
UF_DISPATCH:
	set I1, -1
FUNCDISP
		if (%functions) {
			foreach(keys %functions) {
				print FUNC qq{\teq S0, "$_", UF_}, english_func($_), qq{\n};
			}
		}
		print FUNC<<FUNCEND;
	branch UF_DISPATCH_END
UF_DISPATCH_END:
	#print "Ending user function, stack depth now "
	#print I25
	#print "\\n"
	ret
FUNCEND
	print FUNC<<SUBDISP;
SUB_DISPATCH:
	set I1, -1
SUBDISP
	foreach (keys %subs) {
		print FUNC qq{\teq S0, "$_", SUB_$_\n};
	}
	print FUNC<<SUBEND;
	branch SUB_DISPATCH_END
SUB_DISPATCH_END:
	ret
SUBEND
}
sub parse_struct_copy_dispatch {
	print CODE <<SCOPYDIS;
	
	#
	# Structure copy dispatch routine
	# Call with S0 set to the type
	# Source in P6
	# Dest returned in P1
STRUCT_COPY:
SCOPYDIS
	foreach(keys %usertypes) {
		print CODE<<DISP;
	eq S0, "$_", COPY_$_
DISP
	}
	print CODE <<DISP2;
	print "Structure type of "
	print S0
	print " not found\\n"
	end
DISP2

	print CODE <<SCOPYDIS;
	#
	# Structure create dispatch routine
	# Call with S0 set to the type
	# Dest returned in P0
STRUCT_DIM:
SCOPYDIS
	foreach(keys %usertypes) {
		print CODE<<DISP;
	eq S0, "$_", DIM_$_
DISP
	}
	print CODE <<DISP2;
	print "Structure type of "
	print S0
	print " not found\\n"
	end
DISP2
	print CODE<<RTB;
	# Several statements need to make branches
	# that are only discovered at runtime.
RUNTIME_JUMP:
RTB
	foreach(sort keys %labels) {
		print CODE qq|\teq S0, "$labels{$_}", $labels{$_}\n|;
	}
	print CODE<<RTBE;
	print "Runtime branch of "
	print S0
	print " not found\\n"
	end
RTBE
}
sub parse_data_setup {
	print CODE<<DATAPREP;
	# Prepare the Read/Data stuff
DATA_SETUP:
DATAPREP
	my $counter=0;
	foreach my $ld (@data) {
		my $line=$ld->{line};
		if (length $line) {
			print CODE qq{\tset P16["$line"], $counter\n};
		}
		foreach (@{$ld->{data}}) {
			my($t,$v)=($_->{type}, $_->{value});
			print CODE<<ADDDATA;
	new P0, .PerlHash
	set P0["type"], "$t"
	set P0["value"], $v
	push P15, P0
ADDDATA
			$counter++;
		}
	}

	print CODE "\tret\n";
}
sub typeof {
	my($var)=@_;
	return "INT" if ($var=~/[%&]$/);
	return "FLO" if ($var=~/[!#]$/);
	return "STRING" if ($var=~/\$$/);
	return "FLO"
}

1;
