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
     CALL = 260,
     GOTO = 261,
     ARG = 262,
     FLATTEN_ARG = 263,
     IF = 264,
     UNLESS = 265,
     NEW = 266,
     NEWSUB = 267,
     NEWCLOSURE = 268,
     END = 269,
     SAVEALL = 270,
     RESTOREALL = 271,
     NAMESPACE = 272,
     ENDNAMESPACE = 273,
     CLASS = 274,
     ENDCLASS = 275,
     FIELD = 276,
     METHOD = 277,
     SUB = 278,
     SYM = 279,
     LOCAL = 280,
     CONST = 281,
     INC = 282,
     DEC = 283,
     GLOBAL_CONST = 284,
     SHIFT_LEFT = 285,
     SHIFT_RIGHT = 286,
     INTV = 287,
     FLOATV = 288,
     STRINGV = 289,
     DEFINED = 290,
     LOG_XOR = 291,
     RELOP_EQ = 292,
     RELOP_NE = 293,
     RELOP_GT = 294,
     RELOP_GTE = 295,
     RELOP_LT = 296,
     RELOP_LTE = 297,
     GLOBAL = 298,
     ADDR = 299,
     CLONE = 300,
     RESULT = 301,
     RETURN = 302,
     POW = 303,
     SHIFT_RIGHT_U = 304,
     LOG_AND = 305,
     LOG_OR = 306,
     COMMA = 307,
     ESUB = 308,
     PCC_BEGIN = 309,
     PCC_END = 310,
     PCC_CALL = 311,
     PCC_SUB = 312,
     PCC_BEGIN_RETURN = 313,
     PCC_END_RETURN = 314,
     PCC_BEGIN_YIELD = 315,
     PCC_END_YIELD = 316,
     NCI_CALL = 317,
     PROTOTYPED = 318,
     NON_PROTOTYPED = 319,
     LABEL = 320,
     EMIT = 321,
     EOM = 322,
     IREG = 323,
     NREG = 324,
     SREG = 325,
     PREG = 326,
     IDENTIFIER = 327,
     STRINGC = 328,
     INTC = 329,
     FLOATC = 330,
     REG = 331,
     MACRO = 332,
     ENDM = 333,
     PARROT_OP = 334,
     VAR = 335,
     LINECOMMENT = 336,
     FILECOMMENT = 337
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define CALL 260
#define GOTO 261
#define ARG 262
#define FLATTEN_ARG 263
#define IF 264
#define UNLESS 265
#define NEW 266
#define NEWSUB 267
#define NEWCLOSURE 268
#define END 269
#define SAVEALL 270
#define RESTOREALL 271
#define NAMESPACE 272
#define ENDNAMESPACE 273
#define CLASS 274
#define ENDCLASS 275
#define FIELD 276
#define METHOD 277
#define SUB 278
#define SYM 279
#define LOCAL 280
#define CONST 281
#define INC 282
#define DEC 283
#define GLOBAL_CONST 284
#define SHIFT_LEFT 285
#define SHIFT_RIGHT 286
#define INTV 287
#define FLOATV 288
#define STRINGV 289
#define DEFINED 290
#define LOG_XOR 291
#define RELOP_EQ 292
#define RELOP_NE 293
#define RELOP_GT 294
#define RELOP_GTE 295
#define RELOP_LT 296
#define RELOP_LTE 297
#define GLOBAL 298
#define ADDR 299
#define CLONE 300
#define RESULT 301
#define RETURN 302
#define POW 303
#define SHIFT_RIGHT_U 304
#define LOG_AND 305
#define LOG_OR 306
#define COMMA 307
#define ESUB 308
#define PCC_BEGIN 309
#define PCC_END 310
#define PCC_CALL 311
#define PCC_SUB 312
#define PCC_BEGIN_RETURN 313
#define PCC_END_RETURN 314
#define PCC_BEGIN_YIELD 315
#define PCC_END_YIELD 316
#define NCI_CALL 317
#define PROTOTYPED 318
#define NON_PROTOTYPED 319
#define LABEL 320
#define EMIT 321
#define EOM 322
#define IREG 323
#define NREG 324
#define SREG 325
#define PREG 326
#define IDENTIFIER 327
#define STRINGC 328
#define INTC 329
#define FLOATC 330
#define REG 331
#define MACRO 332
#define ENDM 333
#define PARROT_OP 334
#define VAR 335
#define LINECOMMENT 336
#define FILECOMMENT 337




#ifndef YYSTYPE
#line 203 "imcc/imcc.y"
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
#line 214 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

