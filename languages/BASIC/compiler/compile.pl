#!/usr/bin/perl -w

# Remember, this is BAD PERL later to be translated to PASM
# First tokenize the input stream into:
#          @tokens and @tokdsc
# Then compile.
use strict;
use Getopt::Std;
use vars qw( @tokens @tokdsc);
use vars qw(%code %options @basic);
use vars qw( @syms @type );
use vars qw( %labels $runtime_jump $debug  $sourceline);
use COMP_toker;
use COMP_parser;
use COMP_assignments;
use COMP_expressions;

our @basic=();


$SIG{__DIE__}=sub {
	print "At BASIC source line $main::sourceline:\n";
	$_=$_[0];
	s/^(.{1,50})(\S+)\s+(.*)/\t$1$2\n\t$3/;
	print;
	exit 1;
};

getopts('d', \%options);
$debug=1 if $options{d};

if (@ARGV) {
	open(D, $ARGV[0]) || die;
	@basic=<D>;
	chomp(@basic);
	seek D, 0, 0 or warn "Cannot reseek: $!";
} else {
	open(D, "<&DATA") || die;
}
shift(@ARGV);

tokenize();
push(@ARGV);
parse(@ARGV);

open(CODE, ">TARG_test.imc") || die;

print CODE qq{.include "RT_initialize.pasm"\n};
foreach my $seg ("_main", "_basicmain", keys %code) {
	next unless exists $code{$seg};
	my @debdecl=();

	print CODE ".sub $seg\n";
	if (exists $code{$seg}->{declarations}) {
		foreach my $var (sort keys %{$code{$seg}->{declarations}}) {
			if ($var=~/_string$/) {
				print CODE "\t.local string $var\n";
				push @debdecl, "\t\tset \$P1[\"$var\"], $var\n";
			} else {
				print CODE "\t.local float $var\n";
				push @debdecl, "\t\tset \$S0, $var\n\t\tset \$P1[\"$var\"], \$S0\n";
			}

		}
	}
	print CODE<<INIT;
	.sub ${seg}_run			# Always jump here.
		call ${seg}_main
		ret
	.end
INIT
	print CODE "\t.sub ${seg}_main\n\t\tsaveall\n";
	foreach(@{$code{$seg}->{code}}) {
		s/#RTJ// if $runtime_jump;
		s/^/\t/gm;
		print CODE;
	}
	print CODE "\t\trestoreall\n\t\tret\n";
	print CODE "\t.end\t# main segment\n";
	delete $code{$seg};
	if (! $debug) {
		print CODE ".end\t# outer segment\n";
		next;
	}
	print CODE<<EOD;
	.sub ${seg}_debug
		saveall
		.param int debline
		find_global \$P0, "DEBUGGER"
		set \$I0, \$P0["step"]
		ne \$I0, 0, DEBUGGER_STOP
		set \$P1, \$P0["break"]
		set \$I0, \$P1
		eq \$I0, 0, DEBUGGER_DONE  # No breakpoints
		set \$S0, debline
		exists \$I0, \$P1[\$S0]
		eq \$I0, 0, DEBUGGER_DONE	 # This breakpoint doesn't exist
	DEBUGGER_STOP:
		\$P1=new PerlHash
@debdecl		.arg \$P1
		.arg debline
		call _DEBUGGER_STOP_FOR_REAL
	DEBUGGER_DONE:
		restoreall
		ret
	
	.end	# End debug segment
.end 	# End outer segment
EOD
}
if ($debug) {
	print CODE<<FOO;
.sub _DEBUG_INIT
	saveall
	\$P0=new PerlArray
	find_global \$P1, "DEBUGGER"
FOO
	foreach(0..@main::basic-1) {
		my $line=$main::basic[$_];
		$line=~s/"/'/g;
		print CODE "\tset \$P0[",$_+1,"], \"$line\"\n";
	}
	print CODE<<FOO;
	set \$P1["code"], \$P0
	set \$P1["step"], 1   # Turn on stepping mode
	\$P0=new PerlHash
	set \$P1["break"], \$P0  # Breakpoints
	\$P0=new PerlArray
	set \$P1["watch"], \$P0  # Watch
	store_global "DEBUGGER", \$P1
	restoreall
	ret
.end
FOO
}
print CODE<<RUNTIMESHUTDOWN;
	#
	# Pull in the runtime libraries
	#
.include "RT_aggregates.pasm"
.include "RT_builtins.pasm"
.include "RT_debugger.pasm"
.include "RT_io.pasm"
.include "RT_platform.pasm"
.include "RT_support.pasm"
RUNTIMESHUTDOWN

close(CODE);

exit 0;

=pod

=cut

__END__

print "This is the default program.  Say 'compile filename.bas' to compile"
print "  a BASIC program"
