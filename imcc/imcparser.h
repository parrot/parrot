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
     CALL = 263,
     GOTO = 264,
     ARG = 265,
     FLATTEN_ARG = 266,
     FLATTEN = 267,
     IF = 268,
     UNLESS = 269,
     END = 270,
     SAVEALL = 271,
     RESTOREALL = 272,
     NEW = 273,
     NEWSUB = 274,
     NEWCLOSURE = 275,
     NEWCOR = 276,
     NEWCONT = 277,
     NAMESPACE = 278,
     ENDNAMESPACE = 279,
     CLASS = 280,
     ENDCLASS = 281,
     FIELD = 282,
     DOT_METHOD = 283,
     SUB = 284,
     SYM = 285,
     LOCAL = 286,
     CONST = 287,
     INC = 288,
     DEC = 289,
     GLOBAL_CONST = 290,
     PLUS_ASSIGN = 291,
     MINUS_ASSIGN = 292,
     MUL_ASSIGN = 293,
     DIV_ASSIGN = 294,
     CONCAT_ASSIGN = 295,
     BAND_ASSIGN = 296,
     BOR_ASSIGN = 297,
     BXOR_ASSIGN = 298,
     FDIV = 299,
     FDIV_ASSIGN = 300,
     MOD_ASSIGN = 301,
     SHR_ASSIGN = 302,
     SHL_ASSIGN = 303,
     SHR_U_ASSIGN = 304,
     SHIFT_LEFT = 305,
     SHIFT_RIGHT = 306,
     INTV = 307,
     FLOATV = 308,
     STRINGV = 309,
     PMCV = 310,
     OBJECTV = 311,
     LOG_XOR = 312,
     RELOP_EQ = 313,
     RELOP_NE = 314,
     RELOP_GT = 315,
     RELOP_GTE = 316,
     RELOP_LT = 317,
     RELOP_LTE = 318,
     GLOBAL = 319,
     GLOBALOP = 320,
     ADDR = 321,
     RESULT = 322,
     RETURN = 323,
     YIELDT = 324,
     POW = 325,
     SHIFT_RIGHT_U = 326,
     LOG_AND = 327,
     LOG_OR = 328,
     COMMA = 329,
     ESUB = 330,
     DOTDOT = 331,
     PCC_BEGIN = 332,
     PCC_END = 333,
     PCC_CALL = 334,
     PCC_SUB = 335,
     PCC_BEGIN_RETURN = 336,
     PCC_END_RETURN = 337,
     PCC_BEGIN_YIELD = 338,
     PCC_END_YIELD = 339,
     NCI_CALL = 340,
     METH_CALL = 341,
     INVOCANT = 342,
     PROTOTYPED = 343,
     NON_PROTOTYPED = 344,
     MAIN = 345,
     LOAD = 346,
     IMMEDIATE = 347,
     POSTCOMP = 348,
     METHOD = 349,
     ANON = 350,
     MULTI = 351,
     LABEL = 352,
     EMIT = 353,
     EOM = 354,
     IREG = 355,
     NREG = 356,
     SREG = 357,
     PREG = 358,
     IDENTIFIER = 359,
     REG = 360,
     MACRO = 361,
     ENDM = 362,
     STRINGC = 363,
     INTC = 364,
     FLOATC = 365,
     USTRINGC = 366,
     PARROT_OP = 367,
     VAR = 368,
     LINECOMMENT = 369,
     FILECOMMENT = 370,
     DOT = 371,
     CONCAT = 372,
     POINTY = 373
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define FASTCALL 261
#define N_OPERATORS 262
#define CALL 263
#define GOTO 264
#define ARG 265
#define FLATTEN_ARG 266
#define FLATTEN 267
#define IF 268
#define UNLESS 269
#define END 270
#define SAVEALL 271
#define RESTOREALL 272
#define NEW 273
#define NEWSUB 274
#define NEWCLOSURE 275
#define NEWCOR 276
#define NEWCONT 277
#define NAMESPACE 278
#define ENDNAMESPACE 279
#define CLASS 280
#define ENDCLASS 281
#define FIELD 282
#define DOT_METHOD 283
#define SUB 284
#define SYM 285
#define LOCAL 286
#define CONST 287
#define INC 288
#define DEC 289
#define GLOBAL_CONST 290
#define PLUS_ASSIGN 291
#define MINUS_ASSIGN 292
#define MUL_ASSIGN 293
#define DIV_ASSIGN 294
#define CONCAT_ASSIGN 295
#define BAND_ASSIGN 296
#define BOR_ASSIGN 297
#define BXOR_ASSIGN 298
#define FDIV 299
#define FDIV_ASSIGN 300
#define MOD_ASSIGN 301
#define SHR_ASSIGN 302
#define SHL_ASSIGN 303
#define SHR_U_ASSIGN 304
#define SHIFT_LEFT 305
#define SHIFT_RIGHT 306
#define INTV 307
#define FLOATV 308
#define STRINGV 309
#define PMCV 310
#define OBJECTV 311
#define LOG_XOR 312
#define RELOP_EQ 313
#define RELOP_NE 314
#define RELOP_GT 315
#define RELOP_GTE 316
#define RELOP_LT 317
#define RELOP_LTE 318
#define GLOBAL 319
#define GLOBALOP 320
#define ADDR 321
#define RESULT 322
#define RETURN 323
#define YIELDT 324
#define POW 325
#define SHIFT_RIGHT_U 326
#define LOG_AND 327
#define LOG_OR 328
#define COMMA 329
#define ESUB 330
#define DOTDOT 331
#define PCC_BEGIN 332
#define PCC_END 333
#define PCC_CALL 334
#define PCC_SUB 335
#define PCC_BEGIN_RETURN 336
#define PCC_END_RETURN 337
#define PCC_BEGIN_YIELD 338
#define PCC_END_YIELD 339
#define NCI_CALL 340
#define METH_CALL 341
#define INVOCANT 342
#define PROTOTYPED 343
#define NON_PROTOTYPED 344
#define MAIN 345
#define LOAD 346
#define IMMEDIATE 347
#define POSTCOMP 348
#define METHOD 349
#define ANON 350
#define MULTI 351
#define LABEL 352
#define EMIT 353
#define EOM 354
#define IREG 355
#define NREG 356
#define SREG 357
#define PREG 358
#define IDENTIFIER 359
#define REG 360
#define MACRO 361
#define ENDM 362
#define STRINGC 363
#define INTC 364
#define FLOATC 365
#define USTRINGC 366
#define PARROT_OP 367
#define VAR 368
#define LINECOMMENT 369
#define FILECOMMENT 370
#define DOT 371
#define CONCAT 372
#define POINTY 373




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
#line 287 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

