%{
/*
 * cola.y
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * The parser. Grammar for Bison.
 */


#include <string.h>
#include <stdio.h>
#include <stdlib.h> 
#include "cola.h"
extern char yytext[];
long line;
int indent;
int yyerror( char * );
int yylex();
AST * ast_start = NULL;

/* Pointers to the builtin type entries in the symbol table */
Symbol * t_void, * t_string, * t_int, * t_float;

%}

%union {
	int ival;
	Symbol * sym;
	AST * ast;
}

%token ASM

%token USING NAMESPACE CLASS MODIFIER CONST REF OUT READONLY
%token VOID BOOL CHAR STRING INT SBYTE BYTE UINT SHORT USHORT LONG ULONG
%token FLOAT DOUBLE DECIMAL TRUE FALSE OBJECT STRING
%token NEW PUBLIC PROTECTED INTERNAL PRIVATE ABSTRACT STATIC SEALED VIRTUAL
%token OVERRIDE EXTERN GET SET
%token IF ELSE WHILE FOR RETURN BREAK CONTINUE GOTO NULLVAL TYPE
%token <sym> IDENTIFIER LITERAL
%token INC DEC LOGICAL_AND LOGICAL_OR LOGICAL_EQ LOGICAL_NE
%token LOGICAL_LT LOGICAL_GT LOGICAL_LTE LOGICAL_GTE
%token LEFT_SHIFT RIGHT_SHIFT INDEX

%token TYPE METHOD


%type <sym> type ref_type array_type return_type
%type <sym> member_name qualified_identifier 

%type <ast> using_directives using_directive attribute_list
%type <ast> namespace_member_decls namespace_member_decl
%type <ast> namespace_decl class_decl namespace_body
%type <ast> return_statement jump_statement asm_block
%type <ast> statement statement_list
%type <ast> decl_statement method_decl
%type <ast> class_decl
%type <sym> class_scope_start 
%type <ast> class_body class_member_decl_list class_member_decl
%type <ast> local_var_decl
%type <sym> var_declarator var_declarators
%type <ast> method_header method_body
%type <sym> formal_param_list fixed_params fixed_param
%type <ast> block labeled_statement embedded_statement
%type <ast> expression_statement selection_statement if_statement
%type <ast> iteration_statement while_statement for_statement
%type <ast> expression_list expression statement_expression assignment
%type <ast> primary_expression boolean_expression equality_expression
%type <ast> post_inc_expr post_dec_expr pre_inc_expr pre_dec_expr
%type <ast> new_expression new_object_expression
%type <ast> conditional_expression conditional_or_expression
%type <ast> conditional_and_expression inclusive_or_expression and_expression
%type <ast> shift_expression exclusive_or_expression relational_expression
%type <ast> unary_expression add_expression mult_expression
%type <ast> equality_expression relational_expression
%type <ast> call element_access arg arg_list
%type <ival> equality_op relational_op
%type <ival> rank_specifier rank_specifiers dim_separators


%left '-' '+'
%left '*' '/'
%nonassoc UMINUS INC DEC
%start compilation_unit

%%

optional_semi	:
		|	';'
		;

compilation_unit:
        using_directives attribute_list namespace_member_decls
		{
			unshift_ast(&ast_start, $1);
			unshift_ast(&ast_start, $2);
			unshift_ast(&ast_start, $3);
			printf("DONE: compilation_unit.\n");
		}
	;

using_directives:	/*NULL*/
		{ $$ = NULL; }
	|	using_directives using_directive
		{
			unshift_ast(&($$), $1);
		}
	;

using_directive:
		USING IDENTIFIER '=' IDENTIFIER ';'
		{	printf("using_alias_directive\n");	}
	|	USING IDENTIFIER ';'
		{	printf("using_directive\n");	}
	;

attribute_list	:	/*NULL*/
		{ $$ = NULL; }
	;

namespace_decl:
    NAMESPACE qualified_identifier namespace_body
    {
        $$ = $3;
        printf("NAMESPACES not supported yet, stuff inside [%s] is global.\n",
                $2->name);
    }
    ;

qualified_identifier:
    IDENTIFIER
    |   qualified_identifier '.' IDENTIFIER
    {
        $$ = $1;
        /* Build a list of ('System', 'Console', 'Write') */
        tunshift_sym(&($$), $3);
    }
    
namespace_body:
    '{' using_directives namespace_member_decls '}'
    {
        $$ = $2;
    }
    ;
    
namespace_member_decls: /*NULL*/
		{ $$ = NULL; }
	|
		namespace_member_decls namespace_member_decl
		{
			$$ = $1;
			unshift_ast(&($$), $2);
		}
	;

namespace_member_decl:
    namespace_decl
        { $$ = $1; }
    |   class_decl
		{ $$ = $1; }
	;

class_decl:	class_modifiers class_scope_start class_body optional_semi
		{
			/* Collect class members */
			/*$2->members = pop_scope(current_symbol_table);*/
			pop_scope(NULL);
			pop_namespace();
			$$ = new_ast(AST_STATEMENT, ASTT_CLASS_DECL, $3, NULL);
			$$->sym = $2;
		}
	;

class_modifiers:	/*NULL*/
	|		class_modifiers class_modifier
	;
	
class_modifier:
		PUBLIC
	|	PRIVATE
	|	PROTECTED
	|	STATIC
	|	VIRTUAL
	;

class_body:	'{' class_member_decl_list '}'
		{ $$ = $2; }
	;

class_scope_start:	CLASS IDENTIFIER
		{
			/* Create a new namespace for class and put it in effect */
			Symbol * c;
			if(lookup_type($2->name)) {
				printf("Error, redefinition of type [%s]\n", $2->name);
				exit(0);
			}
			c = new_class($2);
			push_namespace(c);
			push_scope();
			$$ = c;
		}
	;
	
class_member_decl_list:
		{	$$ = NULL;	}
	|		class_member_decl_list class_member_decl
		{
			$$ = $1;
			unshift_ast(&($$), $2);
		}
	;

class_member_decl:
		decl_statement
		{ $$ = $1; }
	|	method_decl
		{	$$ = $1; }
/*
	|		property_decl
	|		event_decl
	|		indexer_decl
	|		operator_decl
	|		constructor_decl
	|		destructor_decl
	|		static_constructor_decl
	|		type_decl
*/
	;


block:
    '{' block_scope statement_list '}'
		{
			$$ = $3;
			if($$) {
				$$->locals = pop_scope(current_symbol_table);
			} else {
				pop_scope(current_symbol_table);
			}
		}
	;
	
block_scope:
        { push_scope(); }
	;
	
embedded_statement:
	block
		{$$ = $1;}
	|	expression_statement
		{ $$ = $1; }
	|	selection_statement
		{ $$ = $1;}
	|	iteration_statement
		{ $$ = $1;}
	|	jump_statement
		{ $$ = $1;}
	|	return_statement
		{ $$ = $1; }
	|   asm_block
	    { $$ = $1; }
	;

statement:
		embedded_statement
	|	decl_statement
	|	labeled_statement
	;

statement_list:
	/* NULL */
		{ $$ = NULL; }
	|	statement
		{ $$ = $1; }
	|	statement_list statement
		{
			$$ = $1;
			unshift_ast(&($$), $2);
		}
	;

labeled_statement:
    IDENTIFIER ':' statement
    	{ $$ = $3; $$->sym = $1; }
	;

expression_statement:
	statement_expression ';'
		{ $$ = $1; }
	;

statement_expression:
	call
	|	assignment
	|	post_inc_expr
	|	post_dec_expr
	|	pre_inc_expr
	|	pre_dec_expr
	;

jump_statement:
	BREAK ';'
		{ $$ = new_statement(ASTT_BREAK, NULL, NULL); }
	|	CONTINUE ';'
		{ $$ = new_statement(ASTT_CONTINUE, NULL, NULL); }
	|	GOTO IDENTIFIER ';'
		{
			$$ = NULL;
			printf("GOTO not supported yet.\n");
			exit(0);
		}
	;

return_statement:
	RETURN expression ';'
		{	$$ = new_statement(ASTT_RETURN, $2, NULL); }
	|	RETURN ';'
		{	$$ = new_statement(ASTT_RETURN, NULL, NULL); }
	;
	
asm_block:
    ASM '(' LITERAL ')' ';'
    { $$ = NULL; }
    ;

call:
		primary_expression '(' arg_list ')'
		{$$ = new_expression(ASTT_CALL, $1, $3);}
	;

arg_list:
		arg
	|	arg_list ',' arg
		{
			$$ = $1;
			unshift_ast(&($$), $3);
		}
	;
	
arg:
    /*NULL*/
		{ $$ = NULL; }
	|	expression
		{ $$ = $1;	}
	|	REF
		{ $$ = NULL; }
	|	OUT
		{ $$ = NULL; }
	;
	
selection_statement:
		if_statement
	;

if_statement:
	IF '(' boolean_expression ')' embedded_statement
	ELSE embedded_statement
		{
			$$ = new_if($3, $5, $7);
		}
	|	IF '(' boolean_expression ')' embedded_statement
		{
			$$ = new_if($3, $5, NULL);
		}
	;

iteration_statement:
	while_statement
	|	for_statement
	;
	
while_statement:
	WHILE '(' boolean_expression ')' embedded_statement
    	{
	    	$$ = new_while($3, $5);
    	}
	;
	
for_statement:
	FOR '(' statement_expression ';' boolean_expression ';' statement_expression ')'
	embedded_statement
    	{
    		if($3 == NULL) {
    			printf("for_statement: NULL init statement\n");
    			exit(0);
    		}
    		$$ = new_for($3, $5, $7, $9);
    	}
	;

return_type:
	type
		{	if($1 == NULL) {
				printf("Internal compiler error, NULL type.\n");
				exit(0);
			}
		}
	|	VOID
		{
			$$ = t_void;
			if($$ == NULL) {
				printf("Internal compiler error, NULL type for VOID.\n");
				exit(0);
			}
		}
	;

/* We really don't have to hardcode these types into the
 * parser since they are all stored in the symbol table.
 * Should allow the boostrap namespace to define all builtin
 * types; will probably rip this out soon.
 */
type:
    INT
		{ $$ = lookup_type("int"); }
	|   STRING
		{ $$ = lookup_type("string"); }
	|   BYTE
		{ $$ = lookup_type("byte"); }
	|   FLOAT
		{ $$ = lookup_type("float"); }
	|   IDENTIFIER
    	{
    		Symbol * t;
    		t = lookup_type($1->name);
    		if(t != NULL) {
    			if(t->class == TYPE) {
    				printf("Class [%s] found in type list.\n", t->name);
    			}
    			else {
    				printf("Error, unknown type [%s]\n", $1->name);
    				exit(0);
    			}
    			$$ = t;
    		}
    		else {
    			printf("Error, undeclared type [%s]\n", $1->name);
    			exit(0);
    		}
    	}
	;

ref_type:
	array_type
	;

array_type:
	type rank_specifiers
		{
		}
	;
		
rank_specifiers:
	rank_specifier
	|	rank_specifiers rank_specifier
	;
		
rank_specifier:
	'[' dim_separators ']'
    	{ $$ = 0; printf("rank_specifier: %d dimensions\n", $2);  }
	;

dim_separators:
	','
	    { $$ = 1; }
	|   dim_separators ','
	    { $$ = $1 + 1; }
	; 
	
assignment:	unary_expression '=' expression
    	{ $$ = new_expression(ASTT_ASSIGN, $1, $3); }
	;

primary_expression:
	LITERAL
		{$$ = new_expression(ASTT_LITERAL, NULL, NULL); $$->sym = $1;}
	|	IDENTIFIER
		{
			Symbol * orig;
			orig = check_id_decl(current_symbol_table, $1->name);
			/* Kludge for now, defaults to global namespace if current
			 * namespace fails. This should run up the stack of namespaces.
			 */
			if(orig == NULL)
				orig = check_id_decl(global_symbol_table, $1->name);
			if(orig == NULL) {
				printf("error (line %ld): undeclared identifier %s.\n", line, $1->name);
				exit(0);
			}
			$$ = new_expression(ASTT_IDENTIFIER, NULL, NULL);
			$$->sym = orig;
		}
	|	'(' expression ')'
		{$$ = $2; }
	|	call
		{$$ = $1; }
	|	post_inc_expr
	|	post_dec_expr
	|	element_access
	|	new_expression
	;

pre_inc_expr:
	INC unary_expression
    	{
    	    $$ = new_expression(ASTT_PREINC, $2, NULL);
    		$$->op = INC;
    	}
	;

pre_dec_expr:
	DEC unary_expression
    	{
    	    $$ = new_expression(ASTT_PREINC, $2, NULL);
    		$$->op = DEC;
    	}
	;

post_inc_expr:
	primary_expression INC
    	{
    		$$ = new_expression(ASTT_POSTINC, $1, NULL);
    		$$->op = INC;
    	}
	;

post_dec_expr:
	primary_expression DEC
    	{
    		$$ = new_expression(ASTT_POSTINC, $1, NULL);
    		$$->op = DEC;
    	}
	;

new_expression:
	new_object_expression
/*
	| new_array_expression
	| new_delegate_expression
*/
	;

new_object_expression:
	NEW type '(' arg_list ')'
    	{
    		$$ = new_expression(ASTT_NEW_OBJECT, $4, NULL);
    		$$->sym = $2;
    	}
	;

expression:
	conditional_expression
		{ $$ = $1; }
	|   assignment
		{ $$ = new_expression(ASTT_ASSIGN, $1, NULL); }
	;

boolean_expression:	expression
    	{ $$ = new_expression(ASTT_BOOLEAN, $1, NULL);	}
	;

unary_expression:
	primary_expression
		{ $$ = $1; }
	|	'+' unary_expression
		{ $$ = $2; $$->op = '+'}
	|	'-' unary_expression
		{ $$ = $2; $$->op = '-'}
	|	'!' unary_expression
		{ $$ = $2; $$->op = '!'}
	|	pre_inc_expr
	|	pre_dec_expr
	;

mult_expression:
    unary_expression
	|	mult_expression '*' unary_expression
		{
			AST * ast = new_expression(ASTT_MUL, $1, $3);
			ast->op = '*';
			$$ = ast;
		}
	|	mult_expression '/' unary_expression
		{
			AST * ast = new_expression(ASTT_MUL, $1, $3);
			ast->op = '/';
			$$ = ast;
		}
	|	mult_expression '%' unary_expression
		{
			AST * ast = new_expression(ASTT_MUL, $1, $3);
			ast->op = '%';
			$$ = ast;
		}
	;

add_expression:
    mult_expression
	|	add_expression '+' mult_expression
		{
			AST * ast = new_expression(ASTT_ADD, $1, $3);
			ast->op = '+';
			$$ = ast;
		}
	|	add_expression '-' mult_expression
		{
			AST * ast = new_expression(ASTT_ADD, $1, $3);
			ast->op = '-';
			$$ = ast;
		}
	;

conditional_expression:
	conditional_or_expression
	|	conditional_or_expression '?' expression ':' expression
	;

conditional_and_expression:
	inclusive_or_expression
	|	conditional_and_expression LOGICAL_AND inclusive_or_expression
	;

conditional_or_expression:
	conditional_and_expression
	|	conditional_or_expression LOGICAL_OR conditional_and_expression
	;

and_expression:
    equality_expression
	|	and_expression '&' equality_expression
	;

exclusive_or_expression:
	and_expression
	|	exclusive_or_expression '^' and_expression
	;

inclusive_or_expression:
	exclusive_or_expression
	|	inclusive_or_expression '|' exclusive_or_expression
	;

relational_op:
	LOGICAL_LT
		{$$ = LOGICAL_LT;}
	|	LOGICAL_GT
		{$$ = LOGICAL_GT;}
	|	LOGICAL_LTE
		{$$ = LOGICAL_LTE;}
	|	LOGICAL_GTE
		{$$ = LOGICAL_GTE;}
	;

equality_op:
	LOGICAL_EQ
		{$$ = LOGICAL_EQ;}
	|	LOGICAL_NE
		{$$ = LOGICAL_NE;}
	;
	
relational_expression:
    shift_expression
	|	relational_expression relational_op shift_expression
        {
        	$$ = new_expression(ASTT_COMPARISON, $1, $3);
        	$$->op = $2;
        }
	;

equality_expression:
	relational_expression
	|	equality_expression equality_op relational_expression
    	{
    		$$ = new_expression(ASTT_COMPARISON, $1, $3);
    		$$->op = $2;
    	}
	;		

shift_expression:
	add_expression
	|	shift_expression LEFT_SHIFT add_expression	
	|	shift_expression RIGHT_SHIFT add_expression
	;

element_access:
	primary_expression '[' expression ']'
    	{
    		$$ = new_expression(ASTT_INDEX, $1, $3);
    		$$->op = INDEX;
    	}
	;

expression_list:
    expression
	|	expression_list ',' expression
	;

decl_statement:
	local_var_decl ';'
		{ $$ = $1;	}
	|	CONST type IDENTIFIER '=' LITERAL ';'
		{
			$3->type = $2;
			$3->literal = $5;
			check_id_redecl(current_symbol_table, $3->name);
			store_symbol(current_symbol_table, $3); 
			$$ = new_statement(ASTT_CONSTANT_DECL, NULL, NULL);
			$$->sym = $3;
			if(lookup_symbol(current_symbol_table, $$->sym->name)) {
					printf("Warning: declaration of '%s' shadows previous instance.\n",
							$$->sym->name);
			}
		}
	;

local_var_decl:
	type var_declarators
    	{
    		/* Insert symbols into symbol table, collect any initializer
    		 * statement expressions, then discard symbol list.
    		 */
    		Symbol * sym;
    		AST * init_exprs = NULL;
    		if($1 == NULL) {
    			printf("Internal compiler error: local_var_decl: type is NULL\n");
    			abort();
    		}
    		for(sym=$2; sym; sym=sym->tnext) {
    			sym->type = $1;
    			check_id_redecl(current_symbol_table, sym->name);
    			if(lookup_symbol(current_symbol_table, sym->name)) {
    					printf("Warning: declaration of '%s' shadows previous instance.\n",
    							sym->name);
    			}
    			store_symbol(current_symbol_table, sym);
    			/* Collect intializer statements */
    			if(sym->init_expr) {
    				AST *id, * init_expr;
    				id = new_expression(ASTT_IDENTIFIER, NULL, NULL);
    				id->sym = sym;
    				init_expr = new_expression(ASTT_ASSIGN, id, sym->init_expr);
    				unshift_ast(&init_exprs, init_expr);
    			}
    		}
    		$$ = init_exprs;
    	}
	;
	
var_declarators:
	var_declarator
	|   var_declarators ',' var_declarator
    	{
    		$$ = $1;
    		tpush_sym(&($$), $3);
    	}
	;
	
var_declarator:
	IDENTIFIER
	|   IDENTIFIER '=' expression
    	{
    		$$ = $1; $$->init_expr = $3;
    	}
/*
	|   IDENTIFIER '=' array_initializer
*/
	;
	
method_decl:
	method_header method_body
    	{
    		$$ = $1;
    		$$->Attr.Method.body = $2;
    		if($2 != NULL)
    			$$->locals = $2->locals;
    		pop_scope(current_symbol_table);
    	}
	;

method_header:
    method_modifiers return_type member_name '(' formal_param_list ')'
		{
			Symbol * param;
			$$ = new_statement(ASTT_METHOD_DECL, NULL, NULL);
			$3->class = METHOD;
			$3->type = $2;
			$$->sym = $3;

			$$->Attr.Method.params = $5;
			store_symbol(current_symbol_table, $$->sym);
			push_scope();
			for(param = $5; param; param = param->tnext) {
				store_symbol(current_symbol_table, param);
			}
		}
	;

param_scope:
    	{ push_scope(); }
	;
	
method_modifiers:	/*NULL*/	
	|	method_modifiers method_modifier
	;

method_modifier:
    STATIC
	|	VIRTUAL
	|	PUBLIC
	|	PRIVATE
	|	PROTECTED
	;

formal_param_list:	/*NULL*/
		{ $$ = NULL; }
	|	fixed_params
		{ $$ = $1; }
/*
	|	fixed_params ',' param_array
	|	param_array
*/
	;
		
fixed_params:
	fixed_param
	|	fixed_params ',' fixed_param
		{
			$$ = $1;
			tunshift_sym(&($$), $3);
		}
	;
	
fixed_param:
	type IDENTIFIER
		{
		    $2->type = $1;
			$$ = $2;
		}
	;

/*
param_modifier:
		REF
	|	OUT
	;
	
param_array:
		attributes PARAMS array_type IDENTIFIER
	;
*/
	
	
member_name:
    IDENTIFIER
		{
			$$ = $1;
			check_id_redecl(current_symbol_table, $1->name);
			if(lookup_symbol(current_symbol_table, $1->name)) {
					printf("Warning: declaration of '%s' shadows previous instance.\n",
							$1->name);
			}
		}
/*
	|	interface_type '.' IDENTIFIER
*/
	;

method_body:
	block
		{ $$ = $1; }
	;

%%

extern FILE *yyin;


int main(int argc, char * argv[])
{
	printf("Cola compiler version %s\n\n", COLA_VERSION);
	if(argc > 1) {
		if(!(yyin = fopen(argv[1], "r")))	{
			printf( "Error reading source file %s.\n", argv[1] );
			exit(0);
		}
	} else {
		printf( "No source file specified.\n" );
		exit(0);
	}

	line = 1;
	init_symbol_tables();
	init_builtin_types();
	/* Kludge - fake routines by adding them to symbol table
	 * and emitting them.
	 */
	{
		store_identifier(current_symbol_table, "puts", METHOD, t_void); 
		store_identifier(current_symbol_table, "puti", METHOD, t_void);
		store_identifier(current_symbol_table, "putf", METHOD, t_void);
		store_identifier(current_symbol_table, "gets", METHOD, t_string);
		store_identifier(current_symbol_table, "substr", METHOD, t_string);
		store_identifier(current_symbol_table, "strlen", METHOD, t_int);
		store_identifier(current_symbol_table, "strchop", METHOD, t_string);
		store_identifier(current_symbol_table, "strrep", METHOD, t_string);
		store_identifier(current_symbol_table, "ord", METHOD, t_int);
		store_identifier(current_symbol_table, "sleep", METHOD, t_void);
	}

	yyparse();
	fclose(yyin);

    freopen("a.imc", "w", stdout);
    fprintf(stderr, "Compiling intermediate code to a.imc\n");      

	printf( "Dump of global namespace:\n" );
	indent = 0;
	dump_namespace(current_namespace);
	printf("\n<program>\n");
	printf("# Cola (%s) generated\n#\n", COLA_VERSION);
	printf("_START:\n\tpusharg \"\"\n\tcall __Main\n");
	printf("__END:\n\tend\n\n");

	if(ast_start) {
		gen_ast(ast_start);
	}

	gen_bootstrap();
	printf("</program>\n");
    fclose(stdout);
    fprintf(stderr, "%ld lines compiled.\n", line);
    fprintf(stderr, "Compiling assembly module a.pasm\n");
    system("perl int2pasm.pl a.imc > a.pasm");
    return 0;
}

int yyerror( char * s )
{
	printf( "(error) line %ld: %s\n", line, s );
	printf( "Didn't create output asm.\n" );
	exit(0);
}

