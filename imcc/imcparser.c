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

/* Written by Richard Stallman by simplifying the original so called
   ``semantic'' parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON	1

/* Pure parsers.  */
#define YYPURE	1

/* Using locations.  */
#define YYLSP_NEEDED 0



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
     SHIFT_LEFT = 278,
     SHIFT_RIGHT = 279,
     INTV = 280,
     FLOATV = 281,
     STRINGV = 282,
     DEFINED = 283,
     LOG_XOR = 284,
     RELOP_EQ = 285,
     RELOP_NE = 286,
     RELOP_GT = 287,
     RELOP_GTE = 288,
     RELOP_LT = 289,
     RELOP_LTE = 290,
     GLOBAL = 291,
     ADDR = 292,
     CLONE = 293,
     RESULT = 294,
     RETURN = 295,
     POW = 296,
     SHIFT_RIGHT_U = 297,
     LOG_AND = 298,
     LOG_OR = 299,
     COMMA = 300,
     ESUB = 301,
     PCC_BEGIN = 302,
     PCC_END = 303,
     PCC_CALL = 304,
     PCC_SUB = 305,
     PCC_BEGIN_RETURN = 306,
     PCC_END_RETURN = 307,
     PCC_BEGIN_YIELD = 308,
     PCC_END_YIELD = 309,
     PROTOTYPED = 310,
     NON_PROTOTYPED = 311,
     LABEL = 312,
     EMIT = 313,
     EOM = 314,
     IREG = 315,
     NREG = 316,
     SREG = 317,
     PREG = 318,
     IDENTIFIER = 319,
     STRINGC = 320,
     INTC = 321,
     FLOATC = 322,
     REG = 323,
     MACRO = 324,
     ENDM = 325,
     PARROT_OP = 326,
     VAR = 327
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
#define SHIFT_LEFT 278
#define SHIFT_RIGHT 279
#define INTV 280
#define FLOATV 281
#define STRINGV 282
#define DEFINED 283
#define LOG_XOR 284
#define RELOP_EQ 285
#define RELOP_NE 286
#define RELOP_GT 287
#define RELOP_GTE 288
#define RELOP_LT 289
#define RELOP_LTE 290
#define GLOBAL 291
#define ADDR 292
#define CLONE 293
#define RESULT 294
#define RETURN 295
#define POW 296
#define SHIFT_RIGHT_U 297
#define LOG_AND 298
#define LOG_OR 299
#define COMMA 300
#define ESUB 301
#define PCC_BEGIN 302
#define PCC_END 303
#define PCC_CALL 304
#define PCC_SUB 305
#define PCC_BEGIN_RETURN 306
#define PCC_END_RETURN 307
#define PCC_BEGIN_YIELD 308
#define PCC_END_YIELD 309
#define PROTOTYPED 310
#define NON_PROTOTYPED 311
#define LABEL 312
#define EMIT 313
#define EOM 314
#define IREG 315
#define NREG 316
#define SREG 317
#define PREG 318
#define IDENTIFIER 319
#define STRINGC 320
#define INTC 321
#define FLOATC 322
#define REG 323
#define MACRO 324
#define ENDM 325
#define PARROT_OP 326
#define VAR 327




/* Copy the first part of user declarations.  */
#line 1 "imcc.y"

/*
 * imcc.y
 *
 * Intermediate Code Compiler for Parrot.
 *
 * Copyright (C) 2002 Melvin Smith <melvin.smith@mindspring.com>
 *
 * Grammar for the parser.
 *
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define _PARSER
#define MAIN
#include "imc.h"
#include "pbc.h"
#include "parser.h"

#define YYDEBUG 1
#define YYERROR_VERBOSE 1

/*
 * we use a pure parser wtih the interpreter as a parameter
 * this still doesn't make the parser reentrant, there are too
 * many globals around.
 * These globals should go into one structure, which could be
 * attached to the interpreter
 */

#define YYPARSE_PARAM interp
#define YYLEX_PARAM interp
/*
 * Choosing instructions for Parrot is pretty easy since
 * many are polymorphic.
 */


static SymReg *keys[IMCC_MAX_REGS];
static int nkeys = 0;

static SymReg ** RR(int n, ...)
{
    va_list ap;
    int i = 0;

    va_start(ap, n);
    while (n--) {
	regs[i++] = va_arg(ap, SymReg *);
    }
    va_end(ap);
    while (i < IMCC_MAX_REGS)
	regs[i++] = 0;
    return regs;
}

/* macros for registers */
#define R0() 		RR(nargs=0)
#define R1(r0) 		RR(nargs=1,r0)
#define R2(r0,r1) 	RR(nargs=2,r0,r1)
#define R3(r0,r1,r2) 	RR(nargs=3,r0,r1,r2)
#define R4(r0,r1,r2,r3) RR(nargs=4,r0,r1,r2,r3)


/*
 * MK_I: build and emitb instruction by iANY
 *
 * fmt may contain:
 *   op %s, %s # comment
 * or just
 *   op
 *
 */
static
Instruction *
MK_I(struct Parrot_Interp *interpreter, const char * fmt, SymReg ** r)
{
    char opname[64];
    char *p;
    const char *q;
    for (p = opname, q = fmt; *q && *q != ' '; )
	*p++ = *q++;
    *p = 0;
    if (!*q)
	fmt = 0;
    else
	fmt = ++q;
#if OPDEBUG
    fprintf(stderr, "op '%s' format '%s' (%d)\n", opname, fmt?:"",nargs);
#endif
    return iANY(interpreter, opname, fmt, r, 1);
}

/*
 * special instructions
 *
 * labels and such
 */


static void clear_state(void)
{
    nargs = 0;
    keyvec = 0;
    memset(regs, 0, sizeof(regs));
}


Instruction * INS_LABEL(SymReg * r0, int emit)
{
    Instruction *i = _mk_instruction("","%s:", R1(r0), 0);
    i->type = ITLABEL;
    r0->first_ins = i;
    if (emit)
        emitb(i);
    return i;
}

static Instruction * iLABEL(SymReg * r0) {
    Instruction *i = INS_LABEL(r0, 1);
    i->line = line;
    clear_state();
    return i;
}


static Instruction * iSUBROUTINE(SymReg * r0) {
    Instruction *i;
    function = r0->name;
    i =  iLABEL(r0);
    i->line = line - 1;
    if (*r0->name != '_')
        fataly(EX_SOFTWARE, "iSUBROUTINE", line,
        "illegal local label '%s'\n", r0->name);
    return i;
}


/*
 * substr or X = Pkey
 */
static Instruction *
iINDEXFETCH(struct Parrot_Interp *interp, SymReg * r0, SymReg * r1,
    SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        SymReg * r3 = mk_const(str_dup("1"), 'I');
        return MK_I(interp, "substr %s, %s, %s, 1", R4(r0, r1, r2, r3));
    }
    keyvec |= KEY_BIT(2);
    return MK_I(interp, "set %s, %s[%s]", R3(r0,r1,r2));
}

/*
 * substr or Pkey = X
 */

static Instruction *
iINDEXSET(struct Parrot_Interp *interp, SymReg * r0, SymReg * r1, SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'I' && r2->set == 'S') {
        SymReg * r3 = mk_const(str_dup("1"), 'I');
        MK_I(interp, "substr %s, %s, %s, %s", R4(r0, r1,r3, r2));
    }
    else if (r0->set == 'P') {
        keyvec |= KEY_BIT(1);
	MK_I(interp, "set %s[%s], %s", R3(r0,r1,r2));
    }
    else {
        fataly(EX_SOFTWARE, "iINDEXSET", line,"unsupported indexed set op\n");
    }
    return 0;
}

static Instruction *
multi_keyed(struct Parrot_Interp *interpreter,char *name,
SymReg ** r, int nr, int emit)
{
    int i, keyf, kv, n;
    char buf[16];
    static int p = 0;
    SymReg *preg[IMCC_MAX_REGS];    /* px,py,pz */
    SymReg *nreg[IMCC_MAX_REGS];
    Instruction *ins = 0;

    /* count keys in keyvec */
    kv = keyvec;
    for (i = keyf = 0; i < nr; i++, kv >>= 1)
        if (kv & 1)
            keyf++;
    if (keyf <= 1)
        return 0;
    /* XXX what to do, if we don't emit instruction? */
    assert(emit);
    /* OP  _p_k    _p_k_p_k =>
     * set      py, p_k
     * set      pz,     p_k
     * new px, .PerlUndef
     * OP  px, py, pz
     * set _p_k_px
     */

    kv = keyvec;
    for (i = n = 0; i < nr; i++, kv >>= 1, n++) {
        if (kv & 1) {
            fataly(EX_SOFTWARE, "multi_keyed", line,"illegal key operand\n");
        }
        /* make a new P symbol */
        while (1) {
            sprintf(buf, "$P%d", ++p);
            if (get_sym(buf) == 0)
                break;
        }
        preg[n] = mk_symreg(str_dup(buf), 'P');
        kv >>= 1;
        if (kv & 1) {
            /* we have a keyed operand */
            if (r[i]->set != 'P') {
                fataly(EX_SOFTWARE, "multi_keyed", line,"not an aggregate\n");
            }
            nargs = 3;
            /* don't emit LHS yet */
            if (i == 0) {
                keyvec = 1 << 1;
                nreg[0] = r[i];
                nreg[1] = r[i+1];
                nreg[2] = preg[n];
                /* set p_k px */
                ins = iANY(interpreter, str_dup("set"), 0, nreg, 0);
            }
            else {
                keyvec = 1 << 2;
                nreg[0] = preg[n];
                nreg[1] = r[i];
                nreg[2] = r[i+1];
                /* set py|z p_k */
                iANY(interpreter, str_dup("set"), 0, nreg, 1);
            }
            i++;
        }
        /* non keyed */
        else {
            nargs = 2;
            keyvec = 0;
            if (i == 0) {
                nreg[0] = r[i];
                nreg[1] = preg[n];
                /* set n, px */
                ins = iANY(interpreter, str_dup("set"), 0, nreg, 0);
            }
            else {
                nreg[0] = preg[n];
                nreg[1] = r[i];
                /* set px, n */
                iANY(interpreter, str_dup("set"), 0, nreg, 1);
            }
        }
    }
    /* make a new undef */
    iNEW(interpreter, preg[0], str_dup("PerlUndef"), NULL, 1);
    /* emit the operand */
    nargs = 3;
    keyvec = 0;
    iANY(interpreter, name, 0, preg, 1);
    /* emit the LHS op */
    emitb(ins);
    return ins;
}

Instruction *
iANY(struct Parrot_Interp *interpreter, char * name,
    const char *fmt, SymReg **r, int emit)
{
    char fullname[64];
    int i;
    int dirs = 0;
    int op;
    Instruction * ins;

#if 1
    ins = multi_keyed(interpreter, name, r, nargs, emit);
    if (ins)
        return ins;
#endif
    op_fullname(fullname, name, r, nargs);
    op = interpreter->op_lib->op_code(fullname, 1);
    if (op < 0)         /* maybe we got a fullname */
        op = interpreter->op_lib->op_code(name, 1);
    if (op >= 0) {
        op_info_t * op_info = &interpreter->op_info_table[op];
	char format[128];
	int len;

        *format = '\0';
        /* info->arg_count is offset by one, first is opcode
         * build instruction format
         * set LV_in / out flags */
        for (i = 0; i < op_info->arg_count-1; i++) {
            switch (op_info->dirs[i+1]) {
                case PARROT_ARGDIR_INOUT:
                    dirs |= 1 << (16 + i);
                    /* goon */
                case PARROT_ARGDIR_IN:
                    dirs |= 1 << i ;
                    break;

                case PARROT_ARGDIR_OUT:
                    dirs |= 1 << (16 + i);
                    break;

                default:
                    assert(0);
            };
            if (keyvec & KEY_BIT(i)) {
                len = strlen(format);
                len -= 2;
                format[len] = '\0';
                strcat(format, "[%s], ");
	}
            else
                strcat(format, "%s, ");
	}
	len = strlen(format);
	if (len >= 2)
	    len -= 2;
	format[len] = '\0';
        if (fmt && *fmt)
            strcpy(format, fmt);
        memset(r + nargs, 0, sizeof(*r) * (IMCC_MAX_REGS - nargs));
#if 1
        debug(DEBUG_PARSER,"%s %s\t%s\n", name, format, fullname);
#endif
        /* make the instruction */

        ins = _mk_instruction(name, format, r, dirs);
        ins->keys |= keyvec;
        /* fill iin oplib's info */
        ins->opnum = op;
        ins->opsize = op_info->arg_count;
        /* mark end as absolute branch */
        if (!strcmp(name, "end")) {
            ins->type |= ITBRANCH | IF_goto;
        }
        /* set up branch flags */
        if (op_info->jump) {

            /* XXX: assume the jump is relative and to the last arg.
             * usually true.
             */
            if (op_info->jump & PARROT_JUMP_RESTART)
                ins->type = ITBRANCH;
            else
                ins->type = ITBRANCH | (1 << (nargs-1));
            if (!strcmp(name, "branch"))
                ins->type |= IF_goto;
            if (!strcmp(fullname, "jump_i") ||
                    !strcmp(fullname, "jsr_i") ||
                    !strcmp(fullname, "branch_i") ||
                    !strcmp(fullname, "bsr_i"))
                dont_optimize = 1;
        }
        else if (!strcmp(name, "set") && nargs == 2) {
            /* set Px, Py: both PMCs have the same address */
            if (r[0]->set == 'P' && r[1]->set == 'P')
                ins->type |= ITALIAS;
        }
        else if (!strcmp(name, "set_addr")) {
            /* mark this as branch, because it needs fixup */
            ins->type = ITADDR | IF_r1_branch | ITBRANCH;
        }
        else if (!strcmp(name, "newsub")) {
            if (ins->opsize == 4)
                ins->type = ITADDR | IF_r2_branch | ITBRANCH;
            else
                ins->type = ITADDR | IF_r2_branch | IF_r3_branch | ITBRANCH;
        }
        else if (!strcmp(name, "compile"))
            ++has_compile;

        if (emit)
             emitb(ins);
    } else {
        fataly(EX_SOFTWARE, "iANY", line,"op not found '%s' (%s<%d>)\n",
                fullname, name, nargs);
    }
    return ins;
}



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

#ifndef YYSTYPE
#line 395 "imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 618 "imcparser.c"
# define YYSTYPE yystype
# define YYSTYPE_IS_TRIVIAL 1
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
# define YYLTYPE_IS_TRIVIAL 1
#endif

/* Copy the second part of user declarations.  */


/* Line 213 of /usr/share/bison/yacc.c.  */
#line 639 "imcparser.c"

#if ! defined (yyoverflow) || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# if YYSTACK_USE_ALLOCA
#  define YYSTACK_ALLOC alloca
# else
#  ifndef YYSTACK_USE_ALLOCA
#   if defined (alloca) || defined (_ALLOCA_H)
#    define YYSTACK_ALLOC alloca
#   else
#    ifdef __GNUC__
#     define YYSTACK_ALLOC __builtin_alloca
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning. */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
# else
#  if defined (__STDC__) || defined (__cplusplus)
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   define YYSIZE_T size_t
#  endif
#  define YYSTACK_ALLOC malloc
#  define YYSTACK_FREE free
# endif
#endif /* ! defined (yyoverflow) || YYERROR_VERBOSE */


#if (! defined (yyoverflow) \
     && (! defined (__cplusplus) \
	 || (YYLTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAX (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE))				\
      + YYSTACK_GAP_MAX)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  register YYSIZE_T yyi;		\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];	\
	}					\
      while (0)
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAX;	\
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (0)

#endif

#if defined (__STDC__) || defined (__cplusplus)
   typedef signed char yysigned_char;
#else
   typedef short yysigned_char;
#endif

/* YYFINAL -- State number of the termination state. */
#define YYFINAL  3
#define YYLAST   310

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  88
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  70
/* YYNRULES -- Number of rules. */
#define YYNRULES  177
/* YYNRULES -- Number of states. */
#define YYNSTATES  307

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   327

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      73,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    75,     2,     2,     2,    81,    83,     2,
       2,     2,    79,    78,     2,    76,    82,    80,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    87,
       2,    74,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    85,     2,    86,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    84,     2,    77,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     4,     7,     9,    12,    16,    19,    20,
      24,    25,    27,    28,    33,    36,    39,    41,    43,    45,
      46,    51,    52,    53,    62,    63,    66,    70,    71,    76,
      77,    89,    91,    93,    94,    96,   102,   106,   107,   110,
     114,   117,   118,   121,   125,   128,   129,   134,   135,   142,
     143,   150,   151,   154,   158,   161,   163,   166,   167,   170,
     173,   175,   177,   179,   180,   182,   185,   187,   189,   193,
     195,   197,   199,   202,   205,   206,   211,   212,   219,   220,
     225,   228,   231,   234,   237,   240,   243,   246,   249,   251,
     253,   255,   258,   259,   261,   263,   265,   267,   269,   273,
     278,   283,   288,   294,   300,   306,   312,   318,   324,   330,
     336,   342,   348,   354,   360,   366,   372,   378,   384,   391,
     398,   405,   410,   415,   423,   428,   433,   438,   443,   444,
     448,   453,   461,   466,   473,   478,   483,   488,   493,   495,
     497,   499,   501,   503,   505,   507,   509,   511,   513,   514,
     516,   520,   522,   524,   529,   531,   533,   535,   537,   539,
     541,   543,   544,   547,   549,   553,   555,   557,   559,   561,
     563,   565,   567,   569,   571,   573,   575,   577
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      89,     0,    -1,    -1,    90,   125,    -1,    92,    -1,    91,
      92,    -1,   128,    93,    73,    -1,    69,    73,    -1,    -1,
      94,    71,    95,    -1,    -1,   144,    -1,    -1,    58,    97,
      91,    59,    -1,   101,    99,    -1,   125,    46,    -1,    98,
      -1,   103,    -1,    96,    -1,    -1,    12,   102,    64,    73,
      -1,    -1,    -1,    50,   104,    64,   112,    73,   105,   106,
      99,    -1,    -1,   107,    73,    -1,   106,   107,    73,    -1,
      -1,    20,   108,   136,    64,    -1,    -1,    47,   111,    73,
     110,   114,   113,   130,    73,   116,    48,    73,    -1,    55,
      -1,    56,    -1,    -1,   111,    -1,    49,   149,    45,   149,
      73,    -1,    49,   149,    73,    -1,    -1,   115,    73,    -1,
     114,   115,    73,    -1,     5,   149,    -1,    -1,   117,    73,
      -1,   116,   117,    73,    -1,    39,   149,    -1,    -1,    18,
     118,   136,    64,    -1,    -1,    51,    73,   120,   123,    52,
      73,    -1,    -1,    53,    73,   122,   123,    54,    73,    -1,
      -1,   123,    73,    -1,   123,   124,    73,    -1,    40,   149,
      -1,   126,    -1,   125,   126,    -1,    -1,   127,   131,    -1,
      69,    73,    -1,   109,    -1,   119,    -1,   121,    -1,    -1,
     129,    -1,   129,   130,    -1,   130,    -1,    57,    -1,   128,
     132,    73,    -1,   100,    -1,   138,    -1,   140,    -1,    13,
      64,    -1,    14,    64,    -1,    -1,    18,   133,   136,    64,
      -1,    -1,    19,   134,   136,    64,    74,   156,    -1,    -1,
      20,   135,   136,    64,    -1,    20,   155,    -1,    39,   149,
      -1,     5,   149,    -1,    40,   149,    -1,     3,   147,    -1,
       4,   147,    -1,    21,   149,    -1,    22,   149,    -1,    10,
      -1,    11,    -1,     9,    -1,    71,   144,    -1,    -1,    25,
      -1,    26,    -1,    27,    -1,   137,    -1,    64,    -1,   142,
      74,   149,    -1,   142,    74,    75,   149,    -1,   142,    74,
      76,   149,    -1,   142,    74,    77,   149,    -1,   142,    74,
     149,    78,   149,    -1,   142,    74,   149,    76,   149,    -1,
     142,    74,   149,    79,   149,    -1,   142,    74,   149,    41,
     149,    -1,   142,    74,   149,    80,   149,    -1,   142,    74,
     149,    81,   149,    -1,   142,    74,   149,    82,   149,    -1,
     142,    74,   149,    23,   149,    -1,   142,    74,   149,    24,
     149,    -1,   142,    74,   149,    42,   149,    -1,   142,    74,
     149,    43,   149,    -1,   142,    74,   149,    44,   149,    -1,
     142,    74,   149,    29,   149,    -1,   142,    74,   149,    83,
     149,    -1,   142,    74,   149,    84,   149,    -1,   142,    74,
     149,    77,   149,    -1,   142,    74,   149,    85,   150,    86,
      -1,   149,    85,   150,    86,    74,   149,    -1,   142,    74,
       8,   137,    45,   149,    -1,   142,    74,     8,   137,    -1,
     142,    74,    28,   149,    -1,   142,    74,    28,   149,    85,
     150,    86,    -1,   142,    74,    38,   149,    -1,   142,    74,
      37,    64,    -1,   142,    74,    36,   157,    -1,    36,   157,
      74,   149,    -1,    -1,     8,   139,    95,    -1,    28,   142,
      45,   149,    -1,    28,   142,    45,   149,    85,   150,    86,
      -1,    38,   142,    45,   149,    -1,     6,   149,   141,   149,
       4,   147,    -1,     6,   149,     4,   147,    -1,     7,   149,
       4,   147,    -1,     6,   149,    45,   147,    -1,     7,   149,
      45,   147,    -1,    30,    -1,    31,    -1,    32,    -1,    33,
      -1,    34,    -1,    35,    -1,    72,    -1,   155,    -1,    72,
      -1,   155,    -1,    -1,   145,    -1,   145,    45,   146,    -1,
     146,    -1,   148,    -1,   143,    85,   150,    86,    -1,    64,
      -1,    71,    -1,    64,    -1,    71,    -1,   149,    -1,    72,
      -1,   154,    -1,    -1,   151,   152,    -1,   153,    -1,   152,
      87,   153,    -1,   149,    -1,   155,    -1,   156,    -1,    60,
      -1,    61,    -1,    62,    -1,    63,    -1,    68,    -1,    66,
      -1,    67,    -1,    65,    -1,    62,    -1,    65,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   438,   438,   438,   446,   447,   450,   451,   454,   454,
     456,   458,   463,   462,   471,   475,   484,   485,   486,   489,
     489,   495,   497,   495,   507,   508,   509,   512,   512,   516,
     516,   545,   546,   549,   550,   553,   557,   562,   563,   564,
     567,   570,   571,   572,   575,   576,   576,   579,   579,   595,
     595,   612,   613,   614,   617,   620,   621,   624,   624,   626,
     627,   628,   629,   632,   633,   636,   637,   640,   643,   645,
     647,   649,   650,   651,   652,   652,   653,   653,   655,   655,
     657,   658,   659,   660,   661,   662,   663,   664,   665,   666,
     667,   668,   669,   672,   674,   675,   676,   679,   683,   685,
     686,   687,   688,   689,   690,   691,   692,   693,   694,   695,
     696,   697,   698,   699,   700,   701,   702,   703,   704,   705,
     706,   707,   708,   709,   711,   713,   715,   716,   717,   717,
     719,   720,   722,   725,   727,   728,   729,   730,   734,   736,
     737,   738,   739,   740,   744,   745,   747,   748,   751,   752,
     755,   756,   759,   760,   764,   766,   768,   770,   771,   774,
     775,   778,   778,   782,   783,   786,   789,   790,   793,   794,
     795,   796,   797,   800,   801,   802,   805,   806
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "CALL", "GOTO", "ARG", "IF", "UNLESS", 
  "NEW", "END", "SAVEALL", "RESTOREALL", "SUB", "NAMESPACE", 
  "ENDNAMESPACE", "CLASS", "ENDCLASS", "SYM", "LOCAL", "CONST", "PARAM", 
  "INC", "DEC", "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", 
  "DEFINED", "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", 
  "RELOP_LT", "RELOP_LTE", "GLOBAL", "ADDR", "CLONE", "RESULT", "RETURN", 
  "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", 
  "PCC_BEGIN", "PCC_END", "PCC_CALL", "PCC_SUB", "PCC_BEGIN_RETURN", 
  "PCC_END_RETURN", "PCC_BEGIN_YIELD", "PCC_END_YIELD", "PROTOTYPED", 
  "NON_PROTOTYPED", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", 
  "PREG", "IDENTIFIER", "STRINGC", "INTC", "FLOATC", "REG", "MACRO", 
  "ENDM", "PARROT_OP", "VAR", "'\\n'", "'='", "'!'", "'-'", "'~'", "'+'", 
  "'*'", "'/'", "'%'", "'.'", "'&'", "'|'", "'['", "']'", "';'", 
  "$accept", "program", "@1", "pasmcode", "pasmline", "pasm_inst", "@2", 
  "pasm_args", "emit", "@3", "nsub", "sub_body", "sub", "sub_start", "@4", 
  "pcc_sub", "@5", "@6", "pcc_params", "pcc_param", "@7", "pcc_sub_call", 
  "@8", "pcc_proto", "pcc_sub_proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@9", "pcc_ret", "@10", "pcc_yield", "@11", 
  "pcc_returns", "pcc_return", "statements", "statement", "@12", "labels", 
  "_labels", "label", "instruction", "labeled_inst", "@13", "@14", "@15", 
  "type", "classname", "assignment", "@16", "if_statement", "relop", 
  "target", "lhs", "vars", "_vars", "_var_or_i", "label_op", "var_or_i", 
  "var", "keylist", "@17", "_keylist", "key", "rc", "reg", "const", 
  "string", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const unsigned short yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,    10,    61,    33,    45,   126,    43,    42,
      47,    37,    46,    38,   124,    91,    93,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    88,    90,    89,    91,    91,    92,    92,    94,    93,
      93,    95,    97,    96,    98,    99,   100,   100,   100,   102,
     101,   104,   105,   103,   106,   106,   106,   108,   107,   110,
     109,   111,   111,   112,   112,   113,   113,   114,   114,   114,
     115,   116,   116,   116,   117,   118,   117,   120,   119,   122,
     121,   123,   123,   123,   124,   125,   125,   127,   126,   126,
     126,   126,   126,   128,   128,   129,   129,   130,   131,   131,
     132,   132,   132,   132,   133,   132,   134,   132,   135,   132,
     132,   132,   132,   132,   132,   132,   132,   132,   132,   132,
     132,   132,   132,   136,   136,   136,   136,   137,   138,   138,
     138,   138,   138,   138,   138,   138,   138,   138,   138,   138,
     138,   138,   138,   138,   138,   138,   138,   138,   138,   138,
     138,   138,   138,   138,   138,   138,   138,   138,   139,   138,
     138,   138,   138,   140,   140,   140,   140,   140,   141,   141,
     141,   141,   141,   141,   142,   142,   143,   143,   144,   144,
     145,   145,   146,   146,   147,   147,   148,   148,   148,   149,
     149,   151,   150,   152,   152,   153,   154,   154,   155,   155,
     155,   155,   155,   156,   156,   156,   157,   157
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     2,     3,     2,     0,     3,
       0,     1,     0,     4,     2,     2,     1,     1,     1,     0,
       4,     0,     0,     8,     0,     2,     3,     0,     4,     0,
      11,     1,     1,     0,     1,     5,     3,     0,     2,     3,
       2,     0,     2,     3,     2,     0,     4,     0,     6,     0,
       6,     0,     2,     3,     2,     1,     2,     0,     2,     2,
       1,     1,     1,     0,     1,     2,     1,     1,     3,     1,
       1,     1,     2,     2,     0,     4,     0,     6,     0,     4,
       2,     2,     2,     2,     2,     2,     2,     2,     1,     1,
       1,     2,     0,     1,     1,     1,     1,     1,     3,     4,
       4,     4,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     6,     6,
       6,     4,     4,     7,     4,     4,     4,     4,     0,     3,
       4,     7,     4,     6,     4,     4,     4,     4,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     1,
       3,     1,     1,     4,     1,     1,     1,     1,     1,     1,
       1,     0,     2,     1,     3,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,    57,     1,     0,     0,     0,     0,    60,    61,
      62,    57,    55,    63,    31,    32,     0,    47,    49,    59,
      56,    19,    21,    67,    12,    18,    16,    69,    57,    17,
      92,    64,    66,    58,    29,    51,    51,     0,     0,    63,
      14,    57,     0,     0,     0,     0,     0,   128,    90,    88,
      89,     0,     0,    74,    76,    78,     0,     0,     0,     0,
       0,     0,     0,   168,   169,   170,   171,   175,   173,   174,
     172,   148,   144,     0,    70,    71,     0,     0,   160,   145,
     167,    65,    37,     0,     0,     0,    33,     0,    63,     4,
       8,    15,   154,   155,    84,    85,   159,    82,   166,     0,
       0,   148,    72,    73,     0,     0,     0,    80,    86,    87,
     144,     0,   145,   176,   177,     0,     0,    81,    83,   156,
     157,   159,     0,    91,   149,   151,   152,   158,   166,    68,
       0,   161,     0,     0,     0,     0,     0,    52,     0,     0,
      20,    34,     0,     7,    13,     5,     0,     0,     0,   138,
     139,   140,   141,   142,   143,     0,     0,     0,     0,   129,
      11,    93,    94,    95,    97,     0,    96,     0,     0,     0,
       0,     0,   161,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    98,     0,     0,    40,     0,     0,     0,    38,
      54,    48,    53,    50,    22,     6,   148,   134,   136,     0,
     135,   137,    75,     0,    79,   130,   127,   132,     0,   150,
     121,   122,   126,   125,   124,    99,   100,   101,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   161,     0,   165,   162,   163,     0,
       0,    39,    24,     9,     0,     0,   161,   153,     0,   161,
     109,   110,   114,   105,   111,   112,   113,   103,   117,   102,
     104,   106,   107,   108,   115,   116,     0,     0,     0,     0,
      36,    41,    27,    57,     0,   133,    77,     0,   120,     0,
     118,   119,   164,     0,    45,     0,     0,     0,     0,    23,
       0,    25,   131,   123,    35,     0,    44,     0,     0,    42,
       0,    26,     0,    30,    43,    28,    46
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,    88,    89,   146,   147,   159,    25,    39,
      26,    40,    27,    28,    37,    29,    38,   242,   273,   274,
     288,     8,    82,    16,   142,   187,   133,   134,   286,   287,
     295,     9,    35,    10,    36,    83,   138,    41,    12,    13,
      90,    31,    32,    33,    73,   104,   105,   106,   165,   166,
      74,   101,    75,   156,    76,   122,   160,   124,   125,    94,
     126,   127,   183,   184,   237,   238,    78,    98,    80,   115
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -172
static const short yypact[] =
{
    -172,    17,   -41,  -172,    57,   -18,    -4,     3,  -172,  -172,
    -172,    56,  -172,    -5,  -172,  -172,    50,  -172,  -172,  -172,
    -172,  -172,  -172,  -172,  -172,  -172,  -172,  -172,   -41,  -172,
     222,   -24,  -172,  -172,  -172,  -172,  -172,    30,    60,   -33,
    -172,    26,   -46,   -46,   148,   148,   148,  -172,  -172,  -172,
    -172,    74,    78,  -172,  -172,    59,   148,   148,   185,     6,
     185,   148,   148,  -172,  -172,  -172,  -172,  -172,  -172,  -172,
    -172,   203,     0,    70,  -172,  -172,    72,    29,  -172,    68,
    -172,  -172,   139,   -32,   -19,    82,    57,    84,     5,  -172,
      86,  -172,  -172,  -172,  -172,  -172,  -172,  -172,  -172,   102,
       1,   203,  -172,  -172,    40,    40,    40,  -172,  -172,  -172,
    -172,   115,  -172,  -172,  -172,    88,   116,  -172,  -172,  -172,
    -172,    89,    91,  -172,   128,  -172,  -172,  -172,    92,  -172,
      21,  -172,   148,    -1,   105,   148,   106,  -172,   107,   108,
    -172,  -172,   109,  -172,  -172,  -172,   110,   113,   -46,  -172,
    -172,  -172,  -172,  -172,  -172,   -46,   148,   -46,   -46,  -172,
    -172,  -172,  -172,  -172,  -172,   121,  -172,   122,   123,   148,
     148,   148,  -172,   203,   142,   148,     6,   143,   148,   148,
     148,   148,    87,   131,   148,  -172,   148,   -24,   146,  -172,
    -172,  -172,  -172,  -172,  -172,  -172,   203,  -172,  -172,   217,
    -172,  -172,  -172,   149,  -172,   137,  -172,  -172,   138,  -172,
     189,   164,  -172,  -172,  -172,  -172,  -172,  -172,   148,   148,
     148,   148,   148,   148,   148,   148,   148,   148,   148,   148,
     148,   148,   148,   148,  -172,   177,  -172,   165,  -172,   -26,
     181,  -172,   236,  -172,   -46,    25,  -172,  -172,   148,  -172,
    -172,  -172,  -172,  -172,  -172,  -172,  -172,  -172,  -172,  -172,
    -172,  -172,  -172,  -172,  -172,  -172,   173,   148,   148,   148,
    -172,    12,  -172,    -9,   199,  -172,  -172,   187,  -172,   190,
    -172,  -172,  -172,   204,  -172,   148,    22,   205,    40,  -172,
     206,  -172,  -172,  -172,  -172,    40,  -172,   207,   208,  -172,
     227,  -172,   228,  -172,  -172,  -172,  -172
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -172,  -172,  -172,  -172,   198,  -172,  -172,    99,  -172,  -172,
    -172,    23,  -172,  -172,  -172,  -172,  -172,  -172,  -172,    24,
    -172,  -172,  -172,   212,  -172,  -172,  -172,   166,  -172,    14,
    -172,  -172,  -172,  -172,  -172,   265,  -172,   300,     2,  -172,
     290,  -172,   -29,  -172,  -172,  -172,  -172,  -172,   -83,   130,
    -172,  -172,  -172,  -172,    41,  -172,   234,  -172,   133,   -40,
    -172,   -30,  -171,  -172,  -172,    39,  -172,   -21,    63,   134
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -167
static const short yytable[] =
{
      77,   208,    81,    95,   132,   157,     4,    21,   135,    79,
       5,   272,     6,    20,    97,    99,   100,     3,    92,   269,
     136,   135,   167,   168,    23,    93,   108,   109,     7,   174,
     284,   117,   118,    23,   107,   139,    87,   112,     4,   112,
     284,   137,     5,    20,     6,    22,   158,   270,   186,   175,
     128,   285,    23,    24,   137,    17,    -3,   176,   177,   178,
       7,   285,    23,   266,   144,   161,   162,   163,   113,    18,
     297,   114,    91,     4,    87,   277,    19,     5,   279,     6,
     128,    63,    64,    65,    66,  -159,    67,    68,    69,    70,
      67,    68,    69,    96,    85,     7,   179,   180,   181,   111,
     182,   116,   185,     4,   164,   190,   148,     5,   197,     6,
     218,   219,    14,    15,   131,   198,   220,   200,   201,    63,
      64,    65,    66,    34,    86,     7,   199,    70,   221,   222,
     223,   224,   149,   150,   151,   152,   153,   154,   102,   205,
     206,   207,   103,   129,   132,   211,   130,   155,   214,   215,
     216,   217,   128,  -166,   236,   140,   239,   143,   240,   -10,
     169,   171,   170,   225,   226,   227,   228,   229,   230,   231,
     232,   233,   234,   173,  -146,   128,   172,  -147,   189,   191,
     192,   193,   194,   195,   196,   202,   203,   204,   250,   251,
     252,   253,   254,   255,   256,   257,   258,   259,   260,   261,
     262,   263,   264,   265,   275,   300,   164,   213,    63,    64,
      65,    66,   302,    67,    68,    69,    70,   235,   278,   241,
      96,   244,   246,   245,   247,    42,    43,    44,    45,    46,
      47,    48,    49,    50,   248,    51,    52,   281,   236,   283,
      53,    54,    55,    56,    57,    63,    64,    65,    66,   249,
      58,   267,   268,    70,   271,   296,   272,   110,    59,   280,
      60,    61,    62,    63,    64,    65,    66,   119,    67,    68,
      69,    70,   291,   292,   120,   121,   293,   294,   299,   301,
     303,   304,    63,    64,    65,    66,   145,    67,    68,    69,
      70,   305,   306,    71,    72,   243,   289,   290,   141,   188,
     298,    84,    11,    30,   210,   123,   209,   282,   276,     0,
     212
};

static const short yycheck[] =
{
      30,   172,    31,    43,     5,     4,    47,    12,    40,    30,
      51,    20,    53,    11,    44,    45,    46,     0,    64,    45,
      52,    40,   105,   106,    57,    71,    56,    57,    69,     8,
      18,    61,    62,    57,    55,    54,    69,    58,    47,    60,
      18,    73,    51,    41,    53,    50,    45,    73,    49,    28,
      71,    39,    57,    58,    73,    73,     0,    36,    37,    38,
      69,    39,    57,   234,    59,    25,    26,    27,    62,    73,
      48,    65,    46,    47,    69,   246,    73,    51,   249,    53,
     101,    60,    61,    62,    63,    85,    65,    66,    67,    68,
      65,    66,    67,    72,    64,    69,    75,    76,    77,    58,
     130,    60,   132,    47,    64,   135,     4,    51,   148,    53,
      23,    24,    55,    56,    85,   155,    29,   157,   158,    60,
      61,    62,    63,    73,    64,    69,   156,    68,    41,    42,
      43,    44,    30,    31,    32,    33,    34,    35,    64,   169,
     170,   171,    64,    73,     5,   175,    74,    45,   178,   179,
     180,   181,   173,    85,   184,    73,   186,    73,   187,    73,
      45,    45,    74,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    45,    85,   196,    85,    85,    73,    73,
      73,    73,    73,    73,    71,    64,    64,    64,   218,   219,
     220,   221,   222,   223,   224,   225,   226,   227,   228,   229,
     230,   231,   232,   233,   244,   288,    64,    64,    60,    61,
      62,    63,   295,    65,    66,    67,    68,    86,   248,    73,
      72,     4,    85,    74,    86,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    45,    13,    14,   267,   268,   269,
      18,    19,    20,    21,    22,    60,    61,    62,    63,    85,
      28,    74,    87,    68,    73,   285,    20,    72,    36,    86,
      38,    39,    40,    60,    61,    62,    63,    64,    65,    66,
      67,    68,    73,    86,    71,    72,    86,    73,    73,    73,
      73,    73,    60,    61,    62,    63,    88,    65,    66,    67,
      68,    64,    64,    71,    72,   196,   273,   273,    86,   133,
     286,    36,     2,    13,   174,    71,   173,   268,   245,    -1,
     176
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    89,    90,     0,    47,    51,    53,    69,   109,   119,
     121,   125,   126,   127,    55,    56,   111,    73,    73,    73,
     126,    12,    50,    57,    58,    96,    98,   100,   101,   103,
     128,   129,   130,   131,    73,   120,   122,   102,   104,    97,
      99,   125,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    13,    14,    18,    19,    20,    21,    22,    28,    36,
      38,    39,    40,    60,    61,    62,    63,    65,    66,    67,
      68,    71,    72,   132,   138,   140,   142,   149,   154,   155,
     156,   130,   110,   123,   123,    64,    64,    69,    91,    92,
     128,    46,    64,    71,   147,   147,    72,   149,   155,   149,
     149,   139,    64,    64,   133,   134,   135,   155,   149,   149,
      72,   142,   155,    62,    65,   157,   142,   149,   149,    64,
      71,    72,   143,   144,   145,   146,   148,   149,   155,    73,
      74,    85,     5,   114,   115,    40,    52,    73,   124,    54,
      73,   111,   112,    73,    59,    92,    93,    94,     4,    30,
      31,    32,    33,    34,    35,    45,   141,     4,    45,    95,
     144,    25,    26,    27,    64,   136,   137,   136,   136,    45,
      74,    45,    85,    45,     8,    28,    36,    37,    38,    75,
      76,    77,   149,   150,   151,   149,    49,   113,   115,    73,
     149,    73,    73,    73,    73,    73,    71,   147,   147,   149,
     147,   147,    64,    64,    64,   149,   149,   149,   150,   146,
     137,   149,   157,    64,   149,   149,   149,   149,    23,    24,
      29,    41,    42,    43,    44,    76,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,   149,   152,   153,   149,
     130,    73,   105,    95,     4,    74,    85,    86,    45,    85,
     149,   149,   149,   149,   149,   149,   149,   149,   149,   149,
     149,   149,   149,   149,   149,   149,   150,    74,    87,    45,
      73,    73,    20,   106,   107,   147,   156,   150,   149,   150,
      86,   149,   153,   149,    18,    39,   116,   117,   108,    99,
     107,    73,    86,    86,    73,   118,   149,    48,   117,    73,
     136,    73,   136,    73,    73,    64,    64
};

#if ! defined (YYSIZE_T) && defined (__SIZE_TYPE__)
# define YYSIZE_T __SIZE_TYPE__
#endif
#if ! defined (YYSIZE_T) && defined (size_t)
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T)
# if defined (__STDC__) || defined (__cplusplus)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# endif
#endif
#if ! defined (YYSIZE_T)
# define YYSIZE_T unsigned int
#endif

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrlab1

/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yychar1 = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { 								\
      yyerror ("syntax error: cannot back up");			\
      YYERROR;							\
    }								\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

/* YYLLOC_DEFAULT -- Compute the default location (before the actions
   are run).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)           \
  Current.first_line   = Rhs[1].first_line;      \
  Current.first_column = Rhs[1].first_column;    \
  Current.last_line    = Rhs[N].last_line;       \
  Current.last_column  = Rhs[N].last_column;
#endif

/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX	yylex (&yylval, YYLEX_PARAM)
#else
# define YYLEX	yylex (&yylval)
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (0)
# define YYDSYMPRINT(Args)			\
do {						\
  if (yydebug)					\
    yysymprint Args;				\
} while (0)
/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YYDSYMPRINT(Args)
#endif /* !YYDEBUG */

/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   SIZE_MAX < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#if YYMAXDEPTH == 0
# undef YYMAXDEPTH
#endif

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined (__GLIBC__) && defined (_STRING_H)
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
#   if defined (__STDC__) || defined (__cplusplus)
yystrlen (const char *yystr)
#   else
yystrlen (yystr)
     const char *yystr;
#   endif
{
  register const char *yys = yystr;

  while (*yys++ != '\0')
    continue;

  return yys - yystr - 1;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined (__GLIBC__) && defined (_STRING_H) && defined (_GNU_SOURCE)
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
#   if defined (__STDC__) || defined (__cplusplus)
yystpcpy (char *yydest, const char *yysrc)
#   else
yystpcpy (yydest, yysrc)
     char *yydest;
     const char *yysrc;
#   endif
{
  register char *yyd = yydest;
  register const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

#endif /* !YYERROR_VERBOSE */



#if YYDEBUG
/*-----------------------------.
| Print this symbol on YYOUT.  |
`-----------------------------*/

static void
#if defined (__STDC__) || defined (__cplusplus)
yysymprint (FILE* yyout, int yytype, YYSTYPE yyvalue)
#else
yysymprint (yyout, yytype, yyvalue)
    FILE* yyout;
    int yytype;
    YYSTYPE yyvalue;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvalue;

  if (yytype < YYNTOKENS)
    {
      YYFPRINTF (yyout, "token %s (", yytname[yytype]);
# ifdef YYPRINT
      YYPRINT (yyout, yytoknum[yytype], yyvalue);
# endif
    }
  else
    YYFPRINTF (yyout, "nterm %s (", yytname[yytype]);

  switch (yytype)
    {
      default:
        break;
    }
  YYFPRINTF (yyout, ")");
}
#endif /* YYDEBUG. */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
#if defined (__STDC__) || defined (__cplusplus)
yydestruct (int yytype, YYSTYPE yyvalue)
#else
yydestruct (yytype, yyvalue)
    int yytype;
    YYSTYPE yyvalue;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvalue;

  switch (yytype)
    {
      default:
        break;
    }
}



/* The user can define YYPARSE_PARAM as the name of an argument to be passed
   into yyparse.  The argument should have type void *.
   It should actually point to an object.
   Grammar actions can access the variable by casting it
   to the proper pointer type.  */

#ifdef YYPARSE_PARAM
# if defined (__STDC__) || defined (__cplusplus)
#  define YYPARSE_PARAM_ARG void *YYPARSE_PARAM
#  define YYPARSE_PARAM_DECL
# else
#  define YYPARSE_PARAM_ARG YYPARSE_PARAM
#  define YYPARSE_PARAM_DECL void *YYPARSE_PARAM;
# endif
#else /* !YYPARSE_PARAM */
# define YYPARSE_PARAM_ARG
# define YYPARSE_PARAM_DECL
#endif /* !YYPARSE_PARAM */

/* Prevent warning if -Wstrict-prototypes.  */
#ifdef __GNUC__
# ifdef YYPARSE_PARAM
int yyparse (void *);
# else
int yyparse (void);
# endif
#endif




int
yyparse (YYPARSE_PARAM_ARG)
     YYPARSE_PARAM_DECL
{
  /* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of parse errors so far.  */
int yynerrs;

  register int yystate;
  register int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Lookahead token as an internal (translated) token number.  */
  int yychar1 = 0;

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  short	yyssa[YYINITDEPTH];
  short *yyss = yyssa;
  register short *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  register YYSTYPE *yyvsp;



#define YYPOPSTACK   (yyvsp--, yyssp--)

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* When reducing, the number of symbols on the RHS of the reduced
     rule.  */
  int yylen;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed. so pushing a state here evens the stacks.
     */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyssp >= yyss + yystacksize - 1)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack. Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	short *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow ("parser stack overflow",
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyoverflowlab;
# else
      /* Extend the stack our own way.  */
      if (yystacksize >= YYMAXDEPTH)
	goto yyoverflowlab;
      yystacksize *= 2;
      if (yystacksize > YYMAXDEPTH)
	yystacksize = YYMAXDEPTH;

      {
	short *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyoverflowlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyssp >= yyss + yystacksize - 1)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

/* Do appropriate processing given the current state.  */
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* yychar is either YYEMPTY or YYEOF
     or a valid token in external form.  */

  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  /* Convert token to internal form (in yychar1) for indexing tables with.  */

  if (yychar <= 0)		/* This means end of input.  */
    {
      yychar1 = 0;
      yychar = YYEOF;		/* Don't call YYLEX any more.  */

      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yychar1 = YYTRANSLATE (yychar);

      /* We have to keep this `#if YYDEBUG', since we use variables
	 which are defined only if `YYDEBUG' is set.  */
      YYDPRINTF ((stderr, "Next token is "));
      YYDSYMPRINT ((stderr, yychar1, yylval));
      YYDPRINTF ((stderr, "\n"));
    }

  /* If the proper action on seeing token YYCHAR1 is to reduce or to
     detect an error, take that action.  */
  yyn += yychar1;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yychar1)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Shift the lookahead token.  */
  YYDPRINTF ((stderr, "Shifting token %d (%s), ",
	      yychar, yytname[yychar1]));

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;


  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  yystate = yyn;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];



#if YYDEBUG
  /* We have to keep this `#if YYDEBUG', since we use variables which
     are defined only if `YYDEBUG' is set.  */
  if (yydebug)
    {
      int yyi;

      YYFPRINTF (stderr, "Reducing via rule %d (line %d), ",
		 yyn - 1, yyrline[yyn]);

      /* Print the symbols being reduced, and their result.  */
      for (yyi = yyprhs[yyn]; yyrhs[yyi] >= 0; yyi++)
	YYFPRINTF (stderr, "%s ", yytname[yyrhs[yyi]]);
      YYFPRINTF (stderr, " -> %s\n", yytname[yyr1[yyn]]);
    }
#endif
  switch (yyn)
    {
        case 2:
#line 438 "imcc.y"
    { open_comp_unit(); }
    break;

  case 3:
#line 439 "imcc.y"
    { yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 6:
#line 450 "imcc.y"
    { yyval.i = 0; }
    break;

  case 7:
#line 451 "imcc.y"
    { yyval.i = 0; }
    break;

  case 8:
#line 454 "imcc.y"
    {clear_state();}
    break;

  case 9:
#line 455 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs,1); free(yyvsp[-1].s); }
    break;

  case 10:
#line 456 "imcc.y"
    { yyval.i = 0;}
    break;

  case 12:
#line 463 "imcc.y"
    { open_comp_unit();
                                          function = "(emit)"; }
    break;

  case 13:
#line 466 "imcc.y"
    { if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); yyval.i=0;}
    break;

  case 15:
#line 477 "imcc.y"
    {
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 19:
#line 489 "imcc.y"
    { open_comp_unit(); }
    break;

  case 20:
#line 491 "imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 21:
#line 495 "imcc.y"
    { open_comp_unit(); }
    break;

  case 22:
#line 497 "imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 23:
#line 504 "imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 507 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 25:
#line 508 "imcc.y"
    { add_pcc_param(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 26:
#line 509 "imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 27:
#line 512 "imcc.y"
    { is_def=1; }
    break;

  case 28:
#line 513 "imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 29:
#line 516 "imcc.y"
    {
              char name[128];
              SymReg * r;
              Instruction *i;

              sprintf(name, "#pcc_sub_call_%d", line - 1);
              yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
              r->pcc_sub->prototyped = yyvsp[-1].t;
              /* this mid rule action has the semantic value of the
                 sub SymReg.
                 This is used below to append args & results
              */
              i = iLABEL(r);
              i->type = ITPCCSUB;
              /*
               * if we are inside a pcc_sub mark the sub as doing a
               * sub call; the sub is in r1 of the first ins
               */
              if (instructions->r[1] && instructions->r[1]->pcc_sub)
                  instructions->r[1]->pcc_sub->calls_a_sub = 1;

           }
    break;

  case 30:
#line 542 "imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 545 "imcc.y"
    { yyval.t = 1; }
    break;

  case 32:
#line 546 "imcc.y"
    { yyval.t = 0; }
    break;

  case 33:
#line 549 "imcc.y"
    { yyval.t = -1; }
    break;

  case 35:
#line 553 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 36:
#line 557 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 37:
#line 562 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 38:
#line 563 "imcc.y"
    {  add_pcc_arg(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 39:
#line 564 "imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 40:
#line 567 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 41:
#line 570 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 42:
#line 571 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 43:
#line 572 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-7].sr, yyvsp[-1].sr); }
    break;

  case 44:
#line 575 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 45:
#line 576 "imcc.y"
    { is_def=1; }
    break;

  case 46:
#line 576 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 47:
#line 579 "imcc.y"
    {
                Instruction *i, *ins = instructions;
                char name[128];
                if (!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
                    fataly(EX_SOFTWARE, "pcc_ret", line,
                        "pcc_return not inside pcc subroutine\n");
                yyval.sr = ins->r[1];
                sprintf(name, "#pcc_sub_ret_%d:", line - 1);
                i = _mk_instruction("", name, NULL, 0);
                i = emitb(i);
                i->type = ITPCCSUB | ITLABEL;
        }
    break;

  case 48:
#line 592 "imcc.y"
    { yyval.i = 0; }
    break;

  case 49:
#line 595 "imcc.y"
    {
                Instruction *i, *ins = instructions;
                char name[128];
                if (!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
                    fataly(EX_SOFTWARE, "pcc_yield", line,
                        "pcc_yield not inside pcc subroutine\n");
                ins->r[1]->pcc_sub->calls_a_sub = 1;
                yyval.sr = ins->r[1];
                sprintf(name, "#pcc_sub_yield_%d:", line - 1);
                i = _mk_instruction("", name, NULL, 0);
                i = emitb(i);
                i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
        }
    break;

  case 50:
#line 609 "imcc.y"
    { yyval.i = 0; }
    break;

  case 51:
#line 612 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 52:
#line 613 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 53:
#line 614 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 54:
#line 617 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 57:
#line 624 "imcc.y"
    { clear_state(); }
    break;

  case 58:
#line 625 "imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 59:
#line 626 "imcc.y"
    { yyval.i = 0; }
    break;

  case 60:
#line 627 "imcc.y"
    { yyval.i = 0; }
    break;

  case 63:
#line 632 "imcc.y"
    { yyval.i = NULL; }
    break;

  case 67:
#line 640 "imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 68:
#line 644 "imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 72:
#line 650 "imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 73:
#line 651 "imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 74:
#line 652 "imcc.y"
    { is_def=1; }
    break;

  case 75:
#line 652 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 76:
#line 653 "imcc.y"
    { is_def=1; }
    break;

  case 77:
#line 654 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr);is_def=0; }
    break;

  case 78:
#line 655 "imcc.y"
    { is_def=1; }
    break;

  case 79:
#line 655 "imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            R1(mk_ident(yyvsp[0].s, yyvsp[-1].t)));is_def=0; }
    break;

  case 80:
#line 657 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 81:
#line 658 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 82:
#line 659 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 83:
#line 660 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 84:
#line 661 "imcc.y"
    { yyval.i = MK_I(interp, "bsr",  R1(yyvsp[0].sr)); }
    break;

  case 85:
#line 662 "imcc.y"
    { yyval.i = MK_I(interp, "branch",R1(yyvsp[0].sr)); }
    break;

  case 86:
#line 663 "imcc.y"
    { yyval.i = MK_I(interp, "inc",R1(yyvsp[0].sr)); }
    break;

  case 87:
#line 664 "imcc.y"
    { yyval.i = MK_I(interp, "dec",R1(yyvsp[0].sr)); }
    break;

  case 88:
#line 665 "imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,R0()); }
    break;

  case 89:
#line 666 "imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,R0()); }
    break;

  case 90:
#line 667 "imcc.y"
    { yyval.i = MK_I(interp, "end" ,R0()); }
    break;

  case 91:
#line 668 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs, 1); free(yyvsp[-1].s); }
    break;

  case 92:
#line 669 "imcc.y"
    { yyval.i = 0;}
    break;

  case 93:
#line 673 "imcc.y"
    { yyval.t = 'I'; }
    break;

  case 94:
#line 674 "imcc.y"
    { yyval.t = 'N'; }
    break;

  case 95:
#line 675 "imcc.y"
    { yyval.t = 'S'; }
    break;

  case 96:
#line 676 "imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 98:
#line 684 "imcc.y"
    { yyval.i = MK_I(interp, "set", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 99:
#line 685 "imcc.y"
    { yyval.i = MK_I(interp, "not", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 100:
#line 686 "imcc.y"
    { yyval.i = MK_I(interp, "neg", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 101:
#line 687 "imcc.y"
    { yyval.i = MK_I(interp, "bnot", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 102:
#line 688 "imcc.y"
    { yyval.i = MK_I(interp, "add", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 103:
#line 689 "imcc.y"
    { yyval.i = MK_I(interp, "sub", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 104:
#line 690 "imcc.y"
    { yyval.i = MK_I(interp, "mul", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 105:
#line 691 "imcc.y"
    { yyval.i = MK_I(interp, "pow", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 106:
#line 692 "imcc.y"
    { yyval.i = MK_I(interp, "div", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 107:
#line 693 "imcc.y"
    { yyval.i = MK_I(interp, "mod", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 108:
#line 694 "imcc.y"
    { yyval.i = MK_I(interp, "concat", R3(yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 109:
#line 695 "imcc.y"
    { yyval.i = MK_I(interp, "shl", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 110:
#line 696 "imcc.y"
    { yyval.i = MK_I(interp, "shr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 111:
#line 697 "imcc.y"
    { yyval.i = MK_I(interp, "lsr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 112:
#line 698 "imcc.y"
    { yyval.i = MK_I(interp, "and", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 113:
#line 699 "imcc.y"
    { yyval.i = MK_I(interp, "or", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 114:
#line 700 "imcc.y"
    { yyval.i = MK_I(interp, "xor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 115:
#line 701 "imcc.y"
    { yyval.i = MK_I(interp, "band", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 116:
#line 702 "imcc.y"
    { yyval.i = MK_I(interp, "bor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 117:
#line 703 "imcc.y"
    { yyval.i = MK_I(interp, "bxor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 118:
#line 704 "imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 119:
#line 705 "imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 120:
#line 706 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 121:
#line 707 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 122:
#line 708 "imcc.y"
    { yyval.i = MK_I(interp, "defined",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 123:
#line 709 "imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", R3(yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 124:
#line 711 "imcc.y"
    { yyval.i = MK_I(interp, "clone",R2(yyvsp[-3].sr, yyvsp[0].sr));
    }
    break;

  case 125:
#line 713 "imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          R2(yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once))); }
    break;

  case 126:
#line 715 "imcc.y"
    { yyval.i = MK_I(interp, "find_global",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 127:
#line 716 "imcc.y"
    { yyval.i = MK_I(interp, "store_global",R2(yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 128:
#line 717 "imcc.y"
    { expect_pasm = 1; }
    break;

  case 129:
#line 718 "imcc.y"
    { yyval.i = iANY(interp, "new",0,regs,1);  }
    break;

  case 130:
#line 719 "imcc.y"
    { yyval.i = MK_I(interp, "defined", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 131:
#line 720 "imcc.y"
    { keyvec=KEY_BIT(2);
                                       yyval.i = MK_I(interp, "defined", R3(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 132:
#line 722 "imcc.y"
    { yyval.i = MK_I(interp, "clone", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 133:
#line 726 "imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,R3(yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 134:
#line 727 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 135:
#line 728 "imcc.y"
    {yyval.i= MK_I(interp, "unless",R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 136:
#line 729 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 137:
#line 730 "imcc.y"
    {yyval.i= MK_I(interp, "unless", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 138:
#line 735 "imcc.y"
    { yyval.s = "eq"; }
    break;

  case 139:
#line 736 "imcc.y"
    { yyval.s = "ne"; }
    break;

  case 140:
#line 737 "imcc.y"
    { yyval.s = "gt"; }
    break;

  case 141:
#line 738 "imcc.y"
    { yyval.s = "ge"; }
    break;

  case 142:
#line 739 "imcc.y"
    { yyval.s = "lt"; }
    break;

  case 143:
#line 740 "imcc.y"
    { yyval.s = "le"; }
    break;

  case 148:
#line 751 "imcc.y"
    { yyval.sr = NULL; }
    break;

  case 149:
#line 752 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 150:
#line 755 "imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 152:
#line 759 "imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 153:
#line 760 "imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 154:
#line 765 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 155:
#line 766 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 156:
#line 769 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 157:
#line 770 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 161:
#line 778 "imcc.y"
    { nkeys=0; }
    break;

  case 162:
#line 779 "imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 163:
#line 782 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 164:
#line 783 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 168:
#line 793 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 169:
#line 794 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 170:
#line 795 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 171:
#line 796 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 172:
#line 797 "imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 173:
#line 800 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 174:
#line 801 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 175:
#line 802 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 176:
#line 805 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 177:
#line 806 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2572 "imcparser.c"

  yyvsp -= yylen;
  yyssp -= yylen;


#if YYDEBUG
  if (yydebug)
    {
      short *yyssp1 = yyss - 1;
      YYFPRINTF (stderr, "state stack now");
      while (yyssp1 != yyssp)
	YYFPRINTF (stderr, " %d", *++yyssp1);
      YYFPRINTF (stderr, "\n");
    }
#endif

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (YYPACT_NINF < yyn && yyn < YYLAST)
	{
	  YYSIZE_T yysize = 0;
	  int yytype = YYTRANSLATE (yychar);
	  char *yymsg;
	  int yyx, yycount;

	  yycount = 0;
	  /* Start YYX at -YYN if negative to avoid negative indexes in
	     YYCHECK.  */
	  for (yyx = yyn < 0 ? -yyn : 0;
	       yyx < (int) (sizeof (yytname) / sizeof (char *)); yyx++)
	    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	      yysize += yystrlen (yytname[yyx]) + 15, yycount++;
	  yysize += yystrlen ("parse error, unexpected ") + 1;
	  yysize += yystrlen (yytname[yytype]);
	  yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg != 0)
	    {
	      char *yyp = yystpcpy (yymsg, "parse error, unexpected ");
	      yyp = yystpcpy (yyp, yytname[yytype]);

	      if (yycount < 5)
		{
		  yycount = 0;
		  for (yyx = yyn < 0 ? -yyn : 0;
		       yyx < (int) (sizeof (yytname) / sizeof (char *));
		       yyx++)
		    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
		      {
			const char *yyq = ! yycount ? ", expecting " : " or ";
			yyp = yystpcpy (yyp, yyq);
			yyp = yystpcpy (yyp, yytname[yyx]);
			yycount++;
		      }
		}
	      yyerror (yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    yyerror ("parse error; also virtual memory exhausted");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror ("parse error");
    }
  goto yyerrlab1;


/*----------------------------------------------------.
| yyerrlab1 -- error raised explicitly by an action.  |
`----------------------------------------------------*/
yyerrlab1:
  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      /* Return failure if at end of input.  */
      if (yychar == YYEOF)
        {
	  /* Pop the error token.  */
          YYPOPSTACK;
	  /* Pop the rest of the stack.  */
	  while (yyssp > yyss)
	    {
	      YYDPRINTF ((stderr, "Error: popping "));
	      YYDSYMPRINT ((stderr,
			    yystos[*yyssp],
			    *yyvsp));
	      YYDPRINTF ((stderr, "\n"));
	      yydestruct (yystos[*yyssp], *yyvsp);
	      YYPOPSTACK;
	    }
	  YYABORT;
        }

      YYDPRINTF ((stderr, "Discarding token %d (%s).\n",
		  yychar, yytname[yychar1]));
      yydestruct (yychar1, yylval);
      yychar = YYEMPTY;
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */

  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;

      YYDPRINTF ((stderr, "Error: popping "));
      YYDSYMPRINT ((stderr,
		    yystos[*yyssp], *yyvsp));
      YYDPRINTF ((stderr, "\n"));

      yydestruct (yystos[yystate], *yyvsp);
      yyvsp--;
      yystate = *--yyssp;


#if YYDEBUG
      if (yydebug)
	{
	  short *yyssp1 = yyss - 1;
	  YYFPRINTF (stderr, "Error: state stack now");
	  while (yyssp1 != yyssp)
	    YYFPRINTF (stderr, " %d", *++yyssp1);
	  YYFPRINTF (stderr, "\n");
	}
#endif
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  YYDPRINTF ((stderr, "Shifting error token, "));

  *++yyvsp = yylval;


  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*----------------------------------------------.
| yyoverflowlab -- parser overflow comes here.  |
`----------------------------------------------*/
yyoverflowlab:
  yyerror ("parser stack overflow");
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  return yyresult;
}


#line 808 "imcc.y"



int yyerror(char * s)
{
    /* fprintf(stderr, "last token = [%s]\n", yylval.s); */
    fprintf(stderr, "(error) line %d: %s\n", line, s );
    fprintf(stderr, "Didn't create output asm.\n" );
    exit(EX_UNAVAILABLE);
}

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/

