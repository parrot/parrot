/* A Bison parser, made from languages/imcc/imcc.y, by GNU bison 1.75.  */

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

#ifndef BISON_LANGUAGES_IMCC_IMCPARSER_H
# define BISON_LANGUAGES_IMCC_IMCPARSER_H

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
     SUB = 270,
     NAMESPACE = 271,
     ENDNAMESPACE = 272,
     CLASS = 273,
     ENDCLASS = 274,
     SYM = 275,
     LOCAL = 276,
     CONST = 277,
     INC = 278,
     DEC = 279,
     GLOBAL_CONST = 280,
     SHIFT_LEFT = 281,
     SHIFT_RIGHT = 282,
     INTV = 283,
     FLOATV = 284,
     STRINGV = 285,
     DEFINED = 286,
     LOG_XOR = 287,
     RELOP_EQ = 288,
     RELOP_NE = 289,
     RELOP_GT = 290,
     RELOP_GTE = 291,
     RELOP_LT = 292,
     RELOP_LTE = 293,
     GLOBAL = 294,
     ADDR = 295,
     CLONE = 296,
     RESULT = 297,
     RETURN = 298,
     POW = 299,
     SHIFT_RIGHT_U = 300,
     LOG_AND = 301,
     LOG_OR = 302,
     COMMA = 303,
     ESUB = 304,
     PCC_BEGIN = 305,
     PCC_END = 306,
     PCC_CALL = 307,
     PCC_SUB = 308,
     PCC_BEGIN_RETURN = 309,
     PCC_END_RETURN = 310,
     PCC_BEGIN_YIELD = 311,
     PCC_END_YIELD = 312,
     NCI_CALL = 313,
     PROTOTYPED = 314,
     NON_PROTOTYPED = 315,
     LABEL = 316,
     EMIT = 317,
     EOM = 318,
     IREG = 319,
     NREG = 320,
     SREG = 321,
     PREG = 322,
     IDENTIFIER = 323,
     STRINGC = 324,
     INTC = 325,
     FLOATC = 326,
     REG = 327,
     MACRO = 328,
     ENDM = 329,
     PARROT_OP = 330,
     VAR = 331,
     LINECOMMENT = 332,
     FILECOMMENT = 333
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
#define SUB 270
#define NAMESPACE 271
#define ENDNAMESPACE 272
#define CLASS 273
#define ENDCLASS 274
#define SYM 275
#define LOCAL 276
#define CONST 277
#define INC 278
#define DEC 279
#define GLOBAL_CONST 280
#define SHIFT_LEFT 281
#define SHIFT_RIGHT 282
#define INTV 283
#define FLOATV 284
#define STRINGV 285
#define DEFINED 286
#define LOG_XOR 287
#define RELOP_EQ 288
#define RELOP_NE 289
#define RELOP_GT 290
#define RELOP_GTE 291
#define RELOP_LT 292
#define RELOP_LTE 293
#define GLOBAL 294
#define ADDR 295
#define CLONE 296
#define RESULT 297
#define RETURN 298
#define POW 299
#define SHIFT_RIGHT_U 300
#define LOG_AND 301
#define LOG_OR 302
#define COMMA 303
#define ESUB 304
#define PCC_BEGIN 305
#define PCC_END 306
#define PCC_CALL 307
#define PCC_SUB 308
#define PCC_BEGIN_RETURN 309
#define PCC_END_RETURN 310
#define PCC_BEGIN_YIELD 311
#define PCC_END_YIELD 312
#define NCI_CALL 313
#define PROTOTYPED 314
#define NON_PROTOTYPED 315
#define LABEL 316
#define EMIT 317
#define EOM 318
#define IREG 319
#define NREG 320
#define SREG 321
#define PREG 322
#define IDENTIFIER 323
#define STRINGC 324
#define INTC 325
#define FLOATC 326
#define REG 327
#define MACRO 328
#define ENDM 329
#define PARROT_OP 330
#define VAR 331
#define LINECOMMENT 332
#define FILECOMMENT 333




#ifndef YYSTYPE
#line 191 "languages/imcc/imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 1281 of /usr/share/bison/yacc.c.  */
#line 203 "languages/imcc/imcparser.h"
# define YYSTYPE yystype
#endif




#endif /* not BISON_LANGUAGES_IMCC_IMCPARSER_H */

