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
     FASTCALL = 261,
     N_OPERATORS = 262,
     HLL = 263,
     CALL = 264,
     GOTO = 265,
     ARG = 266,
     FLATTEN_ARG = 267,
     FLATTEN = 268,
     IF = 269,
     UNLESS = 270,
     END = 271,
     SAVEALL = 272,
     RESTOREALL = 273,
     NEW = 274,
     NEWSUB = 275,
     NEWCLOSURE = 276,
     NEWCOR = 277,
     NEWCONT = 278,
     NAMESPACE = 279,
     ENDNAMESPACE = 280,
     CLASS = 281,
     ENDCLASS = 282,
     FIELD = 283,
     DOT_METHOD = 284,
     SUB = 285,
     SYM = 286,
     LOCAL = 287,
     CONST = 288,
     INC = 289,
     DEC = 290,
     GLOBAL_CONST = 291,
     PLUS_ASSIGN = 292,
     MINUS_ASSIGN = 293,
     MUL_ASSIGN = 294,
     DIV_ASSIGN = 295,
     CONCAT_ASSIGN = 296,
     BAND_ASSIGN = 297,
     BOR_ASSIGN = 298,
     BXOR_ASSIGN = 299,
     FDIV = 300,
     FDIV_ASSIGN = 301,
     MOD_ASSIGN = 302,
     SHR_ASSIGN = 303,
     SHL_ASSIGN = 304,
     SHR_U_ASSIGN = 305,
     SHIFT_LEFT = 306,
     SHIFT_RIGHT = 307,
     INTV = 308,
     FLOATV = 309,
     STRINGV = 310,
     PMCV = 311,
     OBJECTV = 312,
     LOG_XOR = 313,
     RELOP_EQ = 314,
     RELOP_NE = 315,
     RELOP_GT = 316,
     RELOP_GTE = 317,
     RELOP_LT = 318,
     RELOP_LTE = 319,
     GLOBAL = 320,
     GLOBALOP = 321,
     ADDR = 322,
     RESULT = 323,
     RETURN = 324,
     YIELDT = 325,
     POW = 326,
     SHIFT_RIGHT_U = 327,
     LOG_AND = 328,
     LOG_OR = 329,
     COMMA = 330,
     ESUB = 331,
     DOTDOT = 332,
     PCC_BEGIN = 333,
     PCC_END = 334,
     PCC_CALL = 335,
     PCC_SUB = 336,
     PCC_BEGIN_RETURN = 337,
     PCC_END_RETURN = 338,
     PCC_BEGIN_YIELD = 339,
     PCC_END_YIELD = 340,
     NCI_CALL = 341,
     METH_CALL = 342,
     INVOCANT = 343,
     PROTOTYPED = 344,
     NON_PROTOTYPED = 345,
     MAIN = 346,
     LOAD = 347,
     IMMEDIATE = 348,
     POSTCOMP = 349,
     METHOD = 350,
     ANON = 351,
     MULTI = 352,
     LABEL = 353,
     EMIT = 354,
     EOM = 355,
     IREG = 356,
     NREG = 357,
     SREG = 358,
     PREG = 359,
     IDENTIFIER = 360,
     REG = 361,
     MACRO = 362,
     ENDM = 363,
     STRINGC = 364,
     INTC = 365,
     FLOATC = 366,
     USTRINGC = 367,
     PARROT_OP = 368,
     VAR = 369,
     LINECOMMENT = 370,
     FILECOMMENT = 371,
     DOT = 372,
     CONCAT = 373,
     POINTY = 374
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define FASTCALL 261
#define N_OPERATORS 262
#define HLL 263
#define CALL 264
#define GOTO 265
#define ARG 266
#define FLATTEN_ARG 267
#define FLATTEN 268
#define IF 269
#define UNLESS 270
#define END 271
#define SAVEALL 272
#define RESTOREALL 273
#define NEW 274
#define NEWSUB 275
#define NEWCLOSURE 276
#define NEWCOR 277
#define NEWCONT 278
#define NAMESPACE 279
#define ENDNAMESPACE 280
#define CLASS 281
#define ENDCLASS 282
#define FIELD 283
#define DOT_METHOD 284
#define SUB 285
#define SYM 286
#define LOCAL 287
#define CONST 288
#define INC 289
#define DEC 290
#define GLOBAL_CONST 291
#define PLUS_ASSIGN 292
#define MINUS_ASSIGN 293
#define MUL_ASSIGN 294
#define DIV_ASSIGN 295
#define CONCAT_ASSIGN 296
#define BAND_ASSIGN 297
#define BOR_ASSIGN 298
#define BXOR_ASSIGN 299
#define FDIV 300
#define FDIV_ASSIGN 301
#define MOD_ASSIGN 302
#define SHR_ASSIGN 303
#define SHL_ASSIGN 304
#define SHR_U_ASSIGN 305
#define SHIFT_LEFT 306
#define SHIFT_RIGHT 307
#define INTV 308
#define FLOATV 309
#define STRINGV 310
#define PMCV 311
#define OBJECTV 312
#define LOG_XOR 313
#define RELOP_EQ 314
#define RELOP_NE 315
#define RELOP_GT 316
#define RELOP_GTE 317
#define RELOP_LT 318
#define RELOP_LTE 319
#define GLOBAL 320
#define GLOBALOP 321
#define ADDR 322
#define RESULT 323
#define RETURN 324
#define YIELDT 325
#define POW 326
#define SHIFT_RIGHT_U 327
#define LOG_AND 328
#define LOG_OR 329
#define COMMA 330
#define ESUB 331
#define DOTDOT 332
#define PCC_BEGIN 333
#define PCC_END 334
#define PCC_CALL 335
#define PCC_SUB 336
#define PCC_BEGIN_RETURN 337
#define PCC_END_RETURN 338
#define PCC_BEGIN_YIELD 339
#define PCC_END_YIELD 340
#define NCI_CALL 341
#define METH_CALL 342
#define INVOCANT 343
#define PROTOTYPED 344
#define NON_PROTOTYPED 345
#define MAIN 346
#define LOAD 347
#define IMMEDIATE 348
#define POSTCOMP 349
#define METHOD 350
#define ANON 351
#define MULTI 352
#define LABEL 353
#define EMIT 354
#define EOM 355
#define IREG 356
#define NREG 357
#define SREG 358
#define PREG 359
#define IDENTIFIER 360
#define REG 361
#define MACRO 362
#define ENDM 363
#define STRINGC 364
#define INTC 365
#define FLOATC 366
#define USTRINGC 367
#define PARROT_OP 368
#define VAR 369
#define LINECOMMENT 370
#define FILECOMMENT 371
#define DOT 372
#define CONCAT 373
#define POINTY 374




#ifndef YYSTYPE
#line 321 "imcc/imcc.y"
typedef union {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
    Symbol * sym;
    SymbolList * symlist;
    SymbolTable * symtab;
} yystype;
/* Line 1281 of /usr/share/bison/yacc.c.  */
#line 289 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

