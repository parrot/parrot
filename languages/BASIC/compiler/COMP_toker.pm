#! perl -w

use strict;

my ($cur,$next,$afternext,$curtok);
my $stmts=0;

sub fetch {
	$cur=$next;
	$next=$afternext;
	$afternext=getc(D);
	$afternext="" if (! defined $afternext);
	$stmts++ if $afternext=~/\n/;
}
sub append {
	$curtok.=$cur;
}
sub emit {
	unless ($_[0] eq "STRING" or $_[0] eq "COMM" or $_[0] eq "DIRECTIVE") {
		$curtok=~tr/A-Z/a-z/;
	}
	push(@tokens, $curtok);
	push(@tokdsc, $_[0]);
	$curtok="";
}

sub tokenize {

	fetch;	
	fetch;
	fetch;
MAIN:
	goto END if $cur eq -1;
	if ($cur =~ /[\t ]/) {   # Whitespace
		fetch;
		goto MAIN;
	}

	if ($cur =~ /[\d\.]/) {  # Numeric constants
		goto NOTNUM if ($cur eq "." and $next !~ /\d/);
		my $numtype="INT";
		if ($cur eq ".") {
			$numtype="FLO";
			$cur="0.";
		}
		append;
		fetch;
NUMCONST:	if ($cur =~ /\d/) {
			append;
			fetch;
			goto NUMCONST;
		}
		if ($cur eq '.' ) {
			append;
			fetch;
			$numtype="FLO";
			goto NUMCONST;
		}
		if ($cur =~ /[eEdD]/ and $next =~/[-+\d]/) {
			append;
			fetch;
			append;	# Pick up next char too
			fetch;
			$numtype="FLO";
			goto NUMCONST;
		}
		# Falls through!
		if ($cur =~ /[#!&%]/) {
			append;
			fetch;
			if ($cur =~ /[!#]/) {
				$numtype="FLO";
			}
		}
		emit($numtype);
		goto MAIN;
	}
NOTNUM:
	#if ($cur eq "-" and $next =~ /[\d\.]/) {
	#	append;
	#	fetch;
	#	goto NUMCONST;
	#}
	if ($cur eq '"') {   # String constants
		append;
		fetch;
		while($cur ne '"') {
			if ($cur eq "\n") {
				$cur=q{"};  # EOL is also an end-quote
				last;
			}
			die "Unexpected EOF (missing quote?)" if ( $cur eq -1 or $cur eq "\n");
			append;
			fetch;
		}
		append;
		$curtok=~s/^"|"$//g;    # Remove quote marks!
		emit("STRING");
		fetch;
		goto MAIN;
	}
	if ( ($cur eq "'") or 
	     ($cur=~/[Rr]/ and $next=~/[Ee]/ and $afternext=~/[Mm]/ ) ) {	# Comments
		append;
		fetch;
		while($cur ne -1 and $cur ne "\n") {
			append;	
			fetch;
		}
		emit("COMM");
		fetch;
		goto MAIN;
	}
	if ($cur =~ /[A-Za-z]/) {		# Bareword 
		append;
		fetch;
		while($cur =~ /[A-Za-z0-9]/ or $cur =~ /[#!&\$%]/) { # SIGIL
			append;
			if ($cur =~ /[#!&\$%]/) {
				fetch;
				last;
			}
			fetch;
		}
		emit("BARE");
		goto MAIN;
	}
	if ($cur eq '&') {		# Hex or Octal constant
		append;
		fetch;
		die "Bad constant" unless ($cur =~ /[oOhH]/);
		if ($cur =~ /[oO]/) {
			append;
			fetch;
			while($cur =~ /[0-7]/) {
				append;
				fetch;
			}
		} elsif ($cur =~ /[hH]/) {
			append;
			fetch;
			while($cur =~ /[0-7a-fA-F]/) {
				append;
				fetch;
			}
		}
		if ($cur eq '&' or $cur eq '%') {
			append;
			fetch;
		}
		emit("BASE");
		goto MAIN;
	}
	if ($cur eq ">" or $cur eq "<" or $cur eq "=") { 
		append;
		if ($next eq "=" or $next eq ">") {
			fetch;
			append;
		}
		emit("Compare");
		fetch;
		goto MAIN;
	}
	if ($cur eq "_" and $next =~ /\w/) {	# Directive
		append;
		fetch;
		while($cur =~ /\w/) {
			append;
			fetch;
		}
		emit("BARE");
		until($cur eq "\n" and $next eq "_" and $afternext =~ /\w/) {
			append;
			fetch;
		}
		append;
		fetch;
		emit("DIRECTIVE");
		while($cur =~ /\w/) {
			append;
			fetch;
		}
		emit("BARE");
		fetch;
		goto MAIN;
	}

	if ($cur =~ /[-^+\/*()#,\\_.;]/) { # Punct
		append;
		emit("PUN");
		fetch;
		goto MAIN;
	}

	if ($cur eq "\n") {   # ;?
		append;
		emit("STMT");
		fetch;
		goto MAIN;
	}
	if ($cur eq ":") {
		append;
		emit("COMP");
		fetch;
		goto MAIN;
	}
	if ($cur eq "") { goto END };
	die "unknown: $cur at source line $stmts";
	goto MAIN;

END:	emit("STMT");
	return;

}

1;
