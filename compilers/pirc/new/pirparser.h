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
     TK_NL = 258,
     TK_HLL = 259,
     TK_HLL_MAP = 260,
     TK_LOADLIB = 261,
     TK_SUB = 262,
     TK_END = 263,
     TK_PARAM = 264,
     TK_LEX = 265,
     TK_LOCAL = 266,
     TK_NAMESPACE = 267,
     TK_INVOCANT = 268,
     TK_METH_CALL = 269,
     TK_GLOBALCONST = 270,
     TK_CONST = 271,
     TK_RETURN = 272,
     TK_YIELD = 273,
     TK_BEGIN_YIELD = 274,
     TK_END_YIELD = 275,
     TK_BEGIN_RETURN = 276,
     TK_END_RETURN = 277,
     TK_BEGIN_CALL = 278,
     TK_END_CALL = 279,
     TK_GET_RESULTS = 280,
     TK_CALL = 281,
     TK_ARG = 282,
     TK_RESULT = 283,
     TK_NCI_CALL = 284,
     TK_LABEL = 285,
     TK_IDENT = 286,
     TK_INT = 287,
     TK_NUM = 288,
     TK_PMC = 289,
     TK_STRING = 290,
     TK_IF = 291,
     TK_UNLESS = 292,
     TK_NULL = 293,
     TK_GOTO = 294,
     TK_STRINGC = 295,
     TK_INTC = 296,
     TK_NUMC = 297,
     TK_PREG = 298,
     TK_NREG = 299,
     TK_SREG = 300,
     TK_IREG = 301,
     TK_ARROW = 302,
     TK_NE = 303,
     TK_EQ = 304,
     TK_LT = 305,
     TK_LE = 306,
     TK_GT = 307,
     TK_GE = 308,
     TK_USHIFT = 309,
     TK_RSHIFT = 310,
     TK_LSHIFT = 311,
     TK_FDIV = 312,
     TK_OR = 313,
     TK_AND = 314,
     TK_XOR = 315,
     TK_CONC = 316,
     TK_ASSIGN_USHIFT = 317,
     TK_ASSIGN_RSHIFT = 318,
     TK_ASSIGN_LSHIFT = 319,
     TK_ASSIGN_INC = 320,
     TK_ASSIGN_DEC = 321,
     TK_ASSIGN_MUL = 322,
     TK_ASSIGN_MOD = 323,
     TK_ASSIGN_POW = 324,
     TK_ASSIGN_DIV = 325,
     TK_ASSIGN_BOR = 326,
     TK_ASSIGN_BAND = 327,
     TK_ASSIGN_FDIV = 328,
     TK_ASSIGN_BNOT = 329,
     TK_ASSIGN_CONC = 330,
     TK_FLAG_INIT = 331,
     TK_FLAG_LOAD = 332,
     TK_FLAG_MAIN = 333,
     TK_FLAG_ANON = 334,
     TK_FLAG_METHOD = 335,
     TK_FLAG_OUTER = 336,
     TK_FLAG_VTABLE = 337,
     TK_FLAG_LEX = 338,
     TK_FLAG_MULTI = 339,
     TK_FLAG_POSTCOMP = 340,
     TK_FLAG_IMMEDIATE = 341,
     TK_FLAG_LEXID = 342,
     TK_INSTANCEOF = 343,
     TK_FLAG_UNIQUE_REG = 344,
     TK_FLAG_NAMED = 345,
     TK_FLAG_SLURPY = 346,
     TK_FLAG_FLAT = 347,
     TK_FLAG_OPTIONAL = 348,
     TK_FLAG_OPT_FLAG = 349,
     TK_FLAG_INVOCANT = 350
   };
#endif
/* Tokens.  */
#define TK_NL 258
#define TK_HLL 259
#define TK_HLL_MAP 260
#define TK_LOADLIB 261
#define TK_SUB 262
#define TK_END 263
#define TK_PARAM 264
#define TK_LEX 265
#define TK_LOCAL 266
#define TK_NAMESPACE 267
#define TK_INVOCANT 268
#define TK_METH_CALL 269
#define TK_GLOBALCONST 270
#define TK_CONST 271
#define TK_RETURN 272
#define TK_YIELD 273
#define TK_BEGIN_YIELD 274
#define TK_END_YIELD 275
#define TK_BEGIN_RETURN 276
#define TK_END_RETURN 277
#define TK_BEGIN_CALL 278
#define TK_END_CALL 279
#define TK_GET_RESULTS 280
#define TK_CALL 281
#define TK_ARG 282
#define TK_RESULT 283
#define TK_NCI_CALL 284
#define TK_LABEL 285
#define TK_IDENT 286
#define TK_INT 287
#define TK_NUM 288
#define TK_PMC 289
#define TK_STRING 290
#define TK_IF 291
#define TK_UNLESS 292
#define TK_NULL 293
#define TK_GOTO 294
#define TK_STRINGC 295
#define TK_INTC 296
#define TK_NUMC 297
#define TK_PREG 298
#define TK_NREG 299
#define TK_SREG 300
#define TK_IREG 301
#define TK_ARROW 302
#define TK_NE 303
#define TK_EQ 304
#define TK_LT 305
#define TK_LE 306
#define TK_GT 307
#define TK_GE 308
#define TK_USHIFT 309
#define TK_RSHIFT 310
#define TK_LSHIFT 311
#define TK_FDIV 312
#define TK_OR 313
#define TK_AND 314
#define TK_XOR 315
#define TK_CONC 316
#define TK_ASSIGN_USHIFT 317
#define TK_ASSIGN_RSHIFT 318
#define TK_ASSIGN_LSHIFT 319
#define TK_ASSIGN_INC 320
#define TK_ASSIGN_DEC 321
#define TK_ASSIGN_MUL 322
#define TK_ASSIGN_MOD 323
#define TK_ASSIGN_POW 324
#define TK_ASSIGN_DIV 325
#define TK_ASSIGN_BOR 326
#define TK_ASSIGN_BAND 327
#define TK_ASSIGN_FDIV 328
#define TK_ASSIGN_BNOT 329
#define TK_ASSIGN_CONC 330
#define TK_FLAG_INIT 331
#define TK_FLAG_LOAD 332
#define TK_FLAG_MAIN 333
#define TK_FLAG_ANON 334
#define TK_FLAG_METHOD 335
#define TK_FLAG_OUTER 336
#define TK_FLAG_VTABLE 337
#define TK_FLAG_LEX 338
#define TK_FLAG_MULTI 339
#define TK_FLAG_POSTCOMP 340
#define TK_FLAG_IMMEDIATE 341
#define TK_FLAG_LEXID 342
#define TK_INSTANCEOF 343
#define TK_FLAG_UNIQUE_REG 344
#define TK_FLAG_NAMED 345
#define TK_FLAG_SLURPY 346
#define TK_FLAG_FLAT 347
#define TK_FLAG_OPTIONAL 348
#define TK_FLAG_OPT_FLAG 349
#define TK_FLAG_INVOCANT 350




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 176 "pir.y"
{
    double              dval;
    int                 ival;
    char               *sval;
    struct constant    *cval;
    struct instruction *instr;
    struct expression  *expr;
    struct target      *targ;
    struct argument    *argm;
    struct invocation  *invo;
    struct key         *key;
    struct symbol      *symb;
}
/* Line 1489 of yacc.c.  */
#line 253 "pirparser.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



