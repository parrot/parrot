/* A Bison parser, made from ast/ast.y, by GNU bison 1.75.  */

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

#ifndef BISON_AST_ASTPARSER_H
# define BISON_AST_ASTPARSER_H

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     STRINGC = 258,
     INTC = 259,
     FLOATC = 260,
     USTRINGC = 261,
     NAME = 262,
     IDENTIFIER = 263,
     MODULE = 264,
     FUNCTION = 265
   };
#endif
#define STRINGC 258
#define INTC 259
#define FLOATC 260
#define USTRINGC 261
#define NAME 262
#define IDENTIFIER 263
#define MODULE 264
#define FUNCTION 265




#ifndef YYSTYPE
#line 43 "ast/ast.y"
typedef union {
    int t;
    char *s;
    struct nodeType_t *n;
} yystype;
/* Line 1281 of /usr/share/bison/yacc.c.  */
#line 66 "ast/astparser.h"
# define YYSTYPE yystype
#endif



#ifndef YYLTYPE
typedef struct yyltype
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} yyltype;
# define YYLTYPE yyltype
#endif



#endif /* not BISON_AST_ASTPARSER_H */

