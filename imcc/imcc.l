%{
/*
 * imcc.l
 *
 * Intermediate Code Compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith
 *
 * The tokenizer.
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
    char *name;
    struct params_t params;
    char *expansion;
    int line;
};

/* XXX: boe: rework this hack to use a hash */
struct macro_t macros[256];
int num_macros = 0;

char temp_buffer[4096];

struct macro_frame_t {
    struct macro_frame_t *next;
    YY_BUFFER_STATE buffer;
    struct params_t *params;
    struct params_t expansion;
    int label;
    int line;
    int pasm_file;      /* pasm_file mode of previous frame */
};

struct macro_frame_t *frames = NULL;

/* static function declariations */
static struct macro_frame_t *new_frame (void);
static void scan_string (struct macro_frame_t *frame, const char *expansion);
static void scan_file (struct macro_frame_t *frame, FILE *);
static void destroy_frame (struct macro_frame_t *frame);
static int yylex_skip (YYSTYPE *valp, void *interp, const char *skip);

static int read_macro (YYSTYPE *valp, void *interp);
static int expand_macro (YYSTYPE *valp, void *interp, const char *name);
static void include_file (const char *file_name);
static int in_pod;

#define YY_DECL int yylex(YYSTYPE *valp, struct Parrot_Interp *interp)

#define YYCHOP() (yytext[--yyleng] = '\0')
#define DUP_AND_RET(valp, token)             \
  do {                                       \
      if (valp) (valp)->s = str_dup(yytext); \
      return token;                          \
  } while (0)

%}

%option outfile="imclexer.c"

LETTER          [a-zA-Z_]
DIGIT           [0-9]
HEX		0x[0-9A-Fa-f]+
BIN             0b[01]+
DOT		[.]
SIGN            [-+]
FLOATNUM        {SIGN}?{DIGIT}+{DOT}{DIGIT}*([eE]{SIGN}?{DIGIT}+)?
LETTERDIGIT     [a-zA-Z0-9_]
ID              {LETTER}{LETTERDIGIT}*
STRINGCONSTANT  \"(\\\"|[^"\n]*)*\"
CHARCONSTANT    \'[^'\n]*\'
RANKSPEC        \[[,]*\]
EOL		\r?\n
WS              [\t\f\r ]

%x emit
%x macro
%x pod

%%
        /* for emacs "*/
        if (expect_pasm == 1 && !in_pod) {
            expect_pasm = 2;
            BEGIN(emit);
        }
        if (pasm_file && YYSTATE == INITIAL && !in_pod) {
            if (pasm_file == 1) {
                BEGIN(emit);
                return EMIT;
	    }
            return 0;
        }

<INITIAL,emit>{EOL} {
        if (expect_pasm == 2)
	  BEGIN(INITIAL);
        expect_pasm = 0;
        line++;
        return '\n';
    }

<INITIAL,emit>#.*{EOL} {
        if (expect_pasm == 2)
	  BEGIN(INITIAL);
        expect_pasm = 0;
        line++;
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

^"="            { in_pod = 1; BEGIN(pod); }
<pod>^"=cut"{EOL}    { in_pod = 0; BEGIN(INITIAL); }
<pod>.*         { /*ignore*/ }
<pod>{EOL}      { ++line; }

".sym"          return(LOCAL);
".arg"          return(ARG);
".sub"          return(SUB);
".end"          return(ESUB);
".pcc_begin"    return(PCC_BEGIN);
".pcc_end"      return(PCC_END);
".pcc_call"     return(PCC_CALL);
".pcc_sub"      return(PCC_SUB);
".pcc_begin_return"    return(PCC_BEGIN_RETURN);
".pcc_end_return"      return(PCC_END_RETURN);
".pcc_begin_yield"    return(PCC_BEGIN_YIELD);
".pcc_end_yield"      return(PCC_END_YIELD);
"prototyped"    return PROTOTYPED;
"non_prototyped"    return NON_PROTOTYPED;

".result"       return(RESULT);
".return"       return(RETURN);
".class"        return(CLASS);
".endclass"     return(ENDCLASS);
".namespace"    return(NAMESPACE);
".endnamespace" return(ENDNAMESPACE);
".local"        return(LOCAL);
".const"        return(CONST);
".globalconst"  return(GLOBAL_CONST);
".param"        return(PARAM);
"end"           return(END);
"goto"          return(GOTO);
"if"            return(IF);
"unless"        return(UNLESS);
"int"           return(INTV);
"inc"           return(INC);
"dec"           return(DEC);
"float"         return(FLOATV);
"new"           return(NEW);
"defined"       return(DEFINED);
"addr"          return(ADDR);
"global"        return(GLOBAL);
"clone"         return(CLONE);
"string"        return(STRINGV);
"call"          return(CALL);
"saveall"       return(SAVEALL);
"restoreall"    return(RESTOREALL);
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

<emit,INITIAL>".macro" {
        return read_macro(valp, interp);
    }

<emit>".constant" {
        int c;
	char *name;
	struct macro_t *m;

	BEGIN(macro);
	c = yylex_skip(valp, interp, " ");
	if (c != IDENTIFIER)
	    fataly(EX_SOFTWARE, ".constant", line,
		   "Constant names must be identifiers");

	name = str_dup(valp->s);

	c = yylex_skip(valp, interp, " ");
        if (c != INTC && c != FLOATC && c != STRINGC && c != REG)
        fataly(EX_SOFTWARE, name, line, "Constant value must be a number, "
            "stringliteral or register");

	m = macros + num_macros++;
	m->name = name;
	m->expansion = str_dup (valp->s);
	m->params.num_param = 0;

	BEGIN (emit);
	return MACRO;
    }

<*>".include" {
        int c;

	c = yylex(valp, interp);
	if (c != STRINGC) return c;

	YYCHOP();
	include_file(str_dup(yytext + 1));
    }

<emit,INITIAL>{ID}"$:" {
        char *label;

	if (valp) {
	    YYCHOP();
            YYCHOP();

	    label = mem_sys_allocate(yyleng+10);
	    sprintf(label, "%s%d", yytext, frames->label);

	    valp->s = label;
	}

        return LABEL;
    }

<emit,INITIAL>{ID}"$" {
        char *label;

	if (valp) {
	    YYCHOP();

	    label = mem_sys_allocate(yyleng+10);
	    sprintf(label, "%s%d", yytext, frames->label);

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
        int type = Parrot_get_pmc_num(interp, yytext+1);

        if (type) {
            char *buf = malloc(16);
	    sprintf(buf, "%d", type);
	    valp->s = buf;
	    return INTC;
	}
	if (!expand_macro(valp, interp, yytext+1))
            fataly(1, "", line, "unknown macro '%s'\n", yytext);
    }

<emit,INITIAL>{LETTER}{LETTERDIGIT}* {
	if (!is_def) {
		SymReg *r = find_sym(yytext);
		if (r && (r->type & (VTIDENTIFIER|VT_CONSTP))) {
		    valp->sr = r;
		    return VAR;
		}
	}
        valp->s = str_dup(yytext);
        return(!is_def && is_op(interp, valp->s) ? PARROT_OP : IDENTIFIER);
    }

<*>{FLOATNUM}         DUP_AND_RET(valp, FLOATC);
<*>{SIGN}?{DIGIT}+    DUP_AND_RET(valp, INTC);
<*>{HEX}              DUP_AND_RET(valp, INTC);
<*>{BIN}              DUP_AND_RET(valp, INTC);

<*>{STRINGCONSTANT} {
	valp->s = str_dup(yytext);
        return(STRINGC); /* XXX delete quotes, -> emit, pbc */
    }

<*>{CHARCONSTANT} {
        valp->s = str_dup(yytext); /* XXX delete quotes, -> emit, pbc */
        return(STRINGC);
    }

<INITIAL>\$I[0-9]+          DUP_AND_RET(valp, IREG);
<INITIAL>\$N[0-9]+          DUP_AND_RET(valp, NREG);
<INITIAL>\$S[0-9]+          DUP_AND_RET(valp, SREG);
<INITIAL>\$P[0-9]+          DUP_AND_RET(valp, PREG);

<emit,INITIAL>{WS}+ /* skip */;

<emit,INITIAL>.     {
        return yytext[0];
    }

<emit><<EOF>> {
        BEGIN (INITIAL);
        if (pasm_file) {
            pasm_file = 2;
            return EOM;
        }
        return 0;
    }

<INITIAL><<EOF>> yyterminate();

<macro>".endm"         DUP_AND_RET(valp, ENDM);

<macro>{WS}*{EOL} {
        line++;
        DUP_AND_RET(valp, '\n');
    }

<macro>"$"{ID}":"  return LABEL;
<macro>".local"{WS}+ {
        char *label;
	char *name = macros[num_macros].name;

	if (yylex(valp, interp) != LABEL)
	    fataly(EX_SOFTWARE, "", line, "LABEL expected");

	if (valp) {
	    YYCHOP();

	    label = mem_sys_allocate(strlen(name) + yyleng + 15);
	    sprintf(label, "local__%s__%s__$:", name, yytext+1);

	    valp->s = label;
	}

	return LABEL;
    }

<macro>".$"{ID} {
        char *label;
	char *name = macros[num_macros].name;

	if (valp) {
	    label = mem_sys_allocate(strlen(name) + yyleng + 15);
	    sprintf(label, "local__%s__%s__$", name, yytext+2);

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

int yywrap() {
    /* Add code here to open next source file and start scanning
       yywrap returns 0 if scanning is to continue
    */
    yy_delete_buffer(YY_CURRENT_BUFFER);

    /* pop old frame */
    if (frames) {
	struct macro_frame_t *tmp;
	tmp = frames;
        pasm_file = frames->pasm_file;
        if (YYSTATE == INITIAL || YYSTATE == emit)
            BEGIN(pasm_file ? emit : INITIAL);
	frames = frames->next;
	destroy_frame(tmp);
	return 0;
    }

    return 1;
}

static struct macro_frame_t *
new_frame (void)
{
    static int label = 0;
    struct macro_frame_t *tmp;

    tmp = mem_sys_allocate_zeroed(sizeof(struct macro_frame_t));
    tmp->label = ++label;
    tmp->line = line;
    tmp->pasm_file = pasm_file;

    return tmp;
}

static void
scan_string (struct macro_frame_t *frame, const char *expansion)
{
    frame->buffer = YY_CURRENT_BUFFER;
    frame->next = frames;
    frames = frame;

    yy_scan_string(expansion);
}

static void
destroy_frame (struct macro_frame_t *frame)
{
    YY_BUFFER_STATE buffer;
    int i;

    buffer = frame->buffer;

    for (i = 0; i < frame->expansion.num_param; i++) {
	free(frame->expansion.name[i]);
    }

    line = frame->line;

    mem_sys_free(frame);

    yy_switch_to_buffer(buffer);
}

static int
yylex_skip (YYSTYPE *valp, void *interp, const char *skip)
{
    int c;
    const char *p;

    do {
        c = yylex(valp, interp);
        p = skip;
	while (*p && c != *p) p++;
    } while (*p != '\0');

    DUP_AND_RET(valp, c);
}

static int
read_params (YYSTYPE *valp, void *interp, struct params_t *params,
	     const char *macro_name, int need_id)
{
    int c;
    YYSTYPE val;
    char *current = str_dup("");
    int len = 0;

    params->num_param = 0;
    c = yylex_skip(&val, interp, " \n");

    while(c != ')') {
	if (c == 0)
	    fataly(EX_SOFTWARE, macro_name, line,
		   "End of file reached while reading arguments");
	else if (c == ',') {
	    params->name[params->num_param++] = current;
	    current = str_dup("");
	    len = 0;
	    c = yylex_skip(&val, interp, " \n");
	}
	else if (need_id && (*current || c != IDENTIFIER) && c != ' ') {
	    fataly(EX_SOFTWARE, macro_name, line,
		   "Parameter definition must be IDENTIFIER");
	}
	else {
	    if (!need_id || c != ' ') {
		len += strlen(val.s);
		current = realloc(current, len + 1);
		strcat(current,val.s);
	    }
	    free(val.s);
	    c = yylex(&val,interp);
	}
    }
    params->name[params->num_param++] = current;

    if (valp) *valp = val;
    else free(val.s);

    return c;
}

static int
read_macro (YYSTYPE *valp, void *interp)
{
    int c;
    struct macro_t *m = macros + num_macros;
    int start_cond;

    temp_buffer[0]='\0';

    start_cond = YY_START;
    BEGIN(macro);

    c = yylex_skip(valp, interp, " ");
    if (c != IDENTIFIER)
	fataly(EX_SOFTWARE, ".macro", line, "Macro names must be identifiers");

    m->name = valp->s;
    m->line = line;

    /* white space is allowed between macro and opening paren) */
    c = yylex_skip(valp, interp, " ");

    if (c == '(') {
	free(valp->s);

	c = read_params(NULL, interp, &m->params, m->name, 1);

	c = yylex(valp, interp);
    }

    while (c != ENDM) {
	if (c == 0)
	    fataly (EX_SOFTWARE, m->name, line,
		    "File ended before macro was complete");

	strcat(temp_buffer, valp->s);
	free(valp->s);

        c = yylex(valp, interp);
    }
    free(valp->s);

    BEGIN(start_cond);

    macros[num_macros].expansion = str_dup(temp_buffer);

    num_macros++;
    return MACRO;
}

static char *
find_macro_param (const char *name)
{
    struct macro_frame_t *f;
    int i;

    for (f = frames; f; f = f->next) {
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

static struct macro_t *
find_macro (const char* name)
{
    int i;

    for (i = 0; i < num_macros; i++) {
	if (strcmp(name, macros[i].name) == 0) return macros + i;
    }

    return NULL;
}

static int
expand_macro (YYSTYPE *valp, void *interp, const char *name)
{
    int c;
    struct macro_frame_t *frame;
    struct macro_t *m;
    const char *expansion;
    int start_cond;

    UNUSED(valp);
    frame = new_frame();

    expansion = find_macro_param(name);
    if (expansion) {
	scan_string(frame, expansion);
	return 1;
    }

    m = find_macro(name);
    frame->params = &m->params;
    if (m) {
	/* whitespace can be savely ignored */
	do {
	    c = input();
	} while (c == ' ' || c == '\t');

	if (c != '(') {
	    unput(c);
	    if (m->params.num_param != 0)
		fataly (EX_SOFTWARE, m->name, line,
			"macro needs %d parameters", m->params.num_param);
	    scan_string(frame, m->expansion);
	    return 1;
	}

	start_cond = YY_START;
	BEGIN(macro);

	read_params (NULL, interp, &frame->expansion, m->name, 0);

	BEGIN(start_cond);

	if (frame->expansion.num_param == 0 && m->params.num_param == 1) {
	    frame->expansion.name[0] = str_dup("");
	    frame->expansion.num_param = 1;
	}

	if (frame->expansion.num_param != m->params.num_param) {
	    fataly(EX_SOFTWARE, m->name, line,
		   "Macro requires %d arguments, but %d given",
		   frame->expansion.num_param, m->params.num_param);
	}

	line = m->line;
	scan_string(frame, m->expansion);
	return 1;
    }

    return 0;
}

static void
include_file (const char *file_name)
{
    struct macro_frame_t *frame;
    FILE *file;
    char *ext;

    frame = new_frame();

    file = fopen(file_name, "r");
    if (!file) {
        /* TODO make include patch configurable */
        const char * incl_path =  "runtime/parrot/include";
        char *s = malloc(strlen(incl_path) + strlen(file_name) + 2);
        strcpy(s, incl_path);
        strcat(s, "/");
        strcat(s, file_name);
#ifdef WIN32
        {
            char *p;
            while ( (p = strchr(s, '/')) )
                *p = '\\';
        }
#endif
        file = fopen(s, "r");
        free(s);
    }
    if (!file)
        fataly(EX_SOFTWARE, file_name, line, strerror(errno));
    ext = strrchr(file_name, '.');
    if (ext) {
        if (strcmp (ext, ".pasm") == 0) {
            pasm_file = 1;
            BEGIN(emit);
        }
        else if (strcmp (ext, ".imc") == 0) {
            pasm_file = 0;
            BEGIN(INITIAL);
        }
    }

    scan_file (frame, file);
}

static void
scan_file (struct macro_frame_t *frame, FILE *file)
{
    frame->buffer = YY_CURRENT_BUFFER;
    frame->next = frames;
    frames = frame;

    /* XXX: Switch the filename */
    line = 1;

    yy_switch_to_buffer(yy_create_buffer(file, YY_BUF_SIZE));
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
