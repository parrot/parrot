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

int         yyerror(char *);
int         yylex();
extern char yytext[];
long        line;
int         indent;

AST         *ast_start = NULL;

/* Pointers to the builtin type entries in the symbol table */

%}

%union {
    int ival;
    Symbol * sym;
    Type * type;
    AST * ast;
    void * p;
}

%token ASM

%token USING NAMESPACE CLASS MODIFIER CONST REF OUT READONLY
%token VOID BOOL CHAR STRING INT SBYTE BYTE UINT SHORT USHORT LONG ULONG
%token FLOAT DOUBLE DECIMAL TRUE FALSE OBJECT STRING
%token NEW PUBLIC PROTECTED INTERNAL PRIVATE ABSTRACT STATIC SEALED VIRTUAL
%token OVERRIDE EXTERN GET SET
%token IF ELSE WHILE FOR RETURN BREAK CONTINUE GOTO NULLVAL TYPE
%token <sym> IDENTIFIER LITERAL
%token <ival> INC DEC LOGICAL_AND LOGICAL_OR LOGICAL_EQ LOGICAL_NE
%token <ival> LOGICAL_LTE LOGICAL_GTE
%token <ival> LEFT_SHIFT RIGHT_SHIFT INDEX

%token TYPE METHOD

%type <type> type_name type return_type array_type non_array_type
%type <type> simple_type primitive_type struct_type enum_type
%type <sym> member_name qualified_identifier
%type <sym> namespace_scope_start class_scope_start 
%type <sym> var_declarator var_declarators
%type <sym> formal_param_list fixed_params fixed_param
%type <ast> using_directives using_directive attribute_list
%type <ast> namespace_member_decls namespace_member_decl
%type <ast> namespace_decl class_decl namespace_body
%type <ast> return_statement jump_statement asm_block
%type <ast> statement statement_list
%type <ast> decl_statement method_decl
%type <ast> class_decl
%type <ast> class_body class_member_decl_list class_member_decl
%type <ast> local_var_decl
%type <ast> method_header method_body
%type <ast> block labeled_statement embedded_statement
%type <ast> expr_statement selection_statement if_statement
%type <ast> iteration_statement while_statement for_statement
%type <ast> expr_list expr statement_expr assignment
%type <ast> primary_expr boolean_expr equality_expr element_access
%type <ast> element_access
%type <ast> post_inc_expr post_dec_expr pre_inc_expr pre_dec_expr
%type <ast> new_expr new_object_expr
%type <ast> conditional_expr conditional_or_expr
%type <ast> conditional_and_expr inclusive_or_expr and_expr
%type <ast> shift_expr exclusive_or_expr relational_expr
%type <ast> unary_expr add_expr mult_expr
%type <ast> equality_expr relational_expr
%type <ast> call arg arg_list member_access
%type <ival> relational_op
%type <p> rank_specifiers
%type <ival> dim_separators rank_specifier


%left '-' '+'
%left '*' '/'
%nonassoc UMINUS INC DEC
%start compilation_unit

%%

optional_semi    :
        |    ';'
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

using_directives:    /*NULL*/
        { $$ = NULL; }
    |   using_directives using_directive
        {
            unshift_ast(&($$), $1);
        }
    ;

using_directive:
    USING IDENTIFIER '=' IDENTIFIER ';'
        {    printf("using_alias_directive\n");    }
    |   USING IDENTIFIER ';'
        {    printf("using_directive\n");    }
    ;

attribute_list    :    /*NULL*/
        { $$ = NULL; }
    ;

namespace_decl:
    namespace_scope_start namespace_body
        {
            pop_scope(NULL);
            pop_namespace();
            $$ = new_ast(KIND_DECL, ASTT_NAMESPACE_DECL, $2, NULL);
            $$->sym = $1;
        }
    ;

namespace_scope_start:    NAMESPACE qualified_identifier
        {
            Symbol *n, *t, *last;
            if(lookup_type_symbol($2)) {
                printf("Error, redefinition of [%s]\n", symbol_to_str($2));
                exit(0);
            }
            for(n = $2, last=current_namespace; n; n = n->tnext) {
                t = new_namespace(n);
                store_symbol(last->table, t);
                last = n;
            }
            push_namespace(t);
            push_scope();
            $$ = t;
        }
    ;
    
qualified_identifier:
    IDENTIFIER
        {
            $$ = $1;
            fprintf(stderr, "qualified_identifier <- IDENTIFIER(%s)\n", NAME($1));
        }
    |   qualified_identifier '.' IDENTIFIER
        {
            $$ = $1;
            /* Build a list of ('System', 'Console', 'Write') */
            tunshift_sym(&($$), $3);
        }
    ;

namespace_body:
    '{' using_directives namespace_member_decls '}'
        {
            $$ = $2;
            if($3)
                unshift_ast(&($$), $3);
        }
    ;
    
namespace_member_decls: /*NULL*/
        { $$ = NULL; }
    |
        namespace_member_decls namespace_member_decl
        {
            $$ = $1;
            if($2)
                unshift_ast(&($$), $2);
        }
    ;

namespace_member_decl:
    namespace_decl
    |   class_decl
    ;

class_decl:    class_modifiers class_scope_start class_body optional_semi
        {
            /* Collect class members */
            /*$2->members = pop_scope(current_symbol_table);*/
            pop_scope(NULL);
            pop_namespace();
            $$ = new_ast(KIND_DECL, ASTT_CLASS_DECL, $3, NULL);
            $$->sym = $2;
        }
    ;

class_modifiers:    /*NULL*/
    |        class_modifiers class_modifier
    ;
    
class_modifier:
    PUBLIC
    |    PRIVATE
    |    PROTECTED
    |    STATIC
    |    VIRTUAL
    ;

class_body:    '{' class_member_decl_list '}'
        { $$ = $2; }
    ;

class_scope_start:
    CLASS IDENTIFIER
        {
            /* Create a new namespace for class and put it in effect */
            Symbol * c;
            if(lookup_type($2->name)) {
                printf("Error, redefinition of type [%s]\n", $2->name);
                exit(0);
            }
            fprintf(stderr, "\nclass_scope_start <- CLASS IDENTIFIER (%s)\n", $2->name);
            c = new_class($2);
            push_namespace(c);
            push_scope();
            $$ = c;
        }
    ;
    
class_member_decl_list:
        {    $$ = NULL;    }
    |        class_member_decl_list class_member_decl
        {
            $$ = $1;
            unshift_ast(&($$), $2);
        }
    ;

class_member_decl:
        decl_statement
        { $$ = $1; }
    |   method_decl
        {    $$ = $1; }
/*
    |        property_decl
    |        event_decl
    |        indexer_decl
    |        operator_decl
    |        constructor_decl
    |        destructor_decl
    |        static_constructor_decl
    |        type_decl
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
    |   expr_statement
        { fprintf(stderr, "##End of expr_statement\n\n"); $$ = $1; }
    |   selection_statement
        { fprintf(stderr, "##End of selection_statement\n\n"); $$ = $1; }
    |   iteration_statement
        { fprintf(stderr, "##End of iteration_statement\n\n"); $$ = $1; }
    |   jump_statement
        { fprintf(stderr, "##End of jump_statement\n\n"); $$ = $1; }
    |   return_statement
        { fprintf(stderr, "##End of return_statement\n\n"); $$ = $1; }
    |   asm_block
        { $$ = $1; }
    ;

statement:
    embedded_statement
    |   decl_statement
        { fprintf(stderr, "##End of decl_statement\n\n"); $$ = $1; }
    |   labeled_statement
        { fprintf(stderr, "##End of labeled_statement\n\n"); $$ = $1; }
    ;

statement_list:
    /* NULL */
        { $$ = NULL; }
    |   statement
        { $$ = $1; }
    |   statement_list statement
        {
            $$ = $1;
            unshift_ast(&($$), $2);
        }
    ;

labeled_statement:
    IDENTIFIER ':' statement
        { $$ = $3; $$->sym = $1; }
    ;

expr_statement:
    statement_expr ';'
        { $$ = $1; }
    ;

jump_statement:
    BREAK ';'
        { $$ = new_statement(ASTT_BREAK, NULL, NULL); }
    |   CONTINUE ';'
        { $$ = new_statement(ASTT_CONTINUE, NULL, NULL); }
    |   GOTO IDENTIFIER ';'
        {
            $$ = NULL;
            printf("GOTO not supported yet.\n");
            exit(0);
        }
    ;

return_statement:
    RETURN expr ';'
        {    $$ = new_statement(ASTT_RETURN, $2, NULL); }
    |   RETURN ';'
        {    $$ = new_statement(ASTT_RETURN, NULL, NULL); }
    ;
    
asm_block:
    ASM '(' LITERAL ')' ';'
    { $$ = NULL; }
    ;

arg_list:
    arg
    |   arg_list ',' arg
        {
            $$ = $1;
            unshift_ast(&($$), $3);
        }
    ;
    
arg:
        { $$ = NULL; }
    |   expr
        { fprintf(stderr, " arg <- expr\n"); $$ = $1;    }
    |   REF
        { $$ = NULL; }
    |   OUT
        { $$ = NULL; }
    ;
    
selection_statement:
    if_statement
    ;

if_statement:
    IF '(' boolean_expr ')' embedded_statement
    ELSE embedded_statement
        {
            $$ = new_if($3, $5, $7);
        }
    |   IF '(' boolean_expr ')' embedded_statement
        {
            $$ = new_if($3, $5, NULL);
        }
    ;

iteration_statement:
    while_statement
    |   for_statement
    ;
    
while_statement:
    WHILE '(' boolean_expr ')' embedded_statement
        {
            $$ = new_while($3, $5);
        }
    ;
    
for_statement:
    FOR '(' statement_expr ';' boolean_expr ';' statement_expr ')'
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
        {
            if($1 == NULL) {
                printf("Internal compiler error, NULL type.\n");
                exit(0);
            }
        }
    |   VOID
        {
            $$ = t_void;
            if($$ == NULL) {
                printf("Internal compiler error, NULL type for VOID.\n");
                exit(0);
            }
        }
    ;

type_name:
    IDENTIFIER
        {
            Type * t;
            fprintf(stderr, " type_name <- IDENTIFIER (%s)\n", $1->name);
            t = lookup_type($1->name);
            if(t != NULL) {
                fprintf(stderr, "Kind [%s] found in type list.\n", t->sym->name);
                $$ = t;
            }
            else {
                printf("Error, undeclared type [%s]\n", $1->name);
                exit(0);
            }
        }
    ;
    
type:
    array_type
        {
            $$ = $1;
        }
    |   non_array_type
        {
            $$ = $1;
        }
    ;

primitive_type:
    INT
        { $$ = lookup_type("int"); }
    |   STRING
        { $$ = lookup_type("string"); }
    |   BYTE
        { $$ = lookup_type("byte"); }
    |   FLOAT
        { $$ = lookup_type("float"); }
    ;
    
struct_type:
    type_name
    |   simple_type
    ;

enum_type:
    type_name
    ;
        
simple_type:
    primitive_type
    |   BOOL
        { $$ = lookup_type("bool"); }
    ;
    
array_type:
        simple_type rank_specifiers
        {
            $$ = (void *)new_array($1, $2);
            fprintf(stderr, " array_type: array of %s\n", type_name($1));
        }
    ;
        
non_array_type:
    simple_type
        {
            $$ = $1;
            fprintf(stderr, " non_array_type <- simple_type\n");
        }
    |   type_name
    ;
    
rank_specifiers:
    rank_specifier
        {
            /* $1 is the dimension of the current rank */
            $$ = (void *)new_rank($1);
            fprintf(stderr, " rank_spec %d\n", $1);
        }
    |   rank_specifiers rank_specifier
        {
            $$ = $1;
            tunshift((Node **)&($$), (Node*)new_rank($2));
        }
    ;
        
rank_specifier:
    '[' dim_separators ']'
        {   $$ = $2 + 1;
            fprintf(stderr, " rank_spec([ dim_separators ])\n");
        }
    |   '[' ']'
        {   $$ = 1;
            fprintf(stderr, " rank_spec([])\n");
        }
    ;

dim_separators:
    ','
        { $$ = 1; }
    |   dim_separators ','
        { $$ = $1 + 1; }
    ; 

/*
 * Expressions
 */ 
statement_expr:
    call
    |   assignment
    |   post_inc_expr
    |   post_dec_expr
    |   pre_inc_expr
    |   pre_dec_expr
    ;

assignment:
    unary_expr '=' expr
        {   $$ = new_expr(ASTT_ASSIGN, $1, $3);   }
    /*
    |   unary_expr compound_assign_op expr
        {
            $$ = new_expr(ASTT_ASSIGN, $1, new_op_expr($1, $2, $3));
        }
    */
    ;

member_access:
    primary_expr '.' IDENTIFIER
/*
    |   predefined_type '.' IDENTIFIER
*/
    ;

pre_inc_expr:
    INC unary_expr
        {
            $$ = new_expr(ASTT_PREINC, $2, NULL);
            $$->op = INC;
        }
    ;

pre_dec_expr:
    DEC unary_expr
        {
            $$ = new_expr(ASTT_PREINC, $2, NULL);
            $$->op = DEC;
        }
    ;

post_inc_expr:
    primary_expr INC
        {
            $$ = new_expr(ASTT_POSTINC, $1, NULL);
            $$->op = INC;
        }
    ;

post_dec_expr:
    primary_expr DEC
        {
            $$ = new_expr(ASTT_POSTINC, $1, NULL);
            $$->op = DEC;
        }
    ;

/*
postfix_expr:
        primary_expr
    |   qualified_identifier
    |   post_inc_expr
    |   post_dec_expr
    ;
*/

expr:
    conditional_expr
        {
            $$ = $1;
            fprintf(stderr, " expr <- conditional_expr\n");
        } 
    |   assignment
    ;

expr_list:
    expr
    |    expr_list ',' expr
    ;

boolean_expr:
    expr
    ;

primary_expr:
        LITERAL
        {
            $$ = new_expr(ASTT_LITERAL, NULL, NULL); $$->sym = $1;
            fprintf(stderr, " primary_expr <- LITERAL(%s)\n", $1->name);
        }
    |   qualified_identifier
        {
            Symbol * orig;
            orig = check_id_decl(current_symbol_table, $1->name);
            if(orig == NULL)
                orig = check_id_decl(global_symbol_table, $1->name);
            if(orig == NULL) {
                printf("error (line %ld): undeclared identifier %s.\n", line, $1->name);
                exit(0);
            }

            $$ = new_expr(ASTT_IDENTIFIER, NULL, NULL);
            $$->sym = orig;
            fprintf(stderr, "primary_expr <- qualified_identifier_expr\n");
        }
    |   '(' expr ')'
        {
            $$ = $2;
        }
    |   element_access
    |   call
    |   post_inc_expr
    |   post_dec_expr
    |   new_expr
    |   member_access
    ;
 
unary_expr:
    primary_expr 
        { $$ = $1; }
    |   '+' unary_expr
        { $$ = $2; $$->op = '+'; }
    |   '-' unary_expr
        { $$ = $2; $$->op = '-'; }
    |   '!' unary_expr
        { $$ = $2; $$->op = '!'; }
    |   '~' unary_expr
        { $$ = $2; $$->op = '~'; }
    |   pre_inc_expr
    |   pre_dec_expr
    ;

call:
    primary_expr '(' arg_list ')'
        {
            $$ = new_expr(ASTT_CALL, $1, $3);
            fprintf(stderr, " call <- primary_expr ( arg_list )\n");
        }
    ;

element_access:
        primary_expr '[' expr ']'
        {
            $$ = new_expr(ASTT_INDEX, $1, $3);
            $$->op = INDEX;
            fprintf(stderr, " element_access <- primary-expr(pex[ex])\n");
        }
    ;
    
new_expr:
    new_object_expr
/*
    | new_array_expr
    | new_delegate_expr
*/
    ;

new_object_expr:
    NEW type '(' arg_list ')'
        {
            $$ = new_expr(ASTT_NEW_OBJECT, $4, NULL);
            $$->type = $2;
        }
    ;

mult_expr:
    unary_expr
    |   mult_expr '*' unary_expr
        {
            $$ = new_op_expr($1, '*', $3);
        }
    |   mult_expr '/' unary_expr
        {
            $$ = new_op_expr($1, '/', $3);
        }
    |   mult_expr '%' unary_expr
        {
            $$ = new_op_expr($1, '%', $3);
        }
    ;

add_expr:
    mult_expr
    |   add_expr '+' mult_expr
        {
            $$ = new_op_expr($1, '+', $3);
        }
    |   add_expr '-' mult_expr
        {
            $$ = new_op_expr($1, '-', $3);
        }
    ;

conditional_expr:
    conditional_or_expr
    |   conditional_or_expr '?' expr ':' expr
    {
        /* Ternary is just a if/then/else statement which can return a value */
        $$ = new_if($1, $3, $5);
        $$->asttype = ASTT_CONDITIONAL_EXPR;
    }
    ;

conditional_and_expr:
    inclusive_or_expr
    |   conditional_and_expr LOGICAL_AND inclusive_or_expr
    {
        $$ = new_logical_expr($1, LOGICAL_AND, $3);
    }
    ;

conditional_or_expr:
    conditional_and_expr
    |   conditional_or_expr LOGICAL_OR conditional_and_expr
    {
        $$ = new_logical_expr($1, LOGICAL_OR, $3);
    }
    ;

and_expr:
    equality_expr
    |   and_expr '&' equality_expr
        {
            $$ = new_op_expr($1, '&', $3);
        }
    ;

exclusive_or_expr:
    and_expr
    |   exclusive_or_expr '^' and_expr
        {
            $$ = new_op_expr($1, '^', $3);
        }
    ;

inclusive_or_expr:
    exclusive_or_expr
    |   inclusive_or_expr '|' exclusive_or_expr
        {
            $$ = new_op_expr($1, '|', $3);
        }
    ;

relational_op:
    '<'
        {$$ = '<';}
    |   '>'
        {$$ = '>';}
    |   LOGICAL_LTE
        {$$ = LOGICAL_LTE;}
    |   LOGICAL_GTE
        {$$ = LOGICAL_GTE;}
    ;

relational_expr:
    shift_expr
    |   relational_expr relational_op shift_expr
        {
            $$ = new_expr(ASTT_COMPARISON, $1, $3);
            $$->op = $2;
        }
    ;

equality_expr:
    relational_expr
    |   equality_expr LOGICAL_EQ relational_expr
        {
            $$ = new_expr(ASTT_COMPARISON, $1, $3);
            $$->op = LOGICAL_EQ;
        }
    |   equality_expr LOGICAL_NE relational_expr
        {
            $$ = new_expr(ASTT_COMPARISON, $1, $3);
            $$->op = LOGICAL_NE;
        }
    ;        

shift_expr:
    add_expr
    |   shift_expr LEFT_SHIFT add_expr
        {
            $$ = new_op_expr($1, LEFT_SHIFT, $3);
        }  
    |   shift_expr RIGHT_SHIFT add_expr
        {
            $$ = new_op_expr($1, RIGHT_SHIFT, $3);
        }  
    ;

decl_statement:
    local_var_decl ';'
        { $$ = $1;    }
    |   CONST type IDENTIFIER '=' LITERAL ';'
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
             * statement exprs, then discard symbol list.
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
                    id = new_expr(ASTT_IDENTIFIER, NULL, NULL);
                    id->sym = sym;
                    init_expr = new_expr(ASTT_ASSIGN, id, sym->init_expr);
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
    {
        $$ = $1;
        fprintf(stderr, " var_declarator <- IDENTIFIER(%s)\n", $1->name);
    }
    |   IDENTIFIER '=' expr
        {
            $$ = $1; $$->init_expr = $3;
            fprintf(stderr, " var_declarator <- IDENTIFER(%s)=init_expr\n", $1->name);
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
            $3->kind = METHOD;
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

method_modifiers:    /*NULL*/    
    |    method_modifiers method_modifier
    ;

method_modifier:
    STATIC
    |    VIRTUAL
    |    PUBLIC
    |    PRIVATE
    |    PROTECTED
    ;

formal_param_list:    /*NULL*/
        { $$ = NULL; }
    |   fixed_params
        { $$ = $1; }
/*
    |   fixed_params ',' param_array
    |   param_array
*/
    ;
        
fixed_params:
    fixed_param
    |   fixed_params ',' fixed_param
        {
            $$ = $1;
            tunshift_sym(&($$), $3);
        }
    ;
    
fixed_param:
    type IDENTIFIER
        {
            fprintf(stderr, " fixed_param <- type IDENTIFIER(%s)\n", $2->name);
            $2->type = $1;
            $$ = $2;
        }
    ;

/*
param_modifier:
    REF
    |   OUT
    ;
    
param_array:
    attributes PARAMS array_type IDENTIFIER
    ;
*/
    
member_name:
    IDENTIFIER
        {
            fprintf(stderr, " member_name <- IDENTIFIER (%s)\n", $1->name);
            $$ = $1;
            check_id_redecl(current_symbol_table, $1->name);
            if(lookup_symbol(current_symbol_table, $1->name)) {
                    printf("Warning: declaration of '%s' shadows previous instance.\n",
                            $1->name);
            }
        }
/*
    |   interface_type '.' IDENTIFIER
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
        if(!(yyin = fopen(argv[1], "r")))    {
            printf( "Error reading source file %s.\n", argv[1] );
            exit(0);
        }
    }
    else {
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
        store_identifier(current_symbol_table, "strlen", METHOD, t_int32);
        store_identifier(current_symbol_table, "strchop", METHOD, t_string);
        store_identifier(current_symbol_table, "strrep", METHOD, t_string);
        store_identifier(current_symbol_table, "ord", METHOD, t_int32);
        store_identifier(current_symbol_table, "sleep", METHOD, t_void);
    }

    printf("#Starting parse...\n");
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

int yyerror(char * s)
{
    fprintf(stderr, "last token = [%s]\n", yytext); 
    fprintf(stderr, "(error) line %ld: %s\n", line, s );
    fprintf(stderr, "Didn't create output asm.\n" );
    exit(0);
}

