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
     IF = 267,
     UNLESS = 268,
     END = 269,
     SAVEALL = 270,
     RESTOREALL = 271,
     ADV_FLAT = 272,
     ADV_SLURPY = 273,
     ADV_OPTIONAL = 274,
     ADV_OPT_FLAG = 275,
     NEW = 276,
     NEWSUB = 277,
     NEWCLOSURE = 278,
     NEWCOR = 279,
     NEWCONT = 280,
     NAMESPACE = 281,
     ENDNAMESPACE = 282,
     CLASS = 283,
     ENDCLASS = 284,
     FIELD = 285,
     DOT_METHOD = 286,
     SUB = 287,
     SYM = 288,
     LOCAL = 289,
     CONST = 290,
     INC = 291,
     DEC = 292,
     GLOBAL_CONST = 293,
     PLUS_ASSIGN = 294,
     MINUS_ASSIGN = 295,
     MUL_ASSIGN = 296,
     DIV_ASSIGN = 297,
     CONCAT_ASSIGN = 298,
     BAND_ASSIGN = 299,
     BOR_ASSIGN = 300,
     BXOR_ASSIGN = 301,
     FDIV = 302,
     FDIV_ASSIGN = 303,
     MOD_ASSIGN = 304,
     SHR_ASSIGN = 305,
     SHL_ASSIGN = 306,
     SHR_U_ASSIGN = 307,
     SHIFT_LEFT = 308,
     SHIFT_RIGHT = 309,
     INTV = 310,
     FLOATV = 311,
     STRINGV = 312,
     PMCV = 313,
     OBJECTV = 314,
     LOG_XOR = 315,
     RELOP_EQ = 316,
     RELOP_NE = 317,
     RELOP_GT = 318,
     RELOP_GTE = 319,
     RELOP_LT = 320,
     RELOP_LTE = 321,
     GLOBAL = 322,
     GLOBALOP = 323,
     ADDR = 324,
     RESULT = 325,
     RETURN = 326,
     YIELDT = 327,
     POW = 328,
     SHIFT_RIGHT_U = 329,
     LOG_AND = 330,
     LOG_OR = 331,
     COMMA = 332,
     ESUB = 333,
     DOTDOT = 334,
     PCC_BEGIN = 335,
     PCC_END = 336,
     PCC_CALL = 337,
     PCC_SUB = 338,
     PCC_BEGIN_RETURN = 339,
     PCC_END_RETURN = 340,
     PCC_BEGIN_YIELD = 341,
     PCC_END_YIELD = 342,
     NCI_CALL = 343,
     METH_CALL = 344,
     INVOCANT = 345,
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
#define IF 267
#define UNLESS 268
#define END 269
#define SAVEALL 270
#define RESTOREALL 271
#define ADV_FLAT 272
#define ADV_SLURPY 273
#define ADV_OPTIONAL 274
#define ADV_OPT_FLAG 275
#define NEW 276
#define NEWSUB 277
#define NEWCLOSURE 278
#define NEWCOR 279
#define NEWCONT 280
#define NAMESPACE 281
#define ENDNAMESPACE 282
#define CLASS 283
#define ENDCLASS 284
#define FIELD 285
#define DOT_METHOD 286
#define SUB 287
#define SYM 288
#define LOCAL 289
#define CONST 290
#define INC 291
#define DEC 292
#define GLOBAL_CONST 293
#define PLUS_ASSIGN 294
#define MINUS_ASSIGN 295
#define MUL_ASSIGN 296
#define DIV_ASSIGN 297
#define CONCAT_ASSIGN 298
#define BAND_ASSIGN 299
#define BOR_ASSIGN 300
#define BXOR_ASSIGN 301
#define FDIV 302
#define FDIV_ASSIGN 303
#define MOD_ASSIGN 304
#define SHR_ASSIGN 305
#define SHL_ASSIGN 306
#define SHR_U_ASSIGN 307
#define SHIFT_LEFT 308
#define SHIFT_RIGHT 309
#define INTV 310
#define FLOATV 311
#define STRINGV 312
#define PMCV 313
#define OBJECTV 314
#define LOG_XOR 315
#define RELOP_EQ 316
#define RELOP_NE 317
#define RELOP_GT 318
#define RELOP_GTE 319
#define RELOP_LT 320
#define RELOP_LTE 321
#define GLOBAL 322
#define GLOBALOP 323
#define ADDR 324
#define RESULT 325
#define RETURN 326
#define YIELDT 327
#define POW 328
#define SHIFT_RIGHT_U 329
#define LOG_AND 330
#define LOG_OR 331
#define COMMA 332
#define ESUB 333
#define DOTDOT 334
#define PCC_BEGIN 335
#define PCC_END 336
#define PCC_CALL 337
#define PCC_SUB 338
#define PCC_BEGIN_RETURN 339
#define PCC_END_RETURN 340
#define PCC_BEGIN_YIELD 341
#define PCC_END_YIELD 342
#define NCI_CALL 343
#define METH_CALL 344
#define INVOCANT 345
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
#line 315 "imcc/imcc.y"
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

