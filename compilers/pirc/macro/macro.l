%{

/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/* 
 * This pre-processor handles the macro layer of the
 * PIR language. The following constructs are filtered
 * out and handled:
 *
 * .macro_const
 * .include
 * .macro
 *
 */ 


#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>
#include "macro.h"

#define  YY_NO_UNISTD_H
#include "macroparser.h"


extern char *yyget_text(yyscan_t yyscanner);
extern int   yyerror(yyscan_t yyscanner, char *message);

extern macro_def *find_macro(constant_table *table, char *name);
extern char *concat(char *str1, char *str2);



/*

The C89 standard does not define a strdup() in the C library,
so define our own strdup. Function names beginning with "str"
are reserved (I think), so make it dupstr, as that is what it
does: duplicate a string.

*/
char *
dupstr(char const * const source) {
    char *newstring = (char *)calloc(strlen(source) + 1, sizeof (char));
    assert(newstring);
    strcpy(newstring, source);
    return newstring;
}

/*

See dupstr, except that this version takes the number of characters to be
copied. Easy for copying a string except the quotes.

*/
char *
dupstrn(char const * const source, size_t num_chars) {
    char *newstring = (char *)calloc(num_chars + 1, sizeof (char));
    assert(newstring);
    /* only copy num_chars characters */
    strncpy(newstring, source, num_chars);
    return newstring;
}

int ctr[YY_NUM_RULES];

int num_rules = YY_NUM_RULES;

int line = 1;

/* after a rule is matched, execute this block of code to keep track of the line no. */
#define YY_USER_ACTION   { ++ctr[yy_act];             \
	                     do {                         \
                              char *iter = yytext;    \
                              while (*iter != '\0') { \
                                  if (*iter == '\n')  \
                                      line++;         \
                                  iter++;             \
                              }                       \
                         }                            \
                         while (0);                   \
                         }



static int is_pir_directive(char *name);

%}

%option reentrant 
%option noyywrap 
%option bison-bridge 
%option never-interactive 
%option nounput 
%option stack 
%option debug
%option prefix="macro"
%option warn
%option noyy_top_state
%option outfile="macrolexer.c"
%option header-file="macrolexer.h"


%x MACRODEF
%x CONSTDEF
%x INCLUDE
%x MACROPAR
%x MACROBODY
%x EXPAND
%x LINE
%s EXPARGS




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

NEWLINE        {EOL}({WS}|{EOL})*

REG            "$"?[SNIP]{DIGITS}

%%



<EXPAND>{NEWLINE}   { /**/
                      yy_pop_state(yyscanner);
                      yylval->sval = dupstr("\n");
                      /*
                      fprintf(stderr, "<EXPAND>{NL}\n");
                      */
                      return TK_NL;
                    }

<MACROPAR>{NEWLINE} { /* after macro header start the macro body */
                      yy_push_state(MACROBODY, yyscanner);
                      yylval->sval = dupstr("\n");
                      /*
                      fprintf(stderr, "<MACROPAR>{NL}\n");
                      */
                      return TK_NL;
                    }

<MACROBODY>{NEWLINE} { /* return newlines in macro body as any tokens */
                       yylval->sval = dupstr("\n");
                       /*
                       fprintf(stderr, "<MACROBODY>{NL}\n");
                       */
                       return TK_ANY;
                     }

<CONSTDEF>{NEWLINE} { yy_pop_state(yyscanner);
                      yylval->sval = "\n";
                      /*
                      fprintf(stderr, "<CONSTDEF>{NL}\n");
                      */
                      return TK_NL;
                    }

<*>{WS}             { /* skip whitespace */ }


<*>{NEWLINE}        { /* in all other states, return newline as the newline token */
                      yylval->sval = dupstr("\n");
                      /*
                      fprintf(stderr, "<*>{NL} (%d)\n", YYSTATE);
                      */
                      return TK_NL;
                    }

".line"             { /* */
                      yy_push_state(LINE, yyscanner);
                      return TK_LINE;
                    }

".include"          { /* */
                      yy_push_state(INCLUDE, yyscanner);
                      return TK_INCLUDE;
                    }

".macro_const"      { /* */
                      yy_push_state(CONSTDEF, yyscanner);
                      return TK_MACRO_CONST;
                    }

".macro"            { /* */
                      yy_push_state(MACROPAR, yyscanner);
                      return TK_MACRO;
                    }

<MACROBODY>".endm" { /* when reading ".endm" while scanning macro body, go back to previous state */

                     yy_pop_state(yyscanner);
                     yy_pop_state(yyscanner);

                     return TK_ENDM;
                   }

<MACROPAR>"("      { /* recognize "(" when scanning macro parameter list */
                     return '(';
                   }

<MACROPAR>","      { /* recognize "," when scanning macro parameter list */
                     return ',';
                   }

<MACROPAR>")"      { /* recognize ")" when scanning a macro parameter list */
                     return ')';
                   }


<EXPAND>"("        { /* recognize "(" when expanding a macro */
                     yy_push_state(EXPARGS, yyscanner);
                     return '(';
                   }


<EXPAND>[^)]       { /* anything except a ")" in this state means a constant expansion, which
                      * has no arguments.
                      */
                     yylval->sval = dupstr(yytext);
                     yy_pop_state(yyscanner);
                     return TK_ANY;
                   }


<INITIAL>"("      { /* */
                    yylval->sval = dupstr(yytext);
                    return TK_ANY;
                  }



<EXPARGS>","       { /* */
                     return ',';
                   }

<EXPARGS>")"       { /* */
                     yy_pop_state(yyscanner);
                     return ')';
                   }

<EXPARGS>{IDENT}   { /* variable argument of macro expansion */
                     yylval->sval = dupstr(yytext);
                     return TK_IDENT;
                   }

<EXPARGS>{REG}     { /* register can be an argument for macro expansion. */
                     yylval->sval = dupstr(yytext);
                     return TK_IDENT;
                   }

<CONSTDEF,MACROPAR>{IDENT}   { /* constant or macro parameter ID */
                               yylval->sval = dupstr(yytext);
                               return TK_IDENT;
                             }

"."{IDENT}          { /* directive, constant, macro or method-call */
                      if (is_pir_directive(yytext)) {
                          yylval->sval = dupstr(yytext);
                          return TK_ANY;
                      }
                      else { /* not a directive */
                          extern constant_table *globaldefinitions;
                          macro_def *macro = find_macro(globaldefinitions, yytext + 1); /* skip dot */
                          if (macro != NULL) { /* it's a macro! */
                              /* only go into EXPAND state if it's a macro/constant */
                              yy_push_state(EXPAND, yyscanner);
                              yylval->mval = macro; /* pass the pointer to the macro_def */
                              return TK_DOT_IDENT;
                          }
                          else { /* it's not a macro, just a method-call */
                              yylval->sval = dupstr(yytext);
                              return TK_ANY;
                          }
                      }
                   }

"."({Q_STRING}|{REG}) { /* treat ".'foo'" or ".$P0" as 1 token to prevent the tokens are separated
                        * by a space; they clearly belong to each other if they were written
                        * together (without a space). This is a method-call, life foo .'bar'().
                        */
                       yylval->sval = dupstr(yytext);
                       return TK_ANY;
                      }

<*>","                { /* in all other cases (than the above), treat a comma just as any token. */
                        yylval->sval = dupstr(yytext);
                        return TK_ANY;
                      }




<CONSTDEF>{REG}    { yylval->sval = dupstr(yytext);
                     /* yy_pop_state(yyscanner);*/
                     return TK_IDENT;
                   }
<CONSTDEF>{Q_STRING} { yylval->sval = dupstr(yytext);
                       return TK_STRINGC;
                     }

<CONSTDEF>{SIGN}?{DIGITS} { yylval->sval = dupstr(yytext);
                            return TK_INTC;
                          }

<CONSTDEF>({HEX}|{BIN}|{OCT}) { yylval->sval = dupstr(yytext);
                                return TK_INTC;
                              }

<CONSTDEF>{FLOATNUM}      { yylval->sval = dupstr(yytext);
                            return TK_NUMC;
                          }

<INCLUDE>{Q_STRING}  { /* a quoted string is needed for an .include or the value of a
                                 * macro constant. After this token, leave the current state.
                                 */
                                yylval->sval = dupstr(yytext);
                                yy_pop_state(yyscanner);
                                return TK_STRINGC;
                              }

<LINE>{DIGITS}  { /* when defining a constant, after reading the value, leave this state */
                           yylval->sval = dupstr(yytext);
                           yy_pop_state(yyscanner);
                           return TK_INTC;
                         }


<EXPARGS>{Q_STRING}   { /* quoted strings argument for macro expansion */
                        yylval->sval = dupstr(yytext);
                        return TK_STRINGC;
                      }

<EXPARGS>{SIGN}?{DIGITS} { yylval->sval = dupstr(yytext);
                           return TK_INTC;
                         }
<EXPARGS>{HEX}             { yylval->sval = dupstr(yytext);
                             return TK_INTC;
                           }
<EXPARGS>{BIN}            { yylval->sval = dupstr(yytext);
                            return TK_INTC;
                          }
<EXPARGS>{OCT}           { yylval->sval = dupstr(yytext);
                           return TK_INTC;
                         }
<EXPARGS>{FLOATNUM}   { yylval->sval = dupstr(yytext);
                        return TK_NUMC;
                      }

<INITIAL,MACROBODY>{REG}         { /* register */
                                   yylval->sval = dupstr(yytext);
                                   return TK_ANY;
                                 }

<INITIAL,MACROBODY>{Q_STRING}    { /* quoted string */
                                   yylval->sval = dupstr(yytext);
                                   return TK_ANY;
                                 }

<INITIAL,MACROBODY>{IDENT}       { /* identifier */
                                   yylval->sval = dupstr(yytext);
                                   return TK_ANY;
                                 }

<INITIAL,MACROBODY>":"{IDENT}    { /* flag */
                                   yylval->sval = dupstr(yytext);
                                   return TK_ANY;
                                 }

<MACROBODY>"."{IDENT}    { /* expansions in a macro body; ignore for now. */
                           yylval->sval = dupstr(yytext);
                           return TK_ANY;
                         }


<INITIAL,MACROBODY>{FLOATNUM}    { yylval->sval = dupstr(yytext);
                                   return TK_ANY;
                                 }

<INITIAL,MACROBODY>{SIGN}?{DIGITS} { yylval->sval = dupstr(yytext);
                                     return TK_ANY;
                                   }

<INITIAL,MACROBODY>({HEX}|{BIN}|{OCT}) { yylval->sval = dupstr(yytext);
                                         return TK_ANY;
                                       }


<INITIAL,MACROBODY>{IDENT}":"    { /* labels */
                                   yylval->sval = dupstr(yytext);
                                   return TK_ANY;
                                 }

<*>"=="|"!="|"<="|"=>"|">="|">>"|"<<"|">>>"             { yylval->sval = dupstr(yytext);
                                                          return TK_ANY;
                                                        }

<*>"+="|"-="|"*="|"/="|".="|">>="|"<<="|">>>="|"//="    { yylval->sval = dupstr(yytext);
                                                          return TK_ANY;
                                                        }

<<EOF>>             { /* when end of file or end of string buffer, stop scanning. */
                      yyterminate();
                    }



<*>.                   { /* just return any single character token we didn't match before. */
                          /*fprintf(stderr, "<*>%s\n", yytext); */
                         yylval->sval = dupstr(yytext);
                         return TK_ANY;
                       }

%%


/*

=head1 FUNCTIONS

=over 4

=item C<is_pir_directive>

Returns a non-zero value if the specified name is a PIR directive.

*/
static int
is_pir_directive(char *name) {

    static char * const directives[] = {
        ".arg",
        ".begin_call",
        ".begin_return",
        ".begin_yield",
        ".call",
        ".const",
        ".emit",
        ".end",
        ".end_call",
        ".end_return",
        ".end_yield",
        ".eom",
        ".get_results",
        ".globalconst",
        ".HLL",
        ".HLL_map",
        ".invocant",
        ".lex",
        ".loadlib",
        ".local",
        ".meth_call",
        ".namespace",
        ".nci_call",
        ".param",
        ".return",
        ".sub",
        ".yield",
        NULL /* needed to easily write loops on this array */
    };

    /* iter is a pointer to constant "char *" (strings). */
    char * const *iter = directives;

    while (*iter != NULL) {
        if (strcmp(*iter, name) == 0) {
            return 1;
        }
        iter++;
    }
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


