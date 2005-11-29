/* A Bison parser, made by GNU Bison 2.1.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005 Free Software Foundation, Inc.

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
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     LOW_PREC = 258,
     PARAM = 259,
     PRAGMA = 260,
     N_OPERATORS = 261,
     HLL = 262,
     HLL_MAP = 263,
     GOTO = 264,
     ARG = 265,
     IF = 266,
     UNLESS = 267,
     PNULL = 268,
     ADV_FLAT = 269,
     ADV_SLURPY = 270,
     ADV_OPTIONAL = 271,
     ADV_OPT_FLAG = 272,
     NEW = 273,
     NAMESPACE = 274,
     ENDNAMESPACE = 275,
     DOT_METHOD = 276,
     SUB = 277,
     SYM = 278,
     LOCAL = 279,
     LEXICAL = 280,
     CONST = 281,
     INC = 282,
     DEC = 283,
     GLOBAL_CONST = 284,
     PLUS_ASSIGN = 285,
     MINUS_ASSIGN = 286,
     MUL_ASSIGN = 287,
     DIV_ASSIGN = 288,
     CONCAT_ASSIGN = 289,
     BAND_ASSIGN = 290,
     BOR_ASSIGN = 291,
     BXOR_ASSIGN = 292,
     FDIV = 293,
     FDIV_ASSIGN = 294,
     MOD_ASSIGN = 295,
     SHR_ASSIGN = 296,
     SHL_ASSIGN = 297,
     SHR_U_ASSIGN = 298,
     SHIFT_LEFT = 299,
     SHIFT_RIGHT = 300,
     INTV = 301,
     FLOATV = 302,
     STRINGV = 303,
     PMCV = 304,
     OBJECTV = 305,
     LOG_XOR = 306,
     RELOP_EQ = 307,
     RELOP_NE = 308,
     RELOP_GT = 309,
     RELOP_GTE = 310,
     RELOP_LT = 311,
     RELOP_LTE = 312,
     GLOBAL = 313,
     GLOBALOP = 314,
     ADDR = 315,
     RESULT = 316,
     RETURN = 317,
     YIELDT = 318,
     GET_RESULTS = 319,
     POW = 320,
     SHIFT_RIGHT_U = 321,
     LOG_AND = 322,
     LOG_OR = 323,
     COMMA = 324,
     ESUB = 325,
     DOTDOT = 326,
     PCC_BEGIN = 327,
     PCC_END = 328,
     PCC_CALL = 329,
     PCC_SUB = 330,
     PCC_BEGIN_RETURN = 331,
     PCC_END_RETURN = 332,
     PCC_BEGIN_YIELD = 333,
     PCC_END_YIELD = 334,
     NCI_CALL = 335,
     METH_CALL = 336,
     INVOCANT = 337,
     MAIN = 338,
     LOAD = 339,
     IMMEDIATE = 340,
     POSTCOMP = 341,
     METHOD = 342,
     ANON = 343,
     OUTER = 344,
     NEED_LEX = 345,
     MULTI = 346,
     LABEL = 347,
     EMIT = 348,
     EOM = 349,
     IREG = 350,
     NREG = 351,
     SREG = 352,
     PREG = 353,
     IDENTIFIER = 354,
     REG = 355,
     MACRO = 356,
     ENDM = 357,
     STRINGC = 358,
     INTC = 359,
     FLOATC = 360,
     USTRINGC = 361,
     PARROT_OP = 362,
     VAR = 363,
     LINECOMMENT = 364,
     FILECOMMENT = 365,
     DOT = 366,
     CONCAT = 367,
     POINTY = 368
   };
#endif
/* Tokens.  */
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define N_OPERATORS 261
#define HLL 262
#define HLL_MAP 263
#define GOTO 264
#define ARG 265
#define IF 266
#define UNLESS 267
#define PNULL 268
#define ADV_FLAT 269
#define ADV_SLURPY 270
#define ADV_OPTIONAL 271
#define ADV_OPT_FLAG 272
#define NEW 273
#define NAMESPACE 274
#define ENDNAMESPACE 275
#define DOT_METHOD 276
#define SUB 277
#define SYM 278
#define LOCAL 279
#define LEXICAL 280
#define CONST 281
#define INC 282
#define DEC 283
#define GLOBAL_CONST 284
#define PLUS_ASSIGN 285
#define MINUS_ASSIGN 286
#define MUL_ASSIGN 287
#define DIV_ASSIGN 288
#define CONCAT_ASSIGN 289
#define BAND_ASSIGN 290
#define BOR_ASSIGN 291
#define BXOR_ASSIGN 292
#define FDIV 293
#define FDIV_ASSIGN 294
#define MOD_ASSIGN 295
#define SHR_ASSIGN 296
#define SHL_ASSIGN 297
#define SHR_U_ASSIGN 298
#define SHIFT_LEFT 299
#define SHIFT_RIGHT 300
#define INTV 301
#define FLOATV 302
#define STRINGV 303
#define PMCV 304
#define OBJECTV 305
#define LOG_XOR 306
#define RELOP_EQ 307
#define RELOP_NE 308
#define RELOP_GT 309
#define RELOP_GTE 310
#define RELOP_LT 311
#define RELOP_LTE 312
#define GLOBAL 313
#define GLOBALOP 314
#define ADDR 315
#define RESULT 316
#define RETURN 317
#define YIELDT 318
#define GET_RESULTS 319
#define POW 320
#define SHIFT_RIGHT_U 321
#define LOG_AND 322
#define LOG_OR 323
#define COMMA 324
#define ESUB 325
#define DOTDOT 326
#define PCC_BEGIN 327
#define PCC_END 328
#define PCC_CALL 329
#define PCC_SUB 330
#define PCC_BEGIN_RETURN 331
#define PCC_END_RETURN 332
#define PCC_BEGIN_YIELD 333
#define PCC_END_YIELD 334
#define NCI_CALL 335
#define METH_CALL 336
#define INVOCANT 337
#define MAIN 338
#define LOAD 339
#define IMMEDIATE 340
#define POSTCOMP 341
#define METHOD 342
#define ANON 343
#define OUTER 344
#define NEED_LEX 345
#define MULTI 346
#define LABEL 347
#define EMIT 348
#define EOM 349
#define IREG 350
#define NREG 351
#define SREG 352
#define PREG 353
#define IDENTIFIER 354
#define REG 355
#define MACRO 356
#define ENDM 357
#define STRINGC 358
#define INTC 359
#define FLOATC 360
#define USTRINGC 361
#define PARROT_OP 362
#define VAR 363
#define LINECOMMENT 364
#define FILECOMMENT 365
#define DOT 366
#define CONCAT 367
#define POINTY 368




#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 319 "imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} YYSTYPE;
/* Line 1447 of yacc.c.  */
#line 272 "imcc/imcparser.h"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif





