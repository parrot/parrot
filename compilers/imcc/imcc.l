%{
/*
 * imcc.l
 *
 * Intermediate Code Compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 * Copyright (C) 2002-2006, The Perl Foundation.
 *
 * The tokenizer.
 *
 * $Id$
 *
 */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "imc.h"
#include "parser.h"

#define MAX_PARAM 16

struct params_t {
    char *name[MAX_PARAM];
    int num_param;
};

struct macro_t {
    struct params_t params;
    char *expansion;
    int line;
};

/* parser state structure
 * the first few items are common to struct parser_state, but
 * we AFAIK need this hack as flex doesn't export YY_BUFFER_STATE
 */
struct macro_frame_t {
    struct parser_state_t s;

    /* macro stuff */
    YY_BUFFER_STATE buffer;
    struct params_t *params;
    struct params_t expansion;
    int label;
    int is_macro;
    char *heredoc_rest;
};

/* static function declariations */
static void pop_parser_state(Interp* interp, void *yyscanner);
static struct macro_frame_t *new_frame (Interp*);
static void define_macro(Interp *interp, char *name, struct params_t *params,
                         char *expansion, int start_line);
static struct macro_t *find_macro(Interp *interp, const char *name);
static void scan_string (struct macro_frame_t *frame, const char *expansion, void *yyscanner);
static void scan_file (Interp* interp, struct macro_frame_t *frame, FILE *, void *yyscanner);
static int destroy_frame (struct macro_frame_t *frame, void *yyscanner);
static int yylex_skip (YYSTYPE *valp, void *interp, const char *skip, void *yyscanner);

static int read_macro (YYSTYPE *valp, Interp *interp, void *yyscanner);
static int expand_macro (YYSTYPE *valp, void *interp, const char *name, void *yyscanner);
static void include_file (Interp* interp, char *file_name, void *yyscanner);

#define YY_DECL int yylex(YYSTYPE *valp, yyscan_t yyscanner, Interp *interp)

#define YYCHOP() (yytext[--yyleng] = '\0')
#define DUP_AND_RET(valp, token)             \
  do {                                       \
      if (valp) (valp)->s = str_dup(yytext); \
      return token;                          \
  } while (0)

%}

%option reentrant
%option never-interactive
%option stack

LETTER          [a-zA-Z_@]
DIGIT           [0-9]
DIGITS          {DIGIT}+
HEX             0[xX][0-9A-Fa-f]+
OCT             0[oO][0-7]+
BIN             0[bB][01]+
DOT             [.]
SIGN            [-+]
BIGINT          {SIGN}?{DIGITS}"L"
FLOATNUM        {SIGN}?(({DIGITS}{DOT}{DIGIT}*|{DOT}{DIGITS})([eE]{SIGN}?{DIGITS})?|{DIGITS}[eE]{SIGN}?{DIGITS})
LETTERDIGIT     [a-zA-Z0-9_]
LABELLETTERDIGIT     ([a-zA-Z0-9_@]|"::")
ID              {LETTER}{LABELLETTERDIGIT}*
DQ_STRING       \"(\\.|[^"\\\n])*\"
ENCCHAR         {LETTER}|{DIGIT}|"-"
ENCCHARS        {ENCCHAR}*
ENC             {LETTER}{ENCCHARS}":"
UNICODE         {ENC}{ENC}?{DQ_STRING}
STRINGCONSTANT  {SQ_STRING}|{DQ_STRING}
SQ_STRING       \'[^'\n]*\'
RANKSPEC        \[[,]*\]
EOL        \r?\n
WS              [\t\f\r\x1a ]
SP              [ ]

%x emit
%x macro
%x pod
%x cmt1
%x cmt2
%x cmt3
%x cmt4
%x cmt5
%x heredoc1
%x heredoc2


%%
        /* for emacs "*/
        if (IMCC_INFO(interp)->expect_pasm == 1 && !IMCC_INFO(interp)->in_pod) {
            IMCC_INFO(interp)->expect_pasm = 2;
            BEGIN(emit);
        }
        if (IMCC_INFO(interp)->frames->s.pasm_file && YYSTATE == INITIAL &&
            !IMCC_INFO(interp)->in_pod)
        {
            if (0)
                yy_top_state(yyscanner); /* silent warning */
            if (IMCC_INFO(interp)->frames->s.pasm_file == 1) {
                BEGIN(emit);
                return EMIT;
        }
            return 0;
        }

<heredoc1>.*{EOL} {
            IMCC_INFO(interp)->frames->heredoc_rest = str_dup(yytext);
            BEGIN(heredoc2);
        }

<heredoc2>{EOL} {
        /* heredocs have highest priority
         * arrange them befor all wildcard state matches
         */

        /* Newline in the heredoc. Realloc and cat on. */
        IMCC_INFO(interp)->line++;
        IMCC_INFO(interp)->heredoc_content =
            mem_sys_realloc(IMCC_INFO(interp)->heredoc_content,
                            strlen(IMCC_INFO(interp)->heredoc_content) +
                            strlen(yytext) + 2);
        strcpy(IMCC_INFO(interp)->heredoc_content +
               strlen(IMCC_INFO(interp)->heredoc_content), yytext);
    }

<heredoc2>.* {
        /* Are we at the end of the heredoc? */
        if (strcmp(IMCC_INFO(interp)->heredoc_end, yytext) == 0)
        {
            /* End of the heredoc. */
            struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
            int len = strlen(IMCC_INFO(interp)->heredoc_content);
            IMCC_INFO(interp)->heredoc_content[len] = IMCC_INFO(interp)->heredoc_content[0];  /* delim */
            IMCC_INFO(interp)->heredoc_content[len+1] = 0;
            mem_sys_free(IMCC_INFO(interp)->heredoc_end);
            IMCC_INFO(interp)->frames->buffer = YY_CURRENT_BUFFER;
            valp->s = IMCC_INFO(interp)->heredoc_content;
            yy_pop_state(yyscanner);
            yy_scan_string(IMCC_INFO(interp)->frames->heredoc_rest, yyscanner);
            return(STRINGC); /* XXX delete quotes, -> emit, pbc */
        }
        else
        {
            /* Part of the heredoc. Realloc and cat the line on. */
            IMCC_INFO(interp)->heredoc_content =
                mem_sys_realloc(IMCC_INFO(interp)->heredoc_content,
                                strlen(IMCC_INFO(interp)->heredoc_content) +
                                strlen(yytext) + 2);
            strcpy(IMCC_INFO(interp)->heredoc_content +
                   strlen(IMCC_INFO(interp)->heredoc_content), yytext);
        }
    }


<*>^"#line"{SP}{DIGITS}{SP}["] {
        yy_push_state(cmt2, yyscanner);
        valp->t = atoi(yytext+6);
        return LINECOMMENT;
    }
<cmt2>[^"]+ {
        yy_pop_state(yyscanner);
        yy_push_state(cmt3, yyscanner);
        valp->s = str_dup(yytext);
        return FILECOMMENT;
    }
<cmt3>["] {
        yy_pop_state(yyscanner);
        yy_push_state(cmt4, yyscanner);
}
<*>setfile{SP}+["] { yy_push_state(cmt2, yyscanner); }
<*>setline{SP}+ { yy_push_state(cmt1, yyscanner);  }
<cmt1>{DIGITS} {
        valp->t = atoi(yytext);
        yy_pop_state(yyscanner);
        yy_push_state(cmt4, yyscanner);
        return LINECOMMENT;
    }
<cmt4>.*{EOL} {
        yy_pop_state(yyscanner);
        IMCC_INFO(interp)->line++;
    }
<INITIAL,emit>{EOL} {
        if (IMCC_INFO(interp)->expect_pasm == 2)
            BEGIN(INITIAL);
        IMCC_INFO(interp)->expect_pasm = 0;
        IMCC_INFO(interp)->line++;
        return '\n';
    }
<INITIAL,emit># {
        yy_push_state(cmt5, yyscanner);
    }
<cmt5>.*{EOL} {
        if (IMCC_INFO(interp)->expect_pasm == 2)
            BEGIN(INITIAL);
        else
            yy_pop_state(yyscanner);
        IMCC_INFO(interp)->expect_pasm = 0;
        IMCC_INFO(interp)->line++;
        return '\n';
    }

^".emit"\n {
    BEGIN(emit);
    return(EMIT);
    }

<emit>^".eom"\n {
    BEGIN(INITIAL);
    return EOM;
    }

<*>[ISNP]{DIGIT}{DIGIT}? {
    valp->s = str_dup(yytext);
    return REG;
    }

<INITIAL,emit,macro>^"="     { IMCC_INFO(interp)->in_pod = 1;
                               yy_push_state(pod, yyscanner); }
<pod>^"=cut"{EOL}            { IMCC_INFO(interp)->in_pod = 0;
                               yy_pop_state(yyscanner); IMCC_INFO(interp)->line++; }
<pod>.*         { /*ignore*/ }
<pod>{EOL}      { IMCC_INFO(interp)->line++; }

".sym"          return(LOCAL);
<INITIAL,emit>".lex"          return(LEXICAL);
".arg"          return(ARG);
".sub"          return(SUB);
".end"          return(ESUB);
".pcc_begin"    return(PCC_BEGIN);
".pcc_end"      return(PCC_END);
".pcc_call"     return(PCC_CALL);
".nci_call"     return(NCI_CALL);
".meth_call"    return(METH_CALL);
".invocant"     return(INVOCANT);
<emit,INITIAL>".pcc_sub"      return(PCC_SUB);
".pcc_begin_return"    return(PCC_BEGIN_RETURN);
".pcc_end_return"      return(PCC_END_RETURN);
".pcc_begin_yield"    return(PCC_BEGIN_YIELD);
".pcc_end_yield"      return(PCC_END_YIELD);

"method"        return(METHOD); /* old compat cruft -
                                  the canonical colon names are below */

":method"        return(METHOD);
<emit,INITIAL>":multi"   return(MULTI);
<emit,INITIAL>":main"    return(MAIN);
<emit,INITIAL>":load"    return(LOAD);
<emit,INITIAL>":init"    return(INIT);
<emit,INITIAL>":immediate"    return(IMMEDIATE);
<emit,INITIAL>":postcomp"    return(POSTCOMP);
<emit,INITIAL>":anon"    return(ANON);
<emit,INITIAL>":outer"   return(OUTER);
<emit,INITIAL>":lex"     return(NEED_LEX);
<emit,INITIAL>":vtable"  return(VTABLE_METHOD);
":unique_reg"  return(UNIQUE_REG);

".result"       return(RESULT);
".get_results"       return(GET_RESULTS);
".yield"        return(YIELDT);
".return"       return(RETURN);
<emit,INITIAL>".loadlib"      return(LOADLIB);

":flat"         return(ADV_FLAT);
":slurpy"       return(ADV_SLURPY);
":optional"     return(ADV_OPTIONAL);
":opt_flag"     return(ADV_OPT_FLAG);
":named"        return(ADV_NAMED);
"=>"            return(ADV_ARROW);

<emit,INITIAL>".namespace"    return(NAMESPACE);
<emit,INITIAL>".HLL"          return(HLL);
<emit,INITIAL>".HLL_map"      return(HLL_MAP);
".endnamespace" return(ENDNAMESPACE);
".local"        return(LOCAL);
".global"       return(GLOBAL);
<emit,INITIAL>".const"        return(CONST);
".globalconst"  return(GLOBAL_CONST);
".param"        return(PARAM);
<*>".pragma"    return(PRAGMA);
<*>"n_operators"   return(N_OPERATORS);
"goto"          return(GOTO);
"if"            return(IF);
"unless"        return(UNLESS);
"null"          return(PNULL);
"int"           return(INTV);
"num"           return(FLOATV);
"float"         return(FLOATV);
"new"           return(NEW);
"addr"          return(ADDR);
"global"        return(GLOBALOP);
"object"        return(OBJECTV);
"pmc"           return(PMCV);
"string"        return(STRINGV);
"<<"            return(SHIFT_LEFT);
">>"            return(SHIFT_RIGHT);
">>>"           return(SHIFT_RIGHT_U);
"&&"            return(LOG_AND);
"||"            return(LOG_OR);
"~~"            return(LOG_XOR);
"<"             return(RELOP_LT);
"<="            return(RELOP_LTE);
">"             return(RELOP_GT);
">="            return(RELOP_GTE);
"=="            return(RELOP_EQ);
"!="            return(RELOP_NE);
"**"            return(POW);
"->"            return(POINTY);
{WS}+"."{WS}+   return(CONCAT);
"."             return(DOT);
<emit,INITIAL>".."     return(DOTDOT);
"+="            return(PLUS_ASSIGN);
"-="            return(MINUS_ASSIGN);
"*="            return(MUL_ASSIGN);
"/="            return(DIV_ASSIGN);
"%="            return(MOD_ASSIGN);
"//"            return(FDIV);
"//="           return(FDIV_ASSIGN);
"&="            return(BAND_ASSIGN);
"|="            return(BOR_ASSIGN);
"~="            return(BXOR_ASSIGN);
">>="           return(SHR_ASSIGN);
"<<="           return(SHL_ASSIGN);
">>>="          return(SHR_U_ASSIGN);
".="            return(CONCAT_ASSIGN);

<emit,INITIAL>".macro" {
        return read_macro(valp, interp, yyscanner);
    }

<emit>".constant" {
    int c;
    int start_line;

    BEGIN(macro);
    c = yylex_skip(valp, interp, " ", yyscanner);
    if (c != IDENTIFIER)
        IMCC_fataly(interp, E_SyntaxError,
           "Constant names must be identifiers");

    IMCC_INFO(interp)->cur_macro_name = valp->s;
    start_line = IMCC_INFO(interp)->line;

    c = yylex_skip(valp, interp, " ", yyscanner);
        if (c != INTC && c != FLOATC && c != STRINGC && c != REG)
        IMCC_fataly(interp, E_SyntaxError,
            "Constant '%s' value must be a number, "
            "stringliteral or register", IMCC_INFO(interp)->cur_macro_name);

    define_macro(interp, IMCC_INFO(interp)->cur_macro_name, NULL, valp->s, start_line);
    IMCC_INFO(interp)->cur_macro_name = NULL;

    BEGIN (emit);
    return MACRO;
    }

<emit,INITIAL>".include" {
    int c;

    c = yylex(valp, yyscanner, interp);
    if (c != STRINGC) return c;

    YYCHOP();
    include_file(interp, str_dup(yytext + 1), yyscanner);
    }

<emit,INITIAL>{ID}"$:" {
        char *label;

    if (valp) {
        YYCHOP();
            YYCHOP();

            if (!IMCC_INFO(interp)->frames || !IMCC_INFO(interp)->frames->label)
                IMCC_fataly(interp, E_SyntaxError, "missing space?");
        label = mem_sys_allocate(yyleng+10);
        sprintf(label, "%s%d", yytext, IMCC_INFO(interp)->frames->label);

        valp->s = label;
    }

        return LABEL;
    }

<emit,INITIAL>{ID}"$" {
        char *label;

        if (valp) {
            YYCHOP();

            /* #32421   if$I0 is parsed as if$ I0 */
            if (!IMCC_INFO(interp)->frames || !IMCC_INFO(interp)->frames->label)
                IMCC_fataly(interp, E_SyntaxError, "missing space?");

            label = mem_sys_allocate(yyleng+10);
            sprintf(label, "%s%d", yytext, IMCC_INFO(interp)->frames->label);

            valp->s = label;
        }

        return IDENTIFIER;
     }

<emit,INITIAL>","             return(COMMA);

<emit,INITIAL>{ID}":" {
    YYCHOP();  /* trim last ':' */
    DUP_AND_RET(valp,LABEL);
    }

<emit,INITIAL>{DOT}{LETTER}{LETTERDIGIT}* {
        char *macro_name = str_dup(yytext+1);
        int type = pmc_type(interp, string_from_cstring(interp, macro_name, 0));

        if (type > 0) {
            char *buf = malloc(16);
            sprintf(buf, "%d", type);
            valp->s = buf;
            free(macro_name);
            return INTC;
        }

        if (!expand_macro(valp, interp, macro_name, yyscanner)) {
            yyless(1);
            free(macro_name);
            return DOT;
        }

        free(macro_name);
    }

<emit,INITIAL>{ID} {
    if (!is_def) {
        SymReg *r = find_sym(interp, yytext);
        if (r && (r->type & (VTIDENTIFIER|VT_CONSTP))) {
            valp->sr = r;
            return VAR;
        }
        if (IMCC_INFO(interp)->cur_unit &&
            IMCC_INFO(interp)->cur_unit->instructions &&
            (r = IMCC_INFO(interp)->cur_unit->instructions->r[0]) &&
            r->pcc_sub)
        {
            if ((r->pcc_sub->pragma & P_METHOD) && !strcmp(yytext, "self")) {
                valp->sr  = mk_ident(interp, str_dup("self"), 'P');
                IMCC_INFO(interp)->cur_unit->type |= IMC_HAS_SELF;
                return VAR;
            }
        }
    }
    valp->s = str_dup(yytext);
    return(!is_def && is_op(interp, valp->s) ? PARROT_OP : IDENTIFIER);
    }

<*>{FLOATNUM}         DUP_AND_RET(valp, FLOATC);
<*>{SIGN}?{DIGIT}+    DUP_AND_RET(valp, INTC);
<*>{HEX}              DUP_AND_RET(valp, INTC);
<*>{BIN}              DUP_AND_RET(valp, INTC);
<*>{OCT}              DUP_AND_RET(valp, INTC);

<*>{BIGINT}         {
    valp->s = str_dup(yytext);
        valp->s[strlen(valp->s) - 1] = '\0'; /* trailing 'L' */
        return(STRINGC); /* no BIGINT native format yet */
    }

<*>{STRINGCONSTANT} {
    valp->s = str_dup(yytext);
        return(STRINGC); /* XXX delete quotes, -> emit, pbc */
    }

<*>"<<"{STRINGCONSTANT} {
        struct macro_frame_t *frame;
        /* Save the string we want to mark the end of the heredoc and snip
           off newline and quote. */
        if (IMCC_INFO(interp)->frames->heredoc_rest)
            IMCC_fataly(interp, E_SyntaxError,
            "nested heredoc not supported");
        IMCC_INFO(interp)->heredoc_end = str_dup(yytext + 3);
        IMCC_INFO(interp)->heredoc_end[strlen(IMCC_INFO(interp)->heredoc_end) - 1] = 0;
        if (!strlen(IMCC_INFO(interp)->heredoc_end))
            IMCC_fataly(interp, E_SyntaxError, "empty heredoc delimiter");
        frame = new_frame(interp);
        frame->s.next = (struct parser_state_t*) IMCC_INFO(interp)->frames;
        IMCC_INFO(interp)->frames = frame;
        /* Start slurping up the heredoc. */
        IMCC_INFO(interp)->heredoc_content = mem_sys_allocate(2);
        IMCC_INFO(interp)->heredoc_content[0] = yytext[2];        /* preserve delim */
        IMCC_INFO(interp)->heredoc_content[1] = 0;                /* eos */
        yy_push_state(heredoc1, yyscanner);
    }

<*>{UNICODE} {
    valp->s = str_dup(yytext);    /* charset:"..." */
        /* this is actually not unicode but a string with a charset */
        return(USTRINGC);
    }


<emit,INITIAL>\$I[0-9]+          DUP_AND_RET(valp, IREG);
<emit,INITIAL>\$N[0-9]+          DUP_AND_RET(valp, NREG);
<emit,INITIAL>\$S[0-9]+          DUP_AND_RET(valp, SREG);
<emit,INITIAL>\$P[0-9]+          DUP_AND_RET(valp, PREG);

<emit,INITIAL>{WS}+ /* skip */;

<emit,cmt1,cmt2,cmt3,cmt4,cmt5,INITIAL>.     {
        /* catch all except for state macro */
        return yytext[0];
    }

<emit><<EOF>> {
        BEGIN (INITIAL);
        if (IMCC_INFO(interp)->frames->s.pasm_file) {
            IMCC_INFO(interp)->frames->s.pasm_file = 2;
            return EOM;
        }
        return 0;
    }

<INITIAL><<EOF>> yyterminate();

<macro>".endm"         DUP_AND_RET(valp, ENDM);

<macro>{WS}*{EOL} {
        IMCC_INFO(interp)->line++;
        DUP_AND_RET(valp, '\n');
    }

<macro>"$"{ID}":"  return LABEL;
<macro>".local"{WS}+ {
    char *label;

    if (yylex(valp, yyscanner, interp) != LABEL)
            IMCC_fataly(interp, E_SyntaxError, "LABEL expected");

    if (valp) {
        YYCHOP();

        label = mem_sys_allocate(strlen(IMCC_INFO(interp)->cur_macro_name) + yyleng + 15);
        sprintf(label, "local__%s__%s__$:", IMCC_INFO(interp)->cur_macro_name, yytext+1);

        valp->s = label;
    }

    return LABEL;
    }

<macro>".$"{ID} {
    char *label;

    if (valp) {
        label = mem_sys_allocate(strlen(IMCC_INFO(interp)->cur_macro_name) + yyleng + 15);
        sprintf(label, "local__%s__%s__$", IMCC_INFO(interp)->cur_macro_name, yytext+2);

        valp->s = label;
    }

    return IDENTIFIER;
    }

<macro>^{WS}+                       /* skip leading ws */;
<macro>{WS}+                        DUP_AND_RET(valp, ' ');
<macro>{ID}                         DUP_AND_RET(valp, IDENTIFIER);
<macro>{DOT}{ID}                    DUP_AND_RET(valp, MACRO);
<macro>.                            DUP_AND_RET(valp, yytext[0]);
<macro><<EOF>>                      yyterminate();

%%

#ifdef yywrap
#undef yywrap
#endif

int yywrap (void* yyscanner) {
    /* Add code here to open next source file and start scanning
     * yywrap returns 0 if scanning is to continue
     */
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
    Interp* interp = yyget_extra(yyscanner);

    if (!interp) {
        fprintf(stderr, "Argh, nao tenho interp\n");
        exit (1);
    }

    yy_delete_buffer(YY_CURRENT_BUFFER, yyscanner);

    /* pop old frame */
    if (IMCC_INFO(interp)->frames->s.next) {
        pop_parser_state(IMCC_INFO(interp)->frames->s.interpreter, yyscanner);
        if (YYSTATE == INITIAL || YYSTATE == emit)
            BEGIN(IMCC_INFO(interp)->frames->s.pasm_file ? emit : INITIAL);
        return 0;
    }

    return 1;
}

static struct macro_frame_t *
new_frame (Interp* interp)
{
    static int label = 0;
    struct macro_frame_t *tmp;

    tmp = mem_sys_allocate_zeroed(sizeof(struct macro_frame_t));
    tmp->label = ++label;
    tmp->s.line = IMCC_INFO(interp)->line;
    tmp->s.handle = NULL;
    if (IMCC_INFO(interp)->frames) {
        tmp->s.pasm_file = IMCC_INFO(interp)->frames->s.pasm_file;
        tmp->s.file = IMCC_INFO(interp)->frames->s.file;
        tmp->s.pragmas = IMCC_INFO(interp)->frames->s.pragmas;
    }
    tmp->s.interpreter = interp;

    return tmp;
}

static void
scan_string (struct macro_frame_t *frame, const char *expansion, void *yyscanner)
{
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
    Interp *interp = yyget_extra(yyscanner);

    frame->buffer = YY_CURRENT_BUFFER;
    frame->s.next = (struct parser_state_t*) IMCC_INFO(interp)->frames;
    IMCC_INFO(interp)->frames = frame;

    yy_scan_string(expansion, yyscanner);
}

static int
destroy_frame (struct macro_frame_t *frame, void *yyscanner)
{
    YY_BUFFER_STATE buffer;
    int i, ret = 0;

    buffer = frame->buffer;

    for (i = 0; i < frame->expansion.num_param; i++) {
        free(frame->expansion.name[i]);
    }

    if (frame->heredoc_rest)
        mem_sys_free(frame->heredoc_rest);
    else
        ret = frame->s.line;
    /* FIXME if frame->s.file was allocated free it */

    mem_sys_free(frame);

    if (buffer != NULL) {
        yy_switch_to_buffer(buffer, yyscanner);
    }

    return ret;
}

static int
yylex_skip (YYSTYPE *valp, void *interp, const char *skip, void *yyscanner)
{
    int c;
    const char *p;
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;

    do {
        c = yylex(valp, yyscanner, interp);
        p = skip;

        while (*p && c != *p)
            p++;
    } while (*p != '\0');

    if (c)
        DUP_AND_RET(valp, c);
    else
        return c;
}

static char*
read_braced (YYSTYPE *valp, void *interp, const char *macro_name,
             char *current, void *yyscanner)
{
    int c, count, len;
    YYSTYPE val;

    len = strlen(current);
    c = yylex(&val, yyscanner, interp);
    count = 0;
    while (c != '}' || count > 0) {
        if (c == '}')      count--;
        else if (c == '{') count++;
        if (c <= 0)
            IMCC_fataly(interp, E_SyntaxError,
                        "End of file reached while reading arguments in '%s'",
                        macro_name);
        len += strlen(val.s);
        current = realloc(current, len + 1);
        strcat(current,val.s);
        free(val.s);
        c = yylex(&val, yyscanner, interp);
    }
    if (valp) *valp = val;
    else free(val.s);
    return current;
}

static int
read_params (YYSTYPE *valp, void *interp, struct params_t *params,
             const char *macro_name, int need_id, void *yyscanner)
{
    int c;
    YYSTYPE val;
    char *current = str_dup("");
    int len = 0;
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;

    params->num_param = 0;
    c = yylex_skip(&val, interp, " \n", yyscanner);

    while(c != ')') {
        if (YYSTATE == heredoc2)
            IMCC_fataly(interp, E_SyntaxError,
                        "Heredoc in macro '%s' not allowed",
                        macro_name);
        if (c <= 0)
            IMCC_fataly(interp, E_SyntaxError,
                        "End of file reached while reading arguments in '%s'",
                        macro_name);
        else if (c == ',') {
            if (params->num_param == MAX_PARAM)
                IMCC_fataly(interp, E_SyntaxError,
                            "More then %d params in '%s'",
                            MAX_PARAM, macro_name);
            params->name[params->num_param++] = current;
            current = str_dup("");
            len = 0;
            c = yylex_skip(&val, interp, " \n", yyscanner);
        }
        else if (need_id && (*current || c != IDENTIFIER) && c != ' ') {
            IMCC_fataly(interp, E_SyntaxError,
                        "Parameter definition in '%s' must be IDENTIFIER",
                        macro_name);
        }
        else if (c == '{') {
            current = read_braced (&val, interp, macro_name, current, yyscanner);
            c = yylex_skip(&val, interp, " \n", yyscanner);
        }
        else {
            if (!need_id || c != ' ') {
                len += strlen(val.s);
                current = realloc(current, len + 1);
                strcat(current,val.s);
            }
            free(val.s);
            c = yylex(&val, yyscanner, interp);
        }
    }
    params->name[params->num_param++] = current;

    if (valp) *valp = val;
    else free(val.s);

    return c;
}

static int
read_macro (YYSTYPE *valp, Interp *interp, void *yyscanner)
{
    int c;
    int start_cond, start_line;
    struct params_t params;
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;

    IMCC_INFO(interp)->temp_buffer[0]='\0';

    start_cond = YY_START;
    BEGIN(macro);

    c = yylex_skip(valp, interp, " ", yyscanner);
    if (c != IDENTIFIER)
        IMCC_fataly(interp, E_SyntaxError,
                    "Macro names must be identifiers");

    IMCC_INFO(interp)->cur_macro_name = valp->s;
    start_line = IMCC_INFO(interp)->line++;
    memset(&params, 0, sizeof(struct params_t));

    /* white space is allowed between macro and opening paren) */
    c = yylex_skip(valp, interp, " ", yyscanner);

    if (c == '(') {
        free(valp->s);

        c = read_params(NULL, interp, &params,
                        IMCC_INFO(interp)->cur_macro_name, 1, yyscanner);

        c = yylex(valp, yyscanner, interp);
    }

    while (c != ENDM) {
        if (c <= 0)
            IMCC_fataly(interp, E_SyntaxError,
                        "File ended before macro '%s' was complete",
                        IMCC_INFO(interp)->cur_macro_name);

        if (strlen(IMCC_INFO(interp)->temp_buffer) + strlen(valp->s) >=
            sizeof(IMCC_INFO(interp)->temp_buffer))
            IMCC_fataly(interp, E_SyntaxError,
                        "Macro '%s' is too big",
                        IMCC_INFO(interp)->cur_macro_name);

        strcat(IMCC_INFO(interp)->temp_buffer, valp->s);
        free(valp->s);

        c = yylex(valp, yyscanner, interp);
    }
    free(valp->s);

    BEGIN(start_cond);

    define_macro(interp, IMCC_INFO(interp)->cur_macro_name,
                 &params, str_dup(IMCC_INFO(interp)->temp_buffer), start_line);
    IMCC_INFO(interp)->cur_macro_name = NULL;

    return MACRO;
}

static char *
find_macro_param (Interp *interp, const char *name)
{
    struct macro_frame_t *f;
    int i;

    for (f = IMCC_INFO(interp)->frames; f; f = (struct macro_frame_t*)f->s.next) {
        if (f->params) {
            for (i = 0; i < f->params->num_param; i++) {
                if (strcmp(f->params->name[i], name) == 0) {
                    return f->expansion.name[i];
                }
            }
        }
    }

    return NULL;
}

static void
define_macro(Interp *interp, char *name, struct params_t *params,
             char *expansion, int start_line)
{
    struct macro_t *m;

    m = find_macro(interp, name);

    if (m) {
        mem_sys_free(name);
        mem_sys_free(m->expansion);
    }
    else {
        m = mem_sys_allocate(sizeof(struct macro_t));
        memset(m, 0, sizeof(struct macro_t));

        if (!IMCC_INFO(interp)->macros)
            parrot_new_cstring_hash(interp, &IMCC_INFO(interp)->macros);
        parrot_hash_put(interp, IMCC_INFO(interp)->macros, name, m);
    }

    if (params)
        m->params = *params;
    else
        memset(&m->params, 0, sizeof(struct params_t));
    m->expansion = expansion;
    m->line = start_line;
}

static struct macro_t *
find_macro(Interp *interp, const char *name)
{
    DECL_CONST_CAST_OF(char);

    if (!IMCC_INFO(interp)->macros)
        return NULL;

    return parrot_hash_get(interp, IMCC_INFO(interp)->macros, const_cast(name));
}

static int
expand_macro (YYSTYPE *valp, void *interp, const char *name, void *yyscanner)
{
    int c;
    struct macro_frame_t *frame;
    struct macro_t *m;
    const char *expansion;
    int start_cond;
    int i;
    char *current;
    char *s;
    int len;
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;

    UNUSED(valp);

    expansion = find_macro_param(interp, name);
    if (expansion) {
        frame = new_frame(interp);
        /* When an error occurs, then report it as being in a macro */
        frame->is_macro = 1;
        scan_string(frame, expansion, yyscanner);
        return 1;
    }

    m = find_macro(interp, name);
    if (m) {
        frame = new_frame(interp);
        frame->params = &m->params;
        /* When an error occurs, then report it as being in a macro */
        frame->is_macro = 1;
        /* remember macro name for error reporting
        TODO check that all the .file text is malloced / freed
        */
        frame->s.file = str_dup(name);
        /* whitespace can be savely ignored */
        do {
            c = input(yyscanner);
        } while (c == ' ' || c == '\t');

        if (c != '(') {
            if (m->params.num_param != 0)
                IMCC_fataly(interp, E_SyntaxError,
                            "Macro '%s' needs %d arguments",
                            name, m->params.num_param);
            unput(c);
            scan_string(frame, m->expansion, yyscanner);
            return 1;
        }

        start_cond = YY_START;
        BEGIN(macro);

        read_params (NULL, interp, &frame->expansion, name, 0, yyscanner);

        BEGIN(start_cond);

        if (frame->expansion.num_param == 0 && m->params.num_param == 1) {
            frame->expansion.name[0] = str_dup("");
            frame->expansion.num_param = 1;
        }

        if (frame->expansion.num_param != m->params.num_param) {
            IMCC_fataly(interp, E_SyntaxError,
                        "Macro '%s' requires %d arguments, but %d given",
                        name, m->params.num_param, frame->expansion.num_param);
        }

        /* expand arguments */
        for (i = 0; i < frame->expansion.num_param; i ++) {
            current = frame->expansion.name[i];
            if (current[0] == '.') { /* parameter of outer macro */
                s = find_macro_param(interp, current + 1);
                if (s) {
                    frame->expansion.name[i] = strdup(s);
                    free(current);
                }
            }
            else {
                len = strlen(current) - 1;
                if (len >= 0 && current[len] == '$') { /* local label */
                    current[len] = '\0';
                    s = mem_sys_allocate(len + 1 + 10);
                    sprintf(s, "%s%d", current, IMCC_INFO(interp)->frames->label);
                    frame->expansion.name[i] = s;
                    free(current);
                }
            }
        }

        IMCC_INFO(interp)->line = m->line;
        scan_string(frame, m->expansion, yyscanner);
        return 1;
    }

    return 0;
}

static void
include_file (Interp* interp, char *file_name, void *yyscanner)
{
    struct macro_frame_t *frame;
    FILE *file = 0;
    char *ext, *s;
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;

    frame = new_frame(interp);
    s = Parrot_locate_runtime_file(interp, file_name,
                                   PARROT_RUNTIME_FT_INCLUDE);
    if (s) {
        file = fopen(s, "r");
        if (!file) {
            mem_sys_free(s);
            IMCC_fataly(interp, E_IOError, strerror(errno));
        }
    }
    else
        IMCC_fataly(interp, E_IOError, strerror(errno));

    frame->s.file = file_name;
    frame->s.handle = file;

    ext = strrchr(file_name, '.');
    if (ext) {
        if (strcmp (ext, ".pasm") == 0) {
            frame->s.pasm_file = 1;
            BEGIN(emit);
        }
        else if (strcmp (ext, ".pir") == 0) {
            frame->s.pasm_file = 0;
            BEGIN(INITIAL);
        }
    }

    scan_file (interp, frame, file, yyscanner);
}

static void
scan_file (Interp* interp, struct macro_frame_t *frame, FILE *file, void *yyscanner)
{
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
    frame->buffer = YY_CURRENT_BUFFER;
    frame->s.next = (struct parser_state_t*)IMCC_INFO(interp)->frames;
    IMCC_INFO(interp)->frames = frame;
    IMCC_INFO(interp)->state = (struct parser_state_t *) IMCC_INFO(interp)->frames;

    IMCC_INFO(interp)->line = 1;

    yy_switch_to_buffer(yy_create_buffer(file, YY_BUF_SIZE, yyscanner), yyscanner);
}

void
IMCC_push_parser_state(Interp* interp)
{
    struct macro_frame_t *frame;

    frame = new_frame(interp);
    frame->s.next = (struct parser_state_t*)IMCC_INFO(interp)->frames;
    IMCC_INFO(interp)->frames = frame;
    frame->s.line = IMCC_INFO(interp)->line = 1;
    IMCC_INFO(interp)->state = (struct parser_state_t *) IMCC_INFO(interp)->frames;
}

static void
pop_parser_state(Interp* interp, void *yyscanner)
{
    int l;
    struct macro_frame_t *tmp;
    tmp = IMCC_INFO(interp)->frames;
    if (tmp) {
        if (tmp->s.handle)
            fclose (tmp->s.handle);
        IMCC_INFO(interp)->frames = (struct macro_frame_t*) IMCC_INFO(interp)->frames->s.next;
        l = destroy_frame(tmp, yyscanner);
        if (l)
            IMCC_INFO(interp)->line = l;
    }
    IMCC_INFO(interp)->state = (struct parser_state_t *) IMCC_INFO(interp)->frames;
}

void
IMCC_pop_parser_state(Interp* interp, void *yyscanner)
{
    pop_parser_state(interp, yyscanner);
}

void
compile_file(Interp *interp, FILE *file, void *yyscanner)
{
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
    YY_BUFFER_STATE buffer;

    IMCC_INFO(interp)->frames->s.next = NULL;
    buffer = YY_CURRENT_BUFFER;
    yy_switch_to_buffer(yy_create_buffer(file, YY_BUF_SIZE, yyscanner), yyscanner);

    emit_open(interp, 1, NULL);

    IMCC_TRY(IMCC_INFO(interp)->jump_buf, IMCC_INFO(interp)->error_code) {
        yyparse(yyscanner, (void *) interp);
        imc_compile_all_units(interp);
    }
    IMCC_CATCH(IMCC_FATAL_EXCEPTION) {
        IMCC_INFO(interp)->error_code=IMCC_FATAL_EXCEPTION;
    }
    IMCC_CATCH(IMCC_FATALY_EXCEPTION) {
        IMCC_INFO(interp)->error_code=IMCC_FATALY_EXCEPTION;
    }
    IMCC_END_TRY;

    if(buffer != NULL) {
        yy_switch_to_buffer(buffer, yyscanner);
    }
}

void
compile_string(Interp *interp, char *s, void *yyscanner)
{
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
    YY_BUFFER_STATE buffer;

    IMCC_INFO(interp)->frames->s.next = NULL;
    buffer = YY_CURRENT_BUFFER;

    yy_scan_string(s, yyscanner);
    emit_open(interp, 1, NULL);

    IMCC_TRY(IMCC_INFO(interp)->jump_buf, IMCC_INFO(interp)->error_code) {
        yyparse(yyscanner, (void *) interp);
        imc_compile_all_units(interp);
    }
    IMCC_CATCH(IMCC_FATAL_EXCEPTION) {
        IMCC_INFO(interp)->error_code=IMCC_FATAL_EXCEPTION;
    }
    IMCC_CATCH(IMCC_FATALY_EXCEPTION) {
        IMCC_INFO(interp)->error_code=IMCC_FATALY_EXCEPTION;
    }
    IMCC_END_TRY;

    if(buffer != NULL) {
        yy_switch_to_buffer(buffer, yyscanner);
    }
}

void
IMCC_print_inc(Interp *interp)
{
    struct macro_frame_t *f;
    const char *old;

    UNUSED(interp);
    if (IMCC_INFO(interp)->frames && IMCC_INFO(interp)->frames->is_macro)
        fprintf(stderr, "\n\tin macro '.%s' line %d\n",
                IMCC_INFO(interp)->frames->s.file, IMCC_INFO(interp)->line);
    else
        fprintf(stderr, "\n\tin file '%s' line %d\n",
                IMCC_INFO(interp)->frames->s.file, IMCC_INFO(interp)->line);
    old = IMCC_INFO(interp)->frames->s.file;
    for (f = IMCC_INFO(interp)->frames; f; f = (struct macro_frame_t *)f->s.next) {
        if (strcmp(f->s.file, old)) {
            fprintf(stderr, "\tincluded from '%s' line %d\n",
                    f->s.file, f->s.line);
        }
        old = f->s.file;
    }
}

/* Functions to set and get yyin, as we can't decorate it for export
   (since it is defined in a file generated by yacc/bison). */
FILE* imc_yyin_set(FILE* new_yyin, void *yyscanner)
{
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
    yyg->yyin_r = new_yyin;
    return(yyg->yyin_r);
}

FILE* imc_yyin_get(void *yyscanner)
{
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
    return(yyg->yyin_r);
}

/* return true if scanner is at EOF */
int at_eof(yyscan_t yyscanner)
{
    struct yyguts_t * yyg = (struct yyguts_t*)yyscanner;
    return yyg->yy_hold_char == '\0';
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
