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
     FLATTEN = 265,
     IF = 266,
     UNLESS = 267,
     END = 268,
     SAVEALL = 269,
     RESTOREALL = 270,
     NEW = 271,
     NEWSUB = 272,
     NEWCLOSURE = 273,
     NEWCOR = 274,
     NEWCONT = 275,
     NAMESPACE = 276,
     ENDNAMESPACE = 277,
     CLASS = 278,
     ENDCLASS = 279,
     FIELD = 280,
     DOT_METHOD = 281,
     SUB = 282,
     SYM = 283,
     LOCAL = 284,
     CONST = 285,
     INC = 286,
     DEC = 287,
     GLOBAL_CONST = 288,
     PLUS_ASSIGN = 289,
     MINUS_ASSIGN = 290,
     MUL_ASSIGN = 291,
     DIV_ASSIGN = 292,
     CONCAT_ASSIGN = 293,
     BAND_ASSIGN = 294,
     BOR_ASSIGN = 295,
     BXOR_ASSIGN = 296,
     FDIV = 297,
     FDIV_ASSIGN = 298,
     MOD_ASSIGN = 299,
     SHR_ASSIGN = 300,
     SHL_ASSIGN = 301,
     SHR_U_ASSIGN = 302,
     SHIFT_LEFT = 303,
     SHIFT_RIGHT = 304,
     INTV = 305,
     FLOATV = 306,
     STRINGV = 307,
     PMCV = 308,
     OBJECTV = 309,
     LOG_XOR = 310,
     RELOP_EQ = 311,
     RELOP_NE = 312,
     RELOP_GT = 313,
     RELOP_GTE = 314,
     RELOP_LT = 315,
     RELOP_LTE = 316,
     GLOBAL = 317,
     GLOBALOP = 318,
     ADDR = 319,
     RESULT = 320,
     RETURN = 321,
     YIELDT = 322,
     POW = 323,
     SHIFT_RIGHT_U = 324,
     LOG_AND = 325,
     LOG_OR = 326,
     COMMA = 327,
     ESUB = 328,
     DOTDOT = 329,
     PCC_BEGIN = 330,
     PCC_END = 331,
     PCC_CALL = 332,
     PCC_SUB = 333,
     PCC_BEGIN_RETURN = 334,
     PCC_END_RETURN = 335,
     PCC_BEGIN_YIELD = 336,
     PCC_END_YIELD = 337,
     NCI_CALL = 338,
     METH_CALL = 339,
     INVOCANT = 340,
     PROTOTYPED = 341,
     NON_PROTOTYPED = 342,
     MAIN = 343,
     LOAD = 344,
     IMMEDIATE = 345,
     POSTCOMP = 346,
     METHOD = 347,
     ANON = 348,
     MULTI = 349,
     LABEL = 350,
     EMIT = 351,
     EOM = 352,
     IREG = 353,
     NREG = 354,
     SREG = 355,
     PREG = 356,
     IDENTIFIER = 357,
     REG = 358,
     MACRO = 359,
     ENDM = 360,
     STRINGC = 361,
     INTC = 362,
     FLOATC = 363,
     USTRINGC = 364,
     PARROT_OP = 365,
     VAR = 366,
     LINECOMMENT = 367,
     FILECOMMENT = 368,
     DOT = 369,
     CONCAT = 370,
     POINTY = 371
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define PRAGMA 260
#define CALL 261
#define GOTO 262
#define ARG 263
#define FLATTEN_ARG 264
#define FLATTEN 265
#define IF 266
#define UNLESS 267
#define END 268
#define SAVEALL 269
#define RESTOREALL 270
#define NEW 271
#define NEWSUB 272
#define NEWCLOSURE 273
#define NEWCOR 274
#define NEWCONT 275
#define NAMESPACE 276
#define ENDNAMESPACE 277
#define CLASS 278
#define ENDCLASS 279
#define FIELD 280
#define DOT_METHOD 281
#define SUB 282
#define SYM 283
#define LOCAL 284
#define CONST 285
#define INC 286
#define DEC 287
#define GLOBAL_CONST 288
#define PLUS_ASSIGN 289
#define MINUS_ASSIGN 290
#define MUL_ASSIGN 291
#define DIV_ASSIGN 292
#define CONCAT_ASSIGN 293
#define BAND_ASSIGN 294
#define BOR_ASSIGN 295
#define BXOR_ASSIGN 296
#define FDIV 297
#define FDIV_ASSIGN 298
#define MOD_ASSIGN 299
#define SHR_ASSIGN 300
#define SHL_ASSIGN 301
#define SHR_U_ASSIGN 302
#define SHIFT_LEFT 303
#define SHIFT_RIGHT 304
#define INTV 305
#define FLOATV 306
#define STRINGV 307
#define PMCV 308
#define OBJECTV 309
#define LOG_XOR 310
#define RELOP_EQ 311
#define RELOP_NE 312
#define RELOP_GT 313
#define RELOP_GTE 314
#define RELOP_LT 315
#define RELOP_LTE 316
#define GLOBAL 317
#define GLOBALOP 318
#define ADDR 319
#define RESULT 320
#define RETURN 321
#define YIELDT 322
#define POW 323
#define SHIFT_RIGHT_U 324
#define LOG_AND 325
#define LOG_OR 326
#define COMMA 327
#define ESUB 328
#define DOTDOT 329
#define PCC_BEGIN 330
#define PCC_END 331
#define PCC_CALL 332
#define PCC_SUB 333
#define PCC_BEGIN_RETURN 334
#define PCC_END_RETURN 335
#define PCC_BEGIN_YIELD 336
#define PCC_END_YIELD 337
#define NCI_CALL 338
#define METH_CALL 339
#define INVOCANT 340
#define PROTOTYPED 341
#define NON_PROTOTYPED 342
#define MAIN 343
#define LOAD 344
#define IMMEDIATE 345
#define POSTCOMP 346
#define METHOD 347
#define ANON 348
#define MULTI 349
#define LABEL 350
#define EMIT 351
#define EOM 352
#define IREG 353
#define NREG 354
#define SREG 355
#define PREG 356
#define IDENTIFIER 357
#define REG 358
#define MACRO 359
#define ENDM 360
#define STRINGC 361
#define INTC 362
#define FLOATC 363
#define USTRINGC 364
#define PARROT_OP 365
#define VAR 366
#define LINECOMMENT 367
#define FILECOMMENT 368
#define DOT 369
#define CONCAT 370
#define POINTY 371




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
#line 283 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

