%{
/*
 * cola.y
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * Borrows heavily from Java and C#
 *     Java is a registered trademark of Sun Microsystems
 *     C# is a registered trademark of Microsoft Corporation
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

%token ABSTRACT BOOL BREAK BYTE CHAR CLASS CONST
%token CONTINUE
%token DOUBLE DECIMAL ELSE EXTERN
%token FALSE FLOAT FOR
%token GET GOTO
%token IF INT INTERNAL
%token LONG METHOD MODIFIER NEW NAMESPACE NULLVAL
%token OUT OVERRIDE OBJECT PRIVATE PROTECTED PUBLIC
%token REF READONLY RETURN
%token SBYTE SET SHORT STRING STATIC
%token THIS TRUE TYPE
%token UINT USHORT ULONG USING VIRTUAL VOID WHILE
%token <sym> IDENTIFIER LITERAL RANKSPEC
%token <ival> INC DEC LOGICAL_AND LOGICAL_OR LOGICAL_EQ LOGICAL_NE
%token <ival> LOGICAL_LTE LOGICAL_GTE
%token <ival> LEFT_SHIFT RIGHT_SHIFT INDEX

%token TYPE METHOD

%type <sym> type array_type
%type <sym> predefined_type integral_type
%type <sym> qualified_name member_access
%type <sym> namespace_scope_start class_scope_start
%type <sym> formal_param_list fixed_params fixed_param
%type <ast> var_declarator var_declarators
%type <ast> using_directives using_directive attribute_list
%type <ast> namespace_member_decls namespace_member_decl
%type <ast> namespace_decl class_decl namespace_body
%type <ast> return_statement jump_statement asm_block
%type <ast> statement statement_list
%type <ast> decl_statement method_decl field_decl
%type <ast> class_body class_member_decl_list class_member_decl
%type <ast> local_var_decl
%type <ast> method_header method_body
%type <ast> block labeled_statement embedded_statement
%type <ast> expr_statement selection_statement if_statement
%type <ast> iteration_statement while_statement for_statement
%type <ast> expr_list expr statement_expr assignment
%type <ast> primary_expr boolean_expr equality_expr element_access
%type <ast> post_inc_expr post_dec_expr pre_inc_expr pre_dec_expr
%type <ast> new_expr new_object_expr
%type <ast> conditional_expr conditional_or_expr
%type <ast> conditional_and_expr inclusive_or_expr and_expr
%type <ast> shift_expr exclusive_or_expr relational_expr
%type <ast> unary_expr add_expr mult_expr
%type <ast> method_call arg arg_list
%type <ival> modifier modifiers opt_modifiers
%type <ival> relational_op
%type <sym> rank_specifiers

%left '-' '+'
%left '*' '/'
%nonassoc IF
%nonassoc ELSE
%right '='
%nonassoc UMINUS INC DEC
%left '('
%left '[' '{'
%left '.'

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
        {
            printf("using_directive\n");
            /*load_module($2->name);*/
        }
    ;

attribute_list    :    /*NULL*/
        { $$ = NULL; }
    ;

namespace_decl:
    namespace_scope_start namespace_body
        {
            pop_namespace();
            $$ = new_ast(KIND_DECL, ASTT_NAMESPACE_DECL, $2, NULL);
            $$->sym = $1;
        }
    ;

namespace_scope_start:
    NAMESPACE qualified_name
        {
            Symbol *n, *t, *last = current_namespace;
            if(lookup_type_symbol($2)) {
                printf("Error, redefinition of [%s]\n", $2->name);
                exit(0);
            }
            for(n = split(".", $2->name); n; n = n->tnext) {
                n->kind = $2->kind;
                t = mk_namespace_symbol(n);
                store_symbol(last->table, t);
                last = n;
            }
            push_namespace(t);
            $$ = t;
        }
    ;

qualified_name:
    IDENTIFIER
        { $$ = $1; fprintf(stderr, "qualified_name <- IDENTIFIER\n"); }
    |   qualified_name '.' IDENTIFIER
        {
            $$ = symbol_join3($1, new_symbol("."), $3);
            fprintf(stderr, "qualified_name <- qualified_name . IDENTIFIER\n");
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

class_decl:
    opt_modifiers class_scope_start class_body optional_semi
        {
            pop_namespace();
            $$ = new_ast(KIND_DECL, ASTT_CLASS_DECL, NULL, NULL);
            $$->Attr.Class.body = $3;
            $$->sym = $2;
            $$->sym->flags = $1;
        }
    ;

opt_modifiers:
        { $$ = 0; }
    |   modifiers
    ;

modifiers:
    modifiers modifier
        { $$ = $1 | $2; }
    |   modifier
    ;

modifier:
    PUBLIC
        { $$ = MOD_PUBLIC; }
    |   PRIVATE
        { $$ = MOD_PRIVATE; }
    |   PROTECTED
        { $$ = MOD_PROTECTED; }
    |   STATIC
        { $$ = MOD_STATIC; }
    |   VIRTUAL
        { $$ = MOD_VIRTUAL; }
    ;

class_body:
    '{' class_member_decl_list '}'
        { $$ = $2; }
    ;

class_scope_start:
    CLASS IDENTIFIER
        {
            /* Create a new namespace for class and put it in effect */
            Symbol * c;
#if DEBUG
            fprintf(stderr, "\nclass_scope_start <- CLASS IDENTIFIER (%s)\n", $2->name);
#endif
            c = mk_class_symbol($2);
            push_namespace(c);
/*
            push_scope();
*/
            $$ = c;
        }
    ;

class_member_decl_list:
        { $$ = NULL; }
    |   class_member_decl_list class_member_decl
        {
            $$ = $1;
            unshift_ast(&($$), $2);
        }
    ;

class_member_decl:
    field_decl
    |   method_decl
/*
    |   property_decl
    |        event_decl
    |        indexer_decl
    |        operator_decl
    |        constructor_decl
    |        destructor_decl
    |        static_constructor_decl
    |        type_decl
*/
    ;


decl_statement:
    local_var_decl ';'
        { $$ = $1; }
    |   CONST type IDENTIFIER '=' LITERAL ';'
        {
            $3->typename = $2;
            $3->literal = $5;
            check_id_redecl(current_symbol_table, $3->name);
            store_symbol(current_symbol_table, $3);
            $$ = new_statement(ASTT_CONSTANT_DECL, NULL, NULL);
            $$->typename = $2;
            if(lookup_symbol_in_tab(current_symbol_table, $$->sym->name)) {
                    printf("Warning: declaration of '%s' shadows previous instance.\n",
                            $$->sym->name);
            }
        }
    ;

local_var_decl:
    type var_declarators
        {
            AST * decl;
            if($1 == NULL) {
                printf("Internal compiler error: local_var_decl: type is NULL\n");
                abort();
            }
            for(decl=$2; decl; decl = decl->next) {
#if DEBUG
                fprintf(stderr, "local_var: [%s] typename [%s]\n",
                        decl->arg1->sym->name, $1->name);
#endif
                decl->arg1->sym->typename = $1;
            }
            $$ = $2;
        }
    ;

field_decl:
    opt_modifiers type var_declarators ';'
        {
            AST * decl;
            if($2 == NULL) {
                printf("Internal compiler error: field_decl: type is NULL\n");
                abort();
            }
            for(decl=$3; decl; decl = decl->next) {
#if DEBUG
                fprintf(stderr, "field: [%s] typename [%s]\n",
                        decl->arg1->sym->name, $2->name);
#endif
                decl->arg1->sym->typename = $2;
            }
            $$ = $3;
        }
    ;

var_declarators:
    var_declarator
    |   var_declarators ',' var_declarator
        {
            $$ = $1;
            unshift_ast(&($$), $3);
        }
    ;

var_declarator:
   IDENTIFIER '=' expr
        {
            AST * decl, * init;
            decl = new_expr(ASTT_IDENTIFIER, NULL, NULL);
            decl->sym = $1;
            init = new_expr(ASTT_ASSIGN, decl, $3);
            $$ = new_statement(ASTT_FIELD_DECL, decl, init);
#if DEBUG
        fprintf(stderr, " var_declarator <- IDENTIFER(%s)=init_expr\n", $1->name);
#endif
        }
    |   IDENTIFIER
        {
            AST * decl = new_expr(ASTT_IDENTIFIER, NULL, NULL);
            decl->sym = $1;
            $$ = new_statement(ASTT_FIELD_DECL, decl, NULL);
#if DEBUG
        fprintf(stderr, " var_declarator <- IDENTIFIER(%s)\n", $1->name);
#endif
        }
    ;

method_decl:
    method_header method_body
        {
            $$ = $1;
            $$->Attr.Method.body = $2;
        }
    ;

method_header:
    opt_modifiers type IDENTIFIER '(' formal_param_list ')'
        {
            Symbol * param;
            $$ = new_statement(ASTT_METHOD_DECL, NULL, NULL);
            $3->kind = METHOD;
            $3->typename = $2;
            $3->flags = $1;
            $$->sym = $3;
            $$->Attr.Method.params = $5;
            /* Methods/Fields stored at scope 0 of class namespace.
             * We can store these at parse time.
             */
            store_symbol(current_symbol_table, $$->sym);
            if($1 & MOD_STATIC) {
                if(!strcmp($3->name, "Main")) {
                    if(main_method)
                        fprintf(stderr,
                        "Warning: multiple definitions of a static Main()\n");
                    main_method = $3;
                }
            }
        }
    |   opt_modifiers VOID IDENTIFIER '(' formal_param_list ')'
        {
            Symbol * param;
            $$ = new_statement(ASTT_METHOD_DECL, NULL, NULL);
            $3->kind = METHOD;
            $3->typename = new_type_symbol("void");
            $3->flags = $1;
            $$->sym = $3;
            $$->Attr.Method.params = $5;
            /* Methods/Fields stored at scope 0 of class namespace.
             * We can store these at parse time.
             */
            store_symbol(current_symbol_table, $$->sym);
            if($1 & MOD_STATIC) {
                if(!strcmp($3->name, "Main")) {
                    if(main_method)
                        fprintf(stderr,
                        "Warning: multiple definitions of a static Main()\n");
                    main_method = $3;
                }
            }
        }

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
#if DEBUG
            fprintf(stderr, " fixed_param <- type IDENTIFIER(%s)\n", $2->name);
#endif
            $2->typename = $1;
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

method_body:
    block
        { $$ = $1; }
    ;

block:
    '{' block_scope statement_list '}'
        {
            $$ = $3;
            if($$) {
                $$->vars = pop_scope();
            } else {
                discard_scope();
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
        { $$ = $1;   }
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

type:
    qualified_name
        {
            fprintf(stderr, "!TYPE[%s]\n", $1->name);
            $$ = $1;
        }
    |   predefined_type
    |   array_type
    ;

predefined_type:
    BOOL
        { $$ = new_type_symbol("bool"); }
    |   STRING
        { $$ = new_type_symbol("string"); }
    |   FLOAT
        { $$ = new_type_symbol("float"); }
    |   integral_type
    ;

integral_type:
    INT
        { $$ = new_type_symbol("int"); }
    |   BYTE
        { $$ = new_type_symbol("byte"); }
    ;

array_type:
    type rank_specifiers
        {
            $$ = symbol_concat($1, $2);
#if DEBUG
            fprintf(stderr, " array_type: %s\n", $1->name);
#endif
        }
    ;

rank_specifiers:
        RANKSPEC
        {
            /* $1 is the dimension of the current rank */
            $$ = $1;
#if DEBUG
            fprintf(stderr, " rank_spec /%s/\n", $1->name);
#endif
        }
    |   rank_specifiers RANKSPEC
        {
            $$ = symbol_concat($1, $2);
        }
    ;

/*
 * Expressions
 */
statement_expr:
    method_call
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

/*
 * Expressions
 */
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

expr:
    conditional_expr
        {
            $$ = $1;
#if DEBUG
            fprintf(stderr, " expr <- conditional_expr\n");
#endif
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
#if DEBUG
            fprintf(stderr, " primary_expr <- LITERAL(%s)\n", $1->name);
#endif
        }
    |   IDENTIFIER
        {
            Symbol * orig;
            $$ = new_expr(ASTT_IDENTIFIER, NULL, NULL);
            $$->sym = $1;
#if DEBUG
            fprintf(stderr, " primary_expr <- IDENTIFIER(%s)\n", $1->name);
#endif
        }
    |   '(' expr ')'
        {
            $$ = $2;
        }
    |   element_access
    |   method_call
    |   post_inc_expr
    |   post_dec_expr
    |   new_expr
    |   member_access
        { $$ = new_expr(ASTT_IDENTIFIER, NULL, NULL); $$->sym = $1; }
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

method_call:
    primary_expr '(' arg_list ')'
        {
            if($1->asttype != ASTT_IDENTIFIER) {
                fprintf(stderr, "Error (line %d), method call must be a simple name or member access.\n", line);
                exit(0);
            }
            $$ = new_expr(ASTT_METHOD_CALL, $1, $3);
#if DEBUG
            fprintf(stderr, " method_call <- primary_expr ( arg_list )\n");
#endif
        }
    ;

member_access:
    qualified_name
    { $$ = $1;
#if DEBUG
            fprintf(stderr, " member_access <- qualified_name\n");
#endif
    }
    ;

element_access:
    primary_expr '[' expr ']'
        {
            $$ = new_expr(ASTT_INDEX, $1, $3);
            $$->op = INDEX;
#if DEBUG
            fprintf(stderr, " element_access <- primary-expr(pex[ex])\n");
#endif
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
            /* $2 is a Symbol of a typename, will resolve to a real type
             * in semantic pass.
             */
            $$->typename = $2;
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
        $$ = new_conditional($1, $3, $5);
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
            $$ = new_op_expr($1, '~', $3);
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


%%



extern FILE *yyin;


int main(int argc, char * argv[])
{
    fprintf(stderr, "Cola - Copyright (C) 2002 Melvin Smith <melvins@us.ibm.com>\n");
    fprintf(stderr, "colac version %s\n\n", COLA_VERSION);
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
        store_method(current_symbol_table, "puts", t_void);
        store_method(current_symbol_table, "puti", t_void);
        store_method(current_symbol_table, "putf", t_void);
        store_method(current_symbol_table, "gets", t_string);
        store_method(current_symbol_table, "substr", t_string);
        store_method(current_symbol_table, "strlen", t_int32);
        store_method(current_symbol_table, "strchop", t_string);
        store_method(current_symbol_table, "strrep", t_string);
        store_method(current_symbol_table, "ord", t_int32);
        store_method(current_symbol_table, "sleep", t_void);
    }

    fprintf(stderr, "Pass 1: Starting parse...\n");
    yyparse();
    fclose(yyin);

    fprintf(stderr, "Pass 2: Type checking...\n");
    fprintf(stderr, "Pass 2: Start scope is [%d]\n", scope);
    build_ast(ast_start);

    fprintf(stderr, "Pass 3: Semantic checking...\n");
    /*semant_ast(ast_start); */

    freopen("a.imc", "w", stdout);
    fprintf(stderr, "Compiling intermediate code to a.imc\n");
/*
    printf( "#Dump of global namespace:\n" );
    indent = 0;
    dump_namespace(current_namespace);
*/
    printf("# Cola (%s) generated\n#\n", COLA_VERSION);
    if(main_method) {
        printf(".sub _MAIN\n\t.arg \"\"\n\tcall _%s__%s\n",
            main_method->namespace->name, main_method->name);
        printf("\tend\n\tret\n.end\n");
#if 0
        printf("\n__END:\n\tend\n\n");
#endif
    }
    fprintf(stderr, "Pass 4: Code generation...\n");

    if(ast_start) {
        gen_ast(ast_start);
    }

    printf("# Include standard API stuff\n");
    printf(".include \"core.imc\"\n\n");
    fflush(stdout);
    fprintf(stderr, "%ld lines compiled to PIR.\n", line);
    fprintf(stderr, "Generating PASM\n");
    system("../../parrot -o a.pasm a.imc");
    fprintf(stderr, "Generating PBC (Bytecode)\n");
    system("../../parrot -o a.pbc a.imc");
    return 0;
}

int yyerror(char * s)
{
/*
    fprintf(stderr, "last token = [%s]\n", yylval.sym->name);
*/
    fprintf(stderr, "(error) line %ld: %s\n", line, s );
    fprintf(stderr, "Didn't create output asm.\n" );
    exit(0);
}

