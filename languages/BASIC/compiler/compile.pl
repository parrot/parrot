
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

=pod

=cut

__END__

print "This is the default program.  Say 'compile filename.bas' to compile"
print "  a BASIC program"
