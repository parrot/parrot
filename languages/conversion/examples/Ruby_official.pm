package Ruby;

use 5.006;
use strict;
use warnings;

require Exporter;

#
# The current grammar is derived directly from http://outerbody.com/ruby/ruby-man-1.4/yacc.html
#
# There is a grammar below this (note that this has two parts) which is
# derived from a straightforward translation of ruby's parse.y file. This might
# be a better grammar to actually parse code from, but was much harder to work
# with.
#

our $VERSION = '0.01';
our $grammar = <<'_EOF_';
kALIAS		: 'alias'
kAND		: 'and'
kBEGIN		: 'begin' # XXX Not sure of case
kCASE		: 'case'
kCLASS		: 'class'
kDEF		: 'def'
kDEFINED	: 'defined'
kDO		: 'do'
kELSE		: 'else'
kELSIF		: 'elsif'
kEND		: 'end' # XXX Not sure of case
kENSURE		: 'ensure'
kIF		: 'if'
kIN		: 'in'
kFOR		: 'for'
kMODULE		: 'module'
kNIL		: 'nil'
kNOT		: 'not'
kOR		: 'or'
kRESCUE		: 'rescue'
kRETURN		: 'return'
kSELF		: 'self'
kSUPER		: 'super'
kTHEN		: 'then'
kUNDEF		: 'undef'					{[@item]}
kUNLESS		: 'unless'
kUNTIL		: 'until'
kWHEN		: 'when'
kWHILE		: 'while'
kYIELD		: 'yield'
_EOF_

#
# Breaking up the literals and basic REs.
# The Here-doc &c will probably need to be rewritten into RE code as well.
#

$grammar .= <<'_EOF_';
# tNUMERIC was left undefined, but this is probably what it is.

tNUMERIC	: /-?0[0-7]+/					{[@item]}
		| /-?[1-9][0-9]*/				{[@item]}
		| /-?0b[01]+/					{[@item]}
		| /-?0x[a-fA-F0-9]+/				{[@item]}
		| /-?[1-9][0-9]*\.[0-9]+([eE]-?[0-9]+)?/	{[@item]}
		| /0/						{[@item]}

tANY_CHAR	: /./ # XXX Probably will hork things...
tCHAR		: /./ # XXX Probably will hork things...
_EOF_

#
# From here on out are nonterminals.
#

$grammar .= <<'_EOF_';
program		: compstmt					{[@item]}

compstmt	: stmt (term expr)(s?) term(?)			{[@item]}

stmt		: call kDO ('|' (block_var)(?) '|')(?) compstmt kEND
		| kUNDEF fname					{[@item]}
		| kALIAS fname fname				{[@item]}
#		| stmt kIF expr					{[@item]}
#		| stmt kWHILE expr				{[@item]}
#		| stmt kUNLESS expr				{[@item]}
#		| stmt kUNTIL expr				{[@item]}
		| 'BEGIN' '{' compstmt '}'			{[@item]}
		| 'END' '{' compstmt '}'			{[@item]}
		| lhs '=' command
		  (kDO ('|' (block_var)(?) '|')(?))(?)
		  compstmt kEND					{[@item]}
		| expr						{[@item]}

expr		: mlhs '=' mrhs					{[@item]}
		| kRETURN call_args				{[@item]}
		| kYIELD call_args				{[@item]}
#		| expr kAND expr				{[@item]}
#		| expr kOR expr					{[@item]}
		| kNOT expr					{[@item]}
		| command					{[@item]}
		| '!' command					{[@item]}
		| arg						{[@item]}

call		: function					{[@item]}
                | command					{[@item]}

command		: operation call_args				{[@item]}
		| primary '.' operation call_args		{[@item]}
		| primary '::' operation call_args		{[@item]}
		| kSUPER call_args				{[@item]}

#
# XXX Only left-recursive because 'primary' is.
#
function        : operation ('(' (call_args)(?) ')')(?)		{[@item]}
		| primary '.' operation '(' (call_args)(?) ')'	{[@item]}
		| primary '::' operation '(' (call_args)(?) ')'	{[@item]}
		| primary '.' operation				{[@item]}
		| primary '::' operation			{[@item]}
		| kSUPER '(' (call_args)(?) ')'			{[@item]}
		| kSUPER					{[@item]}

Lhs		: variable		{[@item]}
		| tNUMERIC		{[@item]}

arg		: lhs '=' arg		{[@item]}
		| lhs op_asgn arg	{[@item]}
		| Lhs '..' arg		{[@item]}
		| Lhs '...' arg		{[@item]}
		| Lhs '+' arg		{[@item]}
		| Lhs '-' arg		{[@item]}
		| Lhs '*' arg		{[@item]}
		| Lhs '/' arg		{[@item]}
		| Lhs '%' arg		{[@item]}
		| Lhs '**' arg		{[@item]}
		| '+' arg		{[@item]}
		| '-' arg		{[@item]}
		| Lhs '|' arg		{[@item]}
		| Lhs '^' arg		{[@item]}
		| Lhs '&' arg		{[@item]}
		| Lhs '<=>' arg		{[@item]}
		| Lhs '>' arg		{[@item]}
		| Lhs '>=' arg		{[@item]}
		| Lhs '<' arg		{[@item]}
		| Lhs '<=' arg		{[@item]}
		| Lhs '==' arg		{[@item]}
		| Lhs '===' arg		{[@item]}
		| Lhs '!=' arg		{[@item]}
		| Lhs '=~' arg		{[@item]}
		| Lhs '!~' arg		{[@item]}
		| '!' arg		{[@item]}
		| '~' arg		{[@item]}
		| Lhs '<<' arg		{[@item]}
		| Lhs '>>' arg		{[@item]}
		| Lhs '&&' arg		{[@item]}
		| Lhs '||' arg		{[@item]}
		| kDEFINED arg		{[@item]} # XXX Removed the '(?)'
		| primary		{[@item]}

#arg		: lhs '=' arg
#		| lhs op_asgn arg
##		| arg '..' arg
##		| arg '...' arg
##		| arg '+' arg
##		| arg '-' arg
##		| arg '*' arg
##		| arg '/' arg
##		| arg '%' arg
##		| arg '**' arg
#		| '+' arg
#		| '-' arg
##		| arg '|' arg
##		| arg '^' arg
##		| arg '&' arg
##		| arg '<=>' arg
##		| arg '>' arg
##		| arg '>=' arg
##		| arg '<' arg
##		| arg '<=' arg
##		| arg '==' arg
##		| arg '===' arg
##		| arg '!=' arg
##		| arg '=~' arg
##		| arg '!~' arg
#		| '!' arg
#		| '~' arg
##		| arg '<<' arg
##		| arg '>>' arg
##		| arg '&&' arg
##		| arg '||' arg
#		| kDEFINED(?) arg
#		| primary

primary		: '(' compstmt ')'				{[@item]}
		| literal					{[@item]}
		| variable					{[@item]}
#		| primary '::' identifier			{[@item]}
		| '::' identifier				{[@item]}
#		| primary '[' (args)(?) ']'			{[@item]}
		| '[' (args (',')(?))(?) ']'			{[@item]}
		| '{' ((args|assocs) (',')(?))(?) '}'		{[@item]}
		| kRETURN ('(' (call_args)(?) ')')(?)		{[@item]}
		| kYIELD ('(' (call_args)(?) ')')(?)		{[@item]}
		| kDEFINED(?) '(' arg ')'			{[@item]}
#		| function					{[@item]}
#		| function '{' ('|' (block_var)(?) '|')(?) compstmt '}'			{[@item]}
		| kIF expr then
		  compstmt
		  (kELSIF expr then compstmt)(s?)
		  (kELSE compstmt)(?)
		  kEND						{[@item]}
		# XXX 'kELSE' is maybe a bug
		| kUNLESS expr then
		  compstmt
		  (kELSE compstmt)(?)
		  kEND						{[@item]}
		| kWHILE expr do compstmt kEND			{[@item]}
		| kUNTIL expr do compstmt kEND			{[@item]}
		| kCASE compstmt
		  (kWHEN when_args then compstmt)(s)
		  (kELSE compstmt)(?)
		  kEND						{[@item]}
		| kFOR block_var kIN expr do
		  compstmt
		  kEND						{[@item]}
		| kBEGIN
		  compstmt
		  (kRESCUE (args)(?) do compstmt)(s)
		  (kELSE compstmt)(?)
		  (kENSURE compstmt)(?)
		  kEND						{[@item]}
		| kCLASS identifier ('<' identifier)(?)
		  compstmt
		  kEND						{[@item]}
		| kMODULE identifier
		  compstmt
		  kEND						{[@item]}
		| kDEF fname argdecl
		  compstmt
		  kEND						{[@item]}
		| kDEF singleton ('.'|'::') fname argdecl
		  compstmt
		  kEND						{[@item]}

when_args	: args (',' '*' args)(?)			{[@item]}
		| '*' arg					{[@item]}

then		: term						{[@item]}
		| kTHEN						{[@item]}
		| term kTHEN					{[@item]}

do		: term						{[@item]}
		| kDO						{[@item]}
		| term kDO					{[@item]}

block_var	: lhs						{[@item]}
		| mlhs						{[@item]}

mlhs		: mlhs_item ',' (mlhs_item (',' mlhs_item)(s?))(?) ('*' (lhs)(?))(?)			{[@item]}
                | '*' lhs					{[@item]}

mlhs_item	: lhs						{[@item]}
		| '(' mlhs ')'					{[@item]}

lhs		: variable					{[@item]}
		| primary '[' (args)(?) ']'			{[@item]}
		| primary '.' identifier			{[@item]}

mrhs		: args (',' '*' arg)(?)				{[@item]}
		| '*' arg					{[@item]}

call_args	: args						{[@item]}
		| args (',' assocs)(?) (',' '*' arg)(?) (',' '&' arg)(?)			{[@item]}
		| assocs (',' '*' arg)(?) (',' '&' arg)(?)	{[@item]}
		| '*' arg (',' '&' arg)(?)			{[@item]}
		| '&' arg					{[@item]}
		| command					{[@item]}

args 		: arg (',' arg)(s?)				{[@item]}

argdecl		: '(' arglist ')'				{[@item]}
		| arglist term					{[@item]}

arglist		: identifier (',' identifier)(s?)(',''*'(identifier)(?))(?)(',''&'identifier)(?)			{[@item]}
		| '*'identifier(',''&'identifier)(?)		{[@item]}
		| ('&'identifier)(?)				{[@item]}

singleton	: variable					{[@item]}
		| '(' expr ')'					{[@item]}

assocs		: assoc (',' assoc)(s?)				{[@item]}

assoc		: arg '=>' arg					{[@item]}

variable	: varname					{[@item]}
		| kNIL						{[@item]}
		| kSELF						{[@item]}

literal		: tNUMERIC					{[@item]}
		| symbol					{[@item]}
		| string					{[@item]}
		| string2					{[@item]}
		| here_doc					{[@item]}
		| regexp					{[@item]}

term		: ';'						{[@item]}
		| '\n'						{[@item]}

op_asgn		: '+='						{[@item]}
		| '-='						{[@item]}
		| '*='						{[@item]}
		| '/='						{[@item]}
		| '%='						{[@item]}
		| '**='						{[@item]}
		| '&='						{[@item]}
		| '|='						{[@item]}
		| '^='						{[@item]}
		| '<<='						{[@item]}
		| '>>='						{[@item]}
		| '&&='						{[@item]}
		| '||='						{[@item]}

symbol		: ':'fname					{[@item]}
		| ':'varname					{[@item]}

fname		: identifier					{[@item]}
		| '..'						{[@item]}
		| '|'						{[@item]}
		| '^'						{[@item]}
		| '&'						{[@item]}
		| '<=>'						{[@item]}
		| '=='						{[@item]}
		| '==='						{[@item]}
		| '=~'						{[@item]}
                | '>'						{[@item]}
		| '>='						{[@item]}
		| '<'						{[@item]}
		| '<='						{[@item]}
		| '+'						{[@item]}
		| '-'						{[@item]}
		| '*'						{[@item]}
		| '/'						{[@item]}
		| '%'						{[@item]}
		| '**'						{[@item]}
		| '<'						{[@item]}
		| '>>'						{[@item]}
		| '~'						{[@item]}
                | '+@'						{[@item]}
		| '-@'						{[@item]}
		| '[]'						{[@item]}
		| '[]='						{[@item]}

operation       : identifier					{[@item]}
                | identifier'!'					{[@item]}
                | identifier'?'					{[@item]}

varname		: global					{[@item]}
		| '@'identifier					{[@item]}
		| identifier					{[@item]}

global		: '$'identifier					{[@item]}
		| '$'tANY_CHAR					{[@item]}
		| '$''-'tANY_CHAR				{[@item]}

string		: '"' tANY_CHAR(s?) '"'				{[@item]}
		| "'" tANY_CHAR(s?) "'"				{[@item]}
		| '`' tANY_CHAR(s?) '`'				{[@item]}

string2		: '%'('Q'|'q'|'x') tCHAR tANY_CHAR(s?) tCHAR	{[@item]}

here_doc        : '<<'(identifier|string)
                  tANY_CHAR(s?)
                  identifier					{[@item]}

regexp		: '/' tANY_CHAR(s?) '/'('i'|'o'|'p')(?)		{[@item]}
		| '%''r' tCHAR tANY_CHAR(s?) tCHAR		{[@item]}

identifier	: /[a-zA-Z_][a-zA-Z0-9_]*/			{[@item]}
_EOF_

#
# The following code is covered by Ruby's copyright.
# Please don't use it until we have permission.
#
# Having said that, this is what I started out with, and the files in t/* are
# designed to work with this grammar.
#

=begin commented_out

our $grammar = <<'_EOF_';
kDEFINED	: 'defined'	{[@item]}

#reservedWord	: 'alias'	{[@item]}
#		| 'and'		{[@item]}
#		| 'BEGIN'	{[@item]}
#		| 'begin'	{[@item]}
#		| 'break'	{[@item]}
#		| 'case'	{[@item]}
#		| 'class'	{[@item]}
##		| 'defined'	{[@item]}
#		| 'def'		{[@item]}
#		| 'do'		{[@item]}
#		| 'END'		{[@item]}
#		| 'end'		{[@item]}
#		| 'else'	{[@item]}
#		| 'elsif'	{[@item]}
#		| 'ensure'	{[@item]}
#		| 'false'	{[@item]}
#		| 'for'		{[@item]}
#		| 'if'		{[@item]}
#		| 'in'		{[@item]}
#		| 'module'	{[@item]}
#		| 'next'	{[@item]}
#		| 'nil'		{[@item]}
#		| 'not'		{[@item]}
#		| 'or'		{[@item]}
#		| 'redo'	{[@item]}
#		| 'rescue'	{[@item]}
#		| 'retry'	{[@item]}
#		| 'return'	{[@item]}
#		| 'self'	{[@item]}
#		| 'super'	{[@item]}
#		| 'then'	{[@item]}
#		| 'true'	{[@item]}
#		| 'undef'	{[@item]}
#		| 'unless'	{[@item]}
#		| 'until'	{[@item]}
#		| 'when'	{[@item]}
#		| 'while'	{[@item]}
#		| 'yield'	{[@item]}
#		| '__FILE__'	{[@item]}
#		| '__LINE__'	{[@item]}

tINTEGER	: /-?0[0-7]+/					{[@item]}
		| /-?[1-9][0-9]*/				{[@item]}
		| /-?0b[01]+/					{[@item]}
		| /-?0x[a-fA-F0-9]+/				{[@item]}
		| /0/						{[@item]}

tFLOAT		: /-?[1-9][0-9]*\.[0-9]+([eE]-?[0-9]+)?/	{[@item]}

tCONSTANT	: /[A-Z][a-zA-Z0-9_]*/				{[@item]}

tIDENTIFIER	: /[a-zA-Z_][a-zA-Z0-9_]*/			{[@item]}
tGLOBALVAR	: /\$[a-zA-Z_][a-zA-Z0-9_]*/			{[@item]}
tINSTANCEVAR	: /\@[a-zA-Z_][a-zA-Z0-9_]*/			{[@item]}

_EOF_

$grammar .= <<'_EOF_';

var		: tGLOBALVAR	{[@item]}
		| tINSTANCEVAR	{[@item]}
		| tIDENTIFIER	{[@item]}

value		: tFLOAT	{[@item]}
		| tINTEGER	{[@item]}

op_asgn		: '+='		{[@item]}
		| '-='		{[@item]}
		| '**='		{[@item]}
		| '*='		{[@item]}
		| '/='		{[@item]}
		| '%='		{[@item]}
		| '&&='		{[@item]}
		| '&='		{[@item]}
		| '||='		{[@item]}
		| '|='		{[@item]}
		| '^='		{[@item]}
		| '<<='		{[@item]}
		| '>>='		{[@item]}

expr_value	: var				{[@item]}
		| value				{[@item]}

lhs		: var				{[@item]}
		| primary '.' tIDENTIFIER	{[@item]}

#
# Note: 'primary' moved to the front because kDEFINED was being misinterpreted
# as an 'expr_value'
#
arg		: primary					{[@item]}
		| kDEFINED arg					{[@item]} # XXX Slightly different than grammar
		| expr_value '+' arg				{[@item]}
		| expr_value '-' arg				{[@item]}
		| expr_value '**' arg				{[@item]}
		| expr_value '*' arg				{[@item]}
		| expr_value '/' arg				{[@item]}
		| expr_value '%' arg				{[@item]}
		| expr_value '&&' arg				{[@item]}
		| expr_value '&' arg				{[@item]}
		| expr_value '||' arg				{[@item]}
		| expr_value '|' arg				{[@item]}
		| expr_value '^' arg				{[@item]}
		| expr_value '>>' arg				{[@item]}
		| expr_value '<<' arg				{[@item]}
		| lhs op_asgn arg				{[@item]}
		| lhs '=' arg					{[@item]}
		| expr_value '...' arg				{[@item]}
		| expr_value '..' arg				{[@item]}
		| expr_value '===' arg				{[@item]}
		| expr_value '==' arg				{[@item]}
		| expr_value '!=' arg				{[@item]}
		| expr_value '!~' arg				{[@item]}
		| expr_value '=~' arg				{[@item]}
		| expr_value '>' arg				{[@item]}
		| expr_value '<' arg				{[@item]}
		| expr_value '>=' arg				{[@item]}
		| expr_value '<=' arg				{[@item]}
		| expr_value '<=>' arg				{[@item]}
		| expr_value '?' arg ':' arg			{[@item]}
		| expr_value '&&' arg				{[@item]}
		| expr_value '||' arg				{[@item]}
		| '+' arg					{[@item]}
		| '-' arg					{[@item]}
		| '!' arg					{[@item]}
		| '~' arg					{[@item]}
		| expr_value					{[@item]}

primary		: '(' arg ')'					{[@item]}
		| '::' tIDENTIFIER				{[@item]}
		| kDEFINED(?) '(' arg ')'			{[@item]}

_EOF_
=cut


=pod

$grammar = <<'_EOF_';

program	: expr			{[@item]}

lhs	: /[a-zA-Z]+/		{[@item]}

var	: /[a-zA-Z]+/		{[@item]}
	| /[1-9][0-9]*/		{[@item]}

expr	: var '+' expr		{[@item]}
	| var '-' expr		{[@item]}
	| var '-' expr		{[@item]}
	| lhs '=' expr		{[@item]}
	| var			{[@item]}

_EOF_
=cut

1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

Ruby - Perl Parse::RecDescent grammar

=head1 SYNOPSIS

  use Ruby;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Ruby, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.

=head1 AUTHOR

A. U. Thor, E<lt>a.u.thor@a.galaxy.far.far.awayE<gt>

=head1 SEE ALSO

L<perl>.

=cut
