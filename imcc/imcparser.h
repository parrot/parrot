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
     CALL = 260,
     GOTO = 261,
     ARG = 262,
     FLATTEN_ARG = 263,
     IF = 264,
     UNLESS = 265,
     END = 266,
     SAVEALL = 267,
     RESTOREALL = 268,
     NEW = 269,
     NEWSUB = 270,
     NEWCLOSURE = 271,
     NEWCOR = 272,
     NEWCONT = 273,
     NAMESPACE = 274,
     ENDNAMESPACE = 275,
     CLASS = 276,
     ENDCLASS = 277,
     FIELD = 278,
     METHOD = 279,
     SUB = 280,
     SYM = 281,
     LOCAL = 282,
     CONST = 283,
     INC = 284,
     DEC = 285,
     GLOBAL_CONST = 286,
     SHIFT_LEFT = 287,
     SHIFT_RIGHT = 288,
     INTV = 289,
     FLOATV = 290,
     STRINGV = 291,
     DEFINED = 292,
     LOG_XOR = 293,
     RELOP_EQ = 294,
     RELOP_NE = 295,
     RELOP_GT = 296,
     RELOP_GTE = 297,
     RELOP_LT = 298,
     RELOP_LTE = 299,
     GLOBAL = 300,
     ADDR = 301,
     CLONE = 302,
     RESULT = 303,
     RETURN = 304,
     POW = 305,
     SHIFT_RIGHT_U = 306,
     LOG_AND = 307,
     LOG_OR = 308,
     COMMA = 309,
     ESUB = 310,
     PCC_BEGIN = 311,
     PCC_END = 312,
     PCC_CALL = 313,
     PCC_SUB = 314,
     PCC_BEGIN_RETURN = 315,
     PCC_END_RETURN = 316,
     PCC_BEGIN_YIELD = 317,
     PCC_END_YIELD = 318,
     NCI_CALL = 319,
     PROTOTYPED = 320,
     NON_PROTOTYPED = 321,
     LABEL = 322,
     EMIT = 323,
     EOM = 324,
     IREG = 325,
     NREG = 326,
     SREG = 327,
     PREG = 328,
     IDENTIFIER = 329,
     STRINGC = 330,
     INTC = 331,
     FLOATC = 332,
     REG = 333,
     MACRO = 334,
     ENDM = 335,
     PARROT_OP = 336,
     VAR = 337,
     LINECOMMENT = 338,
     FILECOMMENT = 339
   };
#endif
#define LOW_PREC 258
#define PARAM 259
#define CALL 260
#define GOTO 261
#define ARG 262
#define FLATTEN_ARG 263
#define IF 264
#define UNLESS 265
#define END 266
#define SAVEALL 267
#define RESTOREALL 268
#define NEW 269
#define NEWSUB 270
#define NEWCLOSURE 271
#define NEWCOR 272
#define NEWCONT 273
#define NAMESPACE 274
#define ENDNAMESPACE 275
#define CLASS 276
#define ENDCLASS 277
#define FIELD 278
#define METHOD 279
#define SUB 280
#define SYM 281
#define LOCAL 282
#define CONST 283
#define INC 284
#define DEC 285
#define GLOBAL_CONST 286
#define SHIFT_LEFT 287
#define SHIFT_RIGHT 288
#define INTV 289
#define FLOATV 290
#define STRINGV 291
#define DEFINED 292
#define LOG_XOR 293
#define RELOP_EQ 294
#define RELOP_NE 295
#define RELOP_GT 296
#define RELOP_GTE 297
#define RELOP_LT 298
#define RELOP_LTE 299
#define GLOBAL 300
#define ADDR 301
#define CLONE 302
#define RESULT 303
#define RETURN 304
#define POW 305
#define SHIFT_RIGHT_U 306
#define LOG_AND 307
#define LOG_OR 308
#define COMMA 309
#define ESUB 310
#define PCC_BEGIN 311
#define PCC_END 312
#define PCC_CALL 313
#define PCC_SUB 314
#define PCC_BEGIN_RETURN 315
#define PCC_END_RETURN 316
#define PCC_BEGIN_YIELD 317
#define PCC_END_YIELD 318
#define NCI_CALL 319
#define PROTOTYPED 320
#define NON_PROTOTYPED 321
#define LABEL 322
#define EMIT 323
#define EOM 324
#define IREG 325
#define NREG 326
#define SREG 327
#define PREG 328
#define IDENTIFIER 329
#define STRINGC 330
#define INTC 331
#define FLOATC 332
#define REG 333
#define MACRO 334
#define ENDM 335
#define PARROT_OP 336
#define VAR 337
#define LINECOMMENT 338
#define FILECOMMENT 339




#ifndef YYSTYPE
#line 203 "imcc/imcc.y"
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
#line 218 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

