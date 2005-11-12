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
     N_OPERATORS = 261,
     HLL = 262,
     GOTO = 263,
     ARG = 264,
     IF = 265,
     UNLESS = 266,
     PNULL = 267,
     ADV_FLAT = 268,
     ADV_SLURPY = 269,
     ADV_OPTIONAL = 270,
     ADV_OPT_FLAG = 271,
     NEW = 272,
     NAMESPACE = 273,
     ENDNAMESPACE = 274,
     DOT_METHOD = 275,
     SUB = 276,
     SYM = 277,
     LOCAL = 278,
     CONST = 279,
     INC = 280,
     DEC = 281,
     GLOBAL_CONST = 282,
     PLUS_ASSIGN = 283,
     MINUS_ASSIGN = 284,
     MUL_ASSIGN = 285,
     DIV_ASSIGN = 286,
     CONCAT_ASSIGN = 287,
     BAND_ASSIGN = 288,
     BOR_ASSIGN = 289,
     BXOR_ASSIGN = 290,
     FDIV = 291,
     FDIV_ASSIGN = 292,
     MOD_ASSIGN = 293,
     SHR_ASSIGN = 294,
     SHL_ASSIGN = 295,
     SHR_U_ASSIGN = 296,
     SHIFT_LEFT = 297,
     SHIFT_RIGHT = 298,
     INTV = 299,
     FLOATV = 300,
     STRINGV = 301,
     PMCV = 302,
     OBJECTV = 303,
     LOG_XOR = 304,
     RELOP_EQ = 305,
     RELOP_NE = 306,
     RELOP_GT = 307,
     RELOP_GTE = 308,
     RELOP_LT = 309,
     RELOP_LTE = 310,
     GLOBAL = 311,
     GLOBALOP = 312,
     ADDR = 313,
     RESULT = 314,
     RETURN = 315,
     YIELDT = 316,
     POW = 317,
     SHIFT_RIGHT_U = 318,
     LOG_AND = 319,
     LOG_OR = 320,
     COMMA = 321,
     ESUB = 322,
     DOTDOT = 323,
     PCC_BEGIN = 324,
     PCC_END = 325,
     PCC_CALL = 326,
     PCC_SUB = 327,
     PCC_BEGIN_RETURN = 328,
     PCC_END_RETURN = 329,
     PCC_BEGIN_YIELD = 330,
     PCC_END_YIELD = 331,
     NCI_CALL = 332,
     METH_CALL = 333,
     INVOCANT = 334,
     MAIN = 335,
     LOAD = 336,
     IMMEDIATE = 337,
     POSTCOMP = 338,
     METHOD = 339,
     ANON = 340,
     MULTI = 341,
     LABEL = 342,
     EMIT = 343,
     EOM = 344,
     IREG = 345,
     NREG = 346,
     SREG = 347,
     PREG = 348,
     IDENTIFIER = 349,
     REG = 350,
     MACRO = 351,
     ENDM = 352,
     STRINGC = 353,
     INTC = 354,
     FLOATC = 355,
     USTRINGC = 356,
     PARROT_OP = 357,
     VAR = 358,
     LINECOMMENT = 359,
     FILECOMMENT = 360,
     DOT = 361,
     CONCAT = 362,
     POINTY = 363
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define N_OPERATORS 261
#define HLL 262
#define GOTO 263
#define ARG 264
#define IF 265
#define UNLESS 266
#define PNULL 267
#define ADV_FLAT 268
#define ADV_SLURPY 269
#define ADV_OPTIONAL 270
#define ADV_OPT_FLAG 271
#define NEW 272
#define NAMESPACE 273
#define ENDNAMESPACE 274
#define DOT_METHOD 275
#define SUB 276
#define SYM 277
#define LOCAL 278
#define CONST 279
#define INC 280
#define DEC 281
#define GLOBAL_CONST 282
#define PLUS_ASSIGN 283
#define MINUS_ASSIGN 284
#define MUL_ASSIGN 285
#define DIV_ASSIGN 286
#define CONCAT_ASSIGN 287
#define BAND_ASSIGN 288
#define BOR_ASSIGN 289
#define BXOR_ASSIGN 290
#define FDIV 291
#define FDIV_ASSIGN 292
#define MOD_ASSIGN 293
#define SHR_ASSIGN 294
#define SHL_ASSIGN 295
#define SHR_U_ASSIGN 296
#define SHIFT_LEFT 297
#define SHIFT_RIGHT 298
#define INTV 299
#define FLOATV 300
#define STRINGV 301
#define PMCV 302
#define OBJECTV 303
#define LOG_XOR 304
#define RELOP_EQ 305
#define RELOP_NE 306
#define RELOP_GT 307
#define RELOP_GTE 308
#define RELOP_LT 309
#define RELOP_LTE 310
#define GLOBAL 311
#define GLOBALOP 312
#define ADDR 313
#define RESULT 314
#define RETURN 315
#define YIELDT 316
#define POW 317
#define SHIFT_RIGHT_U 318
#define LOG_AND 319
#define LOG_OR 320
#define COMMA 321
#define ESUB 322
#define DOTDOT 323
#define PCC_BEGIN 324
#define PCC_END 325
#define PCC_CALL 326
#define PCC_SUB 327
#define PCC_BEGIN_RETURN 328
#define PCC_END_RETURN 329
#define PCC_BEGIN_YIELD 330
#define PCC_END_YIELD 331
#define NCI_CALL 332
#define METH_CALL 333
#define INVOCANT 334
#define MAIN 335
#define LOAD 336
#define IMMEDIATE 337
#define POSTCOMP 338
#define METHOD 339
#define ANON 340
#define MULTI 341
#define LABEL 342
#define EMIT 343
#define EOM 344
#define IREG 345
#define NREG 346
#define SREG 347
#define PREG 348
#define IDENTIFIER 349
#define REG 350
#define MACRO 351
#define ENDM 352
#define STRINGC 353
#define INTC 354
#define FLOATC 355
#define USTRINGC 356
#define PARROT_OP 357
#define VAR 358
#define LINECOMMENT 359
#define FILECOMMENT 360
#define DOT 361
#define CONCAT 362
#define POINTY 363




#ifndef YYSTYPE
#line 308 "imcc/imcc.y"
typedef union {
    IdList * idlist;
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 1281 of /usr/share/bison/yacc.c.  */
#line 264 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

