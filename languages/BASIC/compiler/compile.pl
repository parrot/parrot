
#!/usr/bin/perl -w

# Remember, this is BAD PERL later to be translated to PASM
# First tokenize the input stream into:
#          @tokens and @tokdsc
# Then compile.
use strict;
our @basic=();
use vars qw(%code);

require "COMP_toker.pm";
require "COMP_parser.pm";
require "COMP_assignments.pm";
require "COMP_expressions.pm";

$SIG{__DIE__}=sub {
	print "At BASIC source line $main::sourceline:\n";
	$_=$_[0];
	s/^(.{1,50})(\S+)\s+(.*)/\t$1$2\n\t$3/;
	print;
	exit 1;
};

if (@ARGV) {
	open(D, $ARGV[0]) || die;
	@basic=<D>;
	chomp(@basic);
	seek D, 0, 0 or warn "Cannot reseek: $!";
} else {
	open(D, "<&DATA") || die;
}
shift(@ARGV);

use vars qw( @tokens @tokdsc);
use vars qw( @syms @type );
use vars qw( %labels );


tokenize();
push(@ARGV);
parse(@ARGV);

open(CODE, ">TARG_test.imc") || die;

print CODE qq{.include "RT_initialize.pasm"\n};
my $debug=0;
foreach my $seg ("_main", keys %code) {
	next unless exists $code{$seg};
	my @debdecl=();
	$debug=1 if (grep /debug/, @ARGV);

	print CODE ".sub $seg\n";
	if (exists $code{$seg}->{declarations}) {
		foreach my $var (sort keys %{$code{$seg}->{declarations}}) {
			if ($var=~/_string$/) {
				print CODE "\t.local string $var\n";
				push @debdecl, "\tset \$P1[\"$var\"], $var\n";
			} else {
				print CODE "\t.local float $var\n";
				push @debdecl, "\tset \$S0, $var\n\tset \$P1[\"$var\"], \$S0\n";
			}

		}
	}

	print CODE @{$code{$seg}->{code}};
	if ($debug) {
		print CODE<<'EOD';
DEBUGGER:
	find_global $P0, "DEBUGGER"
	set $I0, $P0["step"]
	ne $I0, 0, DEBUGGER_STOP
	set $P1, $P0["break"]
	set $I0, $P1
	eq $I0, 0, DEBUGGER_DONE  # No breakpoints
	set $S0, $I100
	exists $I0, $P1[$S0]
	eq $I0, 0, DEBUGGER_DONE	 # This breakpoint doesn't exist

DEBUGGER_STOP:
	$P1=new PerlHash
EOD
	print CODE "@debdecl";

		print CODE<<'EOD';
	.arg $P1
	.arg $I100
	call _DEBUGGER_STOP
DEBUGGER_DONE:
	ret
EOD
	}
	print CODE ".end\n";
	delete $code{$seg};
}
print CODE<<RUNTIMESHUTDOWN;
	#
	# Pull in the runtime libraries
	#
#.include "RT_expr.pasm"
#.include "RT_math.pasm"
#.include "RT_variables.pasm"
.include "RT_builtins.pasm"
#.include "RT_userfunc.pasm"
.include "RT_aggregates.pasm"
.include "RT_support.pasm"
.include "RT_io.pasm"
#.include "RT_platform.pasm"
.include "RT_debugger.pasm"
	# 
	# Pull in user-defined functions
	#
#.include "TARG_localfuncs.pasm"
RUNTIMESHUTDOWN

close(CODE);

exit 0;

=pod

=cut

__END__

print "This is the default program.  Say 'compile filename.bas' to compile"
print "  a BASIC program"
