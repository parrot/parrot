package P6C::Parser;

=head1 B<P6C::Parser>

The parser.  It provides the following methods:

=over

=item B<new>

Create a new parser object from scratch.  This is slow.

=item B<Precompile($name)>

Call B<Parse::RecDescent>'s B<Precompile> method to compile the
grammar to the file $name.pm.  The resulting parser can then be loaded
as a module, and instantiated with its B<new> method.  This is much
faster than re-building the grammar.

=item B<Debug($on)>

If C<$on> is true, generate line-number information.  This actually
has a surprisingly small impact on performance.  If C<$on> is false,
turn line-number generation off.

=item B<Reset()>

Reset global parser state.

=back

It's been tweaked for speed in a number of ways.  First, the infix
operators have been turned into regexes.  Second, B<%item> is not
used, and the grammar can be built without B<%item> support for more
speed.  Third, a number of logically distinct rules have been inlined,
making the job of postprocessing the parse tree somewhat more
involved.

=cut

use FindBin;
use lib "$FindBin::Bin/../../lib";
use Parse::RecDescent;
use strict;
require Exporter;

=head2 Internals

=over 

=item B<%WANT>

Maps function (prefix operator) names to their corresponding argument
context rules.  The entries serve the dual purpose of recognizing a
prefix operator, and of telling the parser what to parse next.

=item B<$FUNCTION_ARGS>

The default argument context rule; a comma-separated list of values.

=item B<%CLASSES>

Has an entry for each class.  This allows bare class-names to be
recognized.  The hash values are currently unimportant.

=cut

use vars qw(%WANT %CLASSES $FUNCTION_ARGS $grammar $err_handler);

$err_handler = undef;

sub Precompile {
    shift;
    return Parse::RecDescent->Precompile($grammar, @_);
}

sub new {
    shift;
    return Parse::RecDescent->new($grammar, @_);
}

=item B<add_function($function, $params, $parser)>

Called in function declarations and definitions to add a function to
the parser.

=cut

sub add_function {
    my ($fname, $params, $parser) = @_;
    # We're already deciphering the tree in Tree.pm, why not use it?
    $fname = $fname->tree;
    $params = P6C::Tree::maybe_tree($params);
    if (!defined($params)) {
	# Easy case -- no params, so we assume it's a list operator
	$WANT{$fname} = $FUNCTION_ARGS;
	return 1;
    }
    argument_context($fname, $params, $parser);
    return 1;
}

=item B<add_class($class)>

Add a class.

=cut

sub add_class {		# seen class.
    my $c = shift->[1];
    $CLASSES{$c} = $c;
    1;
}

=item B<set_error_handler($err_handler)>

Sets the error handler for the parser.
When an error is detected during the parse,
$err_handler is called with these parameters:
    &$err_handler($msg, $linenum)

If no error handler if set then a message is printed
on STDERR.

This function returns the previous error handler.

=cut

sub Parse::RecDescent::set_error_handler {
    my $self = shift;
    my $old_handler = $err_handler;
    $err_handler = shift;
    $old_handler;
}

=item B<parse_sig>

Parses a signature and returns (signature, context).

=cut

sub parse_sig {
    my ($sig_string, %options) = @_;

    my $sig = Perl6grammar->new()->signature("($sig_string)");

    $sig = $sig->tree;
    $sig->{no_named} = 1 if $options{no_named};
    return ($sig, new P6C::Context(type => $sig->arg_context) );
}

##############################
# Functions (list operators):

INIT {
$FUNCTION_ARGS = 'bare_arglist';

# When debugging the perl6 compiler, it is very common to have the
# stack go much deeper than the default limit of 100 that the DB
# module assumes is insanely deep.
$DB::deep = 1000;

# XXX: many of these need their own special want_* rules.  This is
# just a hack to make the parser swallow the examples from the
# exegeses.  The compiler will promptly die if you actually use any of
# these.
my @builtin_funcs = qw(crypt index pack rindex sprintf substr
		       join unpack split
		       push unshift splice
		       warn die print printf read select syscall sysread
		       seek sysseek syswrite truncate write
		       vec
		       chmod chown fcntl ioctl link open opendir
		       rename symlink readlink sysopen unlink system
		       return fail
		       puts
		       not);

##############################
# Loop control
my @loop_control = qw(redo last next continue break skip);

##############################
# Unary operators
# XXX: does not handle default $_
my @unary_ops = qw(chop chomp chr hex lc lcfirst length
		   ord reverse uc ucfirst
		   abs atan2 cos exp hex int log oct rand sin sqrt srand
		   pop shift exit
		   delete each exists keys values
		   defined undef
		   chdir chroot glob mkdir rmdir stat umask
		   close
		   print1);	# temporary cruft.

##############################
# Control operators

# XXX: as with the builtin functions above, most of these will not
# compile, but are useful for testing the parser.

my @control_expr_array = qw(grep map sort);
my @control_scalar_block = qw(given while until);
my @control_other = qw(for foreach if when);

##############################
# Named blocks

# XXX: Most will not compile.
my @special_blocks = qw(CATCH BEGIN END INIT AUTOLOAD
			PRE POST NEXT LAST FIRST
			try do);

##############################
# Classes (builtin and otherwise)

# XXX: Will not compile.
my @builtin_types = qw(int num str HASH ARRAY SCALAR Inf NaN
		       true false); # XXX: these are really constants
sub Reset {
    %WANT = ();
    @WANT{@builtin_funcs} = ($FUNCTION_ARGS) x @builtin_funcs;
    @WANT{@loop_control} = ('maybe_label') x @loop_control;
    $WANT{goto} = 'label';
    @WANT{@unary_ops} = ('prefix') x @unary_ops;

    @WANT{@control_other} = map { "want_for_$_" } @control_other;
    @WANT{@control_expr_array} = ('want_expr_array') x @control_expr_array;
    @WANT{@control_scalar_block}
	= ('want_scalar_block') x @control_scalar_block;
    $WANT{default} = 'closure';

    $WANT{unless} = 'want_for_if';
    @WANT{@special_blocks} = ('closure') x @special_blocks;
    %CLASSES = ();
    @CLASSES{@builtin_types} = @builtin_types;
}

BEGIN {
# Handle comments:
    $Parse::RecDescent::skip = '(?:\s*(#[^\n]*?(\n|\Z))?)+';
    $::RD_AUTOACTION = q { bless [@item], 'P6C::'.$item[0] };
}

$grammar = <<'ENDSUPPORT';
#!perl
######################################################################
# Support functions and variables
{
    use vars '$no_comma';
    use vars '$err_handler';
    use vars qw(%KEYWORDS %CLASSES %WANT);
    use vars qw($NAMEPART $COMPARE $CONTEXT $MULDIV $PREFIX $ADDSUB $INCR
		$LOG_OR $LOGOR $FILETEST $ASSIGN $VOPEN $VCLOSE $MATCH 
		$BITSHIFT $BITOR $BITAND
		$SOB $FLUSH $NUMPART $NUMBER $RXATOM $RXMETA $RXCHARCLASS
 		$SPECIAL_DELIM
		$RXESCAPED $HEXCHAR $RXASSERTION);
    use vars '%CDELIM';

# Things from P6C::* used during the parse:
BEGIN {
    no strict 'refs';
    for (qw(add_class add_function CLASSES WANT err_handler)) {
	*$_ = *{'P6C::Parser::'.$_};
    }
}

# Regexen used in the parser:
BEGIN {
    $SOB	= qr|$Parse::RecDescent::skip(?<![^\n\s]){|o;
    $VOPEN	= qr/>>/;
    $VCLOSE	= qr/<</;
    $NAMEPART	= qr/[a-zA-Z_][\w_]*/;
    $COMPARE	= qr{(?:cmp|eq|[gnl]e|[gl]t)\b|<=>|[<>=!]=|<|>};
    $CONTEXT	= qr{[\%\@\$\&*?]|\+(?!\+)|~(?![~\&\|\^])};
    $MULDIV	= qr{[\%*x]|/(?!/)};
    $MATCH	= qr{[=!]~};
    $INCR	= qr{\+\+|--};
    $PREFIX	= qr{ [!\\]    |    # logical negation '!', create a reference '\'
                      \+\^     |    # unary bitwise XOR (bitwise negation)
                      \+(?!\+) |    # posification '+', but not increment '++' 
                      -(?![->])     # negation '-', but not decrement '--', but not dereference '->'
                    }x;
    $ADDSUB	= qr{[-+~](?![\&\|\^])};
    $BITSHIFT	= qr{<<|>>};
    $LOG_OR	= qr{(?:x?or|err)\b};
    $LOGOR	= qr{\|\||\^\^|//};
    $BITOR	= qr{(?:\|(?!\|)|[~\+][\|\^])};
    $BITAND	= qr{(?:\+\&|~\&)};
    $FILETEST	= qr{-[rwxoRWXOezsfdlpSbctugkTBMAC]+\b};
    $ASSIGN	= qr{(?:!|:|//|&&?|\|\|?|\+[\&\|\^]|~[\&\|\^]|\^\^|<<|>>|$ADDSUB|$MULDIV|\*\*)?=};
    # Used for flushing syntax errors
    $FLUSH	= qr/\w+|[^\s\w;}#'"]+/;
    $NUMPART	= qr/(?!_)[\d_]+(?<!_)/;
    $NUMBER = qr/(?:$NUMPART(?:\.$NUMPART)?|\.$NUMPART)(?:[Ee]-?$NUMPART)?/o;
    $HEXCHAR	= qr/[a-fA-F0-9]{2,4}/;
    $RXESCAPED	= qr/\\(?:[Xx]$HEXCHAR|0[0-7]{1,3}|[Xx]\{$HEXCHAR\}|[Pp]\{\w+\}|.)/o;
    $RXASSERTION= qr/:{1,3}|\^{1,2}|\${1,2}/;
    $RXATOM	= qr/(?:[\w_]|\\.)+/;
    $RXCHARCLASS= qr/\[(?:[^\]\\]|\\.)+\]/;
    $SPECIAL_DELIM = qr/[^\w\s]/;
}

# HACK to distinguish between "my ($a, $b) ..." and "foo ($a, $b)".
# Don't need all keywords in here, but only the ones that cause
# problems.
BEGIN {
    my @kw = qw(my our temp if unless until while for and or xor err);
    @KEYWORDS{@kw} = (1) x @kw;
}

# Matching delimiters:
BEGIN {
    %CDELIM = qw|( )  { }  [ ]  < >
		 ) (  } {  ] [  > <|;
    # Those weird French quotes from E5:
    $CDELIM{"\xAB"} = "\xBB";
    $CDELIM{"\xBB"} = "\xAB";
}

# (see Parse::RecDescent::Consumer)
sub consumer {
    my $t = shift;
    my $old_len = length $t;
    return sub {
	my $len = length($_[0]);
	return substr($t, 0, ($old_len - $len));
    };
}

# Labels and statements ending in a '}' with no trailing semicolon are
# recognized by looking backwards when we expect a statement end.
# Entries in B<%since> are closures that make sure nothing significant
# has been seen since they were created.

my %since;

sub check_end {
    my ($type, $text) = @_;
    if ($since{$type}) {
	local $_ = $since{$type}->($text);
	return m/\A$Parse::RecDescent::skip\z/o || undef;
    }
    return undef;
}

sub mark_end {
    my ($type, $text) = @_;
    $since{$type} = consumer($text);
}

my $seen_err;

sub Parse::RecDescent::Debug {
    my ($parser, $on) = @_;
    if ($on) {
	$parser->Replace("\nstmts:            __stmt[\$arg[0]](s?)\n");
    } else {
	$parser->Replace("\nstmts:		  _stmt[\$arg[0]](s?)\n");
    }
}

sub getl($) {
    my $linenum = shift;
    ref($linenum)? Parse::RecDescent::linenum($linenum) : $linenum;
}

sub gett($) {
    my $t = shift;
    $t =~ s/\A($Parse::RecDescent::skip)//o;
    my $matched = $1;
    $::line += $matched =~ s/\n//g;
    $t =~ s/\n.*//s;
    $t =~ s/\s*$//;
    return length($t)> 30 ? substr($t,0,30). '...':$t;
}

sub got_err {
    my ($msg, $text, $linenum) = @_;

    $seen_err = 1;

    # Take care of the hacked P::RD::linenum, if needed.
    $linenum = getl($linenum);

    # Remove whitespace at start of text.
    $text =~ s/\A($Parse::RecDescent::skip)//o;

    # Adjust line number to take account of removed whitespace.
    my $matched = $1;
    $linenum += $matched =~ s/\n//g;

    # Remove everything after \n
    $text =~ s/\n.*$//s;

    # Make text more readable
    if ($text eq "") {
        $text = "end of input";
    } else {
        $text = qq{"$text"};
    }
    $msg = "$msg near $text";

    if ($err_handler) {
        &$err_handler($msg, $linenum);
    } else {
        print STDERR "Parse error [line $linenum]: $msg\n";
    }
}

}

ENDSUPPORT

$grammar .= <<'ENDGRAMMAR';
##############################
# Literals:

sv_literal:
          number
        | /$NUMBER/
		| '{' <commit> hv_seq '}'
		| '[' <commit> av_seq(?) ']'
		| quoted_string

number: radii | base

base: binary | octal | decimal | hex

binary: /0b0[01]+/
octal:  /0c0[0-7]+/
decimal: /0d0[0-9]+/
hex: /0x0[0-9a-fA-F]+/

radii: dotted_radii | reg_radii

dotted_radii:
        /(?=\d+\#(?:\d+:)+\d+)/
        <skip:''>
        /[0-9]+/ '#'
        (/(\d+)/ ':')(s) /(\d+)/
        <skip:$item[1]>

reg_radii:
        /(?=\d+\#\d+)/
        <skip:''>
        /[0-9]+/ '#'
        {
            local $_ = '0-9';
            $_ = "0-" . ($item[3]-1) unless $item[3] > 9;
            $_ .= ('a-' . chr ($item[3] + ord('a') - 11) )
                unless $item[3] < 10 || $item[3] > 35;
            $_ = qr/[$_]+/i;
        }
        /$item[5]/
        <skip:$item[1]>

av_seq:		  semi /[;,]?/

hv_seq:		  <leftop: pair ',' pair> /,?/

##############################
# Variables:
variable:	  sigil <skip:''> varname
scalar_var:	  '$' <skip:''> varname
nonscalar_var:	  /[\@\%]/ <skip:''> varname

sigil:		  /[\@\%\$\&]/

varname:	  name
		| /\d+/
		| /[\!_]/
		| '^' <commit> namepart
		| ('*')(?) '{' <skip:'\s*'> (scalar_expr | name) '}'

name:		  /(?:::|\.|\*)?$NAMEPART(?:::$NAMEPART)*/o

namepart:	  /$NAMEPART/o

##############################
# Expressions

# hype:		  '^' <commit> <skip:''> <matchrule:$arg[0]>
# 		| <matchrule:$arg[0]>

hv_indices:	  /[\w_]+(?=\s*})/ | comma

arglist:	  '(' comma(?) ')'

subscript:	  <skip:''> '{' <commit> <skip:$item[1]> hv_indices '}'
		| <skip:''> '[' <commit> <skip:$item[1]> av_seq ']'
		| '(' comma(?) ')'

subscriptable:	  name <commit>
			{ exists($KEYWORDS{$item[1][1]}) ? undef : 1 }
			arglist
		| '.' <commit> <skip:''> namepart(?)
		| '(' <commit> av_seq(?) ')'
		| variable

context:	  /$CONTEXT/o
# context:	  '%' | '@' | '$' | '&' | '*' | '_' | '?'
# 		| /\+(?!\+)/ # numeric context...

term:		  '<' <commit> expr(?) '>'
		| subscriptable <commit> subscript(s?)
		| /$CONTEXT/o <commit> term
		| pattern
		| sv_literal
		| class
		| closure

apply_rhs:	  namepart <commit> subscript(s?)
		| subscript(s)

apply:		  <leftop: term apply_op apply_rhs>
apply_op:	  /\.|$VOPEN\.$VCLOSE/o

incr:		  incr_op <commit> apply
		| apply incr_op(?)
incr_op:	  /$INCR|$VOPEN$INCR$VCLOSE/o

pow:		  <leftop: incr pow_op prefix>
pow_op:		  /\*\*|$VOPEN\*\*$VCLOSE/o

prefix:		  filetest_op <commit> prefix
		| prefix_op <commit> prefix
		| name { $WANT{$item[1][1]} } <matchrule:$item[2]>
		| pow

# prefix_op:	  '!' | '~' | '\\' | /-(?![->])/
prefix_op:	  /$PREFIX|$VOPEN$PREFIX$VCLOSE/o
filetest_op:	  /$FILETEST/o

pair:		  namepart '=>' <commit> prefix
		| prefix '=>' prefix
maybe_pair:	  namepart '=>' <commit> prefix
		| prefix ('=>' prefix)(?)

match:		  <leftop: maybe_pair match_op maybe_pair>
match_op:	  /$MATCH|$VOPEN$MATCH$VCLOSE/o

muldiv:		  <leftop: match muldiv_op match>
# muldiv_op:	  '*' | '/' | '%' | 'x'
muldiv_op:	  /$MULDIV|$VOPEN$MULDIV$VCLOSE/o

addsub:		  <leftop: muldiv addsub_op muldiv>
# addsub_op:	  '+' | '-' | '~'
addsub_op:	  /$ADDSUB|$VOPEN$ADDSUB$VCLOSE/o

bitshift:	  <leftop: addsub bitshift_op addsub>
bitshift_op:	  /$BITSHIFT|$VOPEN$BITSHIFT$VCLOSE/o

compare:	  <leftop: bitshift compare_op bitshift>
compare_op:	  /$COMPARE|$VOPEN$COMPARE$VCLOSE/o
# compare_op:	  '<=>' | '<=' | '==' | '>=' | '<' | '>' | '!='
# 		| 'eq' | 'ge' | 'ne' | 'le' | 'lt' | 'gt' | 'cmp'

bitand:		  <leftop: compare bitand_op compare>
bitand_op:	  /$BITAND|$VOPEN$BITAND$VCLOSE/o

bitor:		  <leftop: bitand bitor_op bitand>
bitor_op:	  /$BITOR|$VOPEN$BITOR$VCLOSE/o

logand:		  <leftop: bitor logand_op bitor>
logand_op:	  /&&|$VOPEN&&$VCLOSE/o

logor:		  <leftop: logand logor_op logand>
# logor_op:	  '||' | '^^' | '//'
logor_op:	  /$LOGOR|$VOPEN$LOGOR$VCLOSE/o

range:		  logor (range_op logor)(?)
range_op:	  '..'

ternary:	  range ('??' ternary '::' ternary)(?)

scope:		  /my|temp|our/
class:		  name { $CLASSES{$item[1][1]} }
			{ bless ['class', $item[1]], 'P6C::class' }

scope_class:	  scope <commit> class(?)
		| class

property:	  name { ($item[1][1] ne $arg[0]) || undef }
			arglist(?)

and_prop:	  "$arg[0]" <commit> property[$arg[0]]
		| property[$arg[0]]
props:		  "$arg[0]" <commit> property[$arg[0]] and_prop[$arg[0]](s?)
		| # nothing
decl:		  '(' <commit> <leftop: variable ',' variable> ')' props['are']
		|  variable props['is']

assign:		  assign_lhs assign_rhs(s?)

assign_lhs:	  scope_class decl
		| ternary
assign_rhs:	  assign_op scalar_expr

assign_op:	  /$ASSIGN|$VOPEN$ASSIGN$VCLOSE/o
# assign_op:	  /[!:]?=/ <commit>
# 		| assignable_op <skip:''> '='
# assignable_op:	  '//'
# 		| logand_op | logor_op
# 		| bitand_op | bitor_op | bitshift_op
# 		| addsub_op | muldiv_op | pow_op

scalar_expr:	  <leftop: assign 'but' assign>

comma:		  <leftop: <matchrule:@{[@arg ? $arg[0] : 'scalar_expr']}>
			comma_op <matchrule:@{[@arg?$arg[0]:'scalar_expr']}> >
comma_op:	  ','
maybe_comma:	  comma[@{[@arg ? $arg[0] : ()]}]
		| '' # Nothing.
bare_arglist:	  ...!'(' maybe_comma

semi:		  <leftop: expr semi_op expr>
semi_op:	  ';'

adverb:		  comma adv_clause(?)
adv_clause:	  /:(?!:)/ comma['scalar_expr']

log_AND:	  <leftop: adverb log_AND_op adverb>
log_AND_op:	  /and\b|${VOPEN}and\b$VCLOSE/o

log_OR:		  <leftop: log_AND log_OR_op log_AND>
# log_OR_op:	  'or' | 'xor' | 'err'
log_OR_op:	  /$LOG_OR|$VOPEN$LOG_OR$VCLOSE/o

expr:		  log_OR

##############################
# Parameters

signature:	  '(' <commit> sigparam(s? /,/) ')'

sigparam:	  class(?) zone(?) variable props['is'](?) initializer(?)

zone:		  /[\?\*\+]/

initializer:	  assign_op scalar_expr

##############################
# Statements

prog:		  {%since=(); $seen_err=undef; $::file = $arg[0] || ''} <reject>
		| /\A/ stmts[0] /\z/ <commit> {$seen_err ? undef : 1} ''
		| {got_err("Invalid statement", $text, $thisline); undef;}

# this rule gets substituted by »-g« switch in perl6
# so that __stmt is used.
stmts:		  _stmt[$arg[0]](s?)

# collect file,line info
__stmt:		{ $::line = getl($thisline);
                  $::txt = gett($text) } <reject>

__stmt:		  _stmt[$arg[0]] {
		    bless( [$::file,$::line, '??',$item[1], $::txt],
		    	'P6C::debug_info') }

# $arg[0] is set to true/false. True == "in block"
_stmt:		# Handle valid reason for 'stmt' failing (hit end of block)
		  { $arg[0] ? 1 : undef } ..."}" <commit> { undef }

		# Handle case where having missing input
		# or have hit end of file.
		| /\z/
		  <commit>
		  { got_err("Missing closing brace.", $text, $thisline) if ($arg[0]) }
		  <reject>

		# Handle "normal" case.
		| stmt stmt_sep[$arg[0]] { $item[1] }

		# Handle case where 'stmt' failed - try to remove
		# bad statement. Allow this to succeed so that
		# another statement can be tried if the flush
		# didn't hit the end of input.
		| { got_err("Invalid statement", $text, $thisline); 1; }
		  _stmt_flush
		  {0}

# Heuristic for removing invalid statement:
# Skip over all tokens up until we see a ';' or '}'
# or hit the end of the input.
# The tricky part is to ignore ';' or '}' that are
# embedded in quoted things or comments.
# The $FLUSH matches a word (\w+) or
# one or more non-word chars (\W) except these chars:
#     ; }   - we are looking for these
#     ' "   - handled by perl_quotelike
#     \s    - handled by skip
#     #     - handled by skip
# The _stmt_flush rule always succeeds.
# XXX - a smarter heuristic would match { with }
_stmt_flush:	  _stmt_token(s?) /[;}]|\z/ {0}

_stmt_token:	  <perl_quotelike>
		| /$FLUSH/o

stmt_sep:	  ';'
		| { check_end('block', $text) }
		| { check_end('label', $text) }
		| { $arg[0] ? 1 : undef } <commit> ..."}"
		| { $arg[0] ? undef : 1 } .../\z/

stmt:		  label /:(?!:)/ { mark_end('label', $text);1 } ''
		| directive <commit> name comma(?)
		| /method\b/ <commit> name signature props['is'] block
		| /loop\b/ <commit>
			'(' comma(?)
			';' comma(?)
			';' comma(?) ')'
			block
		| scope(?) /(?:sub|rule)\b/ <commit> name signature(?)
			{ add_function(@item[4,5], $thisparser);1 }
			props['is']
		(...';' | <matchrule:@{[$arg[0] eq 'sub'?'block':'rule']}>)[$item[2]]
		| scope(?) 'class' <commit> name { add_class($item[4]);1 }
			props['is'] block
		| expr guard(?)
		| ...';'

directive:	  /(?:package|module|use)\b/
guard:		  { check_end('block', $text) ? undef : 1 } _guard
_guard:		  /(?:if|unless|while|until)\b/ <commit> scalar_expr
		| 'for' expr

maybe_label:	  label(?)
label:		  namepart { exists($KEYWORDS{$item[1][1]}) ? undef
				: bless(['label', $item[1]], 'P6C::label') }

block:		  start_block '...' <commit> '}'
			{ mark_end('block', $text);1; } ''
		| start_block stmts[1] '}'
			{ mark_end('block', $text);1; } ''

start_block:	  <skip:''> /$SOB/o

closure:	  /sub\b|->/ '(' <commit> _closure_args(?) ')' block
		| '->' <commit> _closure_args(?) block
		| /sub\b/ <commit> block
		| block

_closure_args:	  <leftop: comma['variable'] semi_op comma['variable']>

want_for_for:	  av_seq closure
want_for_foreach: maybe_decl '(' expr ')' block
want_for_when:	  comma closure

want_for_if:	  scalar_expr closure elsif(s?) else(?)
elsif:		  /els(?:if|unless)/ scalar_expr closure
else:		  'else' closure

want_scalar_block: scalar_expr comma
want_expr_array:  scalar_expr closure

maybe_decl:	  scope_class <commit> variable props['is']
		| variable <commit> props['is']
		| # nada
nothing:	  ''
no_args:	  ...!'('

##############################
# Strings:

quoted_string:
          double_quoted_string
        | single_quoted_string

double_quoted_string: <rulevar:$delim>
double_quoted_string:
		  double_quoted_string_head <skip:''>
		  { $delim = $CDELIM{$item[1]} || $item[1] }
		  double_quoted_string_body[$delim](s)
		  "$delim" <skip:$item[2]> { $item[-3] }

double_quoted_string_head:
		  '"' { $return = '"' }
		| /qq$SPECIAL_DELIM/o { substr($item[1],2) }

double_quoted_string_body:
         '\\' backslashed_expr { $item[2] }
        | '\\' /./ { $item[2] }
		| interpolated_value { $item[1] }
		| variable str_subscript(s?) ...!/[\[\{\(]/ { [@item[1,2]] }
        | m/[^\\\$\@\%\&\Q$arg[0]\E]*/ { $item[1] }

str_subscript:
        <skip:$Parse::RecDescent::skip> ...!/\s/ subscript
			<skip:$item[1]> { $item[3] }

interpolated_value:
        sigil <skip:''>
			'(' <skip:$Parse::RecDescent::skip> comma ')'
			<skip:$item[2]>

single_quoted_string: <rulevar:$delim>
single_quoted_string:
		  single_quoted_string_head <skip:''>
		  { $delim = $CDELIM{$item[1]} || $item[1] }
		  single_quoted_string_body[$delim](s)
		  "$delim" <skip:$item[2]> { $item[-3] }

single_quoted_string_head:
		  "'" { "'" }
		| /q$SPECIAL_DELIM/o { substr($item[1],1) }
		| 'Q[' { '[' }

single_quoted_string_body:
		  m/\\(?=qq\{)/ <commit> double_quoted_string { $item[-1] }
        | m/(?:[^\Q$arg[0]\E\\]+|\\(?!qq\{).)*/ {
			$item[-1] =~ s/\\'/'/g; quotemeta($item[-1]) }

backslashed_expr:
          /(?=[qQ])/ single_quoted_string { $item[2] }
        | 'c' '[' string_set ']'
        | 'c' '[' /[^\]]+/ ']'
        | ':' '[' string_set ']'
        | ':' '[' /[^\]]+/ ']'
        | 'x' '[' hex_set ']'
        | 'x' '[' /[0-9a-fA-F]+/ ']'
        | '0' '[' number_set ']'
        | '0' '[' base ']'
        | base
        | 'x' /[0-9a-fA-F]+/
        | /[UL]/ '[' /[^\]]*/ ']'
        | /[ul]/ /./
        | /[trfne0\\]/

hex_set:
        ( /[0-9a-fA-F]+/ ';' )(s) /[0-9a-fA-F]+/

number_set:
        ( base ';' )(s) base

string_set:
        ( /(?=[^\];]+;)[^;]+/ ';' )(s) /[^\]]+/

##############################
# Regexes:

rule:	 	  rx_mod(s?) start_block rx_alt '}'
			{ mark_end('block', $text);1; } ''

pattern:	  <rulevar:$cdelim>
pattern:	  /(?:m|rx)\b/ <commit> rx_mod(s?) /$SPECIAL_DELIM/o rx_alt
			{ $cdelim = $CDELIM{$item[4]} || $item[4] }
			"$cdelim"
		| /rule\b/ <commit> rule
		| '/' rx_alt '/'

rx_alt:		  <leftop: rx_seq '|' rx_seq>

rx_seq:		  rx_element(s?)

rx_element:	  scalar_var    ':=' <commit> rx_atom
		| nonscalar_var ':=' <commit> rx_atom rx_repeat
		| ...'{' <commit> block
		| rx_atom rx_repeat(?)
		| rx_mod
		| /$RXASSERTION/o

rx_atom:	  '(' <commit> rx_alt ')'
		| '[' <commit> rx_alt ']'
		| '<' <commit> /!?/ rx_assertion '>'
                | '...'
		| '.'
		| /$RXESCAPED/o
		| variable subscript(s?)
		| /$RXATOM/o

rx_mod:		  /:[\w_]+/ ( '(' maybe_comma ')' )(?)

rx_repeat:	  _rx_repeat /\??/

_rx_repeat:	  '<' <commit> /!?/ _rx_repspec '>'
		| /[*+?]/

_rx_repitem:	  scalar_var
		| /\d+/

_rx_repspec:	  _rx_repitem ',' _rx_repitem
		| /\d+/

rx_assertion:	  '.'
		| /(?=["'])/ <commit> quoted_string
		| '(' <commit> expr ')'
		| '{' <commit> expr '}'
		| rx_call
		| nonscalar_var
		| rx_charclass

rx_charclass:	  <leftop: rx_cc_neg /[+\-]/ rx_cc_neg>
rx_cc_neg:	  /-?/ rx_cc_atom
rx_cc_atom:	  /$RXCHARCLASS/o
		| '<' rx_assertion '>'
		| namepart

rx_call:	  rx_rulename '(' <commit> maybe_comma ')'
		| rx_rulename ':' <commit> /(?:[^>]|\\.)*/
		| rx_rulename rx_alt(?)

rx_rulename:	  name
		| scalar_var

ENDGRAMMAR

} # END INIT

######################################################################
# Context handling
######################################################################

=item B<argument_context($name, $params, $parser)>

Abandon hope, all ye who enter here.  Given the first part of a sub
definition, this code adds a rule to the parser to handle its argument
context, then creates and eval's a function to handle objects of the
resulting type.  Yes, it's ugly.  No, I don't see a less ugly way to
do it.

=item B<argtype($thing)>

Given a B<P6C::variable>, return the appropriate syntax rule to
recognize an argument of that time.  Currently always returns
"scalar_expr".

=item B<optional_last($n)>

Create code to extract arguments from a (',' thing)(s?) element at
position $n and flatten it.

=cut

sub argtype($) {
    # Return the type of argument the parser should look for given
    # that the function wants a particular type.  For now, we're
    # conservative and allow any scalar expression.
    return 'scalar_expr';
#    my %things = ('PerlSub' => 'closure');
#     my $x = shift;
#     return $things{$x} || 'scalar_expr';
}

sub optional_last($) {
    # Build code for an optional last parameter at $n.
    my $n = shift;
    return '
    if (ref($x->['.$n.']) && @{$x->['.$n.']} > 0) {
	use P6C::Util;
	my $commatree = $x->['.$n.'][0][2]->tree;
	push @param, P6C::Util::flatten_leftop($commatree, ",");
    }';
}

# Build an argument context from a parameter spec.
# FIXME: This has not yet been ported to the new perl6 signature stuff.
# It is currently some mangled mixture of the old and new.
sub argument_context {
    my ($name, $params, $parser) = @_;
    if ($params->min == 0) {
	if (!defined($params->max)) {
	    # List operator.
	    $WANT{$name} = $FUNCTION_ARGS;
	    return 1;
	} elsif ($params->max == 0) {
	    # no-arg sub
	    $WANT{$name} = 'no_args';
	    return 1;
	}
    }
    my $rule = "...!'(' ";
    my $rulename = "want_for_$name";
    my $lastparam = 2;		# to skip ...!'('
    my $code = '
sub P6C::'.$rulename.'::tree {
    my $x = shift;
    my @param;';

    # add required things
    my @req;
    foreach (@{$params->positional}) {
	push @req, argtype($_->var->type);
    }
    # XXX: we require commas even around closure args for the moment.
    $rule .= join(" ',' ", @req);
    for (0 .. $params->min - 1) {
	$code .= '
    push @param, $x->['.$lastparam.']->tree;';
	$lastparam += 2;	# to skip comma
    }
    $lastparam -= 1;		# no trailing comma.
    # If there's a splat parameter, just slurp in everything.  XXX:
    # can probably be more intelligent with optional arguments.  Not
    # now, though.

    # XXX: can this be cleaner?
    if ($params->slurpy_array || $params->slurpy_named) {
	$rule .= " (',' comma)(?)";
	$code .= optional_last($lastparam);
    } elsif (@{$params->optional}) {
	# at least one optional.
	if (@req) {
	    # XXX: doesn't do argtypes.
	    $rule .= " (',' scalar_expr)(0..".@{$params->optional}.')';
	    $code .= optional_last($lastparam);
	} elsif (@{$params->optional} == 1) {
	    # No required, only one optional.
	    $rule .= argtype($params->optional(0)->var->type).'(?)';
	    $code .= '
    if (ref($x->[1]) && @{$x->[1]} > 0) {
	push @param, $x->[1][0]->tree;
    }';

	} else {
	    # No required, multiple optional.
	    $rule .= argtype($params->optional(0)->var->type);
	    $rule .= " (',' scalar_expr)(0..".(@{$params->optional} - 1).')';
	    $rule .= "
		| ...!'(' # nothing";
	    $code .= '
    die "Internal error" unless @$x == 1 || @$x == 3;
    if (@$x == 3) {
	push @param, $x->[1]->tree;
';
	    $code .= optional_last(2);
	    $code .= '
    }';
	}
    }
    $code .= '
    return new P6C::ValueList vals => [@param];
}
';
    eval $code;
    die join("\n", 'Error creating argument context:', $@, $rule, $code)
	if $@;

    # The docs say reconfiguring a parser is expensive.  However,
    # since we're adding new rules rather than modifying existing
    # ones, it's remarkably fast.

    $parser->Replace("$rulename: $rule\n");
    $WANT{$name} = $rulename;
}

=back

=cut

1;
