#!/usr/bin/perl -w

use strict;
use constant VERSION => 2.0;

use constant PREV => 2;
use constant CURR => 1;
use constant NEXT => 0;
use subs qw(dumpq EXPRESSION);
use Data::Dumper;

require "COMP_parsefuncs.pm";

sub init {
        @type[0..2]=("","","");
        @syms[0..2]=("","","");
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
	print CODE <<INIT;
.include "RT_initialize.pasm"
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
	print CODE <<SHUTDOWN;
	#
	# ###################
	# Program Termination
	# ###################
	end
	#
	# Pull in the runtime libraries
	#
.include "RT_expr.pasm"
.include "RT_math.pasm"
.include "RT_variables.pasm"
.include "RT_builtins.pasm"
.include "RT_userfunc.pasm"
.include "RT_aggregates.pasm"
.include "RT_support.pasm"
.include "RT_io.pasm"
.include "RT_platform.pasm"
	# 
	# Pull in user-defined functions
	#
.include "TARG_localfuncs.pasm"
SHUTDOWN
}

use vars qw( %functions );
use vars qw( %usertypes );
use vars qw( $funcname );
use vars qw( $branchseq @selects $sourceline );
sub parse {
	my(%opts)=@_;
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
	
PARSE:
	1;
PARSE_NOFEED:
	if ($type[CURR] eq "STMT" or $type[CURR] eq "COMM") {
		$sourceline++;
		unless ($type[PREV] eq "STMT") {
			print CODE "set .LINE, $sourceline\n";
			trace() if $opts{trace};
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
		print CODE "\t# Unimplemented '$syms[CURR] ";
		while(1) {
			feedme();
			$_=$type[CURR];
			last unless $_;
			last if $_ =~ /STMT|COMM|COMP/;
			print CODE "$syms[CURR] ";
		}
		print CODE "'\n";
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
		shared | cls | locate | color
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
	if ($syms[CURR] eq "if") {
		print CODE "\t# if()\n";
		#print "In IF, pushing $ifline onto stack\n";
		push(@ifstack, $ifline);
		print CODE EXPRESSION;
		feedme();
		#print "Post 'if' token is $syms[CURR]\n";
		die "No then?  $syms[CURR]" if ($syms[CURR] ne "then");
		$singleif=1 if ($type[NEXT] ne "STMT" and $type[NEXT] ne "COMM");
		#print "Single if!\n" if $singleif;
		print CODE<<TRUTHTEST;
	bsr TRUTH
	eq I1, 0, IFBRANCH_$ifline
	# The expression was true...
TRUTHTEST
		$ifline++;
		if ($type[NEXT] eq "INT") {  # if x then linenumber
			feedme;
			create_label();
			print CODE "\tbranch $labels{$syms[CURR]}\t# Goto $syms[CURR]\n";
		}
		$elsetag++;
		goto PARSE;
	}
	if ($syms[CURR] eq "elseif") {
		my $c;
		$c=pop @ifstack;
		push(@{$elsestack->{$elsetag}}, $elseline);
		print CODE "\tbranch ELSEBRANCH_$elseline\n";
		print CODE "IFBRANCH_$c:\n";
		print CODE EXPRESSION;
		feedme();
		print CODE<<TRUTHTEST;
	bsr TRUTH
	eq I1, 0, IFBRANCH_$ifline
TRUTHTEST
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
		print CODE "\tbranch ELSEBRANCH_$elseline\n";
		print CODE "\t# The expression was not true...\n";
		print CODE "IFBRANCH_$c:\n";
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
				print CODE "IFBRANCH_$_:\n";
			}
			while($_=pop(@{$elsestack->{$elsetag}})) {
				print CODE "ELSEBRANCH_$_:\n";
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
		print CODE "\tend\n";
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
		print CODE "$labels{$syms[CURR]}:   # For user branch ($syms[CURR])\n";
		print CODE "\tset .LINE, $sourceline\n";
		trace() if ($opts{trace});
		$currline="$labels{$syms[CURR]}";
		feedme;  # Get the :
		goto PARSE
	}
	
	# function assignment...  WRONG-O!
	#     Don't go looking for lhs expression, please.
	if ($syms[NEXT] eq "=" and exists $functions{$syms[CURR]}) {
		# Assignment statement
		my $var=$syms[CURR];
		feedme;  # Get the =
		#print "Going to expression with $syms[CURR]\n";
		print CODE EXPRESSION;		# Evaluate the expression all queued up.
		ASSIGNMENT_FUNC($var);
		goto PARSE_NOFEED;
	}

	if ($syms[CURR] eq "_startasm") {
		feedme;
		#$syms[CURR]=~s/^\n|\n$//gm;
		print CODE "\t#\n\t# User-included assembly\n$syms[CURR]\n\t# End assembly\n\t#\n";
		feedme;
		
		goto PARSE;
	}
		
	# DO ME LAST
	#
	@lhs=EXPRESSION({ lhs => 1});
	feedme();	# Grab the = 
	@rhs=EXPRESSION;
	print CODE<<EOASS;
@lhs
	set P0, P10[I25]
	set P0["right"], P6   # Results of RHS evaluation (target of store)
@rhs
	set P1, P10[I25]
	set P0, P1["right"]   
	bsr ASSIGNMENT        # P0 = P6
EOASS
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

=pod wrongway
UNK:	if (($type[CURR] eq "STMT" or $type[CURR] eq "COMM" or $type[CURR] eq "STMT") and $singleif) {
		while($_=pop(@ifstack)) {
			print CODE "IFBRANCH_$_:\n";
		}
=cut
UNK:	if (($type[CURR] eq "STMT" or $type[CURR] eq "COMM") and $singleif) {

		$_=pop @ifstack;
		if ($_ < 0 ) {
			# print "Else was done, skipping...\n";
		} else {
			print CODE "IFBRANCH_$_:\n";
		}
		while($_=pop(@{$elsestack->{$elsetag}})) {
			print CODE "ELSEBRANCH_$_:\n";
		}
		print CODE "\t# $syms[CURR]\n" if $type[CURR] eq "COMM";
		$elsetag--;
		$singleif=0;
		goto PARSE
	}
	if ($type[CURR] eq "STMT"
		  or
	    $type[CURR] eq "COMP") { goto PARSE; }
	if ($type[CURR] eq 'COMM') {
		print CODE "\t# $syms[CURR]\n";
		goto PARSE;
	}
	if ($type[CURR] eq "INT" and 
		($type[NEXT] eq "BARE" or $type[NEXT] eq "COMM")) {  # Line number!
		create_label();
		$currline="$labels{$syms[CURR]}";
		label_defined($syms[CURR]);
		print CODE "$labels{$syms[CURR]}:   # For user branch ($syms[CURR])\n";
		print CODE "\tset .LINE, $sourceline\n";
		trace() if ($opts{trace});
		goto PARSE
	}
	#
	# End of compile?
	#
	if ($syms[CURR] eq "") {
FORCE_FINISH:
		runtime_shutdown();
		print CODE <<FINISH;
	#
	# All of this crap is generated dynamically because we can't 
	# compute addresses this early to provide a proper jump-table
	# and this stuff needs to be done at runtime
FINISH

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
sub trace {
	print CODE<<TRACE;
print "Trace "
print .LINE
print "\\n"
TRACE
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
