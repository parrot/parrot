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
     POW = 318,
     SHIFT_RIGHT_U = 319,
     LOG_AND = 320,
     LOG_OR = 321,
     COMMA = 322,
     ESUB = 323,
     DOTDOT = 324,
     PCC_BEGIN = 325,
     PCC_END = 326,
     PCC_CALL = 327,
     PCC_SUB = 328,
     PCC_BEGIN_RETURN = 329,
     PCC_END_RETURN = 330,
     PCC_BEGIN_YIELD = 331,
     PCC_END_YIELD = 332,
     NCI_CALL = 333,
     METH_CALL = 334,
     INVOCANT = 335,
     PROTOTYPED = 336,
     NON_PROTOTYPED = 337,
     MAIN = 338,
     LOAD = 339,
     IMMEDIATE = 340,
     POSTCOMP = 341,
     METHOD = 342,
     LABEL = 343,
     EMIT = 344,
     EOM = 345,
     IREG = 346,
     NREG = 347,
     SREG = 348,
     PREG = 349,
     IDENTIFIER = 350,
     REG = 351,
     MACRO = 352,
     ENDM = 353,
     STRINGC = 354,
     INTC = 355,
     FLOATC = 356,
     USTRINGC = 357,
     PARROT_OP = 358,
     VAR = 359,
     LINECOMMENT = 360,
     FILECOMMENT = 361,
     DOT = 362,
     CONCAT = 363,
     POINTY = 364
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
#define POW 318
#define SHIFT_RIGHT_U 319
#define LOG_AND 320
#define LOG_OR 321
#define COMMA 322
#define ESUB 323
#define DOTDOT 324
#define PCC_BEGIN 325
#define PCC_END 326
#define PCC_CALL 327
#define PCC_SUB 328
#define PCC_BEGIN_RETURN 329
#define PCC_END_RETURN 330
#define PCC_BEGIN_YIELD 331
#define PCC_END_YIELD 332
#define NCI_CALL 333
#define METH_CALL 334
#define INVOCANT 335
#define PROTOTYPED 336
#define NON_PROTOTYPED 337
#define MAIN 338
#define LOAD 339
#define IMMEDIATE 340
#define POSTCOMP 341
#define METHOD 342
#define LABEL 343
#define EMIT 344
#define EOM 345
#define IREG 346
#define NREG 347
#define SREG 348
#define PREG 349
#define IDENTIFIER 350
#define REG 351
#define MACRO 352
#define ENDM 353
#define STRINGC 354
#define INTC 355
#define FLOATC 356
#define USTRINGC 357
#define PARROT_OP 358
#define VAR 359
#define LINECOMMENT 360
#define FILECOMMENT 361
#define DOT 362
#define CONCAT 363
#define POINTY 364




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
#line 268 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

