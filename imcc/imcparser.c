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
     PROTOTYPED = 308,
     NON_PROTOTYPED = 309,
     LABEL = 310,
     EMIT = 311,
     EOM = 312,
     IREG = 313,
     NREG = 314,
     SREG = 315,
     PREG = 316,
     IDENTIFIER = 317,
     STRINGC = 318,
     INTC = 319,
     FLOATC = 320,
     REG = 321,
     MACRO = 322,
     ENDM = 323,
     PARROT_OP = 324,
     VAR = 325
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
#define PROTOTYPED 308
#define NON_PROTOTYPED 309
#define LABEL 310
#define EMIT 311
#define EOM 312
#define IREG 313
#define NREG 314
#define SREG 315
#define PREG 316
#define IDENTIFIER 317
#define STRINGC 318
#define INTC 319
#define FLOATC 320
#define REG 321
#define MACRO 322
#define ENDM 323
#define PARROT_OP 324
#define VAR 325




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
    if (emit)
        emitb(i);
    return i;
}

static Instruction * iLABEL(SymReg * r0) {
    Instruction *i = _mk_instruction("","%s:", R1(r0), 0);
    i->type = ITLABEL;
    r0->first_ins = i;
    i = emitb(i);
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
#line 397 "imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 616 "imcparser.c"
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
#line 637 "imcparser.c"

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
#define YYLAST   319

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  86
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  67
/* YYNRULES -- Number of rules. */
#define YYNRULES  172
/* YYNRULES -- Number of states. */
#define YYNSTATES  298

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   325

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      71,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    73,     2,     2,     2,    79,    81,     2,
       2,     2,    77,    76,     2,    74,    80,    78,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    85,
       2,    72,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    83,     2,    84,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    82,     2,    75,     2,     2,     2,
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
      65,    66,    67,    68,    69,    70
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     4,     7,     9,    12,    16,    19,    20,
      24,    25,    27,    28,    33,    36,    39,    41,    43,    45,
      46,    51,    52,    53,    61,    62,    65,    69,    70,    75,
      76,    88,    90,    92,    98,   102,   103,   106,   110,   113,
     114,   117,   121,   124,   125,   130,   131,   138,   139,   142,
     146,   149,   151,   154,   155,   158,   161,   163,   165,   166,
     168,   171,   173,   175,   179,   181,   183,   185,   188,   191,
     192,   197,   198,   205,   206,   211,   214,   217,   220,   223,
     226,   229,   232,   235,   237,   239,   241,   244,   245,   247,
     249,   251,   253,   255,   259,   264,   269,   274,   280,   286,
     292,   298,   304,   310,   316,   322,   328,   334,   340,   346,
     352,   358,   364,   370,   377,   384,   391,   396,   401,   409,
     414,   419,   424,   429,   430,   434,   439,   447,   452,   459,
     464,   469,   474,   479,   481,   483,   485,   487,   489,   491,
     493,   495,   497,   499,   500,   502,   506,   508,   510,   515,
     517,   519,   521,   523,   525,   527,   529,   530,   533,   535,
     539,   541,   543,   545,   547,   549,   551,   553,   555,   557,
     559,   561,   563
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      87,     0,    -1,    -1,    88,   120,    -1,    90,    -1,    89,
      90,    -1,   123,    91,    71,    -1,    67,    71,    -1,    -1,
      92,    69,    93,    -1,    -1,   139,    -1,    -1,    56,    95,
      89,    57,    -1,    99,    97,    -1,   120,    46,    -1,    96,
      -1,   101,    -1,    94,    -1,    -1,    12,   100,    62,    71,
      -1,    -1,    -1,    50,   102,    62,    71,   103,   104,    97,
      -1,    -1,   105,    71,    -1,   104,   105,    71,    -1,    -1,
      20,   106,   131,    62,    -1,    -1,    47,   109,    71,   108,
     111,   110,   125,    71,   113,    48,    71,    -1,    53,    -1,
      54,    -1,    49,   144,    45,   144,    71,    -1,    49,   144,
      71,    -1,    -1,   112,    71,    -1,   111,   112,    71,    -1,
       5,   144,    -1,    -1,   114,    71,    -1,   113,   114,    71,
      -1,    39,   144,    -1,    -1,    18,   115,   131,    62,    -1,
      -1,    51,    71,   117,   118,    52,    71,    -1,    -1,   118,
      71,    -1,   118,   119,    71,    -1,    40,   144,    -1,   121,
      -1,   120,   121,    -1,    -1,   122,   126,    -1,    67,    71,
      -1,   107,    -1,   116,    -1,    -1,   124,    -1,   124,   125,
      -1,   125,    -1,    55,    -1,   123,   127,    71,    -1,    98,
      -1,   133,    -1,   135,    -1,    13,    62,    -1,    14,    62,
      -1,    -1,    18,   128,   131,    62,    -1,    -1,    19,   129,
     131,    62,    72,   151,    -1,    -1,    20,   130,   131,    62,
      -1,    20,   150,    -1,    39,   144,    -1,     5,   144,    -1,
      40,   144,    -1,     3,   142,    -1,     4,   142,    -1,    21,
     144,    -1,    22,   144,    -1,    10,    -1,    11,    -1,     9,
      -1,    69,   139,    -1,    -1,    25,    -1,    26,    -1,    27,
      -1,   132,    -1,    62,    -1,   137,    72,   144,    -1,   137,
      72,    73,   144,    -1,   137,    72,    74,   144,    -1,   137,
      72,    75,   144,    -1,   137,    72,   144,    76,   144,    -1,
     137,    72,   144,    74,   144,    -1,   137,    72,   144,    77,
     144,    -1,   137,    72,   144,    41,   144,    -1,   137,    72,
     144,    78,   144,    -1,   137,    72,   144,    79,   144,    -1,
     137,    72,   144,    80,   144,    -1,   137,    72,   144,    23,
     144,    -1,   137,    72,   144,    24,   144,    -1,   137,    72,
     144,    42,   144,    -1,   137,    72,   144,    43,   144,    -1,
     137,    72,   144,    44,   144,    -1,   137,    72,   144,    29,
     144,    -1,   137,    72,   144,    81,   144,    -1,   137,    72,
     144,    82,   144,    -1,   137,    72,   144,    75,   144,    -1,
     137,    72,   144,    83,   145,    84,    -1,   144,    83,   145,
      84,    72,   144,    -1,   137,    72,     8,   132,    45,   144,
      -1,   137,    72,     8,   132,    -1,   137,    72,    28,   144,
      -1,   137,    72,    28,   144,    83,   145,    84,    -1,   137,
      72,    38,   144,    -1,   137,    72,    37,    62,    -1,   137,
      72,    36,   152,    -1,    36,   152,    72,   144,    -1,    -1,
       8,   134,    93,    -1,    28,   137,    45,   144,    -1,    28,
     137,    45,   144,    83,   145,    84,    -1,    38,   137,    45,
     144,    -1,     6,   144,   136,   144,     4,   142,    -1,     6,
     144,     4,   142,    -1,     7,   144,     4,   142,    -1,     6,
     144,    45,   142,    -1,     7,   144,    45,   142,    -1,    30,
      -1,    31,    -1,    32,    -1,    33,    -1,    34,    -1,    35,
      -1,    70,    -1,   150,    -1,    70,    -1,   150,    -1,    -1,
     140,    -1,   140,    45,   141,    -1,   141,    -1,   143,    -1,
     138,    83,   145,    84,    -1,    62,    -1,    69,    -1,    62,
      -1,    69,    -1,   144,    -1,    70,    -1,   149,    -1,    -1,
     146,   147,    -1,   148,    -1,   147,    85,   148,    -1,   144,
      -1,   150,    -1,   151,    -1,    58,    -1,    59,    -1,    60,
      -1,    61,    -1,    66,    -1,    64,    -1,    65,    -1,    63,
      -1,    60,    -1,    63,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   439,   439,   439,   447,   448,   451,   452,   455,   455,
     457,   459,   464,   463,   472,   476,   485,   486,   487,   490,
     490,   496,   498,   496,   507,   508,   509,   512,   512,   516,
     516,   539,   540,   543,   547,   552,   553,   554,   557,   560,
     561,   562,   565,   566,   566,   569,   569,   585,   586,   587,
     590,   593,   594,   597,   597,   599,   600,   601,   604,   605,
     608,   609,   612,   615,   617,   619,   621,   622,   623,   624,
     624,   625,   625,   627,   627,   629,   630,   631,   632,   633,
     634,   635,   636,   637,   638,   639,   640,   641,   644,   646,
     647,   648,   651,   655,   657,   658,   659,   660,   661,   662,
     663,   664,   665,   666,   667,   668,   669,   670,   671,   672,
     673,   674,   675,   676,   677,   678,   679,   680,   681,   683,
     685,   687,   688,   689,   689,   691,   692,   694,   697,   699,
     700,   701,   702,   706,   708,   709,   710,   711,   712,   716,
     717,   719,   720,   723,   724,   727,   728,   731,   732,   736,
     738,   740,   742,   743,   746,   747,   750,   750,   754,   755,
     758,   761,   762,   765,   766,   767,   768,   769,   772,   773,
     774,   777,   778
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
  "PCC_END_RETURN", "PROTOTYPED", "NON_PROTOTYPED", "LABEL", "EMIT", 
  "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "STRINGC", "INTC", 
  "FLOATC", "REG", "MACRO", "ENDM", "PARROT_OP", "VAR", "'\\n'", "'='", 
  "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'.'", "'&'", "'|'", 
  "'['", "']'", "';'", "$accept", "program", "@1", "pasmcode", "pasmline", 
  "pasm_inst", "@2", "pasm_args", "emit", "@3", "nsub", "sub_body", "sub", 
  "sub_start", "@4", "pcc_sub", "@5", "@6", "pcc_params", "pcc_param", 
  "@7", "pcc_sub_call", "@8", "pcc_proto", "pcc_call", "pcc_args", 
  "pcc_arg", "pcc_results", "pcc_result", "@9", "pcc_ret", "@10", 
  "pcc_returns", "pcc_return", "statements", "statement", "@11", "labels", 
  "_labels", "label", "instruction", "labeled_inst", "@12", "@13", "@14", 
  "type", "classname", "assignment", "@15", "if_statement", "relop", 
  "target", "lhs", "vars", "_vars", "_var_or_i", "label_op", "var_or_i", 
  "var", "keylist", "@16", "_keylist", "key", "rc", "reg", "const", 
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
     325,    10,    61,    33,    45,   126,    43,    42,    47,    37,
      46,    38,   124,    91,    93,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    86,    88,    87,    89,    89,    90,    90,    92,    91,
      91,    93,    95,    94,    96,    97,    98,    98,    98,   100,
      99,   102,   103,   101,   104,   104,   104,   106,   105,   108,
     107,   109,   109,   110,   110,   111,   111,   111,   112,   113,
     113,   113,   114,   115,   114,   117,   116,   118,   118,   118,
     119,   120,   120,   122,   121,   121,   121,   121,   123,   123,
     124,   124,   125,   126,   126,   127,   127,   127,   127,   128,
     127,   129,   127,   130,   127,   127,   127,   127,   127,   127,
     127,   127,   127,   127,   127,   127,   127,   127,   131,   131,
     131,   131,   132,   133,   133,   133,   133,   133,   133,   133,
     133,   133,   133,   133,   133,   133,   133,   133,   133,   133,
     133,   133,   133,   133,   133,   133,   133,   133,   133,   133,
     133,   133,   133,   134,   133,   133,   133,   133,   135,   135,
     135,   135,   135,   136,   136,   136,   136,   136,   136,   137,
     137,   138,   138,   139,   139,   140,   140,   141,   141,   142,
     142,   143,   143,   143,   144,   144,   146,   145,   147,   147,
     148,   149,   149,   150,   150,   150,   150,   150,   151,   151,
     151,   152,   152
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     2,     3,     2,     0,     3,
       0,     1,     0,     4,     2,     2,     1,     1,     1,     0,
       4,     0,     0,     7,     0,     2,     3,     0,     4,     0,
      11,     1,     1,     5,     3,     0,     2,     3,     2,     0,
       2,     3,     2,     0,     4,     0,     6,     0,     2,     3,
       2,     1,     2,     0,     2,     2,     1,     1,     0,     1,
       2,     1,     1,     3,     1,     1,     1,     2,     2,     0,
       4,     0,     6,     0,     4,     2,     2,     2,     2,     2,
       2,     2,     2,     1,     1,     1,     2,     0,     1,     1,
       1,     1,     1,     3,     4,     4,     4,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     6,     6,     6,     4,     4,     7,     4,
       4,     4,     4,     0,     3,     4,     7,     4,     6,     4,
       4,     4,     4,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     0,     1,     3,     1,     1,     4,     1,
       1,     1,     1,     1,     1,     1,     0,     2,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,    53,     1,     0,     0,     0,    56,    57,    53,
      51,    58,    31,    32,     0,    45,    55,    52,    19,    21,
      62,    12,    18,    16,    64,    53,    17,    87,    59,    61,
      54,    29,    47,     0,     0,    58,    14,    53,     0,     0,
       0,     0,     0,   123,    85,    83,    84,     0,     0,    69,
      71,    73,     0,     0,     0,     0,     0,     0,     0,   163,
     164,   165,   166,   170,   168,   169,   167,   143,   139,     0,
      65,    66,     0,     0,   155,   140,   162,    60,    35,     0,
       0,     0,     0,    58,     4,     8,    15,   149,   150,    79,
      80,   154,    77,   161,     0,     0,   143,    67,    68,     0,
       0,     0,    75,    81,    82,   139,     0,   140,   171,   172,
       0,     0,    76,    78,   151,   152,   154,     0,    86,   144,
     146,   147,   153,   161,    63,     0,   156,     0,     0,     0,
       0,     0,    48,     0,    20,    22,     7,    13,     5,     0,
       0,     0,   133,   134,   135,   136,   137,   138,     0,     0,
       0,     0,   124,    11,    88,    89,    90,    92,     0,    91,
       0,     0,     0,     0,     0,   156,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    93,     0,     0,    38,     0,
       0,     0,    36,    50,    46,    49,    24,     6,   143,   129,
     131,     0,   130,   132,    70,     0,    74,   125,   122,   127,
       0,   145,   116,   117,   121,   120,   119,    94,    95,    96,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   156,     0,   160,   157,
     158,     0,     0,    37,    27,    53,     0,     9,     0,     0,
     156,   148,     0,   156,   104,   105,   109,   100,   106,   107,
     108,    98,   112,    97,    99,   101,   102,   103,   110,   111,
       0,     0,     0,     0,    34,    39,     0,    23,     0,    25,
     128,    72,     0,   115,     0,   113,   114,   159,     0,    43,
       0,     0,     0,     0,    26,   126,   118,    33,     0,    42,
       0,     0,    40,    28,     0,    30,    41,    44
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,    83,    84,   139,   140,   152,    22,    35,
      23,    36,    24,    25,    33,    26,    34,   186,   235,   236,
     266,     7,    78,    14,   180,   128,   129,   281,   282,   288,
       8,    32,    79,   133,    37,    10,    11,    85,    28,    29,
      30,    69,    99,   100,   101,   158,   159,    70,    96,    71,
     149,    72,   117,   153,   119,   120,    89,   121,   122,   176,
     177,   229,   230,    74,    93,    76,   110
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -165
static const short yypact[] =
{
    -165,    27,    14,  -165,   -11,   -49,   -42,  -165,  -165,     4,
    -165,     8,  -165,  -165,   -19,  -165,  -165,  -165,  -165,  -165,
    -165,  -165,  -165,  -165,  -165,    14,  -165,   203,    12,  -165,
    -165,  -165,  -165,   -16,    -3,    22,  -165,    72,   -41,   -41,
     236,   236,   236,  -165,  -165,  -165,  -165,    11,    26,  -165,
    -165,    49,   236,   236,   249,   -55,   249,   236,   236,  -165,
    -165,  -165,  -165,  -165,  -165,  -165,  -165,    98,   -15,    19,
    -165,  -165,    24,    18,  -165,    23,  -165,  -165,    86,   -17,
      28,    31,    34,   -23,  -165,    41,  -165,  -165,  -165,  -165,
    -165,  -165,  -165,  -165,    52,     3,    98,  -165,  -165,    -9,
      -9,    -9,  -165,  -165,  -165,  -165,    71,  -165,  -165,  -165,
      45,    75,  -165,  -165,  -165,  -165,    38,    55,  -165,    79,
    -165,  -165,  -165,    57,  -165,   218,  -165,   236,     1,    78,
     236,    80,  -165,    82,  -165,  -165,  -165,  -165,  -165,    83,
      73,   -41,  -165,  -165,  -165,  -165,  -165,  -165,   -41,   236,
     -41,   -41,  -165,  -165,  -165,  -165,  -165,  -165,    81,  -165,
     103,   104,   236,   236,   236,  -165,    98,   107,   236,   -55,
     112,   236,   236,   236,   236,    51,    91,   236,  -165,   236,
      12,   105,  -165,  -165,  -165,  -165,   158,  -165,    98,  -165,
    -165,   175,  -165,  -165,  -165,   109,  -165,    97,  -165,  -165,
     116,  -165,   137,   119,  -165,  -165,  -165,  -165,  -165,  -165,
     236,   236,   236,   236,   236,   236,   236,   236,   236,   236,
     236,   236,   236,   236,   236,   236,  -165,   131,  -165,   120,
    -165,    -5,   133,  -165,  -165,   -10,   147,  -165,   -41,   108,
    -165,  -165,   236,  -165,  -165,  -165,  -165,  -165,  -165,  -165,
    -165,  -165,  -165,  -165,  -165,  -165,  -165,  -165,  -165,  -165,
     135,   236,   236,   236,  -165,     6,    -9,  -165,   149,  -165,
    -165,  -165,   143,  -165,   144,  -165,  -165,  -165,   159,  -165,
     236,    21,   161,   167,  -165,  -165,  -165,  -165,    -9,  -165,
     162,   166,  -165,  -165,   176,  -165,  -165,  -165
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -165,  -165,  -165,  -165,   157,  -165,  -165,    56,  -165,  -165,
    -165,    13,  -165,  -165,  -165,  -165,  -165,  -165,  -165,    15,
    -165,  -165,  -165,  -165,  -165,  -165,   117,  -165,   -34,  -165,
    -165,  -165,  -165,  -165,   247,    10,  -165,   240,  -165,   -25,
    -165,  -165,  -165,  -165,  -165,   -89,    85,  -165,  -165,  -165,
    -165,    16,  -165,   190,  -165,    92,   -37,  -165,   -27,  -164,
    -165,  -165,    -2,  -165,   -18,    20,    96
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -162
static const short yytable[] =
{
      73,   200,    90,    77,    -3,   108,   127,   150,   109,    75,
     234,   160,   161,    92,    94,    95,   154,   155,   156,    17,
      18,    87,    15,   130,   279,   103,   104,     3,    88,    16,
     112,   113,    20,   102,   137,   131,   107,     4,   107,   279,
     263,     5,    12,    13,    82,   280,    80,    17,   151,   123,
     179,     4,    31,   157,   132,     5,   141,     6,    19,    81,
     280,     4,   260,    20,    21,     5,   264,    20,  -154,   290,
     106,     6,   111,    97,   210,   211,   272,    20,   123,   274,
     212,     6,   142,   143,   144,   145,   146,   147,    98,    82,
     124,   127,   213,   214,   215,   216,   125,   148,   175,   134,
     178,   126,   135,   183,   189,   136,  -161,    59,    60,    61,
      62,   190,   -10,   192,   193,    66,   162,   163,    86,     4,
     164,  -141,   191,     5,   166,   217,   218,   219,   220,   221,
     222,   223,   224,   225,   226,   197,   198,   199,   165,     6,
    -142,   203,   188,   194,   206,   207,   208,   209,   123,   182,
     228,   184,   231,   185,   187,   232,    59,    60,    61,    62,
     114,    63,    64,    65,    66,   195,   196,   115,   116,   157,
     123,    63,    64,    65,   205,   227,   233,   283,   234,   238,
     240,   239,   242,   244,   245,   246,   247,   248,   249,   250,
     251,   252,   253,   254,   255,   256,   257,   258,   259,   294,
     241,   270,   243,   261,   265,   262,    38,    39,    40,    41,
      42,    43,    44,    45,    46,   273,    47,    48,   269,   275,
     284,    49,    50,    51,    52,    53,   167,   285,   286,   293,
     287,    54,   292,   295,   276,   228,   278,   296,   297,    55,
     138,    56,    57,    58,   237,   181,   168,   291,   267,     9,
     268,    27,   202,   289,   169,   170,   171,   118,   201,   271,
     277,    59,    60,    61,    62,   204,    63,    64,    65,    66,
       0,     0,    67,    68,     0,     0,    59,    60,    61,    62,
       0,    63,    64,    65,    66,     0,     0,     0,    91,     0,
       0,   172,   173,   174,    59,    60,    61,    62,     0,    63,
      64,    65,    66,     0,     0,     0,    91,    59,    60,    61,
      62,     0,     0,     0,     0,    66,     0,     0,     0,   105
};

static const short yycheck[] =
{
      27,   165,    39,    28,     0,    60,     5,     4,    63,    27,
      20,   100,   101,    40,    41,    42,    25,    26,    27,     9,
      12,    62,    71,    40,    18,    52,    53,     0,    69,    71,
      57,    58,    55,    51,    57,    52,    54,    47,    56,    18,
      45,    51,    53,    54,    67,    39,    62,    37,    45,    67,
      49,    47,    71,    62,    71,    51,     4,    67,    50,    62,
      39,    47,   226,    55,    56,    51,    71,    55,    83,    48,
      54,    67,    56,    62,    23,    24,   240,    55,    96,   243,
      29,    67,    30,    31,    32,    33,    34,    35,    62,    67,
      71,     5,    41,    42,    43,    44,    72,    45,   125,    71,
     127,    83,    71,   130,   141,    71,    83,    58,    59,    60,
      61,   148,    71,   150,   151,    66,    45,    72,    46,    47,
      45,    83,   149,    51,    45,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,   162,   163,   164,    83,    67,
      83,   168,    69,    62,   171,   172,   173,   174,   166,    71,
     177,    71,   179,    71,    71,   180,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    62,    62,    69,    70,    62,
     188,    63,    64,    65,    62,    84,    71,   266,    20,     4,
      83,    72,    45,   210,   211,   212,   213,   214,   215,   216,
     217,   218,   219,   220,   221,   222,   223,   224,   225,   288,
      84,   238,    83,    72,    71,    85,     3,     4,     5,     6,
       7,     8,     9,    10,    11,   242,    13,    14,    71,    84,
      71,    18,    19,    20,    21,    22,     8,    84,    84,    62,
      71,    28,    71,    71,   261,   262,   263,    71,    62,    36,
      83,    38,    39,    40,   188,   128,    28,   281,   235,     2,
     235,    11,   167,   280,    36,    37,    38,    67,   166,   239,
     262,    58,    59,    60,    61,   169,    63,    64,    65,    66,
      -1,    -1,    69,    70,    -1,    -1,    58,    59,    60,    61,
      -1,    63,    64,    65,    66,    -1,    -1,    -1,    70,    -1,
      -1,    73,    74,    75,    58,    59,    60,    61,    -1,    63,
      64,    65,    66,    -1,    -1,    -1,    70,    58,    59,    60,
      61,    -1,    -1,    -1,    -1,    66,    -1,    -1,    -1,    70
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    87,    88,     0,    47,    51,    67,   107,   116,   120,
     121,   122,    53,    54,   109,    71,    71,   121,    12,    50,
      55,    56,    94,    96,    98,    99,   101,   123,   124,   125,
     126,    71,   117,   100,   102,    95,    97,   120,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    13,    14,    18,
      19,    20,    21,    22,    28,    36,    38,    39,    40,    58,
      59,    60,    61,    63,    64,    65,    66,    69,    70,   127,
     133,   135,   137,   144,   149,   150,   151,   125,   108,   118,
      62,    62,    67,    89,    90,   123,    46,    62,    69,   142,
     142,    70,   144,   150,   144,   144,   134,    62,    62,   128,
     129,   130,   150,   144,   144,    70,   137,   150,    60,    63,
     152,   137,   144,   144,    62,    69,    70,   138,   139,   140,
     141,   143,   144,   150,    71,    72,    83,     5,   111,   112,
      40,    52,    71,   119,    71,    71,    71,    57,    90,    91,
      92,     4,    30,    31,    32,    33,    34,    35,    45,   136,
       4,    45,    93,   139,    25,    26,    27,    62,   131,   132,
     131,   131,    45,    72,    45,    83,    45,     8,    28,    36,
      37,    38,    73,    74,    75,   144,   145,   146,   144,    49,
     110,   112,    71,   144,    71,    71,   103,    71,    69,   142,
     142,   144,   142,   142,    62,    62,    62,   144,   144,   144,
     145,   141,   132,   144,   152,    62,   144,   144,   144,   144,
      23,    24,    29,    41,    42,    43,    44,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,   144,   147,
     148,   144,   125,    71,    20,   104,   105,    93,     4,    72,
      83,    84,    45,    83,   144,   144,   144,   144,   144,   144,
     144,   144,   144,   144,   144,   144,   144,   144,   144,   144,
     145,    72,    85,    45,    71,    71,   106,    97,   105,    71,
     142,   151,   145,   144,   145,    84,   144,   148,   144,    18,
      39,   113,   114,   131,    71,    84,    84,    71,   115,   144,
      48,   114,    71,    62,   131,    71,    71,    62
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
#line 439 "imcc.y"
    { open_comp_unit(); }
    break;

  case 3:
#line 440 "imcc.y"
    { yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 6:
#line 451 "imcc.y"
    { yyval.i = 0; }
    break;

  case 7:
#line 452 "imcc.y"
    { yyval.i = 0; }
    break;

  case 8:
#line 455 "imcc.y"
    {clear_state();}
    break;

  case 9:
#line 456 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs,1); free(yyvsp[-1].s); }
    break;

  case 10:
#line 457 "imcc.y"
    { yyval.i = 0;}
    break;

  case 12:
#line 464 "imcc.y"
    { open_comp_unit();
                                          function = "(emit)"; }
    break;

  case 13:
#line 467 "imcc.y"
    { if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); yyval.i=0;}
    break;

  case 15:
#line 478 "imcc.y"
    {
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 19:
#line 490 "imcc.y"
    { open_comp_unit(); }
    break;

  case 20:
#line 492 "imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 21:
#line 496 "imcc.y"
    { open_comp_unit(); }
    break;

  case 22:
#line 498 "imcc.y"
    {
          char *name = str_dup(yyvsp[-1].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
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

           }
    break;

  case 30:
#line 536 "imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 539 "imcc.y"
    { yyval.t = 1; }
    break;

  case 32:
#line 540 "imcc.y"
    { yyval.t = 0; }
    break;

  case 33:
#line 543 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 34:
#line 547 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 35:
#line 552 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 36:
#line 553 "imcc.y"
    {  add_pcc_arg(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 37:
#line 554 "imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 38:
#line 557 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 39:
#line 560 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 40:
#line 561 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 41:
#line 562 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-7].sr, yyvsp[-1].sr); }
    break;

  case 42:
#line 565 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 43:
#line 566 "imcc.y"
    { is_def=1; }
    break;

  case 44:
#line 566 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 45:
#line 569 "imcc.y"
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

  case 46:
#line 582 "imcc.y"
    { yyval.i = 0; }
    break;

  case 47:
#line 585 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 48:
#line 586 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 49:
#line 587 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 50:
#line 590 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 53:
#line 597 "imcc.y"
    { clear_state(); }
    break;

  case 54:
#line 598 "imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 55:
#line 599 "imcc.y"
    { yyval.i = 0; }
    break;

  case 56:
#line 600 "imcc.y"
    { yyval.i = 0; }
    break;

  case 58:
#line 604 "imcc.y"
    { yyval.i = NULL; }
    break;

  case 62:
#line 612 "imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 63:
#line 616 "imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 67:
#line 622 "imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 68:
#line 623 "imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 69:
#line 624 "imcc.y"
    { is_def=1; }
    break;

  case 70:
#line 624 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 71:
#line 625 "imcc.y"
    { is_def=1; }
    break;

  case 72:
#line 626 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr);is_def=0; }
    break;

  case 73:
#line 627 "imcc.y"
    { is_def=1; }
    break;

  case 74:
#line 627 "imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            R1(mk_ident(yyvsp[0].s, yyvsp[-1].t)));is_def=0; }
    break;

  case 75:
#line 629 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 76:
#line 630 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 77:
#line 631 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 78:
#line 632 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 79:
#line 633 "imcc.y"
    { yyval.i = MK_I(interp, "bsr",  R1(yyvsp[0].sr)); }
    break;

  case 80:
#line 634 "imcc.y"
    { yyval.i = MK_I(interp, "branch",R1(yyvsp[0].sr)); }
    break;

  case 81:
#line 635 "imcc.y"
    { yyval.i = MK_I(interp, "inc",R1(yyvsp[0].sr)); }
    break;

  case 82:
#line 636 "imcc.y"
    { yyval.i = MK_I(interp, "dec",R1(yyvsp[0].sr)); }
    break;

  case 83:
#line 637 "imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,R0()); }
    break;

  case 84:
#line 638 "imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,R0()); }
    break;

  case 85:
#line 639 "imcc.y"
    { yyval.i = MK_I(interp, "end" ,R0()); }
    break;

  case 86:
#line 640 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs, 1); free(yyvsp[-1].s); }
    break;

  case 87:
#line 641 "imcc.y"
    { yyval.i = 0;}
    break;

  case 88:
#line 645 "imcc.y"
    { yyval.t = 'I'; }
    break;

  case 89:
#line 646 "imcc.y"
    { yyval.t = 'N'; }
    break;

  case 90:
#line 647 "imcc.y"
    { yyval.t = 'S'; }
    break;

  case 91:
#line 648 "imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 93:
#line 656 "imcc.y"
    { yyval.i = MK_I(interp, "set", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 94:
#line 657 "imcc.y"
    { yyval.i = MK_I(interp, "not", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 95:
#line 658 "imcc.y"
    { yyval.i = MK_I(interp, "neg", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 96:
#line 659 "imcc.y"
    { yyval.i = MK_I(interp, "bnot", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 97:
#line 660 "imcc.y"
    { yyval.i = MK_I(interp, "add", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 98:
#line 661 "imcc.y"
    { yyval.i = MK_I(interp, "sub", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 99:
#line 662 "imcc.y"
    { yyval.i = MK_I(interp, "mul", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 100:
#line 663 "imcc.y"
    { yyval.i = MK_I(interp, "pow", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 101:
#line 664 "imcc.y"
    { yyval.i = MK_I(interp, "div", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 102:
#line 665 "imcc.y"
    { yyval.i = MK_I(interp, "mod", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 103:
#line 666 "imcc.y"
    { yyval.i = MK_I(interp, "concat", R3(yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 104:
#line 667 "imcc.y"
    { yyval.i = MK_I(interp, "shl", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 105:
#line 668 "imcc.y"
    { yyval.i = MK_I(interp, "shr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 106:
#line 669 "imcc.y"
    { yyval.i = MK_I(interp, "lsr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 107:
#line 670 "imcc.y"
    { yyval.i = MK_I(interp, "and", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 108:
#line 671 "imcc.y"
    { yyval.i = MK_I(interp, "or", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 109:
#line 672 "imcc.y"
    { yyval.i = MK_I(interp, "xor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 110:
#line 673 "imcc.y"
    { yyval.i = MK_I(interp, "band", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 111:
#line 674 "imcc.y"
    { yyval.i = MK_I(interp, "bor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 112:
#line 675 "imcc.y"
    { yyval.i = MK_I(interp, "bxor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 113:
#line 676 "imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 114:
#line 677 "imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 115:
#line 678 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 116:
#line 679 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 117:
#line 680 "imcc.y"
    { yyval.i = MK_I(interp, "defined",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 118:
#line 681 "imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", R3(yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 119:
#line 683 "imcc.y"
    { yyval.i = MK_I(interp, "clone",R2(yyvsp[-3].sr, yyvsp[0].sr));
    }
    break;

  case 120:
#line 685 "imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          R2(yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once))); }
    break;

  case 121:
#line 687 "imcc.y"
    { yyval.i = MK_I(interp, "find_global",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 122:
#line 688 "imcc.y"
    { yyval.i = MK_I(interp, "store_global",R2(yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 123:
#line 689 "imcc.y"
    { expect_pasm = 1; }
    break;

  case 124:
#line 690 "imcc.y"
    { yyval.i = iANY(interp, "new",0,regs,1);  }
    break;

  case 125:
#line 691 "imcc.y"
    { yyval.i = MK_I(interp, "defined", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 126:
#line 692 "imcc.y"
    { keyvec=KEY_BIT(2);
                                       yyval.i = MK_I(interp, "defined", R3(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 127:
#line 694 "imcc.y"
    { yyval.i = MK_I(interp, "clone", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 128:
#line 698 "imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,R3(yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 129:
#line 699 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 130:
#line 700 "imcc.y"
    {yyval.i= MK_I(interp, "unless",R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 131:
#line 701 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 132:
#line 702 "imcc.y"
    {yyval.i= MK_I(interp, "unless", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 133:
#line 707 "imcc.y"
    { yyval.s = "eq"; }
    break;

  case 134:
#line 708 "imcc.y"
    { yyval.s = "ne"; }
    break;

  case 135:
#line 709 "imcc.y"
    { yyval.s = "gt"; }
    break;

  case 136:
#line 710 "imcc.y"
    { yyval.s = "ge"; }
    break;

  case 137:
#line 711 "imcc.y"
    { yyval.s = "lt"; }
    break;

  case 138:
#line 712 "imcc.y"
    { yyval.s = "le"; }
    break;

  case 143:
#line 723 "imcc.y"
    { yyval.sr = NULL; }
    break;

  case 144:
#line 724 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 145:
#line 727 "imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 147:
#line 731 "imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 148:
#line 732 "imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 149:
#line 737 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 150:
#line 738 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 151:
#line 741 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 152:
#line 742 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 156:
#line 750 "imcc.y"
    { nkeys=0; }
    break;

  case 157:
#line 751 "imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 158:
#line 754 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 159:
#line 755 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 163:
#line 765 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 164:
#line 766 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 165:
#line 767 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 166:
#line 768 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 167:
#line 769 "imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 168:
#line 772 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 169:
#line 773 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 170:
#line 774 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 171:
#line 777 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 172:
#line 778 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2531 "imcparser.c"

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


#line 780 "imcc.y"



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

