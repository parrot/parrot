#! perl -w

use strict;
use constant VERSION => 2.2;

use constant PREV => 2;
use constant CURR => 1;
use constant NEXT => 0;
use subs qw(dumpq EXPRESSION);
use Data::Dumper;
use vars qw( %code $seg $debug $runtime_jump );

require "COMP_parsefuncs.pm";

sub init {
        @type[0..2]=("","","");
        @syms[0..2]=("","","");
	$seg="_basicmain";
}
sub feedme {
	my $type=shift @tokdsc;
	my $sym=shift @tokens;
        $type="" unless defined $type;
         $sym="" unless defined $sym;
        unshift(@type, $type);
        unshift(@syms,  $sym);
        $#type=3;
        $#syms=3;
}
sub barf {
	unshift(@tokdsc, shift(@type));
	unshift(@tokens, shift(@syms));
	push(@type, "");
	push(@type, "");
}
sub dumps {
	print "$syms[PREV] $type[PREV] \tprevious\n";
	print "$syms[CURR] $type[CURR] \tcurrent\n";
	print "$syms[NEXT] $type[NEXT] \tnext\n";
}
sub usersub { 0; }

sub runtime_init {
	push @{$code{$seg}->{code}}, <<INIT;
	#
	# Program Begins Here
	# I must not fear. Fear is the mind-killer. Fear is the little-death 
	#  that brings total obliteration. I will face my fear. I will permit
	#  it to pass over me and through me. And when it has gone past I will
	#  turn the inner eye to see its path. Where the fear has gone there
	#  will be nothing. Only I will remain.
	#                      Bene Gesserit Litany Against Fear
	# Compiler version @{[VERSION]}@{[ grep $_=sprintf("\n\t#%22s %s\t", 
	     $_, scalar localtime((stat("$_"))[9])),
	     sort { -M $a <=> -M $b } glob("COMP_*")]}
	#
INIT
}
sub runtime_shutdown {
	push @{$code{$seg}->{code}}, <<SHUTDOWN;
	#
	# ###################
	# Program Termination
	# ###################
	restoreall
	ret	# back to _main

SHUTDOWN
}

use vars qw( %functions );
use vars qw( %usertypes );
use vars qw( $funcname );
use vars qw( $branchseq @selects $sourceline );
sub parse {
	$runtime_jump=0;
	init;
	runtime_init;
	feedme;
	$branchseq=0;
	$sourceline=1;
	my $currline="";	# The last labeled line before a "data" statement.
	my $singleif=0;
	my $elsetag=0;
	my $elsestack;
	my $ifline="1";
	my $elseline="a";
	my (@ifstack);
	my(@lhs, @rhs);
	my($result, $type, @code);

	if ($debug) {
		push @{$code{$seg}->{code}},"\tcall _DEBUG_INIT\n";
		debug();
	}

	
PARSE:
	1;
PARSE_NOFEED:
	if ($type[CURR] eq "STMT" or $type[CURR] eq "COMM") {
		$sourceline++;
		unless ($type[PREV] eq "STMT") {
			#print CODE "set .LINE, $sourceline\n";
			debug() if $debug;
		}
	}
	feedme;
	#print "Type $type[CURR] Sym $syms[CURR]\n";
	goto UNK if ($type[CURR] ne 'BARE');
	goto BARE if (! iskeyword($syms[CURR]));

	# The "unimplementeds"
	# Eat tokens until we get to the next statement of some kind.
	# These are likely to *never* be implemented.
	if ($syms[CURR] =~ /^(  screen | pset | preset | line | circle | draw |
			view | window | pmap | palette | paint |
			get | put | pcopy | beep | sound | view |
			width | resume | pos | poke | peek | rset |
			defint | const | declare | lprint | static	# Maybe these...
		)$/x) {
		print "WARNING: $syms[CURR] is unimplemented, skipping.\n";
		push @{$code{$seg}->{code}}, "\t# Unimplemented '$syms[CURR] ";
		while(1) {
			feedme();
			$_=$type[CURR];
			last unless $_;
			last if $_ =~ /STMT|COMM|COMP/;
			push @{$code{$seg}->{code}}, "$syms[CURR] ";
		}
		push @{$code{$seg}->{code}}, "'\n";
		goto PARSE;
	}
	if ($syms[CURR] eq "redim") {
		$syms[CURR]="dim";
		print "WARNING: REDIM interpreted as DIM\n";
	}
	# General purpose keyword dispatch.
	if ($syms[CURR] =~ /^(	
		while | wend | dim | type | exit | function | for | next |
		do | loop | goto | gosub | return  | sub | call | select | case |
		read | restore | input | open | close | on | randomize | stop | swap |
		common | cls | locate | color | keys
		)$/x) {
		no strict 'refs';
		&{"parse_" . $1}();
		goto PARSE;
	}
	if ($syms[CURR] eq "select") {
		&parse_select;
		goto PARSE_NOFEED;
	}
	if ($syms[CURR] eq "data") {
		&parse_data($currline);
		$currline="";
		goto PARSE;
		
	}
	
	goto PARSE if ($syms[CURR] eq "let");  # ha ha
	
	# TEMP FIXME	
	if ($syms[CURR] eq "print") {
		&parse_print;
		goto PARSE_NOFEED;
	}
	#
	# Handle all of the IF-THEN logic
	#
	my $false="0.0";
	if ($syms[CURR] eq "if") {
		($result, $type, @code)=EXPRESSION();
		$false=qq{""} if $type eq "S";
		push @{$code{$seg}->{code}},<<EXPR;
@code	eq $result, $false, IFBRANCH_$ifline
EXPR
		feedme();
		push(@ifstack, $ifline);
		die "No then at $sourceline --  $syms[CURR]" if ($syms[CURR] ne "then");
		$singleif=1 if ($type[NEXT] ne "STMT" and $type[NEXT] ne "COMM");
		#print "Single if!\n" if $singleif;
		$ifline++;
		if ($type[NEXT] eq "INT") {  # if x then linenumber
			feedme;
			create_label();
			push @{$code{$seg}->{code}}, "\tbranch $labels{$syms[CURR]}\t# Goto $syms[CURR]\n";
		}
		$elsetag++;
		goto PARSE;
	}
	if ($syms[CURR] eq "elseif") {
		my $c;
		$c=pop @ifstack;
		push(@{$elsestack->{$elsetag}}, $elseline);
		($result, $type, @code)=EXPRESSION();
		$false=qq{""} if $type eq "S";
		push @{$code{$seg}->{code}}, <<CODE;
	branch ELSEBRANCH_$elseline
IFBRANCH_$c:
@code	eq $result, $false, IFBRANCH_$ifline
CODE
		feedme();
		push(@ifstack, $ifline);
		$ifline++;
		$elseline++;
		goto PARSE;
	}
	if ($syms[CURR] eq "else") {   #  and $singleif) {
		my $c=pop @ifstack;
		push(@ifstack, -1);
		if (! $c) { 
			die "ELSE without corresponding IF at line $sourceline\n";
		}
		push(@{$elsestack->{$elsetag}}, $elseline);
		push @{$code{$seg}->{code}}, <<CODE;
	branch ELSEBRANCH_$elseline
	# The expression was not true...
	IFBRANCH_$c:
CODE
		$elseline++;
		goto PARSE;
	}
	if ($syms[CURR] eq "end") {
		if ($syms[NEXT] eq "function") {
			parse_endfunc();
			goto PARSE;
		}
		if ($syms[NEXT] eq "sub") {
			parse_endsub();
			goto PARSE;
		}
		if ($syms[NEXT] eq "if") {
			$_=pop @ifstack;
			if ($_ < 0 ) {
				# print "Else was done, skipping...\n";
			} else {
				push @{$code{$seg}->{code}}, "IFBRANCH_$_:\n";
			}
			while($_=pop(@{$elsestack->{$elsetag}})) {
				push @{$code{$seg}->{code}}, "ELSEBRANCH_$_:\n";
			}
			feedme;
			$elsetag--;
			goto PARSE;
		}
		if ($syms[NEXT] eq "select") {
			my $s=pop @selects;
			feedme;
			print CODE "CASE_$s->{jump}_$s->{incase}:\n";
			print CODE "CASE_$s->{jump}_FIN:\n";
			goto PARSE;
		}
		push @{$code{$seg}->{code}}, "\tcall _platform_shutdown\n\tend\n";
		goto PARSE;
	}
	die "Unkown keyword $syms[CURR]/$type[CURR] source line $sourceline";
	goto UNK;

BARE:	# Check for user-subroutine
	if (usersub($syms[CURR])) {
		die "User Sub";
	}
	if ($syms[NEXT] eq ":") {
		create_label();
		label_defined($syms[CURR]);
		push @{$code{$seg}->{code}}, "$labels{$syms[CURR]}:   # For user branch ($syms[CURR])\n";
		debug() if $debug;
		$currline="$labels{$syms[CURR]}";
		feedme;  # Get the :
		goto PARSE
	}
	
	# function assignment...  WRONG-O!
	#     Don't go looking for lhs expression, please.
	#if ($syms[NEXT] eq "=" and exists $functions{$syms[CURR]}) {
	#	# Assignment statement
	#	my $var=$syms[CURR];
	#	feedme;  # Get the =
	#	#print "Going to expression with $syms[CURR]\n";
	#	print CODE EXPRESSION;		# Evaluate the expression all queued up.
	#	ASSIGNMENT_FUNC($var);
	#	goto PARSE_NOFEED;
	#}

	if ($syms[CURR] eq "_startasm") {
		feedme;
		#$syms[CURR]=~s/^\n|\n$//gm;
		push @{$code{$seg}->{code}}, "\t#\n\t# User-included assembly\n$syms[CURR]\n\t# End assembly\n\t#\n";
		feedme;
		
		goto PARSE;
	}
		
	# DO ME LAST
	# (Assignments.)
	($result, $type, @code)=EXPRESSION({ lhs => 1, assign => 1});
	push @{$code{$seg}->{code}}, @code;
	goto PARSE;
	# Got a bareword.  
	# This should be an assignment
	#if ($syms[NEXT] eq "=") {
	#	# Assignment statement
	#	my $var=$syms[CURR];
	#	feedme;  # Get the =
	#	#print "Going to expression with $syms[CURR]\n";
	#	EXPRESSION;		# Evaluate the expression all queued up.
	#	ASSIGNMENT($var);
	#	goto PARSE_NOFEED;
	#}
	goto PARSE;

=begin wrongway

UNK:	if (($type[CURR] eq "STMT" or $type[CURR] eq "COMM" or $type[CURR] eq "STMT") and $singleif) {
		while($_=pop(@ifstack)) {
			push @{$code{$seg}->{code}}, "IFBRANCH_$_:\n";
		}
=cut
UNK:	if (($type[CURR] eq "STMT" or $type[CURR] eq "COMM") and $singleif) {

		$_=pop @ifstack;
		if ($_ < 0 ) {
			# print "Else was done, skipping...\n";
		} else {
			push @{$code{$seg}->{code}}, "IFBRANCH_$_:\n";
		}
		while($_=pop(@{$elsestack->{$elsetag}})) {
			push @{$code{$seg}->{code}}, "ELSEBRANCH_$_:\n";
		}
		push @{$code{$seg}->{code}}, "\t# $syms[CURR]\n" if $type[CURR] eq "COMM";
		$elsetag--;
		$singleif=0;
		goto PARSE
	}
	if ($type[CURR] eq "STMT"
		  or
	    $type[CURR] eq "COMP") { goto PARSE; }
	if ($type[CURR] eq 'COMM') {
		push @{$code{$seg}->{code}}, "\t# $syms[CURR]\n";
		goto PARSE;
	}
	if ($type[CURR] eq "INT" and 
		($type[NEXT] eq "BARE" or $type[NEXT] eq "COMM")) {  # Line number!
		create_label();
		$currline="$labels{$syms[CURR]}";
		label_defined($syms[CURR]);
		push @{$code{$seg}->{code}}, "$labels{$syms[CURR]}:   # For user branch ($syms[CURR])\n";
		debug() if $debug;
		goto PARSE
	}
	#
	# End of compile?
	#
	if ($syms[CURR] eq "") {
FORCE_FINISH:
		runtime_shutdown();
		parse_function_dispatch();
		parse_struct_copy_dispatch();
		parse_data_setup();
		check_branches();
		return;
	}

PARSEERR:
	print "Parse error at source line $sourceline: ";
	dumpq;
	die;
}
sub debug {
	push @{$code{$seg}->{code}}, <<DEBUG;
	.arg $sourceline
	call ${seg}_debug
DEBUG
}

sub english_func {
	local $_=$_[0];
	s/\$$/dollar/;
	s/\%$/int/;
	s/\&$/long/;
	s/\!$/single/;
	s/\#$/double/;
	return $_;
}
my %labdef;
sub label_defined {
	$labdef{$_[0]}++;
}

sub check_branches {
	foreach(keys %labels) {
		print "Label $_ not defined\n" unless exists $labdef{$_};
	}
}
sub create_label {
	unless (exists $labels{$syms[CURR]}) {
		$labels{$syms[CURR]}="USERLABEL_$branchseq";
		$branchseq++;
	}
}
1;
