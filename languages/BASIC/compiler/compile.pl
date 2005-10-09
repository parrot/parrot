#! perl -w

# Remember, this is BAD PERL later to be translated to PASM
# First tokenize the input stream into:
#          @tokens and @tokdsc
# Then compile.
use strict;
use Getopt::Std;
use vars qw( @tokens @tokdsc);
use vars qw(%code %options @basic %common);
use vars qw( @syms @type );
use vars qw( %labels $runtime_jump $debug $sourceline);
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
#push(@ARGV);
parse(@ARGV);

open(CODE, ">TARG_test.imc") || die;

foreach my $seg ("_main", "_basicmain", keys %code) {
	next unless exists $code{$seg};
	my @debdecl=();
	my @init=();

	print CODE ".sub $seg\n";
	if (exists $code{$seg}->{declarations}) {
		print CODE <<'END_PIR';

	.local pmc _GLOBALS
	.local string JUMPLABEL
	JUMPLABEL=''
END_PIR
		foreach my $var (sort keys %{$code{$seg}->{declarations}}) {
			if ($var=~/_string$/) {
				print CODE "\t.local string $var\n";
				push @init, qq{\t\t$var=""\n};
				push @debdecl, "\t\t\$P1[\"$var\"]=$var\n";
			} else {
				print CODE "\t.local float $var\n";
				push @init, qq{\t\t$var=0.0\n};
				push @debdecl, "\t\t\$S0=$var\n\t\t\$P1[\"$var\"]= \$S0\n";
			}

		}
	}
	#print CODE<<INIT;
	#.sub ${seg}_run			# Always jump here.
		#${seg}_main()
		#ret
	#.end
#INIT
	my($edit,@saves);
	#print CODE "\t.sub ${seg}_main\n\t\tsaveall\n";

	# If any "common" declared variables are in scope, set them up.
	@saves=();
	foreach my $var (keys %{$code{$seg}->{declarations}}) {
		if (exists $main::common{$var}) {
			push(@saves, $var);
		}
	}
	if (@saves) {
		print CODE qq{\t\t# Grab "COMMON" variables from global stash\n};
		print CODE qq{\t\tfind_global _GLOBALS, "COMMON"\n};
		foreach(@saves) {
			print CODE qq{\t\t$_=_GLOBALS["$_"]\n};
		}
	}

	# Emit the code for the segment
	foreach(@{$code{$seg}->{code}}) {
		s/#RTJ// if $runtime_jump;
		if (/#SAVECOMMON/) {
			@saves=();
			$edit="";
			foreach my $var (keys %{$code{$seg}->{declarations}}) {
				if (exists $main::common{$var}) {
					push(@saves, $var);
				}
			}
			if (@saves) {
				$edit.=qq{\tfind_global _GLOBALS, "COMMON"\n};
				foreach(@saves) {
					$edit.=qq{\t_GLOBALS["$_"]=$_\n};
				}
				$edit.=qq{\tstore_global "COMMON", _GLOBALS\n};
			}
			s/#SAVECOMMON/$edit/;
		}		
		if (/#RESTORECOMMON/) {
			@saves=();
			$edit="";
			foreach my $var (keys %{$code{$seg}->{declarations}}) {
				if (exists $main::common{$var}) {
					push(@saves, $var);
				}
			}
			if (@saves) {
				$edit.=qq{\tfind_global _GLOBALS, "COMMON"\n};
				foreach(@saves) {
					$edit.=qq{\t$_=_GLOBALS["$_"]\n};
				}
			}
			s/#RESTORECOMMON/$edit/;
		}		
		s/^/\t/gm;
		print CODE;
	}
	# Put back all of the globals we've used in this sub
	@saves=();
	foreach my $var (keys %{$code{$seg}->{declarations}}) {
		if (exists $main::common{$var}) {
			push(@saves, $var);
		}
	}
	if (@saves) {
		print CODE qq{\t\tfind_global _GLOBALS, "COMMON"\n};
		foreach(@saves) {
			print CODE qq{\t_GLOBALS["$_"]=$_\n};
		}
		print CODE qq{\t\tstore_global "COMMON", _GLOBALS\n\t};
	}
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
		\$I0= \$P0["step"]
		ne \$I0, 0, DEBUGGER_STOP
		\$P1= \$P0["break"]
		\$I0= \$P1
		eq \$I0, 0, DEBUGGER_DONE  # No breakpoints
		\$S0= debline
		exists \$I0, \$P1[\$S0]
		eq \$I0, 0, DEBUGGER_DONE	 # This breakpoint doesn't exist
	DEBUGGER_STOP:
		\$P1=new .PerlHash
@debdecl		.arg \$P1
		.arg debline
		_DEBUGGER_STOP_FOR_REAL()
	DEBUGGER_DONE: noop
	.end	# End debug segment
.end 	# End outer segment
EOD
}
if ($debug) {
	print CODE<<FOO;
.sub _DEBUG_INIT
	saveall
	\$P0=new .PerlArray
	find_global \$P1, "DEBUGGER"
FOO
	foreach(0..@main::basic-1) {
		my $line=$main::basic[$_];
		$line=~s/"/'/g;
		print CODE "\t\$P0[",$_+1,"]= \"$line\"\n";
	}
	print CODE<<FOO;
	\$P1["code"]= \$P0
	\$P1["step"]= 1   # Turn on stepping mode
	\$P0=new .PerlHash
	\$P1["break"]= \$P0  # Breakpoints
	\$P0=new .PerlArray
	\$P1["watch"]= \$P0  # Watch
	store_global "DEBUGGER", \$P1
.end
FOO
}
print CODE<<RUNTIMESHUTDOWN;
	#
	# Pull in the runtime libraries
	#
.include "RT_initialize.imc"
.include "RT_aggregates.imc"
.include "RT_builtins.imc"
.include "RT_debugger.imc"
.include "RT_io.imc"
.include "RT_platform.imc"
.include "RT_support.imc"
RUNTIMESHUTDOWN

close(CODE);

exit 0;

=pod

=cut

__END__

print "This is the default program.  Say 'compile filename.bas' to compile"
print "  a BASIC program"
