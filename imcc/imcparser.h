/* A Bison parser, made from imcc/imcc.y, by GNU bison 1.75.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

#ifndef BISON_IMCC_IMCPARSER_H
# define BISON_IMCC_IMCPARSER_H

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     LOW_PREC = 258,
     PARAM = 259,
     PRAGMA = 260,
     CALL = 261,
     GOTO = 262,
     ARG = 263,
     FLATTEN_ARG = 264,
     IF = 265,
     UNLESS = 266,
     END = 267,
     SAVEALL = 268,
     RESTOREALL = 269,
     NEW = 270,
     NEWSUB = 271,
     NEWCLOSURE = 272,
     NEWCOR = 273,
     NEWCONT = 274,
     NAMESPACE = 275,
     ENDNAMESPACE = 276,
     CLASS = 277,
     ENDCLASS = 278,
     FIELD = 279,
     METHOD = 280,
     SUB = 281,
     SYM = 282,
     LOCAL = 283,
     CONST = 284,
     INC = 285,
     DEC = 286,
     GLOBAL_CONST = 287,
     SHIFT_LEFT = 288,
     SHIFT_RIGHT = 289,
     INTV = 290,
     FLOATV = 291,
     STRINGV = 292,
     DEFINED = 293,
     LOG_XOR = 294,
     RELOP_EQ = 295,
     RELOP_NE = 296,
     RELOP_GT = 297,
     RELOP_GTE = 298,
     RELOP_LT = 299,
     RELOP_LTE = 300,
     GLOBAL = 301,
     ADDR = 302,
     CLONE = 303,
     RESULT = 304,
     RETURN = 305,
     POW = 306,
     SHIFT_RIGHT_U = 307,
     LOG_AND = 308,
     LOG_OR = 309,
     COMMA = 310,
     ESUB = 311,
     PCC_BEGIN = 312,
     PCC_END = 313,
     PCC_CALL = 314,
     PCC_SUB = 315,
     PCC_BEGIN_RETURN = 316,
     PCC_END_RETURN = 317,
     PCC_BEGIN_YIELD = 318,
     PCC_END_YIELD = 319,
     NCI_CALL = 320,
     PROTOTYPED = 321,
     NON_PROTOTYPED = 322,
     LABEL = 323,
     EMIT = 324,
     EOM = 325,
     IREG = 326,
     NREG = 327,
     SREG = 328,
     PREG = 329,
     IDENTIFIER = 330,
     STRINGC = 331,
     INTC = 332,
     FLOATC = 333,
     REG = 334,
     MACRO = 335,
     ENDM = 336,
     PARROT_OP = 337,
     VAR = 338,
     LINECOMMENT = 339,
     FILECOMMENT = 340
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define CALL 261
#define GOTO 262
#define ARG 263
#define FLATTEN_ARG 264
#define IF 265
#define UNLESS 266
#define END 267
#define SAVEALL 268
#define RESTOREALL 269
#define NEW 270
#define NEWSUB 271
#define NEWCLOSURE 272
#define NEWCOR 273
#define NEWCONT 274
#define NAMESPACE 275
#define ENDNAMESPACE 276
#define CLASS 277
#define ENDCLASS 278
#define FIELD 279
#define METHOD 280
#define SUB 281
#define SYM 282
#define LOCAL 283
#define CONST 284
#define INC 285
#define DEC 286
#define GLOBAL_CONST 287
#define SHIFT_LEFT 288
#define SHIFT_RIGHT 289
#define INTV 290
#define FLOATV 291
#define STRINGV 292
#define DEFINED 293
#define LOG_XOR 294
#define RELOP_EQ 295
#define RELOP_NE 296
#define RELOP_GT 297
#define RELOP_GTE 298
#define RELOP_LT 299
#define RELOP_LTE 300
#define GLOBAL 301
#define ADDR 302
#define CLONE 303
#define RESULT 304
#define RETURN 305
#define POW 306
#define SHIFT_RIGHT_U 307
#define LOG_AND 308
#define LOG_OR 309
#define COMMA 310
#define ESUB 311
#define PCC_BEGIN 312
#define PCC_END 313
#define PCC_CALL 314
#define PCC_SUB 315
#define PCC_BEGIN_RETURN 316
#define PCC_END_RETURN 317
#define PCC_BEGIN_YIELD 318
#define PCC_END_YIELD 319
#define NCI_CALL 320
#define PROTOTYPED 321
#define NON_PROTOTYPED 322
#define LABEL 323
#define EMIT 324
#define EOM 325
#define IREG 326
#define NREG 327
#define SREG 328
#define PREG 329
#define IDENTIFIER 330
#define STRINGC 331
#define INTC 332
#define FLOATC 333
#define REG 334
#define MACRO 335
#define ENDM 336
#define PARROT_OP 337
#define VAR 338
#define LINECOMMENT 339
#define FILECOMMENT 340




#ifndef YYSTYPE
#line 205 "imcc/imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
    Symbol * sym;
    SymbolList * symlist;
    SymbolTable * symtab;
} yystype;
/* Line 1281 of /usr/local/share/bison/yacc.c.  */
#line 220 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

