%{

/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */


#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <stdarg.h>
#include <math.h>

#include "macro.h"

/* prevent declarations of malloc() and free() in macroparser.h */
#define YYMALLOC
#define YYFREE

#include "macroparser.h"

#include "lexer.h"

#include "parrot/string_funcs.h"
#include "parrot/parrot.h"


/* prevent inclusion of <unistd.h> on windows */
#define YY_NO_UNISTD_H

/* declare yylex prototype BEFORE inclusion of lexer header file. */
#define YY_DECL int macrolex(YYSTYPE *yylval, yyscan_t yyscanner)

/* inlude flex-generated lexer header file. */
#include "macrolexer.h"

/* declare yylex. */
extern YY_DECL;

/* declare yyerror */
int yyerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message, ...);

#define YYDEBUG         1


#ifndef YYENABLE_NLS
#  define YYENABLE_NLS 0
#endif

#ifndef YYLTYPE_IS_TRIVIAL
#  define YYLTYPE_IS_TRIVIAL 0
#endif




static void process_file(char const * const filename, lexer_state * const lexer);
static void process_string(char const * const buffer, lexer_state * const lexer);
static void include_file(char const * const filename, lexer_state * const lexer, int currentline);
static void expand(yyscan_t yyscanner, macro_def * const macro, list *args,
                   lexer_state * const lexer);

static void define_constant(constant_table * const table, char const * const name,
                            char const * const value);

static void define_macro(constant_table * const table, char const * const name, list * const parameters,
                         char const * const body, int line_defined);

static void emit(lexer_state * const lexer, char const * const str);
static void emitf(lexer_state * const lexer, char const * const str, ...);

static list *new_list(char const * const first_item);
static list *add_item(list * const L, char const * const item);

static char *munge_id(char const * const label_id, int is_label_declaration,
                      lexer_state * const lexer);

static constant_table *new_constant_table(constant_table * const current,
                                          lexer_state * const lexer);

static constant_table *pop_constant_table(lexer_state * const lexer);

static void delete_constant_table(constant_table *table);
static void update_unique_id(lexer_state * const lexer);

macro_def *find_macro(constant_table * const table, char * const name);

extern char *dupstr(char const * const str);
extern char *dupstrn(char const * const str, size_t len);

static char const *concat(char const *str1, char const *str2, int insert_space);
static char *concatn(int insert_space, unsigned numargs, ...);


%}

%union {
    char const       *sval;
    struct list      *lval;
    struct macro_def *mval;
}


%token TK_MACRO                     ".macro"
       TK_NL                        "\n"
       TK_ENDM                      ".endm"
       TK_INCLUDE                   ".include"
       TK_MACRO_CONST               ".macro_const"
       TK_MACRO_LOCAL               ".macro_local"
       TK_MACRO_LABEL               ".macro_label"

%token <sval> TK_INT                "int"
       <sval> TK_NUM                "num"
       <sval> TK_STRING             "string"
       <sval> TK_PMC                "pmc"

%token <sval> TK_IDENT              "identifier"
       <sval> TK_ANY                "any token"
       <sval> TK_BODY               "macro body"
       <mval> TK_DOT_IDENT          ".identifier"
       <sval> TK_LABEL_ID           "label"
       <sval> TK_LOCAL_ID           "$identifier"

%token <sval> TK_VAR_EXPANSION      "var expansion"
       <sval> TK_LABEL_EXPANSION    "label target expansion"
       <sval> TK_UNIQUE_LABEL       "unique label"
       <sval> TK_UNIQUE_LOCAL       "unique local"

%token <sval> TK_STRINGC            "string constant"
       <sval> TK_NUMC               "number constant"
       <sval> TK_INTC               "integer constant"

%type <sval> expression
             macro_body
             opt_macro_body
             arg
             body_token
             label_declaration
             local_declaration
             type
             long_arg
             braced_arg

%type <lval> arguments
             opt_arg_list
             arg_list
             parameters
             opt_param_list
             param_list




/* generated parser is in "macroparser.c" */
%output="macroparser.c"

/* replace Bison's standard prefix "yy" by "macro" */
%name-prefix="macro"

/* for more helpful error messages */
%error-verbose

/* declare parameters to move around */
%parse-param {yyscan_t yyscanner}
%lex-param   {yyscan_t yyscanner}

%parse-param { struct lexer_state *lexer }

%pure-parser

%start program

%%


program               :
                      | opt_nl statements opt_nl
                      ;

opt_nl                : /* empty */
                      | "\n"
                      ;

statements            : statement
                      | statements newline
                        statement
                      ;

newline               : "\n"
                            { emit(lexer, "\n");  /* after each statement, emit a newline */ }
                      ;

/* handle macro definitions, expansions, include statements
 * and constant definitions. Anything else is skipped.
 */
statement             : macro_definition
                      | include_statement
                      | macro_const_definition
                      | anything
                      ;


/* skip any thing else */
anything              : any
                      | anything any
                      ;

any                   : TK_ANY
                            { emit(lexer, $1); }
                      | TK_DOT_IDENT arguments
                            { expand(yyscanner, $1, $2, lexer); }
                      | TK_LABEL_EXPANSION              /* LABEL: */
                            {
                              char *label = munge_id($1, 1, lexer);
                              emit(lexer, label);
                            }
                      | TK_UNIQUE_LABEL
                            {
                              char *label = munge_id($1, 1, lexer);
                              emit(lexer, label);
                            }
                      | TK_UNIQUE_LOCAL
                            {
                              char *local = munge_id($1, 0, lexer);
                              emit(lexer, local);
                            }
                      | TK_VAR_EXPANSION        /* .$VAR */
                            { char *label = munge_id($1, 0, lexer);
                              emit(lexer, label);
                            }
                      ;


include_statement     : ".include" TK_STRINGC
                            { include_file($2, lexer, macroget_lineno(yyscanner)); }
                      ;

macro_const_definition: ".macro_const" TK_IDENT expression
                            { define_constant(lexer->globaldefinitions, $2, $3); }
                      ;



macro_definition      : macro_keyword TK_IDENT parameters "\n"
                        opt_macro_body
                        ".endm"
                            {
                              define_macro(lexer->globaldefinitions, $2, $3, $5,
                                           lexer->line_defined);
                            }
                      ;

/* separate rule for .macro directive, so we can capture the current line number */
macro_keyword         : ".macro"
                            { lexer->line_defined = macroget_lineno(yyscanner); }
                      ;

opt_macro_body        : /* empty */
                            { $$ = ""; } /*  make sure the macro body is a valid string. */
                      | macro_body
                      ;

macro_body            : body_token
                      | macro_body body_token
                            { $$ = concat($1, $2, 1); }
                      ;

body_token            : TK_ANY
                      | label_declaration
                      | local_declaration
                      ;

label_declaration     : ".macro_label" TK_LABEL_ID
                        { $$ = $2; }
                      ;

local_declaration     : ".macro_local" type TK_LOCAL_ID
                            { /* create a string like ".local <type> <id>" */
                              $$ = concatn(1, 3, ".local", $2, $3);
                            }
                      ;

type                  : "int"
                      | "pmc"
                      | "num"
                      | "string"
                      ;

parameters            : /* empty */
                            { $$ = NULL; }
                      | '(' opt_param_list ')'
                            { $$ = $2;   }
                      ;

opt_param_list        : /* empty */
                            { $$ = NULL; }
                      | param_list
                      ;

param_list            : TK_IDENT
                            { $$ = new_list($1); }
                      | param_list ',' TK_IDENT
                            { $$ = add_item($1, $3); }
                      ;

arguments             : /* empty */
                            { $$ = NULL; }
                      | '(' opt_arg_list ')'
                            { $$ = $2;   }
                      ;

opt_arg_list          : /* empty */
                            { $$ = NULL; }
                      | arg_list
                      ;

arg_list              : arg
                            { $$ = new_list($1); }
                      | arg_list ',' arg
                            { $$ = add_item($1, $3); }
                      ;

arg                   : expression
                      | braced_arg
                      ;

braced_arg            : '{' long_arg '}'
                            { $$ = $2; }
                      ;

long_arg              : /* empty */
                            { $$ = ""; }
                      | long_arg TK_ANY
                            { $$ = concat($1, $2, 0); }
                      ;


/* all types of expressions can probably be handled as a more generic token, such as "TK_EXPR"
 * we don't care if it's a string or a number; it's just text replacing. */
expression            : TK_IDENT
                      | TK_NUMC
                      | TK_INTC
                      | TK_STRINGC
                      ;



%%


/*

=head1 Functions

=over 4

=item C<static list *
new_list(char const * const first_item)>

Create a new list node. The specified item is assigned to the node's value.
Returns the newly created node.

=cut

*/
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static list *
new_list(char const * const first_item) {
    list *L = (list *)mem_sys_allocate_zeroed(sizeof (list));
    L->item = first_item;
    return L;
}

/*

=item C<static list *
add_item(list * const L, char const * const item)>

Add a new item to the specified list. The item is added
at the back of the list, so items added are kept in order.

A pointer to the beginning of the list is returned (the
same as was specified).

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
static list *
add_item(list * const L, char const * const item) {
    list *iter = L;
    PARROT_ASSERT(iter != NULL);

    /* the item is added at the end of the list. This
     * can be done more efficiently, but for now this works.
     */
    while (iter->next != NULL) {
        iter = iter->next;
    }
    /* iter->next is now NULL, link the new node onto it. */
    iter->next = new_list(item);

    return L;
}

/*

=item C<static void
include_file(char const * const filename, lexer_state * const lexer, int currentline)>

Process the specified file.


=cut

*/
static void
include_file(char const * const filename, lexer_state * const lexer, int currentline) {
    char * const temp = dupstrn(filename + 1, strlen(filename) - 1);

    PARROT_ASSERT(filename != NULL);

    fprintf(stderr, "including: %s\n", filename);

    emitf(lexer, "\n.line 1\n");
    emitf(lexer, ".file '%s'\n", temp);

    /* give address of string, skipping opening quote */
    process_file(temp, lexer);

    emitf(lexer, "\n.line %d\n", currentline);
    emitf(lexer, ".file '%s'\n", lexer->currentfile);

    mem_sys_free(temp);
}

/*

=item C<static void
update_unique_id(lexer_state * const lexer)>

=cut

*/
static void
update_unique_id(lexer_state * const lexer) {
    /* each expansion has a unique id that is used for label/local munging */
    lexer->id_gen++;
    /* Count number of digits:
     * log10 returns a double, get the part before the dot (so, "3.14" -> "3")
     * using the floor() function.
     * log10(1000) -> 3, so add 1 more digit.
     */
    lexer->num_digits = (int)floor(log10(lexer->id_gen)) + 1;
}


/*

=item C<static void
expand(yyscan_t yyscanner, macro_def * const macro, list * args, lexer_state * const lexer)>

Expand the specified macro (or constant).

=cut

*/
static void
expand(yyscan_t yyscanner, macro_def * const macro, list * args, lexer_state * const lexer) {
    /* construct a map data structure that maps the argument values to the parameter names */
    /* enter the parameters as temporary symbols (.macro_const) */
    constant_table *macro_params = new_constant_table(lexer->globaldefinitions, lexer);
    list           *params       = macro->parameters;

    int             current_scope_nr;
    char const     *current_macro_id;

    while (params && args) {
        define_constant(macro_params, params->item, args->item);
        params = params->next;
        args   = args->next;
    }

    /* check for both conditions; either can be non-null, indicating an error.
     * If both are null, then all went ok.
     */
    if (params != NULL)  /* args must be null, so too few arguments */
        fprintf(stderr, "Too few arguments for macro expansion %s.\n", macro->name);

    if (args != NULL)  /* params must be null, so too many arguments */
        fprintf(stderr, "Too many arguments for macro expansion %s.\n", macro->name);


    /* parse the macro body */

    current_macro_id = lexer->macro_id;
    lexer->macro_id  = macro->name;
    /* save current scope id */
    current_scope_nr = lexer->unique_id;
    update_unique_id(lexer);
    lexer->unique_id = lexer->id_gen;

    if (macro->line_defined)
        emitf(lexer, "\n.line %d\n", macro->line_defined);

    process_string(macro->body, lexer);

    if (macro->line_defined)
        emitf(lexer, "\n.line %d\n", macroget_lineno(yyscanner));

    /* restore current scope id */
    lexer->unique_id = current_scope_nr;
    lexer->macro_id  = current_macro_id;

    /* now remove the temporary constant definitions */
    pop_constant_table(lexer);
    delete_constant_table(macro_params);

}


/*

=item C<static void
define_constant(constant_table * const table, char const * const name, char const * const value)>

=cut

*/
PARROT_MALLOC
PARROT_IGNORABLE_RESULT
static void
define_constant(constant_table * const table, char const * const name, char const * const value) {
    macro_def *def     = (macro_def *)mem_sys_allocate_zeroed(sizeof (macro_def));
    def->name          = name;
    def->body          = value;
    def->next          = table->definitions;
    table->definitions = def;
}

/*

=item C<void
define_macro(constant_table * const table, char * const name, list * const parameters)>

Define a macro by the given name, parameters and body.

=cut

*/
PARROT_MALLOC
static void
define_macro(constant_table * const table, char const * const name, list * const parameters,
             char const * const body, int line_defined)
{
    struct macro_def *macro   = (struct macro_def *)mem_sys_allocate(sizeof (struct macro_def));

    /* initialize the fields */
    macro->name         = name;
    macro->body         = body;
    macro->parameters   = parameters;
    macro->line_defined = line_defined;

    /* link the macro in the list */
    macro->next         = table->definitions;
    table->definitions  = macro;
}


/*

=item C<macro_def *
find_macro(constant_table * const table, char * const name)>

Find the specified macro. If the specified macro does not exist,
NULL is returned.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
macro_def *
find_macro(constant_table * const table, char * const name) {
    macro_def *iter = table->definitions;
    PARROT_ASSERT(name != NULL);

    /* iterate over the list and compare each node's name */
    while (iter != NULL) {
        if (strcmp(iter->name, name) == 0)
            return iter;
        iter = iter->next;
    }

    if (table->prev)
        return find_macro(table->prev, name);

    return NULL;
}

/*

=item C<static char const *
concat(char const * str1, char const * str2, int need_space)>

Concatenate two strings, and return the result. If the first string is NULL, then
the result consists of the second string. If need_space is true, a space is
inserted between the two strings.

=cut

*/
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static char const *
concat(char const * str1, char const * str2, int need_space) {
    PARROT_ASSERT (str2 != NULL);
    if (str1 == NULL)
        return str2;
    else {
        /* allocate a new buffer large enough to hold both strings, a space, and the NULL char. */
        /* TODO: make this more efficient; don't malloc every time, just allocate a big enough
         * buffer, and only increase it if it's full. For now this is the easiest solution.
         */
        int   strlen1   = strlen(str1);
        char *newbuffer = (char *)mem_sys_allocate((strlen1 + strlen(str2) + 1
                                                   + (need_space ? 1 : 0))
                                                   * sizeof (char));


        sprintf(newbuffer, "%s%s%s", str1, need_space ? " " : "", str2);

        mem_sys_free((void *)((char const *)str1));
        mem_sys_free((void *)((char const *)str2));

        return newbuffer;
    }
}

/*

=item C<static char *
concatn(int need_space, unsigned numargs, ...)>

Concatenate C<numargs> strings together into one new string. If C<need_space> is
non-zero, the strings are separated by a space.

=cut

*/
PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static char *
concatn(int need_space, unsigned numargs, ...) {
    va_list  arg_ptr;
    unsigned iter;
    char   **args;
    size_t   totalsize = 1; /* always 1 for NULL character */
    char    *result;
    size_t   result_index = 0;

    args = (char **)mem_sys_allocate(numargs * sizeof (char *));

    va_start(arg_ptr, numargs);

    for (iter = 0; iter < numargs; iter++) {
        /* store the argument in an array */
        args[iter] = va_arg(arg_ptr, char *);
        /* update total length so far */
        totalsize += strlen(args[iter]);
    }

    va_end(arg_ptr);

    if (need_space) /* then also allocate for separating spaces */
        totalsize += numargs - 1; /* 10 arguments would be separated by 9 spaces */

    result = (char *)mem_sys_allocate_zeroed(totalsize * sizeof (char));

    for (iter = 0; iter < numargs; iter++) {
        /* sprintf returns the number of characters printed; use that as an offset for next time */
        result_index += sprintf(result + result_index, "%s%s", args[iter], need_space ? " " : "");
        /* free old memory */
        mem_sys_free(args[iter]);
    }

    mem_sys_free(args);

    return result;
}

/* short-cut to check for a label; last character must be ":" */
#define is_label(X)     (X[strlen(X) - 1] == ':')

/* short-cut to check for token equality */
#define is_token(X,Y)   (strcmp(X,Y) == 0)


/*

=item C<static void
emit(lexer_state * const lexer, char const * const str)>

Emit the specified string. This function will be the "gateway" to the
output file. All tokens except C<.sub>, C<.end> and C<.namespace> are indented.
All tokens are separated with a space,  C<)>, C<]>, C<,>.

=cut

*/
static void
emit(lexer_state * const lexer, char const * const str) {
    fprintf(lexer->outfile, "%s ", str);
}

/*

=item C<static void
emitf(lexer_state * const lexer, char const * const str, ...)>

=cut

*/
static void
emitf(lexer_state * const lexer, char const * const str, ...) {
    va_list arg_ptr;
    va_start(arg_ptr, str);
    vfprintf(lexer->outfile, str, arg_ptr);
    va_end(arg_ptr);
}

static void
pretty_print(char * const str) {
    FILE *output = stdout;
    /* globals! */
    static int just_nl    = 1;
    static int need_space = 1;

    /* emit a newline between .subs and .namespaces */
    if (is_token(str, ".sub") || is_token(str, ".namespace"))
        fprintf(output, "\n");

    /* if the token needs indention, all except .sub, .end and .namespace. */
    if (!is_token(str, ".sub") && !is_token(str, ".end") && !is_token(str, ".namespace")) {
        if (just_nl) { /* just a newline means we need some indention */
            if (is_label(str)) { /* indent labels a bit less than other tokens */
                fprintf(output, "  ");
            }
            else { /* not a label */
                fprintf(output, "    ");
            }
        }
    }
    /* print the token; if it's a token like a comma, that shouldn't be prefixed with space,
     * remove the space (backspace)
     */
    /*
    if (is_token(str, ",") || is_token(str, ")") || is_token(str, "]")) {
        fprintf(output, "%c", '\b');
    }
    */

    if (is_token(str, "(") || is_token(str, "[")) {
        need_space = 0; /* no separation needed after these tokens */
    }
    else { /* all normal cases emit a separation space for tokens */
        need_space = 1;
    }
    /* print the token */
    fprintf(output, "%s", str);
    /* check for newline */
    if (is_token(str, "\n"))
        just_nl = 1;
    else {
        just_nl = 0;
        if (need_space)
            fprintf(output, " ");
    }

}

/*

=item C<new_constant_table>

=cut

*/
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static constant_table *
new_constant_table(constant_table * const current, lexer_state * const lexer) {
    constant_table *table    = (constant_table *)mem_sys_allocate(sizeof (constant_table));
    table->definitions       = NULL;
    table->prev              = current;
    lexer->globaldefinitions = table;
    return table;
}


/*

=item C<pop_constant_table>

=cut

*/
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
static constant_table *
pop_constant_table(lexer_state * const lexer) {
    constant_table *popped   = lexer->globaldefinitions;
    lexer->globaldefinitions = popped->prev;
    return popped;
}

/*

=item C<delete_constant_table>

=cut

*/
static void
delete_constant_table(constant_table *table) {
    /* destroy all definitions */
    macro_def *iter = table->definitions;

    while (iter != NULL) {
        macro_def *temp = iter;
        iter            = iter->next;
        mem_sys_free(temp);
    }
    mem_sys_free(table);
}



/*

=item C<munge_id>

Generate an identifier based on a macro label or locaal declaration, or a macro label
or local expansion.

A label declaration looks like: ".label $LABEL:", from which a normal
PIR label is created, formatted as: "_unique_MACRO_LABEL_?:".

A label expansion looks like ".$LABEL", from which a label identifier is
generated, formatted as: "_unique_MACRO_LABEL_?"
(note the difference, there is no colon at the end.

The same works for local identifiers, but of course the is_label_declaration
argument must be 0 for that.

=cut

*/
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static char *
munge_id(char const * const id, int is_label_declaration, lexer_state * const lexer) {
    /* the format of the generated label: */
    char const * const format        = "_unique_%s_%s_%d%s"; /* 18 characters */
    int  const         format_length = strlen(format);



    /* calculate length of the generated label: length of macro name,
     * plus length of label name.
     */
    int   length    = format_length + strlen(lexer->macro_id) + lexer->num_digits;
    char *munged_id;

    length += strlen(id);

    if (is_label_declaration)
        length++; /* reserve 1 more byte for the ":" */

    munged_id = (char *)mem_sys_allocate((length + 1) * sizeof (char));

    /* generate the identifier; if it's a declaration, then add the colon. */
    sprintf(munged_id, format, lexer->macro_id, id, lexer->unique_id,
            is_label_declaration ? ":" : "");

    return munged_id;
}



/*

=item C<static void
process_string(char * const buffer, lexer_state * const lexer)>

Process the string stored in C<buffer>. First a new yyscan_t
object is created, initialized, after which the specified
buffer is parsed. Afterwards the yyscan_t object is destroyed.

=cut

*/
static void
process_string(char const * const buffer, lexer_state * const lexer) {
    /* initialize a yyscan_t object */
    yyscan_t yyscanner;
    macrolex_init(&yyscanner);

    macroset_debug(lexer->flexdebug, yyscanner);
    macroset_extra(lexer, yyscanner);
    PARROT_ASSERT(buffer != NULL);
    /* set the scanner to a string buffer and go parse */
    macro_scan_string(buffer, yyscanner);
    yyparse(yyscanner, lexer);
    /* clean up after playing */
    macrolex_destroy(yyscanner);
}

/*

=item C<static void
process_file(char const * const filename, lexer_state * const lexer)>

Process the specified file.

=cut

*/
static void
process_file(char const * const filename, lexer_state * const lexer) {
    char const *temp_file;
    FILE       *fp;
    yyscan_t    yyscanner;

    if (filename == NULL)  /* no file name means reading from stdin. */
        fp = stdin;
    else  /* open the specified file */
        fp = fopen(filename, "r");

    if (fp == NULL) {
        fprintf(stderr, "Failed to open file %s\n", filename);
        return;
    }

    /* save current state of lexer, these are overwritten, so that
     * error messages indicate an error in the string (macro body).
     */
    temp_file = lexer->currentfile;

    /* construct a yylex_t object */
    macrolex_init(&yyscanner);
    macroset_in(fp, yyscanner);
    macroset_debug(lexer->flexdebug, yyscanner);
    macroset_extra(lexer, yyscanner);

    /* go parse the file */
    yyparse(yyscanner, lexer);
    /* and clean up */
    macrolex_destroy(yyscanner);

    /* restore state of lexer */
    lexer->currentfile = temp_file;

}

/*

=item C<static void
print_help(char const * const programname)>

=cut

*/
static void
print_help(char const * const programname) {
    fprintf(stderr, "Usage: %s [options] [input]\n", programname);
    fprintf(stderr, "where options are:\n");
    fprintf(stderr, "  -d  debug the generated parser\n");
    fprintf(stderr, "  -f  debug the generated lexer\n\n");
    fprintf(stderr, "If no input is specified, the program reads from stdin.\n");

}

/*

=item C<int
yyerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message, ...)>

Function for syntax error handling.

=cut

*/
int
yyerror(yyscan_t yyscanner, lexer_state * const lexer, char const * const message, ...) {
    va_list arg_ptr;

    fprintf(stderr, "Error in '%s' (line %d): ", lexer->currentfile, macroget_lineno(yyscanner));

    va_start(arg_ptr, message);
    vfprintf(stderr, message, arg_ptr);
    va_end(arg_ptr);

    puts("");

    ++lexer->errors;
    return 0;
}


/*

=item C<int
main(int argc, char *argv[])>

Pre-processor main function.

=cut

*/
int
main(int argc, char *argv[]) {
    lexer_state *lexer = NULL;
    char const * const programname = argv[0];

    /* skip program name */
    argc--;
    argv++;

    lexer = (lexer_state *)mem_sys_allocate_zeroed(sizeof (lexer_state));

    lexer->unique_id         = 0;
    lexer->errors            = 0;
    lexer->flexdebug         = 0;
    lexer->macro_id          = NULL;
    lexer->globaldefinitions = new_constant_table(NULL, lexer);

    lexer->outfile           = stdout;

    /* very basic argument handling; I'm too lazy to check out
     * the standard funtion for that, right now. This is a TODO.
     */
    while (argc > 0 && argv[0][0] == '-') {
        switch (argv[0][1]) {
            /* Only allow for debug flag if the generated parser supports it */
#ifdef YYDEBUG
            case 'd':
                yydebug = 1;
                break;
#endif
            case 'f':
                lexer->flexdebug = 1;
                break;
            case 'h':
                print_help(programname);
                exit(EXIT_SUCCESS); /* asking for help doesn't make you a failure */
                /* break; */
            default:
                fprintf(stderr, "Unknown option: '%c'\n", argv[0][1]);
                break;
        }
        /* goto next command line argument */
        argv++;
        argc--;
    }

    if (argc > 0) { /* a command line argument was given */
        lexer->currentfile = argv[0];
        process_file(argv[0], lexer);
    }
    else { /* no filename */
        lexer->currentfile = "STDIN";
        process_file(NULL, lexer);
    }

    if (lexer->errors > 0)
        fprintf(stderr, "There were %d error(s)\n", lexer->errors);


    /* clean up and go home */
    delete_constant_table(lexer->globaldefinitions);
    mem_sys_free(lexer);

    return 0;
}


/*

=back

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

