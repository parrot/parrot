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
     NEW = 266,
     END = 267,
     SAVEALL = 268,
     RESTOREALL = 269,
     NAMESPACE = 270,
     ENDNAMESPACE = 271,
     CLASS = 272,
     ENDCLASS = 273,
     FIELD = 274,
     METHOD = 275,
     SUB = 276,
     SYM = 277,
     LOCAL = 278,
     CONST = 279,
     INC = 280,
     DEC = 281,
     GLOBAL_CONST = 282,
     SHIFT_LEFT = 283,
     SHIFT_RIGHT = 284,
     INTV = 285,
     FLOATV = 286,
     STRINGV = 287,
     DEFINED = 288,
     LOG_XOR = 289,
     RELOP_EQ = 290,
     RELOP_NE = 291,
     RELOP_GT = 292,
     RELOP_GTE = 293,
     RELOP_LT = 294,
     RELOP_LTE = 295,
     GLOBAL = 296,
     ADDR = 297,
     CLONE = 298,
     RESULT = 299,
     RETURN = 300,
     POW = 301,
     SHIFT_RIGHT_U = 302,
     LOG_AND = 303,
     LOG_OR = 304,
     COMMA = 305,
     ESUB = 306,
     PCC_BEGIN = 307,
     PCC_END = 308,
     PCC_CALL = 309,
     PCC_SUB = 310,
     PCC_BEGIN_RETURN = 311,
     PCC_END_RETURN = 312,
     PCC_BEGIN_YIELD = 313,
     PCC_END_YIELD = 314,
     NCI_CALL = 315,
     PROTOTYPED = 316,
     NON_PROTOTYPED = 317,
     LABEL = 318,
     EMIT = 319,
     EOM = 320,
     IREG = 321,
     NREG = 322,
     SREG = 323,
     PREG = 324,
     IDENTIFIER = 325,
     STRINGC = 326,
     INTC = 327,
     FLOATC = 328,
     REG = 329,
     MACRO = 330,
     ENDM = 331,
     PARROT_OP = 332,
     VAR = 333,
     LINECOMMENT = 334,
     FILECOMMENT = 335
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
#define NEW 266
#define END 267
#define SAVEALL 268
#define RESTOREALL 269
#define NAMESPACE 270
#define ENDNAMESPACE 271
#define CLASS 272
#define ENDCLASS 273
#define FIELD 274
#define METHOD 275
#define SUB 276
#define SYM 277
#define LOCAL 278
#define CONST 279
#define INC 280
#define DEC 281
#define GLOBAL_CONST 282
#define SHIFT_LEFT 283
#define SHIFT_RIGHT 284
#define INTV 285
#define FLOATV 286
#define STRINGV 287
#define DEFINED 288
#define LOG_XOR 289
#define RELOP_EQ 290
#define RELOP_NE 291
#define RELOP_GT 292
#define RELOP_GTE 293
#define RELOP_LT 294
#define RELOP_LTE 295
#define GLOBAL 296
#define ADDR 297
#define CLONE 298
#define RESULT 299
#define RETURN 300
#define POW 301
#define SHIFT_RIGHT_U 302
#define LOG_AND 303
#define LOG_OR 304
#define COMMA 305
#define ESUB 306
#define PCC_BEGIN 307
#define PCC_END 308
#define PCC_CALL 309
#define PCC_SUB 310
#define PCC_BEGIN_RETURN 311
#define PCC_END_RETURN 312
#define PCC_BEGIN_YIELD 313
#define PCC_END_YIELD 314
#define NCI_CALL 315
#define PROTOTYPED 316
#define NON_PROTOTYPED 317
#define LABEL 318
#define EMIT 319
#define EOM 320
#define IREG 321
#define NREG 322
#define SREG 323
#define PREG 324
#define IDENTIFIER 325
#define STRINGC 326
#define INTC 327
#define FLOATC 328
#define REG 329
#define MACRO 330
#define ENDM 331
#define PARROT_OP 332
#define VAR 333
#define LINECOMMENT 334
#define FILECOMMENT 335




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
/* Line 1281 of /usr/local/share/bison/yacc.c.  */
#line 210 "imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCC_IMCPARSER_H */

