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
Type        *t_void,
            *t_string,
            *t_int,
            *t_float;

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
%type <ast> expression_statement selection_statement if_statement
%type <ast> iteration_statement while_statement for_statement
%type <ast> qualified_identifier_expr
%type <ast> expression_list expression statement_expression assignment
%type <ast> primary_expression boolean_expression equality_expression element_access
%type <ast> paren_expression primary_expression_no_paren element_access
%type <ast> post_inc_expr post_dec_expr pre_inc_expr pre_dec_expr
%type <ast> postfix_expression new_expression new_object_expression
%type <ast> conditional_expression conditional_or_expression
%type <ast> conditional_and_expression inclusive_or_expression and_expression
%type <ast> shift_expression exclusive_or_expression relational_expression
%type <ast> unary_expression unary_expression_not_plusminus add_expression mult_expression
%type <ast> equality_expression relational_expression
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
            fprintf(stderr, "qualified_identifier -> IDENTIFIER(%s)\n", NAME($1));
        }
    |   qualified_identifier '.' IDENTIFIER
        {
            $$ = $1;
            /* Build a list of ('System', 'Console', 'Write') */
            tunshift_sym(&($$), $3);
        }
    ;

qualified_identifier_expr:
    qualified_identifier
        {
            Symbol * orig;
            orig = check_id_decl(current_symbol_table, $1->name);
            if(orig == NULL)
                orig = check_id_decl(global_symbol_table, $1->name);
            if(orig == NULL) {
                printf("error (line %ld): undeclared identifier %s.\n", line, $1->name);
                exit(0);
            }

            $$ = new_expression(ASTT_IDENTIFIER, NULL, NULL);
            $$->sym = orig;
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
            printf("class_scope_start\n");
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
    |   expression_statement
        { $$ = $1; }
    |   selection_statement
        { $$ = $1;}
    |   iteration_statement
        { $$ = $1;}
    |   jump_statement
        { $$ = $1;}
    |   return_statement
        { $$ = $1; }
    |   asm_block
        { $$ = $1; }
    ;

statement:
    embedded_statement
    |    decl_statement
    |    labeled_statement
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

expression_statement:
    statement_expression ';'
        { $$ = $1; }
    ;

statement_expression:
    call
    |   assignment
    |   post_inc_expr
    |   post_dec_expr
    |   pre_inc_expr
    |   pre_dec_expr
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
    RETURN expression ';'
        {    $$ = new_statement(ASTT_RETURN, $2, NULL); }
    |   RETURN ';'
        {    $$ = new_statement(ASTT_RETURN, NULL, NULL); }
    ;
    
asm_block:
    ASM '(' LITERAL ')' ';'
    { $$ = NULL; }
    ;

call:
    primary_expression_no_paren '(' arg_list ')'
        {
            $$ = new_expression(ASTT_CALL, $1, $3);
            fprintf(stderr, "call -> primary_expression\n");
        }
    |   qualified_identifier '(' arg_list ')'
        {
            Symbol * orig;
            AST * id;
            orig = check_id_decl(current_symbol_table, $1->name);
            if(orig == NULL)
                orig = check_id_decl(global_symbol_table, $1->name);
            if(orig == NULL) {
                printf("error (line %ld): undeclared identifier %s.\n", line, $1->name);
                exit(0);
            }

            id = new_expression(ASTT_IDENTIFIER, NULL, NULL);
            id->sym = orig;
        
            $$ = new_expression(ASTT_CALL, id, $3);
            fprintf(stderr, "call -> qualified_identifier(%s)\n", NAME($1));
        }
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
    |   expression
        { fprintf(stderr, "arg -> expression\n"); $$ = $1;    }
    |   REF
        { $$ = NULL; }
    |   OUT
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
    |   IF '(' boolean_expression ')' embedded_statement
        {
            $$ = new_if($3, $5, NULL);
        }
    ;

iteration_statement:
    while_statement
    |   for_statement
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
            fprintf(stderr, "type_name -> IDENTIFIER (%s)\n", $1->name);
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
            fprintf(stderr, "type -> array_type\n");
        }
    |   non_array_type
        {
            $$ = $1;
            fprintf(stderr, "type -> non_array_type\n");
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
    {
        $$ = $1;
        fprintf(stderr, "struct_type -> type_name\n");
    }
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
/*
        array_type rank_specifiers
    |
*/
        simple_type rank_specifiers
        {
            $$ = (void *)new_array($1, $2);
            fprintf(stderr, "array_type: array of %s\n", type_name($1));
        }
    |   qualified_identifier rank_specifiers
        {
            Type * t;
            t = lookup_type($1->name);
            $$ = (void *)new_array(t, $2);
            fprintf(stderr, "array_type: array of %s\n", type_name(t));
        }
    ;
        
non_array_type:
    simple_type
        {
            $$ = $1;
            fprintf(stderr, "non_array_type -> simple_type\n");
        }
    |   type_name
    ;
    
rank_specifiers:
    rank_specifier
        {
            /* $1 is the dimension of the current rank */
            $$ = (void *)new_rank($1);
            fprintf(stderr, "rank_spec %d\n", $1);
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
            fprintf(stderr, "rank_spec([ dim_separators ])\n");
        }
    |   '[' ']'
        {   $$ = 1;
            fprintf(stderr, "rank_spec([])\n");
        }
    ;

dim_separators:
    ','
        { $$ = 1; }
    |   dim_separators ','
        { $$ = $1 + 1; }
    ; 
    
assignment:
    unary_expression '=' expression
        {   $$ = new_expression(ASTT_ASSIGN, $1, $3);   }
    /*
    |   unary_expression compound_assign_op expression
        {
            $$ = new_expression(ASTT_ASSIGN, $1, new_op_expression($1, $2, $3));
        }
    */
    ;

/*
compound_assign_op:

    ;
*/
  
member_access:
    primary_expression '.' IDENTIFIER
/*
    |   predefined_type '.' IDENTIFIER
*/
    ;

postfix_expression:
        primary_expression
    |   qualified_identifier_expr
    |   post_inc_expr
    |   post_dec_expr
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
    postfix_expression INC
        {
            $$ = new_expression(ASTT_POSTINC, $1, NULL);
            $$->op = INC;
        }
    ;

post_dec_expr:
    postfix_expression DEC
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
            $$->type = $2;
        }
    ;

primary_expression:
        paren_expression
    |   primary_expression_no_paren
    ;
     
primary_expression_no_paren:
        LITERAL
        {
            $$ = new_expression(ASTT_LITERAL, NULL, NULL); $$->sym = $1;
            fprintf(stderr, "primary_expression(%s)\n", $1->name);
        }
    |   element_access
    |   call
    |   post_inc_expr
    |   post_dec_expr
    |   new_expression
    |   member_access
    ;
    
paren_expression:
    '(' expression ')'
        {   $$ = $2;    }
    ;
    
element_access:
        primary_expression '[' expression ']'
        {
            $$ = new_expression(ASTT_INDEX, $1, $3);
            $$->op = INDEX;
            fprintf(stderr, "primary-expression(pex[ex])\n");
        }
    |   qualified_identifier '[' expression ']'
        {
            Symbol * orig;
            AST * id;
            orig = check_id_decl(current_symbol_table, $1->name);
            if(orig == NULL)
                orig = check_id_decl(global_symbol_table, $1->name);
            if(orig == NULL) {
                printf("error (line %ld): undeclared identifier %s.\n", line, $1->name);
                exit(0);
            }

            id = new_expression(ASTT_IDENTIFIER, NULL, NULL);
            id->sym = orig;
            $$ = new_expression(ASTT_INDEX, id, $3);
            $$->op = INDEX;
            fprintf(stderr, "primary-expression(%s)\n", NAME(orig));
        }
    ;
    
expression:
    conditional_expression
        {
            $$ = $1;
            fprintf(stderr, "conditional_expression\n");
        } 
    |   assignment
    ;

boolean_expression:
    expression
/*    {
        $$ = new_expression(ASTT_BOOLEAN, $1, NULL);
    }
*/
    ;

unary_expression_not_plusminus:
    postfix_expression
    |   '!' unary_expression
        { $$ = $2; $$->op = '!'; }
    |   '~' unary_expression
        { $$ = $2; $$->op = '~'; }
    ;
    
unary_expression:
    unary_expression_not_plusminus
        { $$ = $1; }
    |   qualified_identifier
        { $$ =  new_expression(ASTT_IDENTIFIER, NULL, NULL); $$->sym = $1; }
    |   '+' unary_expression
        { $$ = $2; $$->op = '+'; }
    |   '-' unary_expression
        { $$ = $2; $$->op = '-'; }
    |   pre_inc_expr
    |   pre_dec_expr
    ;


mult_expression:
    unary_expression
    |   mult_expression '*' unary_expression
        {
            $$ = new_op_expression($1, '*', $3);
        }
    |   mult_expression '/' unary_expression
        {
            $$ = new_op_expression($1, '/', $3);
        }
    |   mult_expression '%' unary_expression
        {
            $$ = new_op_expression($1, '%', $3);
        }
    ;

add_expression:
    mult_expression
    |   add_expression '+' mult_expression
        {
            $$ = new_op_expression($1, '+', $3);
        }
    |   add_expression '-' mult_expression
        {
            $$ = new_op_expression($1, '-', $3);
        }
    ;

conditional_expression:
    conditional_or_expression
    |   conditional_or_expression '?' expression ':' expression
    {
        /* Ternary is just a if/then/else statement which can return a value */
        $$ = new_if($1, $3, $5);
        $$->asttype = ASTT_CONDITIONAL_EXPR;
    }
    ;

conditional_and_expression:
    inclusive_or_expression
    |   conditional_and_expression LOGICAL_AND inclusive_or_expression
    {
        $$ = new_logical_expression($1, LOGICAL_AND, $3);
    }
    ;

conditional_or_expression:
    conditional_and_expression
    |   conditional_or_expression LOGICAL_OR conditional_and_expression
    {
        $$ = new_logical_expression($1, LOGICAL_OR, $3);
    }
    ;

and_expression:
    equality_expression
    |   and_expression '&' equality_expression
        {
            $$ = new_op_expression($1, '&', $3);
        }
    ;

exclusive_or_expression:
    and_expression
    |   exclusive_or_expression '^' and_expression
        {
            $$ = new_op_expression($1, '^', $3);
        }
    ;

inclusive_or_expression:
    exclusive_or_expression
    |   inclusive_or_expression '|' exclusive_or_expression
        {
            $$ = new_op_expression($1, '|', $3);
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

relational_expression:
    shift_expression
    |   relational_expression relational_op shift_expression
        {
            $$ = new_expression(ASTT_COMPARISON, $1, $3);
            $$->op = $2;
        }
    ;

equality_expression:
    relational_expression
    |   equality_expression LOGICAL_EQ relational_expression
        {
            $$ = new_expression(ASTT_COMPARISON, $1, $3);
            $$->op = LOGICAL_EQ;
        }
    |   equality_expression LOGICAL_NE relational_expression
        {
            $$ = new_expression(ASTT_COMPARISON, $1, $3);
            $$->op = LOGICAL_NE;
        }
    ;        

shift_expression:
    add_expression
    |   shift_expression LEFT_SHIFT add_expression
        {
            $$ = new_op_expression($1, LEFT_SHIFT, $3);
        }  
    |   shift_expression RIGHT_SHIFT add_expression
        {
            $$ = new_op_expression($1, RIGHT_SHIFT, $3);
        }  
    ;

expression_list:
    expression
    |    expression_list ',' expression
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
    {
        $$ = $1;
        fprintf(stderr, "var_declarator(%s)\n", $1->name);
    }
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
            fprintf(stderr, "fixed_param -> type IDENTIFIER\n");
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
            fprintf(stderr, "member_name -> IDENTIFIER (%s)\n", $1->name);
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
        store_identifier(current_symbol_table, "strlen", METHOD, t_int);
        store_identifier(current_symbol_table, "strchop", METHOD, t_string);
        store_identifier(current_symbol_table, "strrep", METHOD, t_string);
        store_identifier(current_symbol_table, "ord", METHOD, t_int);
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

int yyerror( char * s )
{
    fprintf(stderr, "last token = [%s]\n", yytext); 
    fprintf(stderr, "(error) line %ld: %s\n", line, s );
    fprintf(stderr, "Didn't create output asm.\n" );
    exit(0);
}

