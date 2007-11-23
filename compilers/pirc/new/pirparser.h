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
     TK_NL = 259,
     TK_HLL = 260,
     TK_HLL_MAP = 261,
     TK_EMIT = 262,
     TK_EOM = 263,
     TK_N_OPERATORS = 264,
     TK_PRAGMA = 265,
     TK_LOADLIB = 266,
     TK_SUB = 267,
     TK_END = 268,
     TK_PARAM = 269,
     TK_LEX = 270,
     TK_LOCAL = 271,
     TK_NAMESPACE = 272,
     TK_INVOCANT = 273,
     TK_METH_CALL = 274,
     TK_GLOBALCONST = 275,
     TK_CONST = 276,
     TK_RETURN = 277,
     TK_YIELD = 278,
     TK_BEGIN_YIELD = 279,
     TK_END_YIELD = 280,
     TK_BEGIN_RETURN = 281,
     TK_END_RETURN = 282,
     TK_BEGIN_CALL = 283,
     TK_END_CALL = 284,
     TK_GET_RESULTS = 285,
     TK_CALL = 286,
     TK_ARG = 287,
     TK_RESULT = 288,
     TK_NCI_CALL = 289,
     TK_IDENT = 290,
     TK_STRINGC = 291,
     TK_INTC = 292,
     TK_NUMC = 293,
     TK_PASM_PREG = 294,
     TK_PASM_NREG = 295,
     TK_PASM_SREG = 296,
     TK_PASM_IREG = 297,
     TK_SYM_PREG = 298,
     TK_SYM_NREG = 299,
     TK_SYM_SREG = 300,
     TK_SYM_IREG = 301,
     TK_PARROT_OP = 302,
     TK_INT = 303,
     TK_NUM = 304,
     TK_PMC = 305,
     TK_STRING = 306,
     TK_IF = 307,
     TK_UNLESS = 308,
     TK_NULL = 309,
     TK_GOTO = 310,
     TK_ARROW = 311,
     TK_NE = 312,
     TK_EQ = 313,
     TK_LT = 314,
     TK_LE = 315,
     TK_GT = 316,
     TK_GE = 317,
     TK_USHIFT = 318,
     TK_RSHIFT = 319,
     TK_LSHIFT = 320,
     TK_FDIV = 321,
     TK_OR = 322,
     TK_AND = 323,
     TK_XOR = 324,
     TK_CONC = 325,
     TK_ASSIGN_USHIFT = 326,
     TK_ASSIGN_RSHIFT = 327,
     TK_ASSIGN_LSHIFT = 328,
     TK_ASSIGN_INC = 329,
     TK_ASSIGN_DEC = 330,
     TK_ASSIGN_MUL = 331,
     TK_ASSIGN_MOD = 332,
     TK_ASSIGN_POW = 333,
     TK_ASSIGN_DIV = 334,
     TK_ASSIGN_BOR = 335,
     TK_ASSIGN_BAND = 336,
     TK_ASSIGN_FDIV = 337,
     TK_ASSIGN_BNOT = 338,
     TK_ASSIGN_CONC = 339,
     TK_FLAG_INIT = 340,
     TK_FLAG_LOAD = 341,
     TK_FLAG_MAIN = 342,
     TK_FLAG_ANON = 343,
     TK_FLAG_METHOD = 344,
     TK_FLAG_OUTER = 345,
     TK_FLAG_VTABLE = 346,
     TK_FLAG_LEX = 347,
     TK_FLAG_MULTI = 348,
     TK_FLAG_POSTCOMP = 349,
     TK_FLAG_IMMEDIATE = 350,
     TK_FLAG_UNIQUE_REG = 351,
     TK_FLAG_NAMED = 352,
     TK_FLAG_SLURPY = 353,
     TK_FLAG_FLAT = 354,
     TK_FLAG_OPTIONAL = 355,
     TK_FLAG_OPT_FLAG = 356
   };
#endif
/* Tokens.  */
#define TK_LABEL 258
#define TK_NL 259
#define TK_HLL 260
#define TK_HLL_MAP 261
#define TK_EMIT 262
#define TK_EOM 263
#define TK_N_OPERATORS 264
#define TK_PRAGMA 265
#define TK_LOADLIB 266
#define TK_SUB 267
#define TK_END 268
#define TK_PARAM 269
#define TK_LEX 270
#define TK_LOCAL 271
#define TK_NAMESPACE 272
#define TK_INVOCANT 273
#define TK_METH_CALL 274
#define TK_GLOBALCONST 275
#define TK_CONST 276
#define TK_RETURN 277
#define TK_YIELD 278
#define TK_BEGIN_YIELD 279
#define TK_END_YIELD 280
#define TK_BEGIN_RETURN 281
#define TK_END_RETURN 282
#define TK_BEGIN_CALL 283
#define TK_END_CALL 284
#define TK_GET_RESULTS 285
#define TK_CALL 286
#define TK_ARG 287
#define TK_RESULT 288
#define TK_NCI_CALL 289
#define TK_IDENT 290
#define TK_STRINGC 291
#define TK_INTC 292
#define TK_NUMC 293
#define TK_PASM_PREG 294
#define TK_PASM_NREG 295
#define TK_PASM_SREG 296
#define TK_PASM_IREG 297
#define TK_SYM_PREG 298
#define TK_SYM_NREG 299
#define TK_SYM_SREG 300
#define TK_SYM_IREG 301
#define TK_PARROT_OP 302
#define TK_INT 303
#define TK_NUM 304
#define TK_PMC 305
#define TK_STRING 306
#define TK_IF 307
#define TK_UNLESS 308
#define TK_NULL 309
#define TK_GOTO 310
#define TK_ARROW 311
#define TK_NE 312
#define TK_EQ 313
#define TK_LT 314
#define TK_LE 315
#define TK_GT 316
#define TK_GE 317
#define TK_USHIFT 318
#define TK_RSHIFT 319
#define TK_LSHIFT 320
#define TK_FDIV 321
#define TK_OR 322
#define TK_AND 323
#define TK_XOR 324
#define TK_CONC 325
#define TK_ASSIGN_USHIFT 326
#define TK_ASSIGN_RSHIFT 327
#define TK_ASSIGN_LSHIFT 328
#define TK_ASSIGN_INC 329
#define TK_ASSIGN_DEC 330
#define TK_ASSIGN_MUL 331
#define TK_ASSIGN_MOD 332
#define TK_ASSIGN_POW 333
#define TK_ASSIGN_DIV 334
#define TK_ASSIGN_BOR 335
#define TK_ASSIGN_BAND 336
#define TK_ASSIGN_FDIV 337
#define TK_ASSIGN_BNOT 338
#define TK_ASSIGN_CONC 339
#define TK_FLAG_INIT 340
#define TK_FLAG_LOAD 341
#define TK_FLAG_MAIN 342
#define TK_FLAG_ANON 343
#define TK_FLAG_METHOD 344
#define TK_FLAG_OUTER 345
#define TK_FLAG_VTABLE 346
#define TK_FLAG_LEX 347
#define TK_FLAG_MULTI 348
#define TK_FLAG_POSTCOMP 349
#define TK_FLAG_IMMEDIATE 350
#define TK_FLAG_UNIQUE_REG 351
#define TK_FLAG_NAMED 352
#define TK_FLAG_SLURPY 353
#define TK_FLAG_FLAT 354
#define TK_FLAG_OPTIONAL 355
#define TK_FLAG_OPT_FLAG 356




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 81 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;
}
/* Line 1489 of yacc.c.  */
#line 257 "pirparser.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



