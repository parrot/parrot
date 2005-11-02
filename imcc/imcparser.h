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
     NAMESPACE = 273,
     ENDNAMESPACE = 274,
     CLASS = 275,
     ENDCLASS = 276,
     FIELD = 277,
     DOT_METHOD = 278,
     SUB = 279,
     SYM = 280,
     LOCAL = 281,
     CONST = 282,
     INC = 283,
     DEC = 284,
     GLOBAL_CONST = 285,
     PLUS_ASSIGN = 286,
     MINUS_ASSIGN = 287,
     MUL_ASSIGN = 288,
     DIV_ASSIGN = 289,
     CONCAT_ASSIGN = 290,
     BAND_ASSIGN = 291,
     BOR_ASSIGN = 292,
     BXOR_ASSIGN = 293,
     FDIV = 294,
     FDIV_ASSIGN = 295,
     MOD_ASSIGN = 296,
     SHR_ASSIGN = 297,
     SHL_ASSIGN = 298,
     SHR_U_ASSIGN = 299,
     SHIFT_LEFT = 300,
     SHIFT_RIGHT = 301,
     INTV = 302,
     FLOATV = 303,
     STRINGV = 304,
     PMCV = 305,
     OBJECTV = 306,
     LOG_XOR = 307,
     RELOP_EQ = 308,
     RELOP_NE = 309,
     RELOP_GT = 310,
     RELOP_GTE = 311,
     RELOP_LT = 312,
     RELOP_LTE = 313,
     GLOBAL = 314,
     GLOBALOP = 315,
     ADDR = 316,
     RESULT = 317,
     RETURN = 318,
     YIELDT = 319,
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
     MULTI = 344,
     LABEL = 345,
     EMIT = 346,
     EOM = 347,
     IREG = 348,
     NREG = 349,
     SREG = 350,
     PREG = 351,
     IDENTIFIER = 352,
     REG = 353,
     MACRO = 354,
     ENDM = 355,
     STRINGC = 356,
     INTC = 357,
     FLOATC = 358,
     USTRINGC = 359,
     PARROT_OP = 360,
     VAR = 361,
     LINECOMMENT = 362,
     FILECOMMENT = 363,
     DOT = 364,
     CONCAT = 365,
     POINTY = 366
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
#define NAMESPACE 273
#define ENDNAMESPACE 274
#define CLASS 275
#define ENDCLASS 276
#define FIELD 277
#define DOT_METHOD 278
#define SUB 279
#define SYM 280
#define LOCAL 281
#define CONST 282
#define INC 283
#define DEC 284
#define GLOBAL_CONST 285
#define PLUS_ASSIGN 286
#define MINUS_ASSIGN 287
#define MUL_ASSIGN 288
#define DIV_ASSIGN 289
#define CONCAT_ASSIGN 290
#define BAND_ASSIGN 291
#define BOR_ASSIGN 292
#define BXOR_ASSIGN 293
#define FDIV 294
#define FDIV_ASSIGN 295
#define MOD_ASSIGN 296
#define SHR_ASSIGN 297
#define SHL_ASSIGN 298
#define SHR_U_ASSIGN 299
#define SHIFT_LEFT 300
#define SHIFT_RIGHT 301
#define INTV 302
#define FLOATV 303
#define STRINGV 304
#define PMCV 305
#define OBJECTV 306
#define LOG_XOR 307
#define RELOP_EQ 308
#define RELOP_NE 309
#define RELOP_GT 310
#define RELOP_GTE 311
#define RELOP_LT 312
#define RELOP_LTE 313
#define GLOBAL 314
#define GLOBALOP 315
#define ADDR 316
#define RESULT 317
#define RETURN 318
#define YIELDT 319
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
#define MULTI 344
#define LABEL 345
#define EMIT 346
#define EOM 347
#define IREG 348
#define NREG 349
#define SREG 350
#define PREG 351
#define IDENTIFIER 352
#define REG 353
#define MACRO 354
#define ENDM 355
#define STRINGC 356
#define INTC 357
#define FLOATC 358
#define USTRINGC 359
#define PARROT_OP 360
#define VAR 361
#define LINECOMMENT 362
#define FILECOMMENT 363
#define DOT 364
#define CONCAT 365
#define POINTY 366




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
#line 273 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

