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

%WANT = ();
%CLASSES = ();
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

=item B<add_class($class)>

Add a class.

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

##############################
# Functions (list operators):

INIT {
$FUNCTION_ARGS = 'maybe_comma';

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
@WANT{@builtin_funcs} = ($FUNCTION_ARGS) x @builtin_funcs;

##############################
# Loop control
my @loop_control = qw(redo last next continue break skip);
@WANT{@loop_control} = ('maybe_label') x @loop_control;
$WANT{goto} = 'label';

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
@WANT{@unary_ops} = ('prefix') x @unary_ops;

##############################
# Control operators

# XXX: as with the builtin functions above, most of these will not
# compile, but are useful for testing the parser.

my @control = qw(for foreach if given while when default sort grep map);
@WANT{@control} = map { "want_for_$_" } @control;
$WANT{unless} = 'want_for_if';
$WANT{until} = 'want_for_while';

##############################
# Named blocks

# XXX: Most will not compile.
my @special_blocks = qw(CATCH BEGIN END INIT AUTOLOAD
			PRE POST NEXT LAST FIRST
			try do);
@WANT{@special_blocks} = ('closure') x @special_blocks;

##############################
# Classes (builtin and otherwise)

# XXX: Will not compile.
my @builtin_types = qw(int num str HASH ARRAY SCALAR Inf NaN
		       true false); # XXX: these are really constants
@CLASSES{@builtin_types} = @builtin_types;

BEGIN {
# Handle comments:
    $Parse::RecDescent::skip = '(\s*(#[^\n]*?(\n|\Z))?)+';
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
		$LOG_OR $LOGOR $FILETEST $ASSIGN $HYPE $MATCH $BITSHIFT
		$SOB $FLUSH $NUMPART);

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
    $HYPE	= qr/\^?/;
    $NAMEPART	= qr/[a-zA-Z_][\w_]*/;
    $COMPARE	= qr{cmp|eq|[gnl]e|[gl]t|<=>|[<>=!]=|<|>};
    $CONTEXT	= qr{[\%\@\$\&*_?]|\+(?!\+)};
    $MULDIV	= qr{[\%*x]|/(?!/)};
    $MATCH	= qr{[=!]~};
    $INCR	= qr{\+\+|--};
    $PREFIX	= qr{[!~\\]|-(?![->])};
    $ADDSUB	= qr{[-+_]};
    $BITSHIFT	= qr{<<|>>};
    $LOG_OR	= qr{x?or|err};
    $LOGOR	= qr{\|\||~~|//};
    $FILETEST	= qr{-[rwxoRWXOezsfdlpSbctugkTBMAC]+};
    $ASSIGN	= qr{(?:!|:|//|&&?|\|\|?|~~?|<<|>>|$ADDSUB|$MULDIV|\*\*)?=};
    # Used for flushing syntax errors
    $FLUSH	= qr/\w+|[^\s\w;}#'"]+/;
    $NUMPART	= qr/(?!_)[\d_]+(?<!_)/;
}

# HACK to distinguish between "my ($a, $b) ..." and "foo ($a, $b)".
# Don't need all keywords in here, but only the ones that cause
# problems.
BEGIN {
    my @kw = qw(my our temp if unless until while for and or xor err);
    @KEYWORDS{@kw} = (1) x @kw;
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

sub getl($) {
    my $linenum = shift;
    ref($linenum)? Parse::RecDescent::linenum($linenum) : $linenum;
}

sub gett($) {
    my $t = shift;
    $t =~ s/\A($Parse::RecDescent::skip)//o;
    my $matched = $1;
    $::line += $matched =~ s/\n//g;
    #$::col -= length($matched);
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

sv_literal:	  /(?:$NUMPART(?:\.$NUMPART)?|\.$NUMPART)(?:[Ee]-?$NUMPART)?/o
		| '{' <commit> hv_seq '}'
		| '[' <commit> av_seq(?) ']'
		| <perl_quotelike>

av_seq:		  semi /[;,]?/

hv_seq:		  <leftop: pair ',' pair> /,?/

##############################
# Variables:
variable:	  sigil <skip:''> varname

sigil:		  /[\@\%\$\&]/

varname:	  name
		| /\d+/
		| /[\!_]/
		| '^' <commit> namepart
		| ('*')(?) '{' <skip:'\s*'> (scalar_expr | name) '}'

name:		  /(?:::|\.|\*)?$NAMEPART(::$NAMEPART)*/o

namepart:	  /$NAMEPART/o

maybe_namepart:	  namepart |

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
		| sv_literal
		| class
		| closure

apply_rhs:	  namepart <commit> subscript(s?)
		| subscript(s)

apply:		  <leftop: term apply_op apply_rhs>
apply_op:	  /$HYPE\./o

incr:		  incr_op <commit> apply
		| apply incr_op(?)
incr_op:	  /$HYPE$INCR/o

pow:		  <leftop: incr pow_op prefix>
pow_op:		  /$HYPE\*\*/o

prefix:		  filetest_op <commit> prefix
		| prefix_op <commit> prefix
		| name { $WANT{$item[1][1]} } <matchrule:$item[2]>
		| pow

# prefix_op:	  '!' | '~' | '\\' | /-(?![->])/
prefix_op:	  /$HYPE$PREFIX/o
filetest_op:	  /$FILETEST/o

pair:		  namepart '=>' <commit> prefix
		| prefix '=>' prefix
maybe_pair:	  namepart '=>' <commit> prefix
		| prefix ('=>' prefix)(?)

match:		  <leftop: maybe_pair match_op maybe_pair>
match_op:	  /$HYPE$MATCH/o

muldiv:		  <leftop: match muldiv_op match>
# muldiv_op:	  '*' | '/' | '%' | 'x'
muldiv_op:	  /$HYPE$MULDIV/o

addsub:		  <leftop: muldiv addsub_op muldiv>
# addsub_op:	  '+' | '-' | '_'
addsub_op:	  /$HYPE$ADDSUB/o

bitshift:	  <leftop: addsub bitshift_op addsub>
bitshift_op:	  /$HYPE$BITSHIFT/o

compare:	  <leftop: bitshift compare_op bitshift>
compare_op:	  /$HYPE$COMPARE/o
# compare_op:	  '<=>' | '<=' | '==' | '>=' | '<' | '>' | '!='
# 		| 'eq' | 'ge' | 'ne' | 'le' | 'lt' | 'gt' | 'cmp'

bitand:		  <leftop: compare bitand_op compare>
bitand_op:	  /$HYPE&(?!&)/o

bitor:		  <leftop: bitand bitor_op bitand>
bitor_op:	  /$HYPE([|~])(?!\1)/o

logand:		  <leftop: bitor logand_op bitor>
logand_op:	  /$HYPE&&/o

logor:		  <leftop: logand logor_op logand>
# logor_op:	  '||' | '~~' | '//'
logor_op:	  /$HYPE$LOGOR/o

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

assign_op:	  /$HYPE$ASSIGN/o
# assign_op:	  /[!:]?=/ <commit>
# 		| assignable_op <skip:''> '='
# assignable_op:	  '//'
# 		| logand_op | logor_op
# 		| bitand_op | bitor_op | bitshift_op
# 		| addsub_op | muldiv_op | pow_op

scalar_expr:	  assign but(s?)
but:		  'but' assign

comma:		  <leftop: <matchrule:@{[@arg ? $arg[0] : 'scalar_expr']}>
			comma_op <matchrule:@{[@arg?$arg[0]:'scalar_expr']}> >
comma_op:	  ','
maybe_comma:	  ...!'(' comma[@{[@arg ? $arg[0] : ()]}]
		| ...!'('

semi:		  <leftop: expr semi_op expr>
semi_op:	  ';'

adverb:		  comma adv_clause(?)
adv_clause:	  /:(?!:)/ comma['scalar_expr']

log_AND:	  <leftop: adverb log_AND_op adverb>
log_AND_op:	  /${HYPE}and/o

log_OR:		  <leftop: log_AND log_OR_op log_AND>
# log_OR_op:	  'or' | 'xor' | 'err'
log_OR_op:	  /$HYPE$LOG_OR/o

expr:		  log_OR

##############################
# Parameters
params:		   <rulevar: local $no_comma>
params:           '(' <commit> { $no_comma = 1 }
			maybe_params opt_params rest_param ')'
                | # nothing

maybe_params:     _params { $no_comma = undef;
			    bless([@item[0,1]], 'P6C::maybe_params') }
                | # nothing

opt_params:       ';' <commit> { $no_comma = 1 } maybe_params
                | # nothing

rest_param:       { $no_comma } '*' <commit> '@' namepart
                | ',' <commit> '*' '@' namepart
                | # nothing

_params:	  <leftop: param ',' param>
param:		  scope_class(?) variable props['is'] initializer(?)
initializer:	  assign_op scalar_expr

##############################
# Statements

prog:		  {%since=(); $seen_err=undef; $::file = $arg[0] || ''} <reject>
		| /\A/ stmts[0] /\z/ <commit> {$seen_err ? undef : 1} ''
		| {got_err("Invalid statement", $text, $thisline); undef;}

# this rule get's substiuted by »-g« switch in perl6
# so that __stmt is used.
stmts:		  _stmt[$arg[0]](s?)

# collect file,line info
__stmt:		{ $::line = getl($thisline);
  		  $::col = $thiscolumn;
                  $::txt = gett($text) } <reject>

__stmt:		  _stmt[$arg[0]] {
		    bless( [$::file,$::line, $::col,$item[1], $::txt],
		    	'P6C::debug_info') }

# $arg[0] is set to true/false. True == "in block"
_stmt:		# Handle valid reason for 'stmt' failing (hit end of block)
		  { $arg[0] ? 1 : undef } ..."}" <commit> { undef }

		# Handle case where having missing input
		# or have hit end of file.
		| /\z/
		  <commit>
		  { got_err("Missing }", $text, $thisline) if ($arg[0]) }
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
		| 'method' <commit> name params props['is'] block
		| 'loop' <commit>
			'(' scalar_expr(?)
			';' scalar_expr(?)
			';' scalar_expr(?) ')'
			block
		| scope(?) 'sub' <commit> name params
			{ add_function(@item[4,5], $thisparser);1 }
			props['is'] (';' | block)
		| scope(?) 'class' <commit> name { add_class($item[4]);1 }
			props['is'] block
		| expr guard(?)
		| ...';'

directive:	  /package|module|use/
guard:		  { check_end('block', $text) ? undef : 1 } _guard
_guard:		  /if|unless|while|until/ <commit> scalar_expr
		| 'for' expr

maybe_label:	  label(?)
label:		  namepart { exists($KEYWORDS{$item[1][1]}) ? undef
				: bless(['label', $item[1]], 'P6C::label') }

block:		  start_block '...' <commit> '}'
			{ mark_end('block', $text);1; } ''
		| start_block stmts[1] '}'
			{ mark_end('block', $text);1; } ''

start_block:	  <skip:''> /$SOB/o

closure:	  '->' '(' <commit> _closure_args(?) ')' block
		| '->' <commit> _closure_args(?) block
		| block

_closure_args:	  <leftop: comma['variable'] semi_op comma['variable']>

want_for_for:	  av_seq closure
want_for_foreach: maybe_decl '(' expr ')' block
want_for_given:	  scalar_expr closure
want_for_while:	  scalar_expr closure
want_for_when:	  comma closure
want_for_default: closure

want_for_if:	  scalar_expr closure elsif(s?) else(?)
elsif:		  /els(?:if|unless)/ scalar_expr closure
else:		  'else' closure

want_for_grep:	  scalar_expr comma
want_for_map:	  scalar_expr comma
want_for_sort:	  scalar_expr comma

maybe_decl:	  scope_class <commit> variable props['is']
		| variable <commit> props['is']
		| # nada
nothing:	  ''

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
	push @param, flatten_leftop($commatree, ",");
    }';
}

# Build an argument context from a parameter spec.
sub argument_context {
    my ($name, $params, $parser) = @_;
    if ($params->min == 0) {
	if (!defined($params->max)) {
	    # List operator.
	    $WANT{$name} = $FUNCTION_ARGS;
	    return 1;
	} elsif ($params->max == 0) {
	    # no-arg sub
	    $WANT{$name} = 'nothing';
	    return 1;
	}
    }
    my $rule;
    my $rulename = "want_for_$name";
    my $lastparam = 1;
    my $code = '
sub P6C::'.$rulename.'::tree {
    my $x = shift;
    my @param;';

    # add required things
    my @req;
    foreach (@{$params->req}) {
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
    if ($params->rest) {
	$rule .= " (',' comma)(?)";
	$code .= optional_last($lastparam);
    } elsif (@{$params->opt}) {
	# at least one optional.
	if (@{$params->req}) {
	    # XXX: doesn't do argtypes.
	    $rule .= " (',' scalar_expr)(0..".@{$params->opt}.')';
	    $code .= optional_last($lastparam);
	} elsif (@{$params->opt} == 1) {
	    # No required, only one optional.
	    $rule .= argtype($params->opt(0)->var->type).'(?)';
	    $code .= '
    if (ref($x->[1]) && @{$x->[1]} > 0) {
	push @param, $x->[1][0]->tree;
    }';

	} else {
	    # No required, multiple optional.
	    $rule .= argtype($params->opt(0)->var->type);
	    $rule .= " (',' scalar_expr)(0..".(@{$params->opt} - 1).')';
	    $rule .= '
		| # nothing';
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

1;
