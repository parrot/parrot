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
     TK_MACRO = 258,
     TK_NL = 259,
     TK_ENDM = 260,
     TK_INCLUDE = 261,
     TK_MACRO_CONST = 262,
     TK_MACRO_LOCAL = 263,
     TK_LINE = 264,
     TK_LABEL = 265,
     TK_INT = 266,
     TK_NUM = 267,
     TK_STRING = 268,
     TK_PMC = 269,
     TK_IDENT = 270,
     TK_ANY = 271,
     TK_BODY = 272,
     TK_DOT_IDENT = 273,
     TK_MACROVAR_EXP = 274,
     TK_LABEL_ID = 275,
     TK_LOCAL_ID = 276,
     TK_LABEL_EXPANSION = 277,
     TK_LABEL_TARGET_EXPANSION = 278,
     TK_STRINGC = 279,
     TK_NUMC = 280,
     TK_INTC = 281
   };
#endif
/* Tokens.  */
#define TK_MACRO 258
#define TK_NL 259
#define TK_ENDM 260
#define TK_INCLUDE 261
#define TK_MACRO_CONST 262
#define TK_MACRO_LOCAL 263
#define TK_LINE 264
#define TK_LABEL 265
#define TK_INT 266
#define TK_NUM 267
#define TK_STRING 268
#define TK_PMC 269
#define TK_IDENT 270
#define TK_ANY 271
#define TK_BODY 272
#define TK_DOT_IDENT 273
#define TK_MACROVAR_EXP 274
#define TK_LABEL_ID 275
#define TK_LOCAL_ID 276
#define TK_LABEL_EXPANSION 277
#define TK_LABEL_TARGET_EXPANSION 278
#define TK_STRINGC 279
#define TK_NUMC 280
#define TK_INTC 281




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 63 "macro.y"
{
    char  *sval;
    struct list *lval;
    struct macro_def *mval;

}
/* Line 1489 of yacc.c.  */
#line 108 "macroparser.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



