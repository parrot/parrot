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
     GOTO = 264,
     ARG = 265,
     IF = 266,
     UNLESS = 267,
     ADV_FLAT = 268,
     ADV_SLURPY = 269,
     ADV_OPTIONAL = 270,
     ADV_OPT_FLAG = 271,
     NEW = 272,
     NEWSUB = 273,
     NEWCLOSURE = 274,
     NEWCOR = 275,
     NEWCONT = 276,
     NAMESPACE = 277,
     ENDNAMESPACE = 278,
     CLASS = 279,
     ENDCLASS = 280,
     FIELD = 281,
     DOT_METHOD = 282,
     SUB = 283,
     SYM = 284,
     LOCAL = 285,
     CONST = 286,
     INC = 287,
     DEC = 288,
     GLOBAL_CONST = 289,
     PLUS_ASSIGN = 290,
     MINUS_ASSIGN = 291,
     MUL_ASSIGN = 292,
     DIV_ASSIGN = 293,
     CONCAT_ASSIGN = 294,
     BAND_ASSIGN = 295,
     BOR_ASSIGN = 296,
     BXOR_ASSIGN = 297,
     FDIV = 298,
     FDIV_ASSIGN = 299,
     MOD_ASSIGN = 300,
     SHR_ASSIGN = 301,
     SHL_ASSIGN = 302,
     SHR_U_ASSIGN = 303,
     SHIFT_LEFT = 304,
     SHIFT_RIGHT = 305,
     INTV = 306,
     FLOATV = 307,
     STRINGV = 308,
     PMCV = 309,
     OBJECTV = 310,
     LOG_XOR = 311,
     RELOP_EQ = 312,
     RELOP_NE = 313,
     RELOP_GT = 314,
     RELOP_GTE = 315,
     RELOP_LT = 316,
     RELOP_LTE = 317,
     GLOBAL = 318,
     GLOBALOP = 319,
     ADDR = 320,
     RESULT = 321,
     RETURN = 322,
     YIELDT = 323,
     POW = 324,
     SHIFT_RIGHT_U = 325,
     LOG_AND = 326,
     LOG_OR = 327,
     COMMA = 328,
     ESUB = 329,
     DOTDOT = 330,
     PCC_BEGIN = 331,
     PCC_END = 332,
     PCC_CALL = 333,
     PCC_SUB = 334,
     PCC_BEGIN_RETURN = 335,
     PCC_END_RETURN = 336,
     PCC_BEGIN_YIELD = 337,
     PCC_END_YIELD = 338,
     NCI_CALL = 339,
     METH_CALL = 340,
     INVOCANT = 341,
     MAIN = 342,
     LOAD = 343,
     IMMEDIATE = 344,
     POSTCOMP = 345,
     METHOD = 346,
     ANON = 347,
     MULTI = 348,
     LABEL = 349,
     EMIT = 350,
     EOM = 351,
     IREG = 352,
     NREG = 353,
     SREG = 354,
     PREG = 355,
     IDENTIFIER = 356,
     REG = 357,
     MACRO = 358,
     ENDM = 359,
     STRINGC = 360,
     INTC = 361,
     FLOATC = 362,
     USTRINGC = 363,
     PARROT_OP = 364,
     VAR = 365,
     LINECOMMENT = 366,
     FILECOMMENT = 367,
     DOT = 368,
     CONCAT = 369,
     POINTY = 370
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define FASTCALL 261
#define N_OPERATORS 262
#define HLL 263
#define GOTO 264
#define ARG 265
#define IF 266
#define UNLESS 267
#define ADV_FLAT 268
#define ADV_SLURPY 269
#define ADV_OPTIONAL 270
#define ADV_OPT_FLAG 271
#define NEW 272
#define NEWSUB 273
#define NEWCLOSURE 274
#define NEWCOR 275
#define NEWCONT 276
#define NAMESPACE 277
#define ENDNAMESPACE 278
#define CLASS 279
#define ENDCLASS 280
#define FIELD 281
#define DOT_METHOD 282
#define SUB 283
#define SYM 284
#define LOCAL 285
#define CONST 286
#define INC 287
#define DEC 288
#define GLOBAL_CONST 289
#define PLUS_ASSIGN 290
#define MINUS_ASSIGN 291
#define MUL_ASSIGN 292
#define DIV_ASSIGN 293
#define CONCAT_ASSIGN 294
#define BAND_ASSIGN 295
#define BOR_ASSIGN 296
#define BXOR_ASSIGN 297
#define FDIV 298
#define FDIV_ASSIGN 299
#define MOD_ASSIGN 300
#define SHR_ASSIGN 301
#define SHL_ASSIGN 302
#define SHR_U_ASSIGN 303
#define SHIFT_LEFT 304
#define SHIFT_RIGHT 305
#define INTV 306
#define FLOATV 307
#define STRINGV 308
#define PMCV 309
#define OBJECTV 310
#define LOG_XOR 311
#define RELOP_EQ 312
#define RELOP_NE 313
#define RELOP_GT 314
#define RELOP_GTE 315
#define RELOP_LT 316
#define RELOP_LTE 317
#define GLOBAL 318
#define GLOBALOP 319
#define ADDR 320
#define RESULT 321
#define RETURN 322
#define YIELDT 323
#define POW 324
#define SHIFT_RIGHT_U 325
#define LOG_AND 326
#define LOG_OR 327
#define COMMA 328
#define ESUB 329
#define DOTDOT 330
#define PCC_BEGIN 331
#define PCC_END 332
#define PCC_CALL 333
#define PCC_SUB 334
#define PCC_BEGIN_RETURN 335
#define PCC_END_RETURN 336
#define PCC_BEGIN_YIELD 337
#define PCC_END_YIELD 338
#define NCI_CALL 339
#define METH_CALL 340
#define INVOCANT 341
#define MAIN 342
#define LOAD 343
#define IMMEDIATE 344
#define POSTCOMP 345
#define METHOD 346
#define ANON 347
#define MULTI 348
#define LABEL 349
#define EMIT 350
#define EOM 351
#define IREG 352
#define NREG 353
#define SREG 354
#define PREG 355
#define IDENTIFIER 356
#define REG 357
#define MACRO 358
#define ENDM 359
#define STRINGC 360
#define INTC 361
#define FLOATC 362
#define USTRINGC 363
#define PARROT_OP 364
#define VAR 365
#define LINECOMMENT 366
#define FILECOMMENT 367
#define DOT 368
#define CONCAT 369
#define POINTY 370




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
#line 281 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

