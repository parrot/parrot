package Ruby;

use 5.006;
use strict;
use warnings;

require Exporter;

#
# The following code is covered by Ruby's copyright.
# Please don't use it until we have permission.
#
# Having said that, this is what I started out with, and the files in t/* are
# designed to work with this grammar.
#

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
