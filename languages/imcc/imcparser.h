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
     FLATTEN_ARG = 261,
     IF = 262,
     UNLESS = 263,
     NEW = 264,
     END = 265,
     SAVEALL = 266,
     RESTOREALL = 267,
     SUB = 268,
     NAMESPACE = 269,
     ENDNAMESPACE = 270,
     CLASS = 271,
     ENDCLASS = 272,
     SYM = 273,
     LOCAL = 274,
     CONST = 275,
     PARAM = 276,
     INC = 277,
     DEC = 278,
     GLOBAL_CONST = 279,
     SHIFT_LEFT = 280,
     SHIFT_RIGHT = 281,
     INTV = 282,
     FLOATV = 283,
     STRINGV = 284,
     DEFINED = 285,
     LOG_XOR = 286,
     RELOP_EQ = 287,
     RELOP_NE = 288,
     RELOP_GT = 289,
     RELOP_GTE = 290,
     RELOP_LT = 291,
     RELOP_LTE = 292,
     GLOBAL = 293,
     ADDR = 294,
     CLONE = 295,
     RESULT = 296,
     RETURN = 297,
     POW = 298,
     SHIFT_RIGHT_U = 299,
     LOG_AND = 300,
     LOG_OR = 301,
     COMMA = 302,
     ESUB = 303,
     PCC_BEGIN = 304,
     PCC_END = 305,
     PCC_CALL = 306,
     PCC_SUB = 307,
     PCC_BEGIN_RETURN = 308,
     PCC_END_RETURN = 309,
     PCC_BEGIN_YIELD = 310,
     PCC_END_YIELD = 311,
     PROTOTYPED = 312,
     NON_PROTOTYPED = 313,
     LABEL = 314,
     EMIT = 315,
     EOM = 316,
     IREG = 317,
     NREG = 318,
     SREG = 319,
     PREG = 320,
     IDENTIFIER = 321,
     STRINGC = 322,
     INTC = 323,
     FLOATC = 324,
     REG = 325,
     MACRO = 326,
     ENDM = 327,
     PARROT_OP = 328,
     VAR = 329,
     LINECOMMENT = 330,
     FILECOMMENT = 331
   };
#endif
#define CALL 258
#define GOTO 259
#define ARG 260
#define FLATTEN_ARG 261
#define IF 262
#define UNLESS 263
#define NEW 264
#define END 265
#define SAVEALL 266
#define RESTOREALL 267
#define SUB 268
#define NAMESPACE 269
#define ENDNAMESPACE 270
#define CLASS 271
#define ENDCLASS 272
#define SYM 273
#define LOCAL 274
#define CONST 275
#define PARAM 276
#define INC 277
#define DEC 278
#define GLOBAL_CONST 279
#define SHIFT_LEFT 280
#define SHIFT_RIGHT 281
#define INTV 282
#define FLOATV 283
#define STRINGV 284
#define DEFINED 285
#define LOG_XOR 286
#define RELOP_EQ 287
#define RELOP_NE 288
#define RELOP_GT 289
#define RELOP_GTE 290
#define RELOP_LT 291
#define RELOP_LTE 292
#define GLOBAL 293
#define ADDR 294
#define CLONE 295
#define RESULT 296
#define RETURN 297
#define POW 298
#define SHIFT_RIGHT_U 299
#define LOG_AND 300
#define LOG_OR 301
#define COMMA 302
#define ESUB 303
#define PCC_BEGIN 304
#define PCC_END 305
#define PCC_CALL 306
#define PCC_SUB 307
#define PCC_BEGIN_RETURN 308
#define PCC_END_RETURN 309
#define PCC_BEGIN_YIELD 310
#define PCC_END_YIELD 311
#define PROTOTYPED 312
#define NON_PROTOTYPED 313
#define LABEL 314
#define EMIT 315
#define EOM 316
#define IREG 317
#define NREG 318
#define SREG 319
#define PREG 320
#define IDENTIFIER 321
#define STRINGC 322
#define INTC 323
#define FLOATC 324
#define REG 325
#define MACRO 326
#define ENDM 327
#define PARROT_OP 328
#define VAR 329
#define LINECOMMENT 330
#define FILECOMMENT 331




#ifndef YYSTYPE
#line 191 "imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 1281 of /usr/share/bison/yacc.c.  */
#line 199 "imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_IMCPARSER_H */

