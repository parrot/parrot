
#!/usr/bin/perl -w

# Remember, this is BAD PERL later to be translated to PASM
# First tokenize the input stream into:
#          @tokens and @tokdsc
# Then compile.
use strict;
our @basic=();

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

open(CODE, ">TARG_test.pasm") || die;
open(FUNC, ">TARG_localfuncs.pasm") || die;

tokenize();
parse(@ARGV);

close(CODE);
close(FUNC);

exit 0;

=pod

=cut

__END__

print "This is the default program.  Say 'compile filename.bas' to compile"
print "  a BASIC program"
