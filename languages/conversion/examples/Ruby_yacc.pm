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

our $grammar;

$grammar = <<'_EOF_';
kALIAS		: 'alias'	{[@item]}
kAND		: 'and'		{[@item]}
kBEGIN		: 'begin'	{[@item]}
kBREAK		: 'break'	{[@item]}
kCASE		: 'case'	{[@item]}
kCLASS		: 'class'	{[@item]}
kDEF		: 'def'		{[@item]}
kDEFINED	: 'defined'	{[@item]}
kDO		: 'do'		{[@item]}
kDO_BLOCK	: 'do'		{[@item]} # XXX Will need to be modified
kDO_COND	: 'do'		{[@item]} # XXX Will need to be modified
kELSE		: 'else'	{[@item]}
kELSIF		: 'elsif'	{[@item]}
kEND		: 'END'		{[@item]}
kENSURE		: 'ensure'	{[@item]}
kFALSE		: 'false'	{[@item]}
kIF		: 'if'		{[@item]}
kIF_MOD		: 'if'		{[@item]} # XXX Will need to be modified
kIN		: 'in'		{[@item]}
kFOR		: 'for'		{[@item]}
klBEGIN		: 'begin'	{[@item]}
klEND		: 'end'		{[@item]}
kMODULE		: 'module'	{[@item]}
kNEXT		: 'next'	{[@item]}
kNIL		: 'nil'		{[@item]}
kNOT		: 'not'		{[@item]}
kOR		: 'or'		{[@item]}
kREDO		: 'redo'	{[@item]}
kRESCUE		: 'rescue'	{[@item]}
kRESCUE_MOD	: 'rescue'	{[@item]} # XXX Will need to be modified
kRETRY		: 'retry'	{[@item]}
kRETURN		: 'return'	{[@item]}
kSELF		: 'self'	{[@item]}
kSUPER		: 'super'	{[@item]}
kTHEN		: 'then'	{[@item]}
kTRUE		: 'true'	{[@item]}
kUNDEF		: 'undef'	{[@item]}
kUNLESS		: 'unless'	{[@item]}
kUNLESS_MOD	: 'unless'	{[@item]} # XXX Will need to be modified
kUNTIL		: 'until'	{[@item]}
kUNTIL_MOD	: 'until'	{[@item]} # XXX Will need to be modified
kWHEN		: 'when'	{[@item]}
kWHILE		: 'while'	{[@item]}
kWHILE_MOD	: 'while'	{[@item]} # XXX Will need to be modified
kYIELD		: 'yield'	{[@item]}
k__FILE__	: '__FILE__'	{[@item]}
k__LINE__	: '__LINE__'	{[@item]}
_EOF_

$grammar .= <<'_EOF_';
tSTAR		: '*'	# XXX Replace this with the real thing
tSTRING		: 'DO NOT MATCH THIS' # XXX Replace with the real thing
tSYMBEG		: 'DO NOT MATCH THIS' # XXX Replace this with the real thing

tAMPER		: '&'						{[@item]}
tASSOC		: 'DO NOT MATCH THIS' # XXX Replace with the real thing
tANDOP		: '&&'						{[@item]}
tAREF		: '[]'						{[@item]}
tASET		: '[]='						{[@item]}
tBACK_REF	: 'DO NOT MATCH THIS' # XXX Replace with the real thing
tCMP		: '<=>'						{[@item]}
tCOLON		: ':'						{[@item]}
tCOLON2		: '::'						{[@item]}
tCOLON3		: ':::'						{[@item]}
tDREGEXP	: 'DO NOT MATCH THIS' # XXX Replace with the real thing
tDSTRING	: 'DO NOT MATCH THIS' # XXX Replace with the real thing
tDXSTRING	: 'DO NOT MATCH THIS' # XXX Replace with the real thing
tEQ		: '=='						{[@item]}
tEQQ		: '==='						{[@item]}
tFID		: 'DO NOT MATCH THIS' # XXX Replace with the real thing
tDOT3		: '...'						{[@item]}
tDOT2		: '..'						{[@item]}
tOROP		: '||'						{[@item]}
tGEQ		: '>='						{[@item]}
tLEQ		: '<='						{[@item]}
tLBRACE		: '{'						{[@item]}
tLBRACK		: '['						{[@item]}
tLPAREN		: '('						{[@item]}
tLSHFT		: '>>'						{[@item]}
tMATCH		: '=~'						{[@item]}
tNEQ		: '!='						{[@item]}
tNMATCH		: '!~'						{[@item]}
tNTH_REF	: 'DO NOT MATCH THIS' # XXX Replace with the real thing
tOROP		: '||'						{[@item]}
tPOW		: '**'						{[@item]}
tREGEXP		: 'DO NOT MATCH THIS' # XXX Replace with the real thing
tRSHFT		: '<<'						{[@item]}
tUMINUS		: '-'						{[@item]}
tUPLUS		: '+'						{[@item]}
tQWORDS		: 'DO NOT MATCH THIS' # XXX Replace with the real thing
tXSTRING	: 'DO NOT MATCH THIS' # XXX Replace with the real thing

tINTEGER	: /-?0[0-7]+/					{[@item]}
		| /-?[1-9][0-9]*/				{[@item]}
		| /-?0b[01]+/					{[@item]}
		| /-?0x[a-fA-F0-9]+/				{[@item]}
		| /0/						{[@item]}

tFLOAT		: /-?[1-9][0-9]*\.[0-9]+([eE]-?[0-9]+)?/	{[@item]}

tCONSTANT	: /[A-Z][a-zA-Z0-9_]*/				{[@item]}

tIDENTIFIER	: /[a-zA-Z_][a-zA-Z0-9_]*/			{[@item]}
tGVAR		: /\$[a-zA-Z_][a-zA-Z0-9_]*/			{[@item]}
tIVAR		: /\@[a-zA-Z_][a-zA-Z0-9_]*/			{[@item]}
tCVAR		: 'DO NOT MATCH THIS'	# XXX Replace with the real thing

tOP_ASGN	: '+='						{[@item]}
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

_EOF_

$grammar .= <<'_EOF_';
error		: 'DO NOT MATCH THIS' # XXX Needs to be modified

program		:  compstmt				{[@item]}

compstmt	: stmts opt_terms			{[@item]}

stmts		: none					{[@item]}
		| stmt					{[@item]}
		| stmts terms stmt			{[@item]}
		| error stmt				{[@item]}

stmt		: kALIAS fitem fitem			{[@item]}
		| kALIAS tGVAR tGVAR			{[@item]}
		| kALIAS tGVAR tBACK_REF		{[@item]}
		| kALIAS tGVAR tNTH_REF			{[@item]}
		| kUNDEF undef_list			{[@item]}
		| stmt kIF_MOD expr			{[@item]}
		| stmt kUNLESS_MOD expr			{[@item]}
		| stmt kWHILE_MOD expr			{[@item]}
		| stmt kUNTIL_MOD expr			{[@item]}
		| stmt kRESCUE_MOD stmt			{[@item]}
		| klBEGIN '{' compstmt '}'		{[@item]}
		| klEND '{' compstmt '}'		{[@item]}
		| lhs '=' command_call			{[@item]}
		| mlhs '=' command_call			{[@item]}
		| lhs '=' mrhs_basic			{[@item]}
		| expr					{[@item]}

expr		: mlhs '=' mrhs				{[@item]}
		| kRETURN ret_args			{[@item]}
		| command_call				{[@item]}
		| expr kAND expr			{[@item]}
		| expr kOR expr				{[@item]}
		| kNOT expr				{[@item]}
		| '!' command_call			{[@item]}
		| arg					{[@item]}

command_call	: command				{[@item]}
		| block_command				{[@item]}

block_command	: block_call					{[@item]}
		| block_call '.' operation2 command_args	{[@item]}
		| block_call tCOLON2 operation2 command_args	{[@item]}

command		: operation command_args			{[@item]}
		| primary '.' operation2 command_args		{[@item]}
		| primary tCOLON2 operation2 command_args	{[@item]}
		| kSUPER command_args			{[@item]}
		| kYIELD ret_args			{[@item]}

mlhs		: mlhs_basic				{[@item]}
		| tLPAREN mlhs_entry ')'		{[@item]}

mlhs_entry	: mlhs_basic				{[@item]}
		| tLPAREN mlhs_entry ')'		{[@item]}

mlhs_basic	: mlhs_head				{[@item]}
		| mlhs_head mlhs_item			{[@item]}
		| mlhs_head tSTAR mlhs_node		{[@item]}
		| mlhs_head tSTAR			{[@item]}
		| tSTAR mlhs_node			{[@item]}
		| tSTAR					{[@item]}

mlhs_item	: mlhs_node				{[@item]}
		| tLPAREN mlhs_entry ')'		{[@item]}

#mlhs_head	: mlhs_item ','				{[@item]}
#		| mlhs_head mlhs_item ','		{[@item]}
mlhs_head	: mlhs_item(s /,/)			{[@item]}

mlhs_node	: variable				{[@item]}
		| primary '[' aref_args ']'		{[@item]}
		| primary '.' tIDENTIFIER		{[@item]}
		| primary tCOLON2 tIDENTIFIER		{[@item]}
		| primary '.' tCONSTANT			{[@item]}
		| backref				{[@item]}

lhs		: variable				{[@item]}
		| primary '[' aref_args ']'		{[@item]}
		| primary '.' tIDENTIFIER		{[@item]}
		| primary tCOLON2 tIDENTIFIER		{[@item]}
		| primary '.' tCONSTANT			{[@item]}
		| backref				{[@item]}

cname		: tIDENTIFIER				{[@item]}
		| tCONSTANT				{[@item]}

fname		: tIDENTIFIER				{[@item]}
		| tCONSTANT				{[@item]}
		| tFID					{[@item]}
		| op					{[@item]}
		| reswords				{[@item]}

fitem		: fname					{[@item]}
		| symbol				{[@item]}

#undef_list	: fitem					{[@item]}
#		| undef_list ',' fitem			{[@item]}
undef_list	: fitem(s /,/)				{[@item]}

op		: '|'					{[@item]}
		| '^'					{[@item]}
		| '&'					{[@item]}
		| tCMP					{[@item]}
		| tEQ					{[@item]}
		| tEQQ					{[@item]}
		| tMATCH				{[@item]}
		| '>'					{[@item]}
		| tGEQ					{[@item]}
		| '<'					{[@item]}
		| tLEQ					{[@item]}
		| tLSHFT				{[@item]}
		| tRSHFT				{[@item]}
		| '+'					{[@item]}
		| '-'					{[@item]}
		| '*'					{[@item]}
		| tSTAR					{[@item]}
		| '/'					{[@item]}
		| '%'					{[@item]}
		| tPOW					{[@item]}
		| '~'					{[@item]}
		| tUPLUS				{[@item]}
		| tUMINUS				{[@item]}
		| tAREF					{[@item]}
		| tASET					{[@item]}
		| '`'					{[@item]}

reswords	: k__LINE__				{[@item]}
		| k__FILE__				{[@item]}
		| klBEGIN				{[@item]}
		| klEND					{[@item]}
		| kALIAS				{[@item]}
		| kAND					{[@item]}
		| kBEGIN				{[@item]}
		| kBREAK				{[@item]}
		| kCASE					{[@item]}
		| kCLASS				{[@item]}
		| kDEF					{[@item]}
		| kDEFINED				{[@item]}
		| kDO					{[@item]}
		| kELSE					{[@item]}
		| kELSIF				{[@item]}
		| kEND					{[@item]}
		| kENSURE				{[@item]}
		| kFALSE				{[@item]}
		| kFOR					{[@item]}
		| kIF_MOD				{[@item]}
		| kIN					{[@item]}
		| kMODULE				{[@item]}
		| kNEXT					{[@item]}
		| kNIL					{[@item]}
		| kNOT					{[@item]}
		| kOR					{[@item]}
		| kREDO					{[@item]}
		| kRESCUE				{[@item]}
		| kRETRY				{[@item]}
		| kRETURN				{[@item]}
		| kSELF					{[@item]}
		| kSUPER				{[@item]}
		| kTHEN					{[@item]}
		| kTRUE					{[@item]}
		| kUNDEF				{[@item]}
		| kUNLESS_MOD				{[@item]}
		| kUNTIL_MOD				{[@item]}
		| kWHEN					{[@item]}
		| kWHILE_MOD				{[@item]}
		| kYIELD				{[@item]}
		| kRESCUE_MOD				{[@item]}

arg		: lhs '=' arg					{[@item]}
		| variable tOP_ASGN arg				{[@item]}
		| primary '[' aref_args ']' tOP_ASGN arg	{[@item]}
		| primary '.' tIDENTIFIER tOP_ASGN arg		{[@item]}
		| primary '.' tCONSTANT tOP_ASGN arg		{[@item]}
		| primary tCOLON2 tIDENTIFIER tOP_ASGN arg	{[@item]}
		| backref tOP_ASGN arg				{[@item]}
		| arg tDOT2 arg					{[@item]}
		| arg tDOT3 arg					{[@item]}
		| arg '+' arg					{[@item]}
		| arg '-' arg					{[@item]}
		| arg '*' arg					{[@item]}
		| arg '/' arg					{[@item]}
		| arg '%' arg					{[@item]}
		| arg tPOW arg					{[@item]}
		| tUPLUS arg					{[@item]}
		| tUMINUS arg					{[@item]}
		| arg '|' arg					{[@item]}
		| arg '^' arg					{[@item]}
		| arg '&' arg					{[@item]}
		| arg tCMP arg					{[@item]}
		| arg '>' arg					{[@item]}
		| arg tGEQ arg				{[@item]}
		| arg '<' arg				{[@item]}
		| arg tLEQ arg				{[@item]}
		| arg tEQ arg				{[@item]}
		| arg tEQQ arg				{[@item]}
		| arg tNEQ arg				{[@item]}
		| arg tMATCH arg			{[@item]}
		| arg tNMATCH arg			{[@item]}
		| '!' arg				{[@item]}
		| '~' arg				{[@item]}
		| arg tLSHFT arg			{[@item]}
		| arg tRSHFT arg			{[@item]}
		| arg tANDOP arg			{[@item]}
		| arg tOROP arg				{[@item]}
		| kDEFINED opt_nl {in_defined = 1;} arg	{[@item]}
		| arg '?' arg ':' arg			{[@item]}
		| primary				{[@item]}

aref_args	: none					{[@item]}
		| command_call opt_nl			{[@item]}
		| args ',' command_call opt_nl		{[@item]}
		| args trailer				{[@item]}
		| args ',' tSTAR arg opt_nl		{[@item]}
		| assocs trailer			{[@item]}
		| tSTAR arg opt_nl			{[@item]}

paren_args	: '(' none ')'				{[@item]}
		| '(' call_args opt_nl ')'		{[@item]}
		| '(' block_call opt_nl ')'		{[@item]}
		| '(' args ',' block_call opt_nl ')'	{[@item]}

opt_paren_args	: none					{[@item]}
		| paren_args				{[@item]}

call_args	: command					{[@item]}
		| args ',' command				{[@item]}
		| args opt_block_arg				{[@item]}
		| args ',' tSTAR arg opt_block_arg		{[@item]}
		| assocs opt_block_arg				{[@item]}
		| assocs ',' tSTAR arg opt_block_arg		{[@item]}
		| args ',' assocs opt_block_arg			{[@item]}
		| args ',' assocs ',' tSTAR arg opt_block_arg	{[@item]}
		| tSTAR arg opt_block_arg			{[@item]}
		| block_arg					{[@item]}

command_args	: call_args				{[@item]}

block_arg	: tAMPER arg				{[@item]}

opt_block_arg	: ',' block_arg				{[@item]}
		| none					{[@item]}

args 		: arg					{[@item]}
		| args ',' arg				{[@item]}

mrhs		: arg					{[@item]}
		| mrhs_basic				{[@item]}

mrhs_basic	: args ',' arg				{[@item]}
		| args ',' tSTAR arg			{[@item]}
		| tSTAR arg				{[@item]}

ret_args	: call_args				{[@item]}

primary		: literal				{[@item]}
		| string				{[@item]}
		| tXSTRING				{[@item]}
		| tQWORDS				{[@item]}
		| tDXSTRING				{[@item]}
		| tDREGEXP				{[@item]}
		| var_ref				{[@item]}
		| backref				{[@item]}
		| tFID					{[@item]}
		| kBEGIN compstmt rescue opt_else ensure kEND	{[@item]}
		| tLPAREN compstmt ')'			{[@item]}
		| primary tCOLON2 tCONSTANT		{[@item]}
		| tCOLON3 cname				{[@item]}
		| primary '[' aref_args ']'		{[@item]}
		| tLBRACK aref_args ']'			{[@item]}
		| tLBRACE assoc_list '}'		{[@item]}
		| kRETURN '(' ret_args ')'		{[@item]}
		| kRETURN '(' ')'			{[@item]}
		| kRETURN				{[@item]}
		| kYIELD '(' ret_args ')'		{[@item]}
		| kYIELD '(' ')'			{[@item]}
		| kYIELD				{[@item]}
		| kDEFINED opt_nl '(' expr ')'		{[@item]}
		| operation brace_block			{[@item]}
		| method_call				{[@item]}
		| method_call brace_block					{[@item]}
		| kIF expr then
		  compstmt
		  if_tail
		  kEND					{[@item]}
		| kUNLESS expr then
		  compstmt
		  opt_else
		  kEND					{[@item]}
		| kWHILE expr do compstmt kEND		{[@item]}
		| kUNTIL expr do compstmt kEND		{[@item]}
		| kCASE expr opt_terms case_body kEND	{[@item]}
		| kCASE opt_terms case_body kEND	{[@item]}
		| kFOR block_var kIN expr do compstmt kEND	{[@item]}
		| kCLASS cname superclass compstmt kEND		{[@item]}
		| kCLASS tLSHFT expr term compstmt kEND		{[@item]}
		| kMODULE cname compstmt kEND			{[@item]}
		| kDEF fname
		  f_arglist
		  compstmt
		  rescue
		  opt_else
		  ensure
		  kEND					{[@item]}
		| kDEF singleton dot_or_colon fname
		  f_arglist
		  compstmt
		  rescue
		  opt_else
		  ensure
		  kEND					{[@item]}
		| kBREAK				{[@item]}
		| kNEXT					{[@item]}
		| kREDO					{[@item]}
		| kRETRY				{[@item]}

then		: term					{[@item]}
		| kTHEN					{[@item]}
		| term kTHEN				{[@item]}

do		: term					{[@item]}
		| kDO_COND				{[@item]}

if_tail		: opt_else				{[@item]}
		| kELSIF expr then compstmt if_tail	{[@item]}

opt_else	: none					{[@item]}
		| kELSE compstmt			{[@item]}

block_var	: lhs					{[@item]}
		| mlhs					{[@item]}

opt_block_var	: none					{[@item]}
		| '|' '|' 				{[@item]}
		| tOROP					{[@item]}
		| '|' block_var '|'			{[@item]}


do_block	: kDO_BLOCK opt_block_var compstmt kEND		{[@item]}

block_call	: command do_block				{[@item]}
		| block_call '.' operation2 opt_paren_args	{[@item]}
		| block_call tCOLON2 operation2 opt_paren_args	{[@item]}

method_call	: operation paren_args				{[@item]}
		| primary '.' operation2 opt_paren_args		{[@item]}
		| primary tCOLON2 operation2 paren_args		{[@item]}
		| primary tCOLON2 operation3			{[@item]}
		| kSUPER paren_args				{[@item]}
		| kSUPER					{[@item]}

brace_block	: '{' opt_block_var compstmt '}'	{[@item]}
		| kDO opt_block_var compstmt kEND	{[@item]}

case_body	: kWHEN when_args then compstmt cases	{[@item]}

when_args	: args					{[@item]}
		| args ',' tSTAR arg			{[@item]}
		| tSTAR arg				{[@item]}

cases		: opt_else				{[@item]}
		| case_body				{[@item]}

exc_list	: none					{[@item]}
		| args					{[@item]}

exc_var		: tASSOC lhs				{[@item]}
		| none					{[@item]}

rescue		: kRESCUE exc_list exc_var then compstmt rescue	{[@item]}
		| none					{[@item]}

ensure		: none					{[@item]}
		| kENSURE compstmt			{[@item]}

literal		: numeric				{[@item]}
		| symbol				{[@item]}
		| tREGEXP				{[@item]}

#string		: tSTRING				{[@item]}
#		| tDSTRING				{[@item]}
#		| string tSTRING			{[@item]}
#		| string tDSTRING			{[@item]}
string		: (tSTRING|tDSTRING)(s?)		{[@item]}

symbol		: tSYMBEG sym				{[@item]}

sym		: fname					{[@item]}
		| tIVAR					{[@item]}
		| tGVAR					{[@item]}
		| tCVAR					{[@item]}

numeric		: tINTEGER				{[@item]}
		| tFLOAT				{[@item]}

variable	: tIVAR					{[@item]}
		| tGVAR					{[@item]}
		| tCVAR					{[@item]}
		| tCONSTANT				{[@item]}
		| tIDENTIFIER				{[@item]}
		| kNIL					{[@item]}
		| kSELF					{[@item]}
		| kTRUE 				{[@item]}
		| kFALSE				{[@item]}
		| k__FILE__				{[@item]}
		| k__LINE__				{[@item]}

var_ref		: variable				{[@item]}

backref		: tNTH_REF				{[@item]}
		| tBACK_REF				{[@item]}

superclass	: term					{[@item]}
		| '<'
		  expr term				{[@item]}
		| error term				{[@item]}

f_arglist	: '(' f_args opt_nl ')'			{[@item]}
		| f_args term				{[@item]}

f_args		: f_arg ',' f_optarg ',' f_rest_arg opt_f_block_arg {[@item]}
		| f_arg ',' f_optarg opt_f_block_arg		{[@item]}
		| f_arg ',' f_rest_arg opt_f_block_arg		{[@item]}
		| f_arg opt_f_block_arg				{[@item]}
		| f_optarg ',' f_rest_arg opt_f_block_arg	{[@item]}
		| f_optarg opt_f_block_arg		{[@item]}
		| f_rest_arg opt_f_block_arg		{[@item]}
		| f_block_arg				{[@item]}
		| 					{[@item]}

f_norm_arg	: tCONSTANT				{[@item]}
                | tIVAR					{[@item]}
                | tGVAR					{[@item]}
                | tCVAR					{[@item]}
		| tIDENTIFIER				{[@item]}

#f_arg		: f_norm_arg				{[@item]}
#		| f_arg ',' f_norm_arg			{[@item]}
f_arg		: f_norm_arg(s /,/)			{[@item]}

f_opt		: tIDENTIFIER '=' arg			{[@item]}

#f_optarg	: f_opt					{[@item]}
#		| f_optarg ',' f_opt			{[@item]}
f_optarg	: f_opt(s /,/)				{[@item]}

f_rest_arg	: tSTAR tIDENTIFIER			{[@item]}
		| tSTAR					{[@item]}

f_block_arg	: tAMPER tIDENTIFIER			{[@item]}

opt_f_block_arg	: ',' f_block_arg			{[@item]}
		| none					{[@item]}

singleton	: var_ref				{[@item]}
		| '(' expr opt_nl ')'			{[@item]}

assoc_list	: none					{[@item]}
		| assocs trailer			{[@item]}
		| args trailer				{[@item]}

#assocs		: assoc					{[@item]}
#		| assocs ',' assoc			{[@item]}
assocs		: assoc(s /,/)				{[@item]}

assoc		: arg tASSOC arg			{[@item]}

operation	: tIDENTIFIER				{[@item]}
		| tCONSTANT				{[@item]}
		| tFID					{[@item]}

operation2	: tIDENTIFIER				{[@item]}
		| tCONSTANT				{[@item]}
		| tFID					{[@item]}
		| op					{[@item]}

operation3	: tIDENTIFIER				{[@item]}
		| tFID					{[@item]}
		| op					{[@item]}

dot_or_colon	: '.'					{[@item]}
		| tCOLON2				{[@item]}

opt_terms	: terms					{[@item]}
		|	# null

opt_nl		: '\n'					{[@item]}
		|	# null

trailer		: '\n'					{[@item]}
		| ','					{[@item]}
		|	# null

term		: ';'					{[@item]}
		| '\n'					{[@item]}

#terms		: term					{[@item]}
#		| terms ';'				{[@item]}
terms		: term(s /;/)				{[@item]}

none		:	# null
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
