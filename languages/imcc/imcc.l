%{
/*
 * imc.l
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
#include "imcparser.h"

#define YY_NO_UNPUT
extern long line;
extern int expect_pasm;
extern int pasm_file;
int state;
int yyerror(char *);
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
STRINGCONSTANT  \"(\\.|[^"\n]*)*["\n]
CHARCONSTANT    \'[^'\n]*\'
RANKSPEC        \[[,]*\]
EOL		\r?\n

%x emit
%%
        /* for emacs: ' */
        if (expect_pasm == 1) {
	    expect_pasm = 2;
            BEGIN(emit);
	}
	if (pasm_file && YYSTATE != emit) {
	    BEGIN(emit);
            return pasm_file == 1 ? EMIT : 0;
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

<emit,INITIAL>[ISNP]{DIGIT}{DIGIT}? {
	yylval.s = str_dup(yytext);
	return REG;
	}

".sym"          return(SYM);
".arg"          return(ARG);
".sub"          return(SUB);
".result"       return(RESULT);
".return"       return(RETURN);
".class"        return(CLASS);
".endclass"     return(ENDCLASS);
".namespace"    return(NAMESPACE);
".local"        return(LOCAL);
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
"print"         return(PRINT);
"push"          return(PUSH);
"pop"           return(POP);
"ret"           return(RET);
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

<emit,INITIAL>","             return(COMMA);

<emit,INITIAL>{LETTER}{LETTERDIGIT}*":" {
	yytext[yyleng-1] = 0;  /* trim last ':' */
        yylval.s = str_dup(yytext);
        return(LABEL);
    }

<emit>{DOT}{LETTER}{LETTERDIGIT}* {	/* XXX */
        yylval.s = str_dup(yytext);
        return(MACRO);
    }
<INITIAL>{DOT}?{LETTER}{LETTERDIGIT}* {
	SymReg *r = get_sym(yytext);
	if (r && r->type & VTIDENTIFIER) {
	    yylval.sr = r;
	    return VAR;
	}
        yylval.s = str_dup(yytext);
        return(is_op(yylval.s) ? PARROT_OP : IDENTIFIER);
    }
<emit,INITIAL>{LETTER}{LETTERDIGIT}* {
	SymReg *r = get_sym(yytext);
	if (r && r->type & VTIDENTIFIER) {
	    yylval.sr = r;
	    return VAR;
	}
        yylval.s = str_dup(yytext);
        return(is_op(yylval.s) ? PARROT_OP : IDENTIFIER);
    }

<emit,INITIAL>{FLOATNUM} {
        yylval.s = str_dup(yytext);
        return(FLOATC);
    }

<emit,INITIAL>{SIGN}?{DIGIT}+ {
        yylval.s = str_dup(yytext);
        return(INTC);
    }
<emit,INITIAL>{HEX} {
        yylval.s = str_dup(yytext);
        return(INTC);
    }
<emit>{BIN} {
        yylval.s = str_dup(yytext);
        return(INTC);
    }
<emit,INITIAL>{STRINGCONSTANT} {
        yylval.s = str_dup(yytext); /* XXX delete quotes, -> emit, pbc */
        return(STRINGC);
    }
<emit>{CHARCONSTANT} {
        yylval.s = str_dup(yytext);
        return(STRINGC);
    }

<emit,INITIAL>\$I[0-9]+ {
        yylval.s = str_dup(yytext);
        return(IREG);
    }

<emit,INITIAL>\$N[0-9]+ {
        yylval.s = str_dup(yytext);
        return(NREG);
    }

<emit,INITIAL>\$S[0-9]+ {
        yylval.s = str_dup(yytext);
        return(SREG);
    }

<emit,INITIAL>\$P[0-9]+ {
        yylval.s = str_dup(yytext);
        return(PREG);
    }

<emit,INITIAL>[\t\f\r ]+        ;
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

<<EOF>> yyterminate();
%%

#ifdef yywrap
#undef yywrap
#endif

int yywrap() {
    /* Add code here to open next source file and start scanning
       yywrap returns 0 if scanning is to continue
    */
    yy_delete_buffer(YY_CURRENT_BUFFER);
    return 1;
}

