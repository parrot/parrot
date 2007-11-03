/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

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
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     TK_LABEL = 258,
     TK_DOTDOT = 259,
     TK_NL = 260,
     TK_HLL = 261,
     TK_HLL_MAP = 262,
     TK_EMIT = 263,
     TK_EOM = 264,
     TK_N_OPERATORS = 265,
     TK_PRAGMA = 266,
     TK_LOADLIB = 267,
     TK_SUB = 268,
     TK_END = 269,
     TK_PARAM = 270,
     TK_LEX = 271,
     TK_LOCAL = 272,
     TK_NAMESPACE = 273,
     TK_INVOCANT = 274,
     TK_METH_CALL = 275,
     TK_GLOBALCONST = 276,
     TK_CONST = 277,
     TK_RETURN = 278,
     TK_YIELD = 279,
     TK_BEGIN_YIELD = 280,
     TK_END_YIELD = 281,
     TK_BEGIN_RETURN = 282,
     TK_END_RETURN = 283,
     TK_BEGIN_CALL = 284,
     TK_END_CALL = 285,
     TK_GET_RESULTS = 286,
     TK_CALL = 287,
     TK_ARG = 288,
     TK_RESULT = 289,
     TK_NCI_CALL = 290,
     TK_IDENT = 291,
     TK_STRINGC = 292,
     TK_INTC = 293,
     TK_NUMC = 294,
     TK_PASM_PREG = 295,
     TK_PASM_NREG = 296,
     TK_PASM_SREG = 297,
     TK_PASM_IREG = 298,
     TK_SYM_PREG = 299,
     TK_SYM_NREG = 300,
     TK_SYM_SREG = 301,
     TK_SYM_IREG = 302,
     TK_PARROT_OP = 303,
     TK_INT = 304,
     TK_NUM = 305,
     TK_PMC = 306,
     TK_STRING = 307,
     TK_IF = 308,
     TK_UNLESS = 309,
     TK_NULL = 310,
     TK_GOTO = 311,
     TK_ARROW = 312,
     TK_NE = 313,
     TK_EQ = 314,
     TK_LT = 315,
     TK_LE = 316,
     TK_GT = 317,
     TK_GE = 318,
     TK_USHIFT = 319,
     TK_RSHIFT = 320,
     TK_LSHIFT = 321,
     TK_FDIV = 322,
     TK_OR = 323,
     TK_AND = 324,
     TK_XOR = 325,
     TK_CONC = 326,
     TK_ASSIGN_USHIFT = 327,
     TK_ASSIGN_RSHIFT = 328,
     TK_ASSIGN_LSHIFT = 329,
     TK_ASSIGN_INC = 330,
     TK_ASSIGN_DEC = 331,
     TK_ASSIGN_MUL = 332,
     TK_ASSIGN_MOD = 333,
     TK_ASSIGN_POW = 334,
     TK_ASSIGN_DIV = 335,
     TK_ASSIGN_BOR = 336,
     TK_ASSIGN_BAND = 337,
     TK_ASSIGN_FDIV = 338,
     TK_ASSIGN_BNOT = 339,
     TK_ASSIGN_CONC = 340,
     TK_FLAG_INIT = 341,
     TK_FLAG_LOAD = 342,
     TK_FLAG_MAIN = 343,
     TK_FLAG_ANON = 344,
     TK_FLAG_METHOD = 345,
     TK_FLAG_OUTER = 346,
     TK_FLAG_VTABLE = 347,
     TK_FLAG_LEX = 348,
     TK_FLAG_MULTI = 349,
     TK_FLAG_POSTCOMP = 350,
     TK_FLAG_IMMEDIATE = 351,
     TK_FLAG_UNIQUE_REG = 352,
     TK_FLAG_NAMED = 353,
     TK_FLAG_SLURPY = 354,
     TK_FLAG_FLAT = 355,
     TK_FLAG_OPTIONAL = 356,
     TK_FLAG_OPT_FLAG = 357
   };
#endif
/* Tokens.  */
#define TK_LABEL 258
#define TK_DOTDOT 259
#define TK_NL 260
#define TK_HLL 261
#define TK_HLL_MAP 262
#define TK_EMIT 263
#define TK_EOM 264
#define TK_N_OPERATORS 265
#define TK_PRAGMA 266
#define TK_LOADLIB 267
#define TK_SUB 268
#define TK_END 269
#define TK_PARAM 270
#define TK_LEX 271
#define TK_LOCAL 272
#define TK_NAMESPACE 273
#define TK_INVOCANT 274
#define TK_METH_CALL 275
#define TK_GLOBALCONST 276
#define TK_CONST 277
#define TK_RETURN 278
#define TK_YIELD 279
#define TK_BEGIN_YIELD 280
#define TK_END_YIELD 281
#define TK_BEGIN_RETURN 282
#define TK_END_RETURN 283
#define TK_BEGIN_CALL 284
#define TK_END_CALL 285
#define TK_GET_RESULTS 286
#define TK_CALL 287
#define TK_ARG 288
#define TK_RESULT 289
#define TK_NCI_CALL 290
#define TK_IDENT 291
#define TK_STRINGC 292
#define TK_INTC 293
#define TK_NUMC 294
#define TK_PASM_PREG 295
#define TK_PASM_NREG 296
#define TK_PASM_SREG 297
#define TK_PASM_IREG 298
#define TK_SYM_PREG 299
#define TK_SYM_NREG 300
#define TK_SYM_SREG 301
#define TK_SYM_IREG 302
#define TK_PARROT_OP 303
#define TK_INT 304
#define TK_NUM 305
#define TK_PMC 306
#define TK_STRING 307
#define TK_IF 308
#define TK_UNLESS 309
#define TK_NULL 310
#define TK_GOTO 311
#define TK_ARROW 312
#define TK_NE 313
#define TK_EQ 314
#define TK_LT 315
#define TK_LE 316
#define TK_GT 317
#define TK_GE 318
#define TK_USHIFT 319
#define TK_RSHIFT 320
#define TK_LSHIFT 321
#define TK_FDIV 322
#define TK_OR 323
#define TK_AND 324
#define TK_XOR 325
#define TK_CONC 326
#define TK_ASSIGN_USHIFT 327
#define TK_ASSIGN_RSHIFT 328
#define TK_ASSIGN_LSHIFT 329
#define TK_ASSIGN_INC 330
#define TK_ASSIGN_DEC 331
#define TK_ASSIGN_MUL 332
#define TK_ASSIGN_MOD 333
#define TK_ASSIGN_POW 334
#define TK_ASSIGN_DIV 335
#define TK_ASSIGN_BOR 336
#define TK_ASSIGN_BAND 337
#define TK_ASSIGN_FDIV 338
#define TK_ASSIGN_BNOT 339
#define TK_ASSIGN_CONC 340
#define TK_FLAG_INIT 341
#define TK_FLAG_LOAD 342
#define TK_FLAG_MAIN 343
#define TK_FLAG_ANON 344
#define TK_FLAG_METHOD 345
#define TK_FLAG_OUTER 346
#define TK_FLAG_VTABLE 347
#define TK_FLAG_LEX 348
#define TK_FLAG_MULTI 349
#define TK_FLAG_POSTCOMP 350
#define TK_FLAG_IMMEDIATE 351
#define TK_FLAG_UNIQUE_REG 352
#define TK_FLAG_NAMED 353
#define TK_FLAG_SLURPY 354
#define TK_FLAG_FLAT 355
#define TK_FLAG_OPTIONAL 356
#define TK_FLAG_OPT_FLAG 357




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 186 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;
}
/* Line 1489 of yacc.c.  */
#line 259 "pirparser.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



