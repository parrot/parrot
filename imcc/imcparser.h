/* A Bison parser, made by GNU Bison 1.875d.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004 Free Software Foundation, Inc.

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
     IF = 267,
     UNLESS = 268,
     END = 269,
     SAVEALL = 270,
     RESTOREALL = 271,
     ADV_FLAT = 272,
     ADV_SLURPY = 273,
     ADV_OPTIONAL = 274,
     NEW = 275,
     NEWSUB = 276,
     NEWCLOSURE = 277,
     NEWCOR = 278,
     NEWCONT = 279,
     NAMESPACE = 280,
     ENDNAMESPACE = 281,
     CLASS = 282,
     ENDCLASS = 283,
     FIELD = 284,
     DOT_METHOD = 285,
     SUB = 286,
     SYM = 287,
     LOCAL = 288,
     CONST = 289,
     INC = 290,
     DEC = 291,
     GLOBAL_CONST = 292,
     PLUS_ASSIGN = 293,
     MINUS_ASSIGN = 294,
     MUL_ASSIGN = 295,
     DIV_ASSIGN = 296,
     CONCAT_ASSIGN = 297,
     BAND_ASSIGN = 298,
     BOR_ASSIGN = 299,
     BXOR_ASSIGN = 300,
     FDIV = 301,
     FDIV_ASSIGN = 302,
     MOD_ASSIGN = 303,
     SHR_ASSIGN = 304,
     SHL_ASSIGN = 305,
     SHR_U_ASSIGN = 306,
     SHIFT_LEFT = 307,
     SHIFT_RIGHT = 308,
     INTV = 309,
     FLOATV = 310,
     STRINGV = 311,
     PMCV = 312,
     OBJECTV = 313,
     LOG_XOR = 314,
     RELOP_EQ = 315,
     RELOP_NE = 316,
     RELOP_GT = 317,
     RELOP_GTE = 318,
     RELOP_LT = 319,
     RELOP_LTE = 320,
     GLOBAL = 321,
     GLOBALOP = 322,
     ADDR = 323,
     RESULT = 324,
     RETURN = 325,
     YIELDT = 326,
     POW = 327,
     SHIFT_RIGHT_U = 328,
     LOG_AND = 329,
     LOG_OR = 330,
     COMMA = 331,
     ESUB = 332,
     DOTDOT = 333,
     PCC_BEGIN = 334,
     PCC_END = 335,
     PCC_CALL = 336,
     PCC_SUB = 337,
     PCC_BEGIN_RETURN = 338,
     PCC_END_RETURN = 339,
     PCC_BEGIN_YIELD = 340,
     PCC_END_YIELD = 341,
     NCI_CALL = 342,
     METH_CALL = 343,
     INVOCANT = 344,
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
#define HLL 263
#define CALL 264
#define GOTO 265
#define ARG 266
#define IF 267
#define UNLESS 268
#define END 269
#define SAVEALL 270
#define RESTOREALL 271
#define ADV_FLAT 272
#define ADV_SLURPY 273
#define ADV_OPTIONAL 274
#define NEW 275
#define NEWSUB 276
#define NEWCLOSURE 277
#define NEWCOR 278
#define NEWCONT 279
#define NAMESPACE 280
#define ENDNAMESPACE 281
#define CLASS 282
#define ENDCLASS 283
#define FIELD 284
#define DOT_METHOD 285
#define SUB 286
#define SYM 287
#define LOCAL 288
#define CONST 289
#define INC 290
#define DEC 291
#define GLOBAL_CONST 292
#define PLUS_ASSIGN 293
#define MINUS_ASSIGN 294
#define MUL_ASSIGN 295
#define DIV_ASSIGN 296
#define CONCAT_ASSIGN 297
#define BAND_ASSIGN 298
#define BOR_ASSIGN 299
#define BXOR_ASSIGN 300
#define FDIV 301
#define FDIV_ASSIGN 302
#define MOD_ASSIGN 303
#define SHR_ASSIGN 304
#define SHL_ASSIGN 305
#define SHR_U_ASSIGN 306
#define SHIFT_LEFT 307
#define SHIFT_RIGHT 308
#define INTV 309
#define FLOATV 310
#define STRINGV 311
#define PMCV 312
#define OBJECTV 313
#define LOG_XOR 314
#define RELOP_EQ 315
#define RELOP_NE 316
#define RELOP_GT 317
#define RELOP_GTE 318
#define RELOP_LT 319
#define RELOP_LTE 320
#define GLOBAL 321
#define GLOBALOP 322
#define ADDR 323
#define RESULT 324
#define RETURN 325
#define YIELDT 326
#define POW 327
#define SHIFT_RIGHT_U 328
#define LOG_AND 329
#define LOG_OR 330
#define COMMA 331
#define ESUB 332
#define DOTDOT 333
#define PCC_BEGIN 334
#define PCC_END 335
#define PCC_CALL 336
#define PCC_SUB 337
#define PCC_BEGIN_RETURN 338
#define PCC_END_RETURN 339
#define PCC_BEGIN_YIELD 340
#define PCC_END_YIELD 341
#define NCI_CALL 342
#define METH_CALL 343
#define INVOCANT 344
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




#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 319 "imcc/imcc.y"
typedef union YYSTYPE {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
    Symbol * sym;
    SymbolList * symlist;
    SymbolTable * symtab;
} YYSTYPE;
/* Line 1285 of yacc.c.  */
#line 284 "imcc/imcparser.h"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif





