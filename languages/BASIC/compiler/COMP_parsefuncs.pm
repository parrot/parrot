# Aux. functions needed by the parser.  (For cleanliness)
#

use warnings;

use vars qw( %usertypes );
use vars qw( %arrays );
use vars qw( $funcname $subname );
use vars qw( %labels $branchseq @selects);
use vars qw( @data $sourceline %common );
use vars qw( %code $debug $runtime_jump);


my @fors=();
my @whiles=();
my @dos=();
@selects=();
my $scopes=0;
my @data=();
sub parse_keys {
	feedme();
	my $targ=$syms[CURR];
	feedme();
	feedme() while($syms[CURR] =~ /[(),]/);
	my $source=$syms[CURR];
	feedme();	
	feedme() while($syms[CURR] =~ /[(),]/);
	$targ.=$seg;
	$source.=$seg;
	push @{$code{$seg}->{code}}, <<KEYS;
	_ARRAY_KEYS("$source","$targ")
KEYS
}
sub parse_common {
	feedme();
	while($type[CURR] !~ /COMP|COMM|STMT/) {
		$var=$syms[CURR];
		feedme();
		next if $var eq ",";
		my $array=0;
		if ($syms[CURR] eq "(") {
			$array=1;
			while($syms[CURR] ne ")") {
				feedme;
			}
			feedme;
		}
		$var=~s/\$$/_string/;
		push @{$code{$seg}->{code}}, "\t# $var was declared COMMON\n"; 
		if (! $array) {
			$main::code{$main::seg}->{declarations}->{$var}="COMMON";
			$common{$var}=1;
		}

	}
}

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

	push @{$code{$seg}->{code}}, $prompt; 
	my $sf=1;
	$sf=0 if ($filedesc);

	push @{$code{$seg}->{code}},<<INP1;
	\$S0 = _READLINE($filedesc)
	\$P99 = _SPLITLINE(\$S0,$sf)
	set \$I0, \$P99
INP1

	# Bug here...FIXME.. I'm using $vars before it's set.
	$vars=1;
	if ($noreloop) {
		push @{$code{$seg}->{code}}, "\t#ne \$I0, $vars, ERR_INPFIELDS\n";
	} else {
		push @{$code{$seg}->{code}}, "\tne \$I0, $vars, INPUT_$inputcounts  # Re-prompt\n";
	}

	$loop=0;
	barf();		# We're too far in already...
	while($type[CURR] !~ /COMP|COMM|STMT/) {
		die if $loop++>20;
		push @{$code{$seg}->{code}}, "\tpop \$S99, \$P99\n";
		push @{$code{$seg}->{code}}, "\tset \$N99, \$S99\n";

		my($result, $type, @code)=EXPRESSION({ stuff => "\$X99", choose => 1 });
		push @{$code{$seg}->{code}}, "@code";
		feedme();
		if ($syms[CURR] eq ",") {
			feedme();
			next;
		}
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
	my($result, $type, @code)=EXPRESSION;  # The switch...
	feedme();
	my $branch=$syms[CURR];  # goto or gosub
	push @{$code{$seg}->{code}}, "\t# On X $branch...\n";
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
	push @{$code{$seg}->{code}},<<ON;
@code	lt $result, 0.0, ONERR_${ons}
	gt $result, 255.0, ONERR_${ons}
	branch ONOK_${ons}
ONERR_${ons}:
	print "On...goto/gosub out of range at $sourceline\\n"
	_platform_shutdown()
	end
ONOK_${ons}:
ON
	$i=1;
	for my $jumps (@onlab) {
		push @{$code{$seg}->{code}}, "\tne $result, $i.0, ON_${ons}_$i\n";
		if ($branch eq "gosub") {
			push @{$code{$seg}->{code}}, qq{\tbsr $labels{$jumps}\t# $branch $jumps\n};
			push @{$code{$seg}->{code}}, qq{\t#RTJ ne S0, "", RUNTIME_JUMP\n};
			push @{$code{$seg}->{code}}, qq{\tbranch ON_END_$ons\n};
		} elsif ($branch eq "goto") {
			push @{$code{$seg}->{code}}, qq{\tbranch $labels{$jumps}\t# $branch $jumps\n};
		} else {
			die "Illegal branch type, only GOSUB/GOTO allowed";
		}
		push @{$code{$seg}->{code}}, "ON_${ons}_$i:\n";
		$i++;
	}
	if ($branch eq "gosub") {
		push @{$code{$seg}->{code}}, "\tnoop\nON_END_${ons}:\n";
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
		($result, $type, @code)=EXPRESSION();
		push @{$code{$seg}->{code}},<<EOR;
@code	find_global \$P0, "RANDSEED"
	set \$I0, $result
	set \$P0["value"], \$I0
	store_global "RANDSEED", \$P0
EOR
		feedme();
	}
}
sub parse_locate {	# locate x,y   | locate x   | locate ,y  
	my($x,$y);
	my(@e2);
	my($resulty, $typey, @codey);
	my($resultx, $typex, @codex);
	if ($type[NEXT] =~ /PUN/) {  # Y only
		feedme();
		($resulty, $typey, @codey)=EXPRESSION();   # Y (only)
	} else {
	    	($resultx, $typex, @codex)=EXPRESSION();    # X
		if ($type[NEXT] =~ /PUN/) {
			feedme();
			($resulty, $typey, @codey)=EXPRESSION();
		}
	}
	if (@codey and @codex) {  	# X and Y
	
	push @{$code{$seg}->{code}},<<XANDY;
@codey	
	set \$N100, $resulty
@codex	
	set \$N101, $resultx
	_screen_locate(\$N101,\$N100)
XANDY
	} elsif (@codey and not @codex) {
	push @{$code{$seg}->{code}},<<YNOTX;
@codey	noop			# Broke!
	_screen_locate($resulty)
YNOTX
	} elsif (@codex and not @codey) {
	push @{$code{$seg}->{code}},<<XNOTY;
@codex	noop		# Broke!
	_screen_locate($resultx)
XNOTY
	}
}
sub parse_color {
	my($f,$b);
	my($resultb, $typeb, @codeb);
	my($resultf, $typef, @codef);

	if ($type[NEXT] =~ /PUN/) {  # Back only
		feedme();
		($resultb, $typeb, @codeb)=EXPRESSION();   # Back (only)
	} else {
	    	($resultf, $typef, @codef)=EXPRESSION();    # Fore
		if ($type[NEXT] =~ /PUN/) {
			feedme();
			($resultb, $typeb, @codeb)=EXPRESSION();
		}
	}
	if (@codeb and @codef) {  	# F and B
		push @{$code{$seg}->{code}},<<FANDB;
@codeb	set \$N100, $resultb
@codef	set \$N101, $resultf
	_screen_color(\$N101,\$N100)
FANDB
	} elsif (@codeb and not @codef) {
		push @{$code{$seg}->{code}},<<BNOTF;
@codeb  noop
	_screen_color($resultb)	# Broke!
BNOTF
	} elsif (@codef and not @codeb) {
		push @{$code{$seg}->{code}},<<FNOTB;
@codef	noop
	_screen_color($resultf)	# Broke!
FNOTB
	}
}
sub parse_cls {
	if (! $type[NEXT] =~ /STMT|COMM|COMP/) {  # No arg version
		@e=EXPRESSION();
	}
	push @{$code{$seg}->{code}},<<CLS;
	_screen_clear()
CLS
	feedme();
}
sub parse_open {
	($result, $type, @code)=EXPRESSION();
	feedme();
	die "Expecting FOR at $sourceline" unless $syms[CURR] eq "for";
	feedme();
	my $mode="";
	if ($syms[CURR] eq "input") {
		$mode="<";
	} elsif ($syms[CURR] eq "output") {
		$mode=">";
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
	push @{$code{$seg}->{code}},<<OPEN;
@code	noop
	_OPEN($result,"$mode",$fd)
OPEN
}
sub parse_close {
	feedme();
	die "Expecting # at $sourceline" unless $syms[CURR] eq "#";
	feedme();
	$fd=$syms[CURR];
	push @{$code{$seg}->{code}},<<CLOSE;
	_CLOSE($fd)
CLOSE
}
sub fdprint {	
	my($fd, $string)=@_;
	if ($fd) {
		push @{$code{$seg}->{code}}, <<PRINT;
	_WRITE($fd,1,"$string")
PRINT
	} else {
		if ($string ne "\\n") {
			push @{$code{$seg}->{code}}, <<PRINT;
	_BUILTIN_DISPLAY(1,"$string")
PRINT
		} else {
			push @{$code{$seg}->{code}}, <<PRINT;
	find_global \$P0, "PRINTCOL"
	\$P0["value"]=0
	store_global "PRINTCOL", \$P0
	print "\\n"
PRINT
		}
	}

}
sub parse_print {
	my $eol=0;
	my $expr=0;
	my $c=0;
	my $fd="";
	my ($result, $type, @CODE);
	feedme();
	if ($syms[CURR] eq "#" and $type[CURR] eq "PUN") { 
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
		if ($type[CURR] eq "STRING" and not $fd and
			( $type[NEXT] eq "STMT" or $type[NEXT] eq "COMP" or $type[NEXT] eq "COMM" ) ) {
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
		($result, $type, @code)=EXPRESSION({nofeed => 1});
		feedme();
		if ($fd) { 
			push @{$code{$seg}->{code}}, <<PRINT;
@code	noop
	_WRITE($fd,1,$result)
PRINT
		} else {
			push @{$code{$seg}->{code}}, <<PRINT;
@code	noop
	_BUILTIN_DISPLAY(1,$result)
PRINT
		}
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
	while($type[CURR] !~ /COMP|COMM|STMT/) {
		push @{$code{$seg}->{code}}, <<EOASS;
	\$S99 = _READ()
	set \$N99, \$S99
EOASS
	($result, $type, @code)=EXPRESSION({ stuff => '$X99', choose => 1 });
	feedme();
	push @{$code{$seg}->{code}}, <<EOASS;
@code
EOASS
		if ($syms[CURR] eq ",") {
			#feedme();
			next;
		}
	}
}
sub parse_swap {
	my(@f, @s);
	feedme();
	my($leftres, $lefttype, @left)=EXPRESSION({lhs => 1});
	feedme();
	die "Expected ',': $syms[CURR]" unless $syms[CURR] eq ",";
	feedme();
	my($rightres, $righttype, @right)=EXPRESSION({lhs => 1});
	push @{$code{$seg}->{code}}, <<SWAP;
	\$${righttype}99 = $rightres
	$rightres = $leftres
	$leftres = \$${righttype}99
SWAP
}

sub parse_stop {
	feedme();
	print CODE<<STOP;
	print "Stopped at source line "
	print I11
	print "\\n"
	_platform_shutdown()
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
		if ($type[CURR] =~ /STRING|BARE|INT|FLO/) {
			push @ld, { type => "STRING", value => qq{"$syms[CURR]"} };
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
 	my @args;
	if ($type[NEXT] eq "BARE" or $type[NEXT] eq "INT") {
		feedme();
		create_label();
		push @args, qq{"$labels{$syms[CURR]}"};
	} else {
		push @args, qq{""};
	}
	feedme();
	push @{$code{$seg}->{code}}, "\t_RESTORE(" . join(",",@args) . ")\n";
}


sub parse_exit {
	if ($syms[NEXT] eq "for") {
		feedme();
	  	$foo=$fors[$scopes]->[-1];
		push @{$code{$seg}->{code}}, "\tbranch AFTER_NEXT_$foo->{num}\n";
	} elsif ($syms[NEXT] eq "function") {
		push @{$code{$seg}->{code}}, qq{\tbranch END_$seg\n};
		feedme();
		#$_=english_func($funcname);
		#print CODE "\tbranch FUNC_EXIT_$_\n";
	} elsif ($syms[NEXT] eq "sub") {
		push @{$code{$seg}->{code}}, qq{\tbranch END_$seg\n};
		feedme();
		#print CODE "\tbranch SUB_EXIT_$subname\n";
	} elsif ($syms[NEXT] eq "do") {
		feedme();
		$foo=$dos[-1];
		push @{$code{$seg}->{code}}, "\tbranch AFTERDO_$foo->{jump}\n";
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



my $false;
my $whilecounter=0;
sub parse_while {
	$whilecounter++;
	push(@whiles, { jump => $whilecounter });
	my($result, $type, @code)=EXPRESSION();
	$false="0.0";
	$false=qq{""} if ($type eq "S");

	push @{$code{$seg}->{code}}, "WHILE_$whilecounter:\n";
	push @{$code{$seg}->{code}}, <<BRANCH;
@code	eq $result, $false, AFTERWHILE_$whilecounter
BRANCH
}
sub parse_wend {
	$_=pop(@whiles);
	$_=$_->{jump};
	push @{$code{$seg}->{code}}, <<LOOPUP;
	branch WHILE_$_
AFTERWHILE_$_:
LOOPUP
}
my $docounter=0;
sub parse_do {
	$docounter++;
	if ($syms[NEXT] eq "until" or $syms[NEXT] eq "while") {
		my $false="0.0";
		feedme();  # At the while/until
		my $which=$syms[CURR];
		push @{$code{$seg}->{code}}, "DO_$docounter:\n";
		my($result, $type, @code)=EXPRESSION();
		$false=qq{""} if $type eq "S";
		if ($which eq "while") {
			$_="@code eq $result, $false, AFTERDO_$docounter";
		} else {
			$_="@code ne $result, $false, AFTERDO_$docounter";
		}
		push @{$code{$seg}->{code}}, "\t$_\n";
		push(@dos, { jump => $docounter, needstmt => 0 });
	} else {
		push @{$code{$seg}->{code}}, "DO_$docounter:\n";
		push(@dos, { jump => $docounter, needstmt => 1 });
	}
}
sub parse_goto {
	feedme;
	create_label();
	push @{$code{$seg}->{code}}, "\tbranch $labels{$syms[CURR]}\t# Goto $syms[CURR]\n";
}
sub parse_gosub {
	feedme;
	create_label();

	push @{$code{$seg}->{code}}, <<GOSUB;	
	bsr $labels{$syms[CURR]}\t# GOSUB $syms[CURR]
	#RTJ ne JUMPLABEL, "", RUNTIME_JUMP
GOSUB
}
sub parse_return {
	if ($type[NEXT] ne "BARE") {
		push @{$code{$seg}->{code}}, <<RETURN1;
	set JUMPLABEL, ""
	ret
RETURN1
	} else {
		feedme();   # Special "Return Label"
		push @{$code{$seg}->{code}}, <<RETURN2;
	set JUMPLABEL, "$labels{$syms[CURR]}"  # Return $syms[CURR]
	ret
RETURN2
		if (! $runtime_jump) {
			warn "Note: RETURN x causes slow IMCC compilation\n";
			$runtime_jump=1;
		}
	}
}
sub parse_loop {
	my $do=pop @dos;
	if ($do->{needstmt} and not ( $syms[NEXT]=~/while|until/ ) ) {
		push @{$code{$seg}->{code}}, "\nbranch DO_$do->{jump}\t# Unconditional\n";
		push @{$code{$seg}->{code}}, "AFTERDO_$do->{jump}:\n";
		return;
	}
	if ($do->{needstmt}) {
		my $false="0.0";
		feedme();
		my $which=$syms[CURR];
		my($result, $type, @code)=EXPRESSION();
		$false=qq{""} if $type eq "S";
		if ($which eq "while") {
			$_="@code ne $result, $false, DO_$do->{jump}";
		} else {
			$_="@code eq $result, $false, DO_$do->{jump}";
		}
		push @{$code{$seg}->{code}}, "\t$_\n";
	} else {
		push @{$code{$seg}->{code}}, "\tbranch DO_$do->{jump}\n";
	}
	push @{$code{$seg}->{code}}, "AFTERDO_$do->{jump}:\n";
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
			$arrays{"${var}${seg}"}=1;
			#print STDERR "Marking ${var}${seg}\n";
			push @{$code{$seg}->{code}}, <<DIMARR;
	# Set aside storage for Array $var
	\$P0 = new PerlHash
	\$P2 = new PerlArray
	\$P3 = new PerlHash
	\$P3["index"]=\$P2
	\$P3["hash"]=\$P0
	find_global \$P1, "BASICARR"
	set \$P1["$var$seg"], \$P3
	store_global "BASICARR", \$P1
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
my $forloop=0;
sub parse_for {   # for var = start to finish [step increment]
	my($endexpr, $stepexpr, @stepcode);

	$forloop++;
	feedme();

	# The initial assignment.  Type of course will be a float.
	($result, $type, @code)=EXPRESSION({ lhs => 1, assign => 1});
	push @{$code{$seg}->{code}}, @code;

	die "TO expected at source line $sourceline" unless ($syms[CURR] ne "to");

	feedme();
	# The destination value
	($endexpr, $type, @code)=EXPRESSION();

	feedme();
	if ($syms[CURR] eq "step") {
		($stepexpr, $type, @stepcode)=EXPRESSION();
	} else {
		$stepexpr="1.0";
	}
	$main::code{$main::seg}->{declarations}->{"FORLOOP_END_$forloop"}=1;
	$main::code{$main::seg}->{declarations}->{"FORLOOP_STEP_$forloop"}=1;
	push @{$code{$seg}->{code}}, <<COND;
@code	set FORLOOP_END_$forloop, $endexpr
@stepcode
	set FORLOOP_STEP_$forloop, $stepexpr
FOR_$forloop:
	gt FORLOOP_STEP_$forloop, 0.0, FOR_GT_$forloop
	lt $result, FORLOOP_END_$forloop, AFTER_NEXT_$forloop
	branch FOR_LOOP_BODY_$forloop
FOR_GT_$forloop:
	gt $result, FORLOOP_END_$forloop, AFTER_NEXT_$forloop
FOR_LOOP_BODY_$forloop:
COND
	debug() if $debug;
	
	push @{$fors[$scopes]}, { var => $result, num => $forloop, inc => $stepexpr };
}
sub parse_next {    # next [a[,b[,c]...]
	feedme();
	my($var,$vartype,$ovar);
	my $ps;
	$ps=pop @{$fors[$scopes]};
	
	if ($type[CURR] ne "BARE") {   # next  (no variable)
		push @{$code{$seg}->{code}}, <<NEXT;
	add $ps->{var}, $ps->{var}, FORLOOP_STEP_$ps->{num}
	branch FOR_$ps->{num}
AFTER_NEXT_$ps->{num}: noop
NEXT
	} else {    # next var
		while (1) {
			push @{$code{$seg}->{code}}, <<NEXT;
	add $ps->{var}, $ps->{var}, FORLOOP_STEP_$ps->{num}
	branch FOR_$ps->{num}
AFTER_NEXT_$ps->{num}: noop
NEXT
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
sub parse_call {
	# Subroutines are disguised as user-defined functions,
	# except that there's no return value to deal with.
	feedme();
	if (! exists $subs{$syms[CURR]}) {
		die "Subroutine $syms[CURR] not found at line $sourceline\n"
	}
	my $sub=$syms[CURR];
	barf();
#	print STDERR "Processing call $sub\n";
	($result, $type, @code)=EXPRESSION({ignorecomma => 1});
#	print STDERR "Got back @code\n";
	push @{$code{$seg}->{code}},<<CALLSUB;
@code
CALLSUB
}
sub parse_sub {
	# Deja-vu from functions.
	feedme;
	my $f;
	$funcname=$syms[CURR];
	my $englishname=english_func($funcname);
	$subs{$funcname}=$englishname;
	$functions{$funcname}=$englishname;

	$f="_USERFUNC_$funcname";
	$f=changename($f);
	$f=~s/\$/_string/g; $f=~tr/a-z/A-Z/;
	$seg=$f;
	CALL_BODY($englishname, "SUB");
}

sub parse_function {
	feedme;
	my $f;
	$funcname=$syms[CURR];
	my $englishname=english_func($funcname);
	$functions{$funcname}=$englishname;

	$f="_USERFUNC_$funcname";
	$f=changename($f);
	$f=~s/\$/_string/g; $f=~tr/a-z/A-Z/;
	$seg=$f;
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
				push(@params, "()$a");
			} else {
				push(@params, $a);  # Always here?
			}
		}
	}
	my $argcnt=@params;
	# The outer compiler will provide the framework for the
	# function call.  We just have to unwind its arguments.
	$_=scalar @params;
	push @{$code{$seg}->{code}}, <<EOH;
	.param int argc
	eq argc, $_, ${englishname}_ARGOK
	print "Function $englishname received "
	print argc
	print " arguments expected $_\\n"
	_platform_shutdown()
	end
${englishname}_ARGOK:
EOH
	$main::code{$main::seg}->{declarations}->{$englishname}=1;
	
	foreach (@params) {
		unless (/\(\)/) {
			my $t=typeof($_);
			$t="string" if $t eq "STRING";
			$t="float" if $t eq "FLO";
			$_=changename($_);
			$_=~s/\$/_string/g; 
			push @{$code{$seg}->{code}}, qq{\t.param $t $_\n};
			push @{$code{$seg}->{args}}, $_;
		} else {
			s/\(\)//g;
			$_=changename($_);
			#print STDERR "Marking ${_}${seg}\n";
			$arrays{"${_}${seg}"}=1;
			push @{$code{$seg}->{code}},<<PUSHARR;
	.param PerlHash array_$englishname
	find_global \$P1, "BASICARR"
	set \$P1["${_}$seg"], array_$englishname
	store_global "BASICARR", \$P1
PUSHARR
			# push @{$code{$seg}->{args}}, $_;
		}
	}
	return;
}

sub parse_endfunc {
	feedme;
	my $t=$seg;
	$seg=~s/^_//;       # Remove the _
	$seg=~tr/A-Z/a-z/;  # lowercase
	$seg=~s/userfunc_//;
	push @{$code{$t}->{code}}, "END_$t:\n";
	if (exists $code{$t}->{args}) {
		foreach(@{$code{$t}->{args}}) {
			push @{$code{$t}->{code}}, "\t.return $_\t# Returning arg\n";
		}
	}
	push @{$code{$t}->{code}}, "\t.return $seg\n";
	$seg="_basicmain";
	$funcname="";
	return;
}
sub parse_endsub {
	goto &parse_endfunc;
}

sub parse_function_dispatch {
	return;
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
	goto RTJUMP;
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
	_platform_shutdown()
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
	_platform_shutdown()
	end
DISP2
RTJUMP:
	push @{$code{$seg}->{code}}, <<RTB;
	# Several statements need to make branches
	# that are only discovered at runtime.
RUNTIME_JUMP:
RTB
	if ($runtime_jump) {
		foreach(sort keys %labels) {
			push @{$code{$seg}->{code}}, qq|\teq JUMPLABEL, "$labels{$_}", $labels{$_}\n|;
		}
	}

	push @{$code{$seg}->{code}}, <<RTBE;
	print "Runtime branch of "
	print JUMPLABEL
	print " not found\\n"
	_platform_shutdown()
	end
RTBE
}
sub parse_data_setup {
	push @{$code{_data}->{code}},<<DATAPREP;
	# Prepare the Read/Data stuff
	find_global \$P1, "RESTOREINFO"
	find_global \$P2, "READDATA"
DATAPREP
	my $counter=0;
	foreach my $ld (@data) {
		my $line=$ld->{line};
		if (length $line) {
			push @{$code{_data}->{code}}, qq{\tset \$P1["$line"], $counter\n};
		}
		foreach (@{$ld->{data}}) {
			my($t,$v)=($_->{type}, $_->{value});
			push @{$code{_data}->{code}},<<ADDDATA;
	push \$P2, $v
ADDDATA
			$counter++;
		}
	}

	push @{$code{_data}->{code}},<<DATADONE;
	store_global "RESTOREINFO", \$P1
	store_global "READDATA", \$P2
DATADONE
}
sub typeof {
	my($var)=@_;
	return "FLO" if ($var=~/[!#%&]$/);
	return "STRING" if ($var=~/\$$/);
	return "FLO"
}

1;
