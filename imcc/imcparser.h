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
     POINTY = 281,
     SUB = 282,
     SYM = 283,
     LOCAL = 284,
     CONST = 285,
     INC = 286,
     DEC = 287,
     GLOBAL_CONST = 288,
     SHIFT_LEFT = 289,
     SHIFT_RIGHT = 290,
     INTV = 291,
     FLOATV = 292,
     STRINGV = 293,
     PMCV = 294,
     OBJECTV = 295,
     DEFINED = 296,
     LOG_XOR = 297,
     RELOP_EQ = 298,
     RELOP_NE = 299,
     RELOP_GT = 300,
     RELOP_GTE = 301,
     RELOP_LT = 302,
     RELOP_LTE = 303,
     GLOBAL = 304,
     GLOBALOP = 305,
     ADDR = 306,
     CLONE = 307,
     RESULT = 308,
     RETURN = 309,
     POW = 310,
     SHIFT_RIGHT_U = 311,
     LOG_AND = 312,
     LOG_OR = 313,
     COMMA = 314,
     ESUB = 315,
     PCC_BEGIN = 316,
     PCC_END = 317,
     PCC_CALL = 318,
     PCC_SUB = 319,
     PCC_BEGIN_RETURN = 320,
     PCC_END_RETURN = 321,
     PCC_BEGIN_YIELD = 322,
     PCC_END_YIELD = 323,
     NCI_CALL = 324,
     PROTOTYPED = 325,
     NON_PROTOTYPED = 326,
     MAIN = 327,
     LOAD = 328,
     IMMEDIATE = 329,
     POSTCOMP = 330,
     LABEL = 331,
     EMIT = 332,
     EOM = 333,
     IREG = 334,
     NREG = 335,
     SREG = 336,
     PREG = 337,
     IDENTIFIER = 338,
     STRINGC = 339,
     INTC = 340,
     FLOATC = 341,
     REG = 342,
     MACRO = 343,
     ENDM = 344,
     PARROT_OP = 345,
     VAR = 346,
     LINECOMMENT = 347,
     FILECOMMENT = 348
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
#define POINTY 281
#define SUB 282
#define SYM 283
#define LOCAL 284
#define CONST 285
#define INC 286
#define DEC 287
#define GLOBAL_CONST 288
#define SHIFT_LEFT 289
#define SHIFT_RIGHT 290
#define INTV 291
#define FLOATV 292
#define STRINGV 293
#define PMCV 294
#define OBJECTV 295
#define DEFINED 296
#define LOG_XOR 297
#define RELOP_EQ 298
#define RELOP_NE 299
#define RELOP_GT 300
#define RELOP_GTE 301
#define RELOP_LT 302
#define RELOP_LTE 303
#define GLOBAL 304
#define GLOBALOP 305
#define ADDR 306
#define CLONE 307
#define RESULT 308
#define RETURN 309
#define POW 310
#define SHIFT_RIGHT_U 311
#define LOG_AND 312
#define LOG_OR 313
#define COMMA 314
#define ESUB 315
#define PCC_BEGIN 316
#define PCC_END 317
#define PCC_CALL 318
#define PCC_SUB 319
#define PCC_BEGIN_RETURN 320
#define PCC_END_RETURN 321
#define PCC_BEGIN_YIELD 322
#define PCC_END_YIELD 323
#define NCI_CALL 324
#define PROTOTYPED 325
#define NON_PROTOTYPED 326
#define MAIN 327
#define LOAD 328
#define IMMEDIATE 329
#define POSTCOMP 330
#define LABEL 331
#define EMIT 332
#define EOM 333
#define IREG 334
#define NREG 335
#define SREG 336
#define PREG 337
#define IDENTIFIER 338
#define STRINGC 339
#define INTC 340
#define FLOATC 341
#define REG 342
#define MACRO 343
#define ENDM 344
#define PARROT_OP 345
#define VAR 346
#define LINECOMMENT 347
#define FILECOMMENT 348




#ifndef YYSTYPE
#line 223 "imcc/imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
    Symbol * sym;
    SymbolList * symlist;
    SymbolTable * symtab;
} yystype;
/* Line 1281 of /usr/share/bison/yacc.c.  */
#line 236 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

