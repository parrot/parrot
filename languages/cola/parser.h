/* A Bison parser, made by GNU Bison 1.875c.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003 Free Software Foundation, Inc.

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ASM = 258,
     ABSTRACT = 259,
     BOOL = 260,
     BREAK = 261,
     BYTE = 262,
     CHAR = 263,
     CLASS = 264,
     CONST = 265,
     CONTINUE = 266,
     DOUBLE = 267,
     DECIMAL = 268,
     ELSE = 269,
     EXTERN = 270,
     FALSE = 271,
     FLOAT = 272,
     FOR = 273,
     GET = 274,
     GOTO = 275,
     IF = 276,
     INT = 277,
     INTERNAL = 278,
     LONG = 279,
     METHOD = 280,
     MODIFIER = 281,
     NEW = 282,
     NAMESPACE = 283,
     NULLVAL = 284,
     OUT = 285,
     OVERRIDE = 286,
     OBJECT = 287,
     PRIVATE = 288,
     PROTECTED = 289,
     PUBLIC = 290,
     REF = 291,
     READONLY = 292,
     RETURN = 293,
     SBYTE = 294,
     SET = 295,
     SHORT = 296,
     STRING = 297,
     STATIC = 298,
     THIS = 299,
     TRUE = 300,
     TYPE = 301,
     UINT = 302,
     USHORT = 303,
     ULONG = 304,
     USING = 305,
     VIRTUAL = 306,
     VOID = 307,
     WHILE = 308,
     IDENTIFIER = 309,
     LITERAL = 310,
     RANKSPEC = 311,
     INC = 312,
     DEC = 313,
     LOGICAL_AND = 314,
     LOGICAL_OR = 315,
     LOGICAL_EQ = 316,
     LOGICAL_NE = 317,
     LOGICAL_LTE = 318,
     LOGICAL_GTE = 319,
     LEFT_SHIFT = 320,
     RIGHT_SHIFT = 321,
     INDEX = 322,
     UMINUS = 323
   };
#endif
#define ASM 258
#define ABSTRACT 259
#define BOOL 260
#define BREAK 261
#define BYTE 262
#define CHAR 263
#define CLASS 264
#define CONST 265
#define CONTINUE 266
#define DOUBLE 267
#define DECIMAL 268
#define ELSE 269
#define EXTERN 270
#define FALSE 271
#define FLOAT 272
#define FOR 273
#define GET 274
#define GOTO 275
#define IF 276
#define INT 277
#define INTERNAL 278
#define LONG 279
#define METHOD 280
#define MODIFIER 281
#define NEW 282
#define NAMESPACE 283
#define NULLVAL 284
#define OUT 285
#define OVERRIDE 286
#define OBJECT 287
#define PRIVATE 288
#define PROTECTED 289
#define PUBLIC 290
#define REF 291
#define READONLY 292
#define RETURN 293
#define SBYTE 294
#define SET 295
#define SHORT 296
#define STRING 297
#define STATIC 298
#define THIS 299
#define TRUE 300
#define TYPE 301
#define UINT 302
#define USHORT 303
#define ULONG 304
#define USING 305
#define VIRTUAL 306
#define VOID 307
#define WHILE 308
#define IDENTIFIER 309
#define LITERAL 310
#define RANKSPEC 311
#define INC 312
#define DEC 313
#define LOGICAL_AND 314
#define LOGICAL_OR 315
#define LOGICAL_EQ 316
#define LOGICAL_NE 317
#define LOGICAL_LTE 318
#define LOGICAL_GTE 319
#define LEFT_SHIFT 320
#define RIGHT_SHIFT 321
#define INDEX 322
#define UMINUS 323




#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 34 "cola.y"
typedef union YYSTYPE {
    int ival;
    Symbol * sym;
    Type * type;
    AST * ast;
    void * p;
} YYSTYPE;
/* Line 1275 of yacc.c.  */
#line 181 "parser.h"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;



