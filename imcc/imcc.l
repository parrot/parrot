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

struct include_frame_t {
    struct include_frame_t *next;
    YY_BUFFER_STATE buffer;
    int label;
    const char *file;
    int line;
    int pasm_file;      /* pasm_file mode of previous frame */
}; 

struct include_frame_t *frames = NULL;


/* static function declariations */
static struct include_frame_t *new_frame (void);
static void destroy_frame (struct include_frame_t *frame);
static int yylex_skip (YYSTYPE *valp, void *interp, const char *skip);

static void include_file (char *file_name);
static int in_pod;
static int prev_state;

#define YY_DECL int yylex(YYSTYPE *valp, struct Parrot_Interp *interp)

#define YYCHOP() (yytext[--yyleng] = '\0')
#define DUP_AND_RET(valp, token)             \
  do {                                       \
      if (valp) (valp)->s = str_dup(yytext); \
      return token;                          \
  } while (0)

%}

%option never-interactive
%option stack

LETTER          [a-zA-Z_@]
DIGIT           [0-9]
DIGITS          {DIGIT}+
HEX		0x[0-9A-Fa-f]+
BIN             0b[01]+
DOT		[.]
SIGN            [-+]
FLOATNUM        {SIGN}?{DIGITS}{DOT}{DIGIT}*([eE]{SIGN}?{DIGITS})?
LETTERDIGIT     [a-zA-Z0-9_]
LABELLETTERDIGIT     ([a-zA-Z0-9_@]|"::")
ID              {LETTER}{LABELLETTERDIGIT}*
STRINGCONSTANT  \"(\\\"|[^"\n]*)*\"
CHARCONSTANT    \'[^'\n]*\'
RANKSPEC        \[[,]*\]
EOL		\r?\n
WS              [\t\f\r\x1a ]
SP              [ ]

%x emit
%x pod
%x cmt1
%x cmt2
%x cmt3
%x cmt4
%x cmt5

%%
        /* for emacs "*/
        if (expect_pasm == 1 && !in_pod) {
            expect_pasm = 2;
            BEGIN(emit);
        }
        if (pasm_file && YYSTATE == INITIAL && !in_pod) {
            if (0)
                yy_top_state(); /* silent warning */
            if (pasm_file == 1) {
                BEGIN(emit);
                return EMIT;
	    }
            return 0;
        }

<*>^"#line"{SP}{DIGITS}{SP}["] { prev_state = YYSTATE; BEGIN(cmt2);
                       valp->t = atoi(yytext+6);
                       return LINECOMMENT;
               }
<cmt2>[^"]+    { BEGIN(cmt3);
                      valp->s = str_dup(yytext);
                      return FILECOMMENT;
               }
<cmt3>["]      { BEGIN(cmt4); }

<*>setfile{SP}+["]   { prev_state = YYSTATE; BEGIN(cmt2); }
<*>setline{SP}+      { prev_state = YYSTATE; BEGIN(cmt1); }
<cmt1>{DIGITS}       {
                       valp->t = atoi(yytext);
                       BEGIN(cmt4);
                       return LINECOMMENT;
               }
<cmt4>.*{EOL}  { BEGIN(prev_state) ; line++; }

<INITIAL,emit>{EOL} {
        if (expect_pasm == 2)
	  BEGIN(INITIAL);
        expect_pasm = 0;
        line++;
        return '\n';
    }

<INITIAL,emit># { prev_state = YYSTATE; BEGIN(cmt5); }
<cmt5>.*{EOL} {
        if (expect_pasm == 2)
	  BEGIN(INITIAL);
        else
          BEGIN(prev_state);
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

<INITIAL,emit>^"="            { in_pod = 1; yy_push_state(pod); }
<pod>^"=cut"{EOL}    { in_pod = 0; yy_pop_state(); ++line; }
<pod>.*         { /*ignore*/ }
<pod>{EOL}      { ++line; }

".sym"          return(LOCAL);
".arg"          return(ARG);
".flatten_arg"  return(FLATTEN_ARG);
".sub"          return(SUB);
".end"          return(ESUB);
".pcc_begin"    return(PCC_BEGIN);
".pcc_end"      return(PCC_END);
".pcc_call"     return(PCC_CALL);
".nci_call"     return(NCI_CALL);
<emit,INITIAL>".pcc_sub"      return(PCC_SUB);

".pcc_begin_return"    return(PCC_BEGIN_RETURN);
".pcc_end_return"      return(PCC_END_RETURN);
".pcc_begin_yield"    return(PCC_BEGIN_YIELD);
".pcc_end_yield"      return(PCC_END_YIELD);

".begin_return"    return(PCC_BEGIN_RETURN);
".end_return"      return(PCC_END_RETURN);
".begin_yield"    return(PCC_BEGIN_YIELD);
".end_yield"      return(PCC_END_YIELD);

"prototyped"    return(PROTOTYPED);
"non_prototyped"    return(NON_PROTOTYPED);

"proto"         return(PROTOTYPED);
"noproto"       return(NON_PROTOTYPED);

".result"       return(RESULT);
".return"       return(RETURN);
".class"        return(CLASS);
".endclass"     return(ENDCLASS);
".namespace"    return(NAMESPACE);
".endnamespace" return(ENDNAMESPACE);
".field"        return(FIELD);
".method"       return(METHOD);
".local"        return(LOCAL);
".global"       return(GLOBAL);
".const"        return(CONST);
".param"        return(PARAM);
"end"           return(END);
"goto"          return(GOTO);
"if"            return(IF);
"unless"        return(UNLESS);
"int"           return(INTV);
"inc"           return(INC);
"dec"           return(DEC);
"num"           return(FLOATV);
"float"         return(FLOATV);
"new"           return(NEW);
"newclosure"    return(NEWCLOSURE);
"newcont"       return(NEWCONT);
"newcor"        return(NEWCOR);
"newsub"        return(NEWSUB);
"defined"       return(DEFINED);
"addr"          return(ADDR);
"global"        return(GLOBALOP);
"clone"         return(CLONE);
"object"        return(OBJECTV);
"pmc"           return(PMCV);
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

<*>".pragma" {
        int tok = yylex(valp, interp);
        if(tok == STRINGC) {
            YYCHOP();
            imc_pragma(yytext+1);
        }
        else if(tok == IDENTIFIER) {
            imc_pragma(yytext);
        }
    }

<*>".include" {
        int c;

	c = yylex(valp, interp);
	if (c != STRINGC) return c;

	YYCHOP();
	include_file(str_dup(yytext + 1));
    }

<emit,INITIAL>","             return(COMMA);

<emit,INITIAL>{ID}":" {
	YYCHOP();  /* trim last ':' */
	DUP_AND_RET(valp,LABEL);
    }

<emit,INITIAL>{DOT}{LETTER}{LETTERDIGIT}* {
        int type = pmc_type(interp, string_from_cstring(interp, yytext+1, 0));

        if (type > 0) {
            char *buf = malloc(16);
	    sprintf(buf, "%d", type);
	    valp->s = buf;
	    return INTC;
	}
        fataly(1, sourcefile, line, "unknown directive or pmc '%s'", yytext);
    }

<emit,INITIAL>{ID} {
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

<emit,INITIAL>\$I[0-9]+          DUP_AND_RET(valp, IREG);
<emit,INITIAL>\$N[0-9]+          DUP_AND_RET(valp, NREG);
<emit,INITIAL>\$S[0-9]+          DUP_AND_RET(valp, SREG);
<emit,INITIAL>\$P[0-9]+          DUP_AND_RET(valp, PREG);

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
	struct include_frame_t *tmp;
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

static struct include_frame_t *
new_frame (void)
{
    static int label = 0;
    struct include_frame_t *tmp;
    tmp = mem_sys_allocate_zeroed(sizeof(struct include_frame_t));
    tmp->label = ++label;
    tmp->line = line;
    tmp->file = sourcefile;
    tmp->pasm_file = pasm_file;
    return tmp;
}

static void
destroy_frame (struct include_frame_t *frame)
{
    YY_BUFFER_STATE buffer;

    buffer = frame->buffer;

    line = frame->line;
    sourcefile = frame->file; /* FIXME, if file was allocated free it */

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
    if (c)
        DUP_AND_RET(valp, c);
    else
        return c;
}

static void
scan_file (struct include_frame_t *frame, FILE *file)
{
    frame->buffer = YY_CURRENT_BUFFER;
    frame->next = frames;
    frames = frame;

    /* XXX: Switch the filename */
    line = 1;

    yy_switch_to_buffer(yy_create_buffer(file, YY_BUF_SIZE));
}

static void
include_file (char *file_name)
{
    struct include_frame_t *frame;
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
        /* free(s); FIXME leak */
        if (!file)
            fataly(EX_SOFTWARE, sourcefile, line, strerror(errno));
        sourcefile = s;
    }
    else {
        sourcefile = file_name;
    }

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

void
compile_file(Interp *interp, FILE *file)
{
    YY_BUFFER_STATE buffer;

    buffer = YY_CURRENT_BUFFER;
    yy_switch_to_buffer(yy_create_buffer(file, YY_BUF_SIZE));

#if IMC_TRACE
    fprintf(stderr, "imcc.l: compile_file\n");
#endif

    emit_open(1, interp);
    yyparse((void *) interp);
    imc_compile_all_units(interp);
    imc_cleanup(interp);
    emit_close(interp);

    yy_switch_to_buffer(buffer);
}

void
print_inc(const char *file, int lin)
{
    struct include_frame_t *f;

    fprintf(stderr, "\nin file '%s' line %d\n", file, lin);
    for (f = frames; f; f = f->next) {
        if (f->file && strcmp(f->file, sourcefile))
            f->next ?
            fprintf(stderr, "\tincluded from '%s' line %d\n",
                f->file, f->line) :
            fprintf(stderr, "\tincluded from '%s' sub '%s' line %d\n",
                f->file, function, f->line);
    }
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
