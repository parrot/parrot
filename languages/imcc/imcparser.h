/* A Bison parser, made from imcc.y, by GNU bison 1.75.  */

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

#ifndef BISON_IMCPARSER_H
# define BISON_IMCPARSER_H

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     CALL = 258,
     GOTO = 259,
     ARG = 260,
     IF = 261,
     UNLESS = 262,
     NEW = 263,
     END = 264,
     SAVEALL = 265,
     RESTOREALL = 266,
     SUB = 267,
     NAMESPACE = 268,
     ENDNAMESPACE = 269,
     CLASS = 270,
     ENDCLASS = 271,
     SYM = 272,
     LOCAL = 273,
     CONST = 274,
     PARAM = 275,
     INC = 276,
     DEC = 277,
     GLOBAL_CONST = 278,
     SHIFT_LEFT = 279,
     SHIFT_RIGHT = 280,
     INTV = 281,
     FLOATV = 282,
     STRINGV = 283,
     DEFINED = 284,
     LOG_XOR = 285,
     RELOP_EQ = 286,
     RELOP_NE = 287,
     RELOP_GT = 288,
     RELOP_GTE = 289,
     RELOP_LT = 290,
     RELOP_LTE = 291,
     GLOBAL = 292,
     ADDR = 293,
     CLONE = 294,
     RESULT = 295,
     RETURN = 296,
     POW = 297,
     SHIFT_RIGHT_U = 298,
     LOG_AND = 299,
     LOG_OR = 300,
     COMMA = 301,
     ESUB = 302,
     PCC_BEGIN = 303,
     PCC_END = 304,
     PCC_CALL = 305,
     PCC_SUB = 306,
     PCC_BEGIN_RETURN = 307,
     PCC_END_RETURN = 308,
     PCC_BEGIN_YIELD = 309,
     PCC_END_YIELD = 310,
     PROTOTYPED = 311,
     NON_PROTOTYPED = 312,
     LABEL = 313,
     EMIT = 314,
     EOM = 315,
     IREG = 316,
     NREG = 317,
     SREG = 318,
     PREG = 319,
     IDENTIFIER = 320,
     STRINGC = 321,
     INTC = 322,
     FLOATC = 323,
     REG = 324,
     MACRO = 325,
     ENDM = 326,
     PARROT_OP = 327,
     VAR = 328
   };
#endif
#define CALL 258
#define GOTO 259
#define ARG 260
#define IF 261
#define UNLESS 262
#define NEW 263
#define END 264
#define SAVEALL 265
#define RESTOREALL 266
#define SUB 267
#define NAMESPACE 268
#define ENDNAMESPACE 269
#define CLASS 270
#define ENDCLASS 271
#define SYM 272
#define LOCAL 273
#define CONST 274
#define PARAM 275
#define INC 276
#define DEC 277
#define GLOBAL_CONST 278
#define SHIFT_LEFT 279
#define SHIFT_RIGHT 280
#define INTV 281
#define FLOATV 282
#define STRINGV 283
#define DEFINED 284
#define LOG_XOR 285
#define RELOP_EQ 286
#define RELOP_NE 287
#define RELOP_GT 288
#define RELOP_GTE 289
#define RELOP_LT 290
#define RELOP_LTE 291
#define GLOBAL 292
#define ADDR 293
#define CLONE 294
#define RESULT 295
#define RETURN 296
#define POW 297
#define SHIFT_RIGHT_U 298
#define LOG_AND 299
#define LOG_OR 300
#define COMMA 301
#define ESUB 302
#define PCC_BEGIN 303
#define PCC_END 304
#define PCC_CALL 305
#define PCC_SUB 306
#define PCC_BEGIN_RETURN 307
#define PCC_END_RETURN 308
#define PCC_BEGIN_YIELD 309
#define PCC_END_YIELD 310
#define PROTOTYPED 311
#define NON_PROTOTYPED 312
#define LABEL 313
#define EMIT 314
#define EOM 315
#define IREG 316
#define NREG 317
#define SREG 318
#define PREG 319
#define IDENTIFIER 320
#define STRINGC 321
#define INTC 322
#define FLOATC 323
#define REG 324
#define MACRO 325
#define ENDM 326
#define PARROT_OP 327
#define VAR 328




#ifndef YYSTYPE
#line 402 "imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 1281 of /usr/share/bison/yacc.c.  */
#line 193 "imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCPARSER_H */

