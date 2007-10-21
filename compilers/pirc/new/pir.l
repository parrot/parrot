/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/*

=head1 NAME

pir.l


=head1 DESCRIPTION

This is a complete rewrite of the PIR lexical analyzer, as defined in IMCC.
Goal is to fix the issues with the current implementation of the PIR language.
Major issues are:

=over 4

=item Grammar is a bit messy, and has some problems, like disallowing line comments in .param declarations.

=item The lexer is messy and not re-entrant. The macro layer is a mess and unmaintainable.

=item No support for nested heredocs.

=item The comment:  "this is just a sign that we suck.  that's all." speaks for itself (imc.h)

=back

=cut

*/

%{

#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>
#include "pirparser.h"
#include "pircompiler.h"


/* Parrot can check out whether the specified text is the name of an op.
 * We define a dummy function for now; replace this later.
 */
static int is_parrot_op(char *spelling);




/* datastructure to store the heredocs, nested please! */
typedef struct heredoc_info {
   char *contents;  /* contents of heredoc */
   char *delimiter; /* delimiter of heredoc */
   int char_count;  /* number of characters in this heredoc */

   struct heredoc_info *next; /* this is a linked list, ptr to next */

} heredoc_info;


/* data structure for managing included files */

typedef struct file_info {
   char *filename;
   int line_nr;
   int line_pos;
   YY_BUFFER_STATE buffer;
   struct file_info *prev;

} file_info;


/* data structure to store .constant definitions */
typedef struct constant_info {
    int line_declared;  /* line where the constant was declared */
    int token_type;     /* token type of the value */
    char *name;         /* name of the constant */
    char *value;        /* the value of the constant */

    struct constant_info *next; /* for now, linked list impl. */

} constant_info;


/* data structure to store a macro definition */
typedef struct macro_info {
    int line_declared;
    char *name;
    char *body;

    struct macro_info *next;

} macro_info;


/* store the "globals" of the lexer in a structure which is passed around. */
typedef struct lexer_state {
    struct file_info       *current_file;
    struct constant_info   *constant_defs;
    struct heredoc_info    *heredocs;
    struct macro_info      *macro_defs;
    char                   *after_heredoc;
    YY_BUFFER_STATE         file_buffer;
    int                     parse_errors;
    int                     line_nr;
    char                   *filename;

} lexer_state;


/* remove defines, and put them literally in the code */
#define current_file  lexer->current_file
#define constant_defs lexer->constant_defs
#define heredocs      lexer->heredocs
#define after_heredoc lexer->after_heredoc
#define file_buffer   lexer->file_buffer




/* macro to chop off the last character, typically a newline character */
#define chop_yytext()   (yytext[--yyleng] = '\0')


/* declaration of the lexer function */
#define YY_DECL int yylex(YYSTYPE *yylval, struct lexer_state *lexer)

/* declare the function yylex here; its definition is #define'd, so use that: */
extern YY_DECL;


extern int yyerror(struct lexer_state *lexer,
                   char *message);


/*

constructor for a lexer.

*/
lexer_state *
new_lexer(char *filename) {
    lexer_state *lexer = (lexer_state *)malloc(sizeof (lexer_state));
    lexer->filename = filename;
    lexer->line_nr  = 1;
    fprintf(stderr, "Constructing new lexer\n");
    return lexer;
}

/*

Accessor function for errors.

*/
int
get_parse_errors(lexer_state *lexer) {
    return lexer->parse_errors;
}

/*

Accessor function to increment the errors field.

*/
void
parse_error(lexer_state *lexer) {
    lexer->parse_errors++;
}

int
get_line_nr(lexer_state *lexer) {
    return lexer->line_nr;
}

char const *
get_current_file(lexer_state *lexer) {
    return lexer->filename;
}
/*

=over 4

=item static void push_file_info(file_info *info)

Store a file_info structure on a stack.

=cut

*/
static void
push_file_info(lexer_state *lexer, file_info *info) {
    info->prev = current_file;
    current_file = info;
}



/*

=item static file_info *pop_file_info(void)

Pop a file_info structure from a stack.

=cut

*/
static file_info *
pop_file_info(lexer_state *lexer) {
    if (current_file == NULL) {
        /* fprintf(stderr, "pop_file_info(): returning NULL\n"); */
        return NULL;
    }
    else {
        file_info *returning = current_file;
        /* fprintf(stderr, "pop_file_info(): returning info object\n"); */
        current_file = current_file->prev;
        /* fprintf(stderr, "current_file is now NULL\n"); */
        return returning;
    }
}


static void
switch_to_file(lexer_state *lexer, file_info *info) {

    /* restore the buffer info */
    /* TODO */

    /* delete the current buffer (of the included file *) */
    yy_delete_buffer(YY_CURRENT_BUFFER);
    /* close current file */
    fclose(yyin);

    /* switch back to previous file */
    yy_switch_to_buffer(info->buffer);

    /* and free all resources of the buffer */

    /*free(info->filename);
    */

    free(info);
    info = NULL;
}

static void
unshift_heredoc(lexer_state *lexer, heredoc_info *heredoc) {
    heredoc->next = heredocs;
    heredocs      = heredoc;
}

static heredoc_info *
shift_heredoc(lexer_state *lexer) {
    heredoc_info *returning = heredocs;
    if (returning == NULL) {
        fprintf(stderr, "shift_heredoc(): queue is empty!\n");
    }
    else {
        heredocs = heredocs->next;
    }
    return returning;
}

static heredoc_info *
peek_heredoc(lexer_state *lexer) {
    return heredocs;
}



static void
save_heredoc_line(lexer_state *lexer, char *text) {
    heredoc_info *heredoc = peek_heredoc(lexer);
    int text_length = strlen(text);
    char *newbuffer;

    /* make sure there's a heredoc active. if not, error! */
    assert(heredoc != NULL);

    /* create a new buffer, large enough to hold current contents
     * plus new contents
     */

    /* only first time there will be no contents */
    if (heredoc->contents != NULL) {
        newbuffer = (char *)calloc(heredoc->char_count + text_length, sizeof (char));
        assert(newbuffer != NULL);
        fprintf(stderr, "copying old contents...\n(%s)", heredoc->contents);
        strcpy(newbuffer, heredoc->contents);
    }
    else {
        /* allocate first buffer, do allocate 1 char extra for NULL character. */
        newbuffer = (char *)calloc(text_length + 1, sizeof (char));
        assert(newbuffer != NULL);
    }

    fprintf(stderr, "concatenating new contents..\n");
    /* copy new text into ne buffer, after old contents. */
    strcpy(newbuffer + heredoc->char_count, text);
    /* free old buffer */
    free(heredoc->contents);
    /* attach new buffer to heredoc node */
    heredoc->contents = newbuffer;
    /* update number of characters in this buffer */
    heredoc->char_count += text_length;

}


/*

=item static void new_heredoc(char *delimiter, int line)

=cut

*/
static void
new_heredoc(lexer_state *lexer, char *delimiter) {
    heredoc_info *heredoc = (heredoc_info *)malloc(sizeof (heredoc_info));
    heredoc->delimiter    = delimiter;
    heredoc->contents     = NULL;
    heredoc->char_count   = 0;
     /* and store the newly created node */
    unshift_heredoc(lexer, heredoc);
}


/*

=item static constant_info *find_constant(char *name)

=cut

*/
static constant_info *
find_constant(lexer_state *lexer, char *name) {

    constant_info *iter = constant_defs;

    while (iter != NULL) {
        if (strcmp(iter->name, name) == 0) {
            return iter;
        }
        iter = iter->next;
    }
    return NULL;
}

/*

=item static void define_constant(char *name, char *value, int token_type, int line)

=cut

*/
static void
define_constant(lexer_state *lexer, char *name, char *value, int token_type) {
    constant_info *info = (constant_info *)malloc(sizeof (constant_info));
    if (info == NULL) {
        fprintf(stderr, "Failed to allocate memory for constant definition.\n");
        exit(1);
    }
    /* create the constant definition */
    info->line_declared = 0; /* TODO */
    info->name          = name;
    info->value         = value;
    info->token_type    = token_type;

    /* for now, just use linked list. Later we'll use a hash */
    info->next    = constant_defs;
    constant_defs = info;
}

/*

=item static macro_info *find_macro(char *name)

=cut

*/
static macro_info *
find_macro(lexer_state *lexer, char *name) {
    /* for now, just a list; should be a hash */
    macro_info *iter = lexer->macro_defs;

    while (iter != NULL) {
        if (strcmp(iter->name, name) == 0) {
            return iter;
        }
        iter = iter->next;
    }

    return NULL;
}

static macro_info *
peek_macro(lexer_state *lexer) {
    return lexer->macro_defs;
}


static void
unshift_macro(lexer_state *lexer, macro_info *macro) {
    macro->next = lexer->macro_defs;
    lexer->macro_defs = macro;
}


/*

*/

static macro_info *
new_macro(char *name) {
    macro_info *macro;
    char *macro_id = strdup(yytext);
    /* create a macro definition, store the macro ID in it */
    macro = (macro_info *)malloc(sizeof (macro_info));
    assert(macro != NULL);
    macro->name = macro_id;
    macro->next = NULL;
    /* TODO: Fix macro body size */
    macro->body = (char *)calloc(4096, sizeof (char));
    assert(macro->body != NULL);
    return macro;
}
/*

=item static void read_macro(void)

=cut

*/
static void
read_macro(YYSTYPE *yylval, lexer_state *lexer) {
    int next_token;
    macro_info *macro = NULL;

    /* get next token, this must be macro id */
    next_token = yylex(yylval, lexer);

    /* check that there's a macro identifier token */
    if (next_token == TK_IDENT) {
        macro = new_macro(yytext);
        /* put the macro definition onto a queue */
        unshift_macro(lexer, macro);

        /* and get next token */
        next_token = yylex(yylval, lexer);
    }
    else { /* error! */
        yyerror(lexer, "macro identifier expected after '.macro'");
    }

    /* read macro parameters, if any */

    if (next_token == '(') { /* there are parameters! */
        int expect_parameter = 0;

        /* get next token after opening parenthesis */
        next_token = yylex(yylval, lexer);

        /* try parsing parameters while we don't see the closing parenthesis
         * or if we still expect a parameter (which means we just read a comma.
         */
        while (next_token != ')' || expect_parameter) {
            if (next_token == TK_IDENT) {
                /* handle parameter */
                char *parameter = strdup(yytext);
                fprintf(stderr, "macro parameter: '%s'\n", parameter);

                /* clear flag */
                expect_parameter = 0;
            }
            else {
                /* TODO: try to recover error */
                yyerror(lexer, "macro parameter identifier expected");
            }

            /* get next token after parameter */
            next_token = yylex(yylval, lexer);

            if (next_token == ',') { /* current token is a comma, get next parameter */
                next_token = yylex(yylval, lexer);
                /* after a comma we expect a parameter; set a flag */
                expect_parameter = 1;
            }
            else { /* no more parameters expected */
                break;
            }
        }

        /* check closing parenthesis of macro parameter list */
        if (next_token == ')') {
            next_token = yylex(yylval, lexer);
        }
        else { /* it was not a ')' */
            yyerror(lexer, "closing ')' expected to close parameter list of macro.");
        }

    }

    /* make sure there's a newline after the macro header TODO: must this be part of the macro text? */
    if (next_token != TK_NL) {
        yyerror(lexer, "newline expected after macro parameter list.");
    }

    next_token = yylex(yylval, lexer);
    /* scan the body of the macro, while we don't see the ".endm" marker,
     * and we don't encounter end of file (= 0). TODO: Check value of <<EOF>> Not sure if this is portable.
     */
    while ((next_token != TK_ENDM) && (next_token != 0)) {
        /* always add a space character to separate the tokens */
        strcat(macro->body, " ");
        /* add current token to macro's buffer */
        strcat(macro->body, yytext);
        /* and get the next token of the macro body */
        next_token = yylex(yylval, lexer);
    }

    /* check for macro delimiter */
    if (next_token == TK_ENDM) {
        next_token = yylex(yylval, lexer);
    }
    else { /* error! */
        yyerror(lexer, "'.endm' expected to close macro definition.");
    }


    /* after ".endm" a newline is expected */
    if (next_token != TK_NL) {
        yyerror(lexer, "newline expected after '.endm'");
    }

}

/*

Create a unique label identifier.
TODO: If we want unique local vars in macros, use this function too and
rename it to make_unique_id or what-ever.

*/
static char *
make_label(char *macro_name, char *label_name) {
    /* format of the generated label */

    /* TODO: the final character is special in IMCC ("$"). Is this enough
     * to make labels unique, and not definable by the user? (you could define
     * a label like "label__xxx__xxx__X:"... Fix this.
     */

    char const * const label_format = "label__%s__%s__X:";

    int format_length = strlen(label_format);
    int m_name_length = strlen(macro_name);
    int l_name_length = strlen(label_name);
    /* create a buffer to hold the new unique label, which contains
     * the label format, the current macro's name and the declared label ID.
     */
    char *label = (char *)calloc(m_name_length + format_length + l_name_length, sizeof (char));
    assert(label != NULL);
    /*
    fprintf(stderr, "making label '%s' for macro '%s'\n", label_name, macro_name);
    */
    sprintf(label, label_format, macro_name, label_name);

    fprintf(stderr, "Made label '%s'\n", label);

    return label;
}


/*

=back

=cut

*/




/*

There are a number of states, described in the table below.

State          Reads from  Description
===========================================================================
INITIAL        file        start state for scanner.

HEREDOC1       file        used as intermediate state to save the
                           "rest of the line" after a <<"STRING" token.

HEREDOC2       file        used to read heredoc contents

HEREDOC3       buffer      as HEREDOC1, but now when reading from a buffer

SCANSTRING     buffer      used to scan the "rest of the line", which
                           was saved by HEREDOC1 and HEREDOC3.
===========================================================================


*/


%}

ALPHA          [a-zA-Z@_]
DIGIT          [0-9]
DIGITS         {DIGIT}+
ALNUM          {ALPHA}|{DIGIT}

IDENT          {ALPHA}{ALNUM}*

DOT            [.]
HEX            0[xX][0-9A-Fa-f]+
OCT            0[oO][0-7]+
BIN            0[bB][01]+
WS             [\t\f\r\x1a ]
EOL            \r?\n

SIGN           [-+]
BIGINT         {SIGN}?{DIGITS}"L"
FLOATNUM       {SIGN}?(({DIGITS}{DOT}{DIGIT}*|{DOT}{DIGITS})([eE]{SIGN}?{DIGITS})?|{DIGITS}[eE]{SIGN}?{DIGITS})

DQ_STRING       \"(\\.|[^"\\\n])*\"
SQ_STRING       \'[^'\n]*\'
Q_STRING       {SQ_STRING}|{DQ_STRING}

LINECOMMENT    [#].*\n


%x HEREDOC1
%x HEREDOC2
%x HEREDOC3
%x SCANSTRING

/* start state for scanning POD comments */
%x POD

/* start state for macro definition. This is an inclusive state,
 * meaning that all rules without start state are also active.
 * In other words, new rules are "added" for this context.
 */
%s MACRODEF

/* support pushing/popping of start states */
%option stack

/* make sure yytext is a pointer */
%pointer

/* slightly more efficient when this option is set; our parser is not interactive anyway. */
%option never-interactive

/* define output file */
%option outfile="pirlexer.c"


%%


".macro"     {  /* macro definition */

                /* enable macro rules, using the (inclusive) state MACRODEF */
                yy_push_state(MACRODEF);
                read_macro(yylval, lexer);
             }

<MACRODEF>".endm"         { /* end of macro definition */ ;
                            yy_pop_state();
                            return TK_ENDM;
                          }

<MACRODEF>"$"{IDENT}":"   { /* unique label */
                            return TK_LABEL;
                          }

<MACRODEF>"$"{IDENT}      { /* unique identifier */
                            /* NEW FEATURE! TODO */
                            return TK_IDENT;
                          }

<MACRODEF>".$"{IDENT}     { /* expansion of a declared label, as in "goto .$foo" */
                            macro_info *current_macro = peek_macro(lexer);
                            /* Labels are formatted as ".$foo", so skip the 2 ".$" characters. */
                            char *label = make_label(current_macro->name, yytext + 2);
                            yytext = label;
                            return TK_IDENT; /* jump targets are label, which are identifiers */
                          }

<MACRODEF>".label"{WS}+   {  /* scan: '.label $foo:' */
                             int token;
                             /* get the label identifier */
                             token = yylex(yylval, lexer);

                             if (token == TK_LABEL) {
                                 macro_info *current_macro = peek_macro(lexer);
                                 char *label = NULL;
                                 chop_yytext(); /* remove the last character, which is a ":" */

                                 /* skip the leading "$" of the label: */
                                 label = make_label(current_macro->name, yytext + 1);

                                 /* make the label available to the parser (read_macro() in this case) */
                                 yytext = label; /* TODO use %union? */
                                 return TK_LABEL;
                             }
                             else { /* error */
                                 yyerror(lexer, "label identifier expected");
                                 yyterminate(); /* do we want to stop here? TODO: error recovery */
                             }

                          }

<MACRODEF><<EOF>>      { yyerror(lexer, "macro definition not closed before end of file");
                         yy_pop_state(); /* handle <<EOF>> in initial state */
                       }



{WS}                               { /* ignore */; }

{EOL}([\t\r\n ]|{LINECOMMENT})*    { /* a set of continuous newlines yields a single newline token. */
                                     return TK_NL;
                                   }

{LINECOMMENT}                      { /* skip line comments */ ; }



"<<"{Q_STRING} {    /* skip the "<<" and the quote, so skip 3 characteres */
                    char *heredoc_id = strdup(yytext + 3);

                    /* check the length of the quoted string. Note that the close quote
                     * was copied in the call to strdup(), so that's why heredoc_id is
                     * at least 1.
                     */
                    if (strlen(heredoc_id) == 1) {
                        yyerror(lexer, "heredoc delimiter cannot be an empty string");
                    }
                    else {
                        /* remove the closing quote */
                        heredoc_id[strlen(heredoc_id) - 1] = '\0';
                        /* store the heredoc delimiter in a FIFO data structure, such as a queue */
                        new_heredoc(lexer, heredoc_id);

                        /* yy_push_state(HEREDOC1); */
                        BEGIN(HEREDOC1);
                    }
               }

<SCANSTRING>"<<"{Q_STRING} {
                             /* skip the "<<" and the quote, so skip 3 characteres */
                             char *heredoc_id = strdup(yytext + 3);

                             /* check the length of the quoted string. Note that the close quote
                              * was copied in the call to strdup(), so that's why heredoc_id is
                              * at least 1.
                              */
                             if (strlen(heredoc_id) == 1) {
                                 yyerror(lexer, "heredoc delimiter cannot be an empty string");
                             }
                             else {
                                 /* remove the closing quote */
                                 heredoc_id[strlen(heredoc_id) - 1] = '\0';

                                 /* store the heredoc delimiter in a FIFO data structure, such as a queue */
                                 new_heredoc(lexer, heredoc_id);

                                 /* yy_push_state(HEREDOC3); */
                                 BEGIN(HEREDOC3);
                             }
                           }

<SCANSTRING>{EOL}   {
                    }

<SCANSTRING>{WS}+   {
                    }

<SCANSTRING><<EOF>> { unsigned char dummy_char;

                      /* End of the "rest" string, switch back to normal buffer and state. */
                      yy_switch_to_buffer(file_buffer);
                      BEGIN(INITIAL);

                      /* we reached the end of the saved string, and just switched back to
                       * the file. However, there may be more whitespace or newlines, so skip these now
                       */
                      dummy_char = input();

                      while (isspace(dummy_char) || dummy_char == '\n') {
                         dummy_char = input();
                      }
                      /* we just read one character too many; this is not a space/'\n', so put it back */
                      unput(dummy_char);

                      /* end of buffer also means end of line (because the buffer represents
                       * the "rest of the line" after reading a <<STRINGC heredoc delimiter argument.
                       * So, return a newline token.
                       */
                      return TK_NL;
                    }

<HEREDOC1>.*{EOL}  { /* This state saves the string after the <<STRINGC heredoc delimiter argument.
                      * After saving the rest of the line, effectively, taking it away from the file input
                      * state HEREDOC2 is activated, in which the heredoc string can be scanned.
                      * After the heredoc string is scanned (until the delimiter is encountered), the
                      * string that was saved here is scanned.
                      */
                     if (after_heredoc != NULL) {
                        /* before allocating new memory to after_heredoc, free the old buffer */
                        free(after_heredoc);
                     }
                     after_heredoc = strdup(yytext);
                     /* continue scanning the file */
                     BEGIN(HEREDOC2);
               }



<HEREDOC3>.*{EOL}   { /* currently, we're reading from a buffer */

                      /* after_heredoc is the buffer we're reading from, it /should/ never be null */
                      assert(after_heredoc != NULL);
                      if (after_heredoc != NULL) {
                         free(after_heredoc);
                      }
                      after_heredoc = strdup(yytext);

                      /* switch back to file */
                      yy_switch_to_buffer(file_buffer);
                      BEGIN(HEREDOC2);
                    }

<HEREDOC2>{EOL}  { /* add a newline character to the heredoc */
                   save_heredoc_line(lexer, "\n");
                 }

<HEREDOC2><<EOF>> { /* does this ever happen? */
                    fprintf(stderr, "<HEREDOC><<EOF>>. Does this ever happen?\n");
                    BEGIN(INITIAL);
                    return TK_NL;
                  }

<HEREDOC2>.*   {  /* get the heredoc delimiter */
                  heredoc_info *heredoc = shift_heredoc(lexer);
                  /* remove newline character from current token's characters */
                  chop_yytext();

                  /* if the current token's characters equals the heredoc
                   * delimiter, the heredoc is complete
                   */
                  if (strcmp(yytext, heredoc->delimiter) == 0) {
                      /* we found the delimiter, save the current buffer, because
                       * we will first continue scanning the "after_heredoc" buffer.
                       */
                      BEGIN(SCANSTRING);
                      /* save the current buffer */
                      file_buffer = YY_CURRENT_BUFFER;
                      yy_scan_string(after_heredoc);
                      /* return the complete heredoc as a string constant */
                      /* yylval.sval = heredoc->contents;
                      */
                      return TK_STRINGC;
                  }
                  else {
                      /* the current line does not contain the heredoc delimiter,
                       * put the heredoc thingie back
                       */
                      unshift_heredoc(lexer, heredoc);

                      /* and save the current text as part of the heredoc */
                      save_heredoc_line(lexer, yytext);
                  }

                }


^"=".*{EOL}            { yy_push_state(POD); }

<POD>^"=cut".*{EOL}+   { yy_pop_state(); }

<POD>.*                { /* ignore pod comments */ }

<POD>{EOL}+            { /* ignore newlines in POD */  }

<POD><<EOF>>           { yyerror(lexer, "POD comment not closed!");
                         yyterminate();
                       }


">>>="      { return TK_ASSIGN_USHIFT; }
">>>"       { return TK_USHIFT; }
">>="       { return TK_ASSIGN_RSHIFT; }
">>"        { return TK_RSHIFT; }
"<<"        { return TK_LSHIFT; }

".."        { return TK_DOTDOT; }
"=>"        { return TK_ARROW; }
"=="        { return TK_EQ; }
"!="        { return TK_NE; }
"<="        { return TK_LE; }
">="        { return TK_GE; }
"<"         { return TK_LT; }
">"         { return TK_GT; }

"//"        { return TK_FDIV; }
"&&"        { return TK_AND; }
"||"        { return TK_OR; }
"~~"        { return TK_XOR; }

"+"         { return '+'; }
"%"         { return '%'; }
"*"         { return '*'; }
"/"         { return '/'; }
"!"         { return '!'; }
"~"         { return '~'; }
"-"         { return '-'; }

<INITIAL,MACRODEF>"("                { return '('; }
<INITIAL,MACRODEF,SCANSTRING>")"     { return ')'; }
<INITIAL,MACRODEF,SCANSTRING>","     { return ','; }

"["         { return '['; }
"]"         { return ']'; }

{WS}"."{WS} { /* if the dot is surrounded by whitespace, it's a concatenation operator */
              return TK_CONC;
            }
"."         { return '.'; }
"="         { return '='; }
";"         { return ';'; }

"+="        { return TK_ASSIGN_INC; }
"-="        { return TK_ASSIGN_DEC; }
"/="        { return TK_ASSIGN_DIV; }
"*="        { return TK_ASSIGN_MUL; }
"%="        { return TK_ASSIGN_MOD; }
"**="       { return TK_ASSIGN_POW; }
"|="        { return TK_ASSIGN_BOR; }
"&="        { return TK_ASSIGN_BAND; }
"//="       { return TK_ASSIGN_FDIV; }
"~="        { return TK_ASSIGN_BNOT; }
".="        { return TK_ASSIGN_CONC; }

"if"              { return TK_IF; }
"goto"            { return TK_GOTO; }
"new"             { return TK_NEW; }
"n_operators"     { return TK_N_OPERATORS; }
"null"            { return TK_NULL; }
"unless"          { return TK_UNLESS; }

"int"             { return TK_INT; }
"num"             { return TK_NUM; }
"pmc"             { return TK_PMC; }
"string"          { return TK_STRING; }

".arg"            { return TK_ARG; }
".const"          { return TK_CONST; }
".emit"           { return TK_EMIT; }
".endnamespace"   { return TK_ENDNAMESPACE; }
".end"            { return TK_END; }

".eom"            { return TK_EOM; }
".get_results"    { return TK_GET_RESULTS; }
".globalconst"    { return TK_GLOBALCONST; }
".HLL"            { return TK_HLL; }
".HLL_map"        { return TK_HLL_MAP; }
".invocant"       { return TK_INVOCANT; }
".lex"            { return TK_LEX; }
".loadlib"        { return TK_LOADLIB; }
".local"          { return TK_LOCAL; }

".meth_call"      { return TK_METH_CALL; }
".namespace"      { return TK_NAMESPACE; }
".nci_call"       { return TK_NCI_CALL; }
".param"          { return TK_PARAM; }
".pcc_begin"      { return TK_PCC_BEGIN; }
".pcc_begin_return" { return TK_PCC_BEGIN_RETURN; }
".pcc_begin_yield"  { return TK_PCC_BEGIN_YIELD; }
".pcc_call"       { return TK_PCC_CALL; }
".pcc_end"        { return TK_PCC_END; }
".pcc_end_return" { return TK_PCC_END_RETURN; }
".pcc_end_yield"  { return TK_PCC_END_YIELD; }
".pragma"         { return TK_PRAGMA; }
".result"         { return TK_RESULT; }
".return"         { return TK_RETURN; }
".sub"            { return TK_SUB; }
".yield"          { return TK_YIELD; }

":anon"      { return TK_FLAG_ANON; }
":init"      { return TK_FLAG_INIT; }
":load"      { return TK_FLAG_LOAD; }
":postcomp"  { return TK_FLAG_POSTCOMP; }
":immediate" { return TK_FLAG_IMMEDIATE; }
":main"      { return TK_FLAG_MAIN; }
":method"    { return TK_FLAG_METHOD; }
":lex"       { return TK_FLAG_LEX; }
":outer"     { return TK_FLAG_OUTER; }
":vtable"    { return TK_FLAG_VTABLE; }
":multi"     { return TK_FLAG_MULTI; }

":unique_reg" { return TK_FLAG_UNIQUE_REG; }
":optional"   { return TK_FLAG_OPTIONAL; }
":opt_flag"   { return TK_FLAG_OPT_FLAG; }
":slurpy"     { return TK_FLAG_SLURPY; }
":named"      { return TK_FLAG_NAMED; }
":flat"       { return TK_FLAG_FLAT; }


{Q_STRING}   { /* yylval.sval = strdup(yytext); */
               return TK_STRINGC;
             }

"P"{DIGIT}+  { return TK_PASM_PREG; }
"S"{DIGIT}+  { return TK_PASM_SREG; }
"N"{DIGIT}+  { return TK_PASM_NREG; }
"I"{DIGIT}+  { return TK_PASM_IREG; }

"$P"{DIGIT}+  { return TK_SYM_PREG; }
"$S"{DIGIT}+  { return TK_SYM_SREG; }
"$N"{DIGIT}+  { return TK_SYM_NREG; }
"$I"{DIGIT}+  { return TK_SYM_IREG; }

{ALPHA}{ALNUM}*":"    { return TK_LABEL; }
{ALPHA}{ALNUM}*       { return is_parrot_op(yytext) ? TK_PARROT_OP : TK_IDENT; }


{FLOATNUM}        { return TK_NUMC; }
{SIGN}?{DIGITS}   { return TK_INTC; }
{HEX}             { return TK_INTC; }
{BIN}             { return TK_INTC; }
{OCT}             { return TK_INTC; }

".include"   { int next_token;
               unsigned char dummy;
               int file_name_length;
               FILE *incl_file_ptr   = NULL;
               char *incl_file_name  = NULL;
               file_info *file_state = NULL;
               YY_BUFFER_STATE incl_file_buffer;

               /* get next token containing name of file being included */
               next_token = yylex(yylval, lexer);

               /* check that it's a string, if not return to parser. */
               if (next_token != TK_STRINGC) {
                   return next_token;
               }

               /* retrieve name of file, remove 2 quote characters. */
               file_name_length = yyleng - 2;
               incl_file_name   = (char *)calloc(file_name_length + 1, sizeof (char));
               assert(incl_file_name != NULL);

               /* copy current token's characters, skip first character */
               strncpy(incl_file_name, yytext + 1, file_name_length);

               /* open the file */
               fprintf(stderr, "Including file '%s'\n", incl_file_name);
               incl_file_ptr = fopen(incl_file_name, "r");

               if (incl_file_ptr == NULL) { /* opening file went wrong */
                   fprintf(stderr, "Error including file '%s'\n", incl_file_name);
                   return 0;
               }

               /* after an include statement a newline is expected */
               next_token = yylex(yylval, lexer);
               if (next_token != 0) { /* if not end of file */
                   if (next_token != TK_NL) {
                       yyerror(lexer, "newline expected after \".include '<string>'\"\n");
                   }
               }

               /* save current file info */
               file_state = (file_info *)malloc(sizeof (file_info));
               assert(file_state != NULL);

               file_state->buffer   = YY_CURRENT_BUFFER;
               file_state->filename = lexer->filename; /* FIX */
               file_state->line_pos = 0; /* FIX */
               file_state->line_nr  = lexer->line_nr;
               file_state->prev     = NULL; /* initialize to NULL */

               /* store the current file's info structure on the stack,
                * we'll continue scanning it later.
                */
               push_file_info(lexer, file_state);

               /* a new file is being scanned, reset line number */
               lexer->line_nr  = 1;
               lexer->filename = incl_file_name;

               /* create a new buffer for the included file and switch to that file */
               incl_file_buffer = yy_create_buffer(incl_file_ptr, YY_BUF_SIZE);
               yy_switch_to_buffer(incl_file_buffer);

               /* the included file may contain whitespace and newlines; remove them */
               dummy = input();
               while (isspace(dummy) || dummy == '\n') {
                   dummy = input();
               }
               unput(dummy);

             }

".constant"  { int next_token;
               char *constant_id;
               char *constant_value;

               next_token = yylex(yylval, lexer);
               if (next_token != TK_IDENT) {
                   yyerror(lexer, "identifier expected after '.constant'.");
               }
               /* store identifier */
               constant_id = strdup(yytext);

               /* ".endm" will only be recognized as a reserved word in MACRO state,
                * but nevertheless, writing ".endm" to expand a constant is not good practice.
                * Emit a warning.
                */
               if (strcmp(constant_id, "endm") == 0) {
                   fprintf(stderr, "Warning: 'endm' should not be used as a constant name, "
                                   "using it would make you write '.endm', which is a keyword.");
               }

               /* read next token, which contains the value */
               next_token = yylex(yylval, lexer);

               /* only these token types are allowed for constant values: */
               switch (next_token) {
                   case TK_INTC:
                   case TK_NUMC:
                   case TK_STRINGC:
                   case TK_SYM_PREG:
                   case TK_SYM_NREG:
                   case TK_SYM_IREG:
                   case TK_SYM_SREG:
                   case TK_PASM_PREG:
                   case TK_PASM_NREG:
                   case TK_PASM_IREG:
                   case TK_PASM_SREG:
                       /* store value by this constant's name */
                       constant_value = strdup(yytext);
                       define_constant(lexer, constant_id, constant_value, next_token);
                       break;
                   default:
                       yyerror(lexer, "Constant value must be a number, string literal or register");
                       break;
               }

               /* after the .constant declaration, a newline must be read */
               next_token = yylex(yylval, lexer);
               if (next_token != TK_NL) {
                   yyerror(lexer, "newline expected after constant declaration");
               }

             }


[.]{ALNUM}        { /* NOTE: the {WS} prefix for this rule makes macro expansions fail. FIX THIS! */

                    /* Check whether this token is a constant or a macro.
                     * Note that there must be whitespace before the dot, otherwise
                     * in "x.y", ".y" is matched, which is wrong.
                     */

                    /* because of the whitespace in front of this matched token, we need to skip this,
                     * yytext contains 1 or more space characters, so find out how many these are.
                     */
                    constant_info *constant = NULL;
                    /* there is at least one space, so we don't have to check that one */
                    int num_spaces = 1;

                    /* as long as yytext + num_spaces points to a space character, increment num_spaces */
                    while (isspace((unsigned char) *(yytext + num_spaces))) {
                        ++num_spaces;
                    }

                    /* give the name of the constant, skipping the whitespace prefix,
                     * and skip the prefix dot.
                     */
                    constant = find_constant(lexer, yytext + num_spaces);

                    if (constant != NULL) { /* found the constant */
                        fprintf(stderr, "Constant '%s' found, value = '%s', token = '%d'\n",
                                constant->name, constant->value, constant->token_type);

                        /* make the value of the constant available to the parser */
                        /* TODO: where to store this? Probably in the %union->sval */
                        yytext = constant->value;
                        /* return the type of token that the constant value represents */
                        return constant->token_type;
                    }
                    else { /* not found, try macro */
                        macro_info *macro = NULL;

                        macro = find_macro(lexer, yytext + num_spaces);

                        if (macro != NULL) {

                            /* read input for parameters */

                            /* expand the macro into a string buffer */

                            file_buffer = YY_CURRENT_BUFFER;
                            /* and scan that string buffer. */
                            YY_BUFFER_STATE state = yy_scan_string(macro->body);

                        }
                        else {
                            /* not found, this is an unknown constant or macro. */
                            yyerror(lexer, "Undefined constant or macro");
                        }
                    }

                  }



<<EOF>>     {  /* get the file info structure of the .include-ing file, if any */
               file_info *info = pop_file_info(lexer);

               if (info == NULL) {
                   /* this was the initial file given to Parrot */
                   yyterminate();
               }
               else { /* this file was included */
                   switch_to_file(lexer, info);
                   return 0; /* end of file, needed for included files. */
               }
            }

<*>.   { yyerror(lexer, "Unexpected character"); }



%%


/*
 * Have yywrap return 1, so that the scanner will not
 * continue after an end of file.
 */
int
yywrap() {
    return 1;
}

static int
is_parrot_op(char *spelling) {

    /* only "print" is recognized as a Parrot instruction */
    if (strcmp(spelling, "print") == 0)
        return 1;
    return 0;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
