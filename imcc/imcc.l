%{
/*
 * imc.l
 *
 * Cola compiler for Parrot
 *
 * Copyright (C) 2002 Melvin Smith
 *
 * Tokenizer for the intermediate compiler/code generator
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "imc.h"
#include "imcparser.h"

extern long line;
int yyerror(char *);
%}

%option outfile="imclexer.c"

LETTER          [a-zA-Z_]
DIGIT           [0-9]
LETTERDIGIT     [a-zA-Z0-9_]
SIGN            [-+]
STRINGCONSTANT  \"[^"\n]*["\n]
CHARCONSTANT    \'[^'\n]*\'
RANKSPEC        \[[,]*\]

%x emit2
%%

^".emit\n"(.|\n)*".eom\n" {
        char * s = strstr(yytext, ".eom");
        if(s) {
            s[0] = '\n';
            s[1] = 0;
        }
        yylval.s = str_dup(&yytext[5]);
        return EMIT;
    }

^".emit2"\n {
    fprintf(stderr, "EMIT\n");
        BEGIN(emit2);
    }

<emit2>^".eom"\n {
    fprintf(stderr, "EOM\n");
        BEGIN(INITIAL);
    }
 
<emit2>.|\n      ;

[\n]            line++;
#.*\n           line++;    /* COMMENT */

".sym"          return(SYM);
".arg"          return(ARG);
".sub"          return(SUB);
".class"        return(CLASS);
".endclass"     return(ENDCLASS);
".namespace"    return(NAMESPACE);
".local"        return(LOCAL);
".param"        return(PARAM);
"branch"        return(BRANCH);
"goto"          return(GOTO);
"if"            return(IF);
"int"           return(INT);
"inc"           return(INC);
"dec"           return(DEC);
"float"         return(FLOAT);
"string"        return(STRING);
"call"          return(CALL);
"print"         return(PRINT);
"push"          return(PUSH);
"pop"           return(POP);
"ret"           return(RET);
"<<"            return(SHIFT_LEFT);
">>"            return(SHIFT_RIGHT);
"<"            return(RELOP_LT);
"<="            return(RELOP_LTE);
">"            return(RELOP_GT);
">="            return(RELOP_GTE);
"=="            return(RELOP_EQ);
"!="            return(RELOP_NE);


{LETTER}{LETTERDIGIT}*":" {
        yylval.s = str_dup(yytext);
        return(LABEL);
    }

{LETTER}{LETTERDIGIT}* {
        yylval.s = str_dup(yytext);
        return(IDENTIFIER);
    }

{SIGN}?{DIGIT}+"."{DIGIT}+ {    
        yylval.s = str_dup(yytext);
        return(FLOATC);
    }

{SIGN}?{DIGIT}+ {    
        yylval.s = str_dup(yytext);
        return(INTC);
    }

{STRINGCONSTANT} {
        yylval.s = str_dup(yytext);
        return(STRINGC);
    }

\$I[0-9]+ {
        yylval.s = str_dup(yytext);
        return(IREG);
    }

\$N[0-9]+ {
        yylval.s = str_dup(yytext);
        return(NREG);
    }

\$S[0-9]+ {
        yylval.s = str_dup(yytext);
        return(SREG);
    }

\$P[0-9]+ {
        yylval.s = str_dup(yytext);
        return(PREG);
    }

[\t\f\r ]+        ;
.     {
#if 0
        fprintf(stderr, "token[%s]\n", yytext);
#endif
        return yytext[0];
    }

%%

#ifdef yywrap
#undef yywrap
#endif

int yywrap() {
    /* Add code here to open next source file and start scanning
       yywrap returns 0 if scanning is to continue
    */
    return 1;
}

#if 0 
char * str_dup(const char * buf) {
    char * s = malloc(strlen(buf)+1);
    strcpy(s, buf);
    return s;
}
#endif

