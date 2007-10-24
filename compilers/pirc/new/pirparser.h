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
     TK_ENDM = 260,
     TK_NL = 261,
     TK_HLL = 262,
     TK_HLL_MAP = 263,
     TK_EMIT = 264,
     TK_EOM = 265,
     TK_N_OPERATORS = 266,
     TK_PRAGMA = 267,
     TK_LOADLIB = 268,
     TK_SUB = 269,
     TK_END = 270,
     TK_PARAM = 271,
     TK_LEX = 272,
     TK_LOCAL = 273,
     TK_NAMESPACE = 274,
     TK_ENDNAMESPACE = 275,
     TK_INVOCANT = 276,
     TK_METH_CALL = 277,
     TK_GLOBALCONST = 278,
     TK_CONST = 279,
     TK_RETURN = 280,
     TK_YIELD = 281,
     TK_PCC_BEGIN_YIELD = 282,
     TK_PCC_END_YIELD = 283,
     TK_PCC_BEGIN_RETURN = 284,
     TK_PCC_END_RETURN = 285,
     TK_PCC_BEGIN = 286,
     TK_PCC_END = 287,
     TK_GET_RESULTS = 288,
     TK_PCC_CALL = 289,
     TK_ARG = 290,
     TK_RESULT = 291,
     TK_NCI_CALL = 292,
     TK_IDENT = 293,
     TK_STRINGC = 294,
     TK_INTC = 295,
     TK_NUMC = 296,
     TK_PASM_PREG = 297,
     TK_PASM_NREG = 298,
     TK_PASM_SREG = 299,
     TK_PASM_IREG = 300,
     TK_SYM_PREG = 301,
     TK_SYM_NREG = 302,
     TK_SYM_SREG = 303,
     TK_SYM_IREG = 304,
     TK_PARROT_OP = 305,
     TK_INT = 306,
     TK_NUM = 307,
     TK_PMC = 308,
     TK_STRING = 309,
     TK_IF = 310,
     TK_UNLESS = 311,
     TK_GOTO = 312,
     TK_ARROW = 313,
     TK_NE = 314,
     TK_EQ = 315,
     TK_LT = 316,
     TK_LE = 317,
     TK_GT = 318,
     TK_GE = 319,
     TK_USHIFT = 320,
     TK_RSHIFT = 321,
     TK_LSHIFT = 322,
     TK_FDIV = 323,
     TK_OR = 324,
     TK_AND = 325,
     TK_XOR = 326,
     TK_CONC = 327,
     TK_ASSIGN_USHIFT = 328,
     TK_ASSIGN_RSHIFT = 329,
     TK_ASSIGN_LSHIFT = 330,
     TK_ASSIGN_INC = 331,
     TK_ASSIGN_DEC = 332,
     TK_ASSIGN_MUL = 333,
     TK_ASSIGN_MOD = 334,
     TK_ASSIGN_POW = 335,
     TK_ASSIGN_DIV = 336,
     TK_ASSIGN_BOR = 337,
     TK_ASSIGN_BAND = 338,
     TK_ASSIGN_FDIV = 339,
     TK_ASSIGN_BNOT = 340,
     TK_ASSIGN_CONC = 341,
     TK_FLAG_INIT = 342,
     TK_FLAG_LOAD = 343,
     TK_FLAG_MAIN = 344,
     TK_FLAG_ANON = 345,
     TK_FLAG_METHOD = 346,
     TK_FLAG_OUTER = 347,
     TK_FLAG_VTABLE = 348,
     TK_FLAG_LEX = 349,
     TK_FLAG_MULTI = 350,
     TK_FLAG_POSTCOMP = 351,
     TK_FLAG_IMMEDIATE = 352,
     TK_FLAG_UNIQUE_REG = 353,
     TK_FLAG_NAMED = 354,
     TK_FLAG_SLURPY = 355,
     TK_FLAG_FLAT = 356,
     TK_FLAG_OPTIONAL = 357,
     TK_FLAG_OPT_FLAG = 358
   };
#endif
/* Tokens.  */
#define TK_LABEL 258
#define TK_DOTDOT 259
#define TK_ENDM 260
#define TK_NL 261
#define TK_HLL 262
#define TK_HLL_MAP 263
#define TK_EMIT 264
#define TK_EOM 265
#define TK_N_OPERATORS 266
#define TK_PRAGMA 267
#define TK_LOADLIB 268
#define TK_SUB 269
#define TK_END 270
#define TK_PARAM 271
#define TK_LEX 272
#define TK_LOCAL 273
#define TK_NAMESPACE 274
#define TK_ENDNAMESPACE 275
#define TK_INVOCANT 276
#define TK_METH_CALL 277
#define TK_GLOBALCONST 278
#define TK_CONST 279
#define TK_RETURN 280
#define TK_YIELD 281
#define TK_PCC_BEGIN_YIELD 282
#define TK_PCC_END_YIELD 283
#define TK_PCC_BEGIN_RETURN 284
#define TK_PCC_END_RETURN 285
#define TK_PCC_BEGIN 286
#define TK_PCC_END 287
#define TK_GET_RESULTS 288
#define TK_PCC_CALL 289
#define TK_ARG 290
#define TK_RESULT 291
#define TK_NCI_CALL 292
#define TK_IDENT 293
#define TK_STRINGC 294
#define TK_INTC 295
#define TK_NUMC 296
#define TK_PASM_PREG 297
#define TK_PASM_NREG 298
#define TK_PASM_SREG 299
#define TK_PASM_IREG 300
#define TK_SYM_PREG 301
#define TK_SYM_NREG 302
#define TK_SYM_SREG 303
#define TK_SYM_IREG 304
#define TK_PARROT_OP 305
#define TK_INT 306
#define TK_NUM 307
#define TK_PMC 308
#define TK_STRING 309
#define TK_IF 310
#define TK_UNLESS 311
#define TK_GOTO 312
#define TK_ARROW 313
#define TK_NE 314
#define TK_EQ 315
#define TK_LT 316
#define TK_LE 317
#define TK_GT 318
#define TK_GE 319
#define TK_USHIFT 320
#define TK_RSHIFT 321
#define TK_LSHIFT 322
#define TK_FDIV 323
#define TK_OR 324
#define TK_AND 325
#define TK_XOR 326
#define TK_CONC 327
#define TK_ASSIGN_USHIFT 328
#define TK_ASSIGN_RSHIFT 329
#define TK_ASSIGN_LSHIFT 330
#define TK_ASSIGN_INC 331
#define TK_ASSIGN_DEC 332
#define TK_ASSIGN_MUL 333
#define TK_ASSIGN_MOD 334
#define TK_ASSIGN_POW 335
#define TK_ASSIGN_DIV 336
#define TK_ASSIGN_BOR 337
#define TK_ASSIGN_BAND 338
#define TK_ASSIGN_FDIV 339
#define TK_ASSIGN_BNOT 340
#define TK_ASSIGN_CONC 341
#define TK_FLAG_INIT 342
#define TK_FLAG_LOAD 343
#define TK_FLAG_MAIN 344
#define TK_FLAG_ANON 345
#define TK_FLAG_METHOD 346
#define TK_FLAG_OUTER 347
#define TK_FLAG_VTABLE 348
#define TK_FLAG_LEX 349
#define TK_FLAG_MULTI 350
#define TK_FLAG_POSTCOMP 351
#define TK_FLAG_IMMEDIATE 352
#define TK_FLAG_UNIQUE_REG 353
#define TK_FLAG_NAMED 354
#define TK_FLAG_SLURPY 355
#define TK_FLAG_FLAT 356
#define TK_FLAG_OPTIONAL 357
#define TK_FLAG_OPT_FLAG 358




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 187 "pir.y"
{
    double dval;
    int    ival;
    char  *sval;
}
/* Line 1489 of yacc.c.  */
#line 261 "pirparser.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



