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
     DOT_METHOD = 280,
     SUB = 281,
     SYM = 282,
     LOCAL = 283,
     CONST = 284,
     INC = 285,
     DEC = 286,
     GLOBAL_CONST = 287,
     PLUS_ASSIGN = 288,
     MINUS_ASSIGN = 289,
     MUL_ASSIGN = 290,
     DIV_ASSIGN = 291,
     CONCAT_ASSIGN = 292,
     BAND_ASSIGN = 293,
     BOR_ASSIGN = 294,
     BXOR_ASSIGN = 295,
     FDIV = 296,
     FDIV_ASSIGN = 297,
     SHR_ASSIGN = 298,
     SHL_ASSIGN = 299,
     SHR_U_ASSIGN = 300,
     SHIFT_LEFT = 301,
     SHIFT_RIGHT = 302,
     INTV = 303,
     FLOATV = 304,
     STRINGV = 305,
     PMCV = 306,
     OBJECTV = 307,
     LOG_XOR = 308,
     RELOP_EQ = 309,
     RELOP_NE = 310,
     RELOP_GT = 311,
     RELOP_GTE = 312,
     RELOP_LT = 313,
     RELOP_LTE = 314,
     GLOBAL = 315,
     GLOBALOP = 316,
     ADDR = 317,
     RESULT = 318,
     RETURN = 319,
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
     PROTOTYPED = 338,
     NON_PROTOTYPED = 339,
     MAIN = 340,
     LOAD = 341,
     IMMEDIATE = 342,
     POSTCOMP = 343,
     METHOD = 344,
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
#define DOT_METHOD 280
#define SUB 281
#define SYM 282
#define LOCAL 283
#define CONST 284
#define INC 285
#define DEC 286
#define GLOBAL_CONST 287
#define PLUS_ASSIGN 288
#define MINUS_ASSIGN 289
#define MUL_ASSIGN 290
#define DIV_ASSIGN 291
#define CONCAT_ASSIGN 292
#define BAND_ASSIGN 293
#define BOR_ASSIGN 294
#define BXOR_ASSIGN 295
#define FDIV 296
#define FDIV_ASSIGN 297
#define SHR_ASSIGN 298
#define SHL_ASSIGN 299
#define SHR_U_ASSIGN 300
#define SHIFT_LEFT 301
#define SHIFT_RIGHT 302
#define INTV 303
#define FLOATV 304
#define STRINGV 305
#define PMCV 306
#define OBJECTV 307
#define LOG_XOR 308
#define RELOP_EQ 309
#define RELOP_NE 310
#define RELOP_GT 311
#define RELOP_GTE 312
#define RELOP_LT 313
#define RELOP_LTE 314
#define GLOBAL 315
#define GLOBALOP 316
#define ADDR 317
#define RESULT 318
#define RETURN 319
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
#define PROTOTYPED 338
#define NON_PROTOTYPED 339
#define MAIN 340
#define LOAD 341
#define IMMEDIATE 342
#define POSTCOMP 343
#define METHOD 344
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
#line 247 "imcc/imcc.y"
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
#line 272 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

