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
#define YYLAST   302

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  86
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  68
/* YYNRULES -- Number of rules. */
#define YYNRULES  174
/* YYNRULES -- Number of states. */
#define YYNSTATES  300

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
      46,    51,    52,    53,    62,    63,    66,    70,    71,    76,
      77,    89,    91,    93,    94,    96,   102,   106,   107,   110,
     114,   117,   118,   121,   125,   128,   129,   134,   135,   142,
     143,   146,   150,   153,   155,   158,   159,   162,   165,   167,
     169,   170,   172,   175,   177,   179,   183,   185,   187,   189,
     192,   195,   196,   201,   202,   209,   210,   215,   218,   221,
     224,   227,   230,   233,   236,   239,   241,   243,   245,   248,
     249,   251,   253,   255,   257,   259,   263,   268,   273,   278,
     284,   290,   296,   302,   308,   314,   320,   326,   332,   338,
     344,   350,   356,   362,   368,   374,   381,   388,   395,   400,
     405,   413,   418,   423,   428,   433,   434,   438,   443,   451,
     456,   463,   468,   473,   478,   483,   485,   487,   489,   491,
     493,   495,   497,   499,   501,   503,   504,   506,   510,   512,
     514,   519,   521,   523,   525,   527,   529,   531,   533,   534,
     537,   539,   543,   545,   547,   549,   551,   553,   555,   557,
     559,   561,   563,   565,   567
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      87,     0,    -1,    -1,    88,   121,    -1,    90,    -1,    89,
      90,    -1,   124,    91,    71,    -1,    67,    71,    -1,    -1,
      92,    69,    93,    -1,    -1,   140,    -1,    -1,    56,    95,
      89,    57,    -1,    99,    97,    -1,   121,    46,    -1,    96,
      -1,   101,    -1,    94,    -1,    -1,    12,   100,    62,    71,
      -1,    -1,    -1,    50,   102,    62,   110,    71,   103,   104,
      97,    -1,    -1,   105,    71,    -1,   104,   105,    71,    -1,
      -1,    20,   106,   132,    62,    -1,    -1,    47,   109,    71,
     108,   112,   111,   126,    71,   114,    48,    71,    -1,    53,
      -1,    54,    -1,    -1,   109,    -1,    49,   145,    45,   145,
      71,    -1,    49,   145,    71,    -1,    -1,   113,    71,    -1,
     112,   113,    71,    -1,     5,   145,    -1,    -1,   115,    71,
      -1,   114,   115,    71,    -1,    39,   145,    -1,    -1,    18,
     116,   132,    62,    -1,    -1,    51,    71,   118,   119,    52,
      71,    -1,    -1,   119,    71,    -1,   119,   120,    71,    -1,
      40,   145,    -1,   122,    -1,   121,   122,    -1,    -1,   123,
     127,    -1,    67,    71,    -1,   107,    -1,   117,    -1,    -1,
     125,    -1,   125,   126,    -1,   126,    -1,    55,    -1,   124,
     128,    71,    -1,    98,    -1,   134,    -1,   136,    -1,    13,
      62,    -1,    14,    62,    -1,    -1,    18,   129,   132,    62,
      -1,    -1,    19,   130,   132,    62,    72,   152,    -1,    -1,
      20,   131,   132,    62,    -1,    20,   151,    -1,    39,   145,
      -1,     5,   145,    -1,    40,   145,    -1,     3,   143,    -1,
       4,   143,    -1,    21,   145,    -1,    22,   145,    -1,    10,
      -1,    11,    -1,     9,    -1,    69,   140,    -1,    -1,    25,
      -1,    26,    -1,    27,    -1,   133,    -1,    62,    -1,   138,
      72,   145,    -1,   138,    72,    73,   145,    -1,   138,    72,
      74,   145,    -1,   138,    72,    75,   145,    -1,   138,    72,
     145,    76,   145,    -1,   138,    72,   145,    74,   145,    -1,
     138,    72,   145,    77,   145,    -1,   138,    72,   145,    41,
     145,    -1,   138,    72,   145,    78,   145,    -1,   138,    72,
     145,    79,   145,    -1,   138,    72,   145,    80,   145,    -1,
     138,    72,   145,    23,   145,    -1,   138,    72,   145,    24,
     145,    -1,   138,    72,   145,    42,   145,    -1,   138,    72,
     145,    43,   145,    -1,   138,    72,   145,    44,   145,    -1,
     138,    72,   145,    29,   145,    -1,   138,    72,   145,    81,
     145,    -1,   138,    72,   145,    82,   145,    -1,   138,    72,
     145,    75,   145,    -1,   138,    72,   145,    83,   146,    84,
      -1,   145,    83,   146,    84,    72,   145,    -1,   138,    72,
       8,   133,    45,   145,    -1,   138,    72,     8,   133,    -1,
     138,    72,    28,   145,    -1,   138,    72,    28,   145,    83,
     146,    84,    -1,   138,    72,    38,   145,    -1,   138,    72,
      37,    62,    -1,   138,    72,    36,   153,    -1,    36,   153,
      72,   145,    -1,    -1,     8,   135,    93,    -1,    28,   138,
      45,   145,    -1,    28,   138,    45,   145,    83,   146,    84,
      -1,    38,   138,    45,   145,    -1,     6,   145,   137,   145,
       4,   143,    -1,     6,   145,     4,   143,    -1,     7,   145,
       4,   143,    -1,     6,   145,    45,   143,    -1,     7,   145,
      45,   143,    -1,    30,    -1,    31,    -1,    32,    -1,    33,
      -1,    34,    -1,    35,    -1,    70,    -1,   151,    -1,    70,
      -1,   151,    -1,    -1,   141,    -1,   141,    45,   142,    -1,
     142,    -1,   144,    -1,   139,    83,   146,    84,    -1,    62,
      -1,    69,    -1,    62,    -1,    69,    -1,   145,    -1,    70,
      -1,   150,    -1,    -1,   147,   148,    -1,   149,    -1,   148,
      85,   149,    -1,   145,    -1,   151,    -1,   152,    -1,    58,
      -1,    59,    -1,    60,    -1,    61,    -1,    66,    -1,    64,
      -1,    65,    -1,    63,    -1,    60,    -1,    63,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   439,   439,   439,   447,   448,   451,   452,   455,   455,
     457,   459,   464,   463,   472,   476,   485,   486,   487,   490,
     490,   496,   498,   496,   508,   509,   510,   513,   513,   517,
     517,   540,   541,   544,   545,   548,   552,   557,   558,   559,
     562,   565,   566,   567,   570,   571,   571,   574,   574,   590,
     591,   592,   595,   598,   599,   602,   602,   604,   605,   606,
     609,   610,   613,   614,   617,   620,   622,   624,   626,   627,
     628,   629,   629,   630,   630,   632,   632,   634,   635,   636,
     637,   638,   639,   640,   641,   642,   643,   644,   645,   646,
     649,   651,   652,   653,   656,   660,   662,   663,   664,   665,
     666,   667,   668,   669,   670,   671,   672,   673,   674,   675,
     676,   677,   678,   679,   680,   681,   682,   683,   684,   685,
     686,   688,   690,   692,   693,   694,   694,   696,   697,   699,
     702,   704,   705,   706,   707,   711,   713,   714,   715,   716,
     717,   721,   722,   724,   725,   728,   729,   732,   733,   736,
     737,   741,   743,   745,   747,   748,   751,   752,   755,   755,
     759,   760,   763,   766,   767,   770,   771,   772,   773,   774,
     777,   778,   779,   782,   783
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
  "@7", "pcc_sub_call", "@8", "pcc_proto", "pcc_sub_proto", "pcc_call", 
  "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@9", "pcc_ret", 
  "@10", "pcc_returns", "pcc_return", "statements", "statement", "@11", 
  "labels", "_labels", "label", "instruction", "labeled_inst", "@12", 
  "@13", "@14", "type", "classname", "assignment", "@15", "if_statement", 
  "relop", "target", "lhs", "vars", "_vars", "_var_or_i", "label_op", 
  "var_or_i", "var", "keylist", "@16", "_keylist", "key", "rc", "reg", 
  "const", "string", 0
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
     107,   109,   109,   110,   110,   111,   111,   112,   112,   112,
     113,   114,   114,   114,   115,   116,   115,   118,   117,   119,
     119,   119,   120,   121,   121,   123,   122,   122,   122,   122,
     124,   124,   125,   125,   126,   127,   127,   128,   128,   128,
     128,   129,   128,   130,   128,   131,   128,   128,   128,   128,
     128,   128,   128,   128,   128,   128,   128,   128,   128,   128,
     132,   132,   132,   132,   133,   134,   134,   134,   134,   134,
     134,   134,   134,   134,   134,   134,   134,   134,   134,   134,
     134,   134,   134,   134,   134,   134,   134,   134,   134,   134,
     134,   134,   134,   134,   134,   135,   134,   134,   134,   134,
     136,   136,   136,   136,   136,   137,   137,   137,   137,   137,
     137,   138,   138,   139,   139,   140,   140,   141,   141,   142,
     142,   143,   143,   144,   144,   144,   145,   145,   147,   146,
     148,   148,   149,   150,   150,   151,   151,   151,   151,   151,
     152,   152,   152,   153,   153
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     2,     3,     2,     0,     3,
       0,     1,     0,     4,     2,     2,     1,     1,     1,     0,
       4,     0,     0,     8,     0,     2,     3,     0,     4,     0,
      11,     1,     1,     0,     1,     5,     3,     0,     2,     3,
       2,     0,     2,     3,     2,     0,     4,     0,     6,     0,
       2,     3,     2,     1,     2,     0,     2,     2,     1,     1,
       0,     1,     2,     1,     1,     3,     1,     1,     1,     2,
       2,     0,     4,     0,     6,     0,     4,     2,     2,     2,
       2,     2,     2,     2,     2,     1,     1,     1,     2,     0,
       1,     1,     1,     1,     1,     3,     4,     4,     4,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     6,     6,     6,     4,     4,
       7,     4,     4,     4,     4,     0,     3,     4,     7,     4,
       6,     4,     4,     4,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     1,     3,     1,     1,
       4,     1,     1,     1,     1,     1,     1,     1,     0,     2,
       1,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,    55,     1,     0,     0,     0,    58,    59,    55,
      53,    60,    31,    32,     0,    47,    57,    54,    19,    21,
      64,    12,    18,    16,    66,    55,    17,    89,    61,    63,
      56,    29,    49,     0,     0,    60,    14,    55,     0,     0,
       0,     0,     0,   125,    87,    85,    86,     0,     0,    71,
      73,    75,     0,     0,     0,     0,     0,     0,     0,   165,
     166,   167,   168,   172,   170,   171,   169,   145,   141,     0,
      67,    68,     0,     0,   157,   142,   164,    62,    37,     0,
       0,    33,     0,    60,     4,     8,    15,   151,   152,    81,
      82,   156,    79,   163,     0,     0,   145,    69,    70,     0,
       0,     0,    77,    83,    84,   141,     0,   142,   173,   174,
       0,     0,    78,    80,   153,   154,   156,     0,    88,   146,
     148,   149,   155,   163,    65,     0,   158,     0,     0,     0,
       0,     0,    50,     0,    20,    34,     0,     7,    13,     5,
       0,     0,     0,   135,   136,   137,   138,   139,   140,     0,
       0,     0,     0,   126,    11,    90,    91,    92,    94,     0,
      93,     0,     0,     0,     0,     0,   158,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    95,     0,     0,    40,
       0,     0,     0,    38,    52,    48,    51,    22,     6,   145,
     131,   133,     0,   132,   134,    72,     0,    76,   127,   124,
     129,     0,   147,   118,   119,   123,   122,   121,    96,    97,
      98,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   158,     0,   162,
     159,   160,     0,     0,    39,    24,     9,     0,     0,   158,
     150,     0,   158,   106,   107,   111,   102,   108,   109,   110,
     100,   114,    99,   101,   103,   104,   105,   112,   113,     0,
       0,     0,     0,    36,    41,    27,    55,     0,   130,    74,
       0,   117,     0,   115,   116,   161,     0,    45,     0,     0,
       0,     0,    23,     0,    25,   128,   120,    35,     0,    44,
       0,     0,    42,     0,    26,     0,    30,    43,    28,    46
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,    83,    84,   140,   141,   153,    22,    35,
      23,    36,    24,    25,    33,    26,    34,   235,   266,   267,
     281,     7,    78,    14,   136,   181,   128,   129,   279,   280,
     288,     8,    32,    79,   133,    37,    10,    11,    85,    28,
      29,    30,    69,    99,   100,   101,   159,   160,    70,    96,
      71,   150,    72,   117,   154,   119,   120,    89,   121,   122,
     177,   178,   230,   231,    74,    93,    76,   110
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -166
static const short yypact[] =
{
    -166,     8,    12,  -166,    37,   -53,   -47,  -166,  -166,     4,
    -166,    10,  -166,  -166,   -15,  -166,  -166,  -166,  -166,  -166,
    -166,  -166,  -166,  -166,  -166,    12,  -166,   218,   -21,  -166,
    -166,  -166,  -166,     6,    11,   -48,  -166,    29,   -57,   -57,
     146,   146,   146,  -166,  -166,  -166,  -166,    32,    39,  -166,
    -166,    99,   146,   146,    58,     9,    58,   146,   146,  -166,
    -166,  -166,  -166,  -166,  -166,  -166,  -166,    23,    16,    35,
    -166,  -166,    41,    38,  -166,    42,  -166,  -166,   115,   -17,
      51,    37,    55,    40,  -166,    56,  -166,  -166,  -166,  -166,
    -166,  -166,  -166,  -166,    13,     7,    23,  -166,  -166,     2,
       2,     2,  -166,  -166,  -166,  -166,    84,  -166,  -166,  -166,
      60,    85,  -166,  -166,  -166,  -166,    50,    52,  -166,    89,
    -166,  -166,  -166,    61,  -166,   103,  -166,   146,     1,    72,
     146,    79,  -166,    81,  -166,  -166,    83,  -166,  -166,  -166,
     101,    86,   -57,  -166,  -166,  -166,  -166,  -166,  -166,   -57,
     146,   -57,   -57,  -166,  -166,  -166,  -166,  -166,  -166,   108,
    -166,   112,   113,   146,   146,   146,  -166,    23,   117,   146,
       9,   118,   146,   146,   146,   146,   219,    97,   146,  -166,
     146,   -21,   111,  -166,  -166,  -166,  -166,  -166,  -166,    23,
    -166,  -166,   179,  -166,  -166,  -166,   130,  -166,   120,  -166,
    -166,   129,  -166,   170,   134,  -166,  -166,  -166,  -166,  -166,
    -166,   146,   146,   146,   146,   146,   146,   146,   146,   146,
     146,   146,   146,   146,   146,   146,   146,  -166,   147,  -166,
     133,  -166,   -29,   149,  -166,   210,  -166,   -57,    45,  -166,
    -166,   146,  -166,  -166,  -166,  -166,  -166,  -166,  -166,  -166,
    -166,  -166,  -166,  -166,  -166,  -166,  -166,  -166,  -166,   157,
     146,   146,   146,  -166,    14,  -166,   -10,   173,  -166,  -166,
     161,  -166,   163,  -166,  -166,  -166,   178,  -166,   146,    22,
     181,     2,  -166,   182,  -166,  -166,  -166,  -166,     2,  -166,
     184,   188,  -166,   202,  -166,   203,  -166,  -166,  -166,  -166
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -166,  -166,  -166,  -166,   167,  -166,  -166,    77,  -166,  -166,
    -166,     3,  -166,  -166,  -166,  -166,  -166,  -166,  -166,     5,
    -166,  -166,  -166,   186,  -166,  -166,  -166,   140,  -166,    -9,
    -166,  -166,  -166,  -166,  -166,   270,    30,  -166,   262,  -166,
     -25,  -166,  -166,  -166,  -166,  -166,   -80,   106,  -166,  -166,
    -166,  -166,    48,  -166,   208,  -166,   119,   -37,  -166,   -27,
    -165,  -166,  -166,    19,  -166,   -18,    47,   121
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -164
static const short yytable[] =
{
      73,   201,    90,    77,    -3,    87,   127,    20,     3,    75,
     265,   151,    88,    92,    94,    95,   262,   142,    15,    82,
     161,   162,    18,   130,    16,   103,   104,   155,   156,   157,
     112,   113,   277,   102,    20,   131,   107,     4,   107,    17,
     277,     5,   263,   143,   144,   145,   146,   147,   148,   123,
     180,     4,   152,   278,   132,     5,    31,     6,   149,     4,
      19,   278,   259,     5,   158,    20,    21,    17,    80,   108,
     290,     6,   109,    81,   270,    86,     4,   272,   123,     6,
       5,    59,    60,    61,    62,   114,    63,    64,    65,    66,
      12,    13,   115,   116,    97,    20,     6,   138,   176,  -156,
     179,    98,   106,   184,   111,   190,   124,    82,    63,    64,
      65,   168,   191,   125,   193,   194,    59,    60,    61,    62,
     127,   126,   134,   192,    66,  -163,   137,   -10,   105,   163,
     165,   169,   164,  -143,   167,   166,   198,   199,   200,   170,
     171,   172,   204,   183,  -144,   207,   208,   209,   210,   123,
     185,   229,   186,   232,   187,   189,   233,    59,    60,    61,
      62,    59,    60,    61,    62,    66,    63,    64,    65,    66,
     195,   123,   188,    91,   196,   197,   173,   174,   175,   158,
     206,   228,   234,   237,   243,   244,   245,   246,   247,   248,
     249,   250,   251,   252,   253,   254,   255,   256,   257,   258,
     268,   293,   238,   239,    59,    60,    61,    62,   295,    63,
      64,    65,    66,   240,   271,   241,    91,   242,   261,   260,
     264,    38,    39,    40,    41,    42,    43,    44,    45,    46,
     265,    47,    48,   274,   229,   276,    49,    50,    51,    52,
      53,   273,   211,   212,   284,   285,    54,   286,   213,   287,
     139,   289,   292,   294,    55,   296,    56,    57,    58,   297,
     214,   215,   216,   217,   298,   299,   236,   135,   182,   282,
     291,   283,     9,    27,   203,   118,    59,    60,    61,    62,
     275,    63,    64,    65,    66,   269,   202,    67,    68,     0,
       0,   205,     0,   218,   219,   220,   221,   222,   223,   224,
     225,   226,   227
};

static const short yycheck[] =
{
      27,   166,    39,    28,     0,    62,     5,    55,     0,    27,
      20,     4,    69,    40,    41,    42,    45,     4,    71,    67,
     100,   101,    12,    40,    71,    52,    53,    25,    26,    27,
      57,    58,    18,    51,    55,    52,    54,    47,    56,     9,
      18,    51,    71,    30,    31,    32,    33,    34,    35,    67,
      49,    47,    45,    39,    71,    51,    71,    67,    45,    47,
      50,    39,   227,    51,    62,    55,    56,    37,    62,    60,
      48,    67,    63,    62,   239,    46,    47,   242,    96,    67,
      51,    58,    59,    60,    61,    62,    63,    64,    65,    66,
      53,    54,    69,    70,    62,    55,    67,    57,   125,    83,
     127,    62,    54,   130,    56,   142,    71,    67,    63,    64,
      65,     8,   149,    72,   151,   152,    58,    59,    60,    61,
       5,    83,    71,   150,    66,    83,    71,    71,    70,    45,
      45,    28,    72,    83,    45,    83,   163,   164,   165,    36,
      37,    38,   169,    71,    83,   172,   173,   174,   175,   167,
      71,   178,    71,   180,    71,    69,   181,    58,    59,    60,
      61,    58,    59,    60,    61,    66,    63,    64,    65,    66,
      62,   189,    71,    70,    62,    62,    73,    74,    75,    62,
      62,    84,    71,     4,   211,   212,   213,   214,   215,   216,
     217,   218,   219,   220,   221,   222,   223,   224,   225,   226,
     237,   281,    72,    83,    58,    59,    60,    61,   288,    63,
      64,    65,    66,    84,   241,    45,    70,    83,    85,    72,
      71,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      20,    13,    14,   260,   261,   262,    18,    19,    20,    21,
      22,    84,    23,    24,    71,    84,    28,    84,    29,    71,
      83,   278,    71,    71,    36,    71,    38,    39,    40,    71,
      41,    42,    43,    44,    62,    62,   189,    81,   128,   266,
     279,   266,     2,    11,   168,    67,    58,    59,    60,    61,
     261,    63,    64,    65,    66,   238,   167,    69,    70,    -1,
      -1,   170,    -1,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    87,    88,     0,    47,    51,    67,   107,   117,   121,
     122,   123,    53,    54,   109,    71,    71,   122,    12,    50,
      55,    56,    94,    96,    98,    99,   101,   124,   125,   126,
     127,    71,   118,   100,   102,    95,    97,   121,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    13,    14,    18,
      19,    20,    21,    22,    28,    36,    38,    39,    40,    58,
      59,    60,    61,    63,    64,    65,    66,    69,    70,   128,
     134,   136,   138,   145,   150,   151,   152,   126,   108,   119,
      62,    62,    67,    89,    90,   124,    46,    62,    69,   143,
     143,    70,   145,   151,   145,   145,   135,    62,    62,   129,
     130,   131,   151,   145,   145,    70,   138,   151,    60,    63,
     153,   138,   145,   145,    62,    69,    70,   139,   140,   141,
     142,   144,   145,   151,    71,    72,    83,     5,   112,   113,
      40,    52,    71,   120,    71,   109,   110,    71,    57,    90,
      91,    92,     4,    30,    31,    32,    33,    34,    35,    45,
     137,     4,    45,    93,   140,    25,    26,    27,    62,   132,
     133,   132,   132,    45,    72,    45,    83,    45,     8,    28,
      36,    37,    38,    73,    74,    75,   145,   146,   147,   145,
      49,   111,   113,    71,   145,    71,    71,    71,    71,    69,
     143,   143,   145,   143,   143,    62,    62,    62,   145,   145,
     145,   146,   142,   133,   145,   153,    62,   145,   145,   145,
     145,    23,    24,    29,    41,    42,    43,    44,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,   145,
     148,   149,   145,   126,    71,   103,    93,     4,    72,    83,
      84,    45,    83,   145,   145,   145,   145,   145,   145,   145,
     145,   145,   145,   145,   145,   145,   145,   145,   145,   146,
      72,    85,    45,    71,    71,    20,   104,   105,   143,   152,
     146,   145,   146,    84,   145,   149,   145,    18,    39,   114,
     115,   106,    97,   105,    71,    84,    84,    71,   116,   145,
      48,   115,    71,   132,    71,   132,    71,    71,    62,    62
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
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 23:
#line 505 "imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 508 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 25:
#line 509 "imcc.y"
    { add_pcc_param(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 26:
#line 510 "imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 27:
#line 513 "imcc.y"
    { is_def=1; }
    break;

  case 28:
#line 514 "imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 29:
#line 517 "imcc.y"
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
#line 537 "imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 540 "imcc.y"
    { yyval.t = 1; }
    break;

  case 32:
#line 541 "imcc.y"
    { yyval.t = 0; }
    break;

  case 33:
#line 544 "imcc.y"
    { yyval.t = -1; }
    break;

  case 35:
#line 548 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 36:
#line 552 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 37:
#line 557 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 38:
#line 558 "imcc.y"
    {  add_pcc_arg(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 39:
#line 559 "imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 40:
#line 562 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 41:
#line 565 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 42:
#line 566 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 43:
#line 567 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-7].sr, yyvsp[-1].sr); }
    break;

  case 44:
#line 570 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 45:
#line 571 "imcc.y"
    { is_def=1; }
    break;

  case 46:
#line 571 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 47:
#line 574 "imcc.y"
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
#line 587 "imcc.y"
    { yyval.i = 0; }
    break;

  case 49:
#line 590 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 50:
#line 591 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 51:
#line 592 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 52:
#line 595 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 55:
#line 602 "imcc.y"
    { clear_state(); }
    break;

  case 56:
#line 603 "imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 57:
#line 604 "imcc.y"
    { yyval.i = 0; }
    break;

  case 58:
#line 605 "imcc.y"
    { yyval.i = 0; }
    break;

  case 60:
#line 609 "imcc.y"
    { yyval.i = NULL; }
    break;

  case 64:
#line 617 "imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 65:
#line 621 "imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 69:
#line 627 "imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 70:
#line 628 "imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 71:
#line 629 "imcc.y"
    { is_def=1; }
    break;

  case 72:
#line 629 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 73:
#line 630 "imcc.y"
    { is_def=1; }
    break;

  case 74:
#line 631 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr);is_def=0; }
    break;

  case 75:
#line 632 "imcc.y"
    { is_def=1; }
    break;

  case 76:
#line 632 "imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            R1(mk_ident(yyvsp[0].s, yyvsp[-1].t)));is_def=0; }
    break;

  case 77:
#line 634 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 78:
#line 635 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 79:
#line 636 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 80:
#line 637 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 81:
#line 638 "imcc.y"
    { yyval.i = MK_I(interp, "bsr",  R1(yyvsp[0].sr)); }
    break;

  case 82:
#line 639 "imcc.y"
    { yyval.i = MK_I(interp, "branch",R1(yyvsp[0].sr)); }
    break;

  case 83:
#line 640 "imcc.y"
    { yyval.i = MK_I(interp, "inc",R1(yyvsp[0].sr)); }
    break;

  case 84:
#line 641 "imcc.y"
    { yyval.i = MK_I(interp, "dec",R1(yyvsp[0].sr)); }
    break;

  case 85:
#line 642 "imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,R0()); }
    break;

  case 86:
#line 643 "imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,R0()); }
    break;

  case 87:
#line 644 "imcc.y"
    { yyval.i = MK_I(interp, "end" ,R0()); }
    break;

  case 88:
#line 645 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs, 1); free(yyvsp[-1].s); }
    break;

  case 89:
#line 646 "imcc.y"
    { yyval.i = 0;}
    break;

  case 90:
#line 650 "imcc.y"
    { yyval.t = 'I'; }
    break;

  case 91:
#line 651 "imcc.y"
    { yyval.t = 'N'; }
    break;

  case 92:
#line 652 "imcc.y"
    { yyval.t = 'S'; }
    break;

  case 93:
#line 653 "imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 95:
#line 661 "imcc.y"
    { yyval.i = MK_I(interp, "set", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 96:
#line 662 "imcc.y"
    { yyval.i = MK_I(interp, "not", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 97:
#line 663 "imcc.y"
    { yyval.i = MK_I(interp, "neg", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 98:
#line 664 "imcc.y"
    { yyval.i = MK_I(interp, "bnot", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 99:
#line 665 "imcc.y"
    { yyval.i = MK_I(interp, "add", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 100:
#line 666 "imcc.y"
    { yyval.i = MK_I(interp, "sub", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 101:
#line 667 "imcc.y"
    { yyval.i = MK_I(interp, "mul", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 102:
#line 668 "imcc.y"
    { yyval.i = MK_I(interp, "pow", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 103:
#line 669 "imcc.y"
    { yyval.i = MK_I(interp, "div", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 104:
#line 670 "imcc.y"
    { yyval.i = MK_I(interp, "mod", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 105:
#line 671 "imcc.y"
    { yyval.i = MK_I(interp, "concat", R3(yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 106:
#line 672 "imcc.y"
    { yyval.i = MK_I(interp, "shl", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 107:
#line 673 "imcc.y"
    { yyval.i = MK_I(interp, "shr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 108:
#line 674 "imcc.y"
    { yyval.i = MK_I(interp, "lsr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 109:
#line 675 "imcc.y"
    { yyval.i = MK_I(interp, "and", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 110:
#line 676 "imcc.y"
    { yyval.i = MK_I(interp, "or", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 111:
#line 677 "imcc.y"
    { yyval.i = MK_I(interp, "xor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 112:
#line 678 "imcc.y"
    { yyval.i = MK_I(interp, "band", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 113:
#line 679 "imcc.y"
    { yyval.i = MK_I(interp, "bor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 114:
#line 680 "imcc.y"
    { yyval.i = MK_I(interp, "bxor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 115:
#line 681 "imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 116:
#line 682 "imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 117:
#line 683 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 118:
#line 684 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 119:
#line 685 "imcc.y"
    { yyval.i = MK_I(interp, "defined",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 120:
#line 686 "imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", R3(yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 121:
#line 688 "imcc.y"
    { yyval.i = MK_I(interp, "clone",R2(yyvsp[-3].sr, yyvsp[0].sr));
    }
    break;

  case 122:
#line 690 "imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          R2(yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once))); }
    break;

  case 123:
#line 692 "imcc.y"
    { yyval.i = MK_I(interp, "find_global",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 124:
#line 693 "imcc.y"
    { yyval.i = MK_I(interp, "store_global",R2(yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 125:
#line 694 "imcc.y"
    { expect_pasm = 1; }
    break;

  case 126:
#line 695 "imcc.y"
    { yyval.i = iANY(interp, "new",0,regs,1);  }
    break;

  case 127:
#line 696 "imcc.y"
    { yyval.i = MK_I(interp, "defined", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 128:
#line 697 "imcc.y"
    { keyvec=KEY_BIT(2);
                                       yyval.i = MK_I(interp, "defined", R3(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 129:
#line 699 "imcc.y"
    { yyval.i = MK_I(interp, "clone", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 130:
#line 703 "imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,R3(yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 131:
#line 704 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 132:
#line 705 "imcc.y"
    {yyval.i= MK_I(interp, "unless",R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 133:
#line 706 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 134:
#line 707 "imcc.y"
    {yyval.i= MK_I(interp, "unless", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 135:
#line 712 "imcc.y"
    { yyval.s = "eq"; }
    break;

  case 136:
#line 713 "imcc.y"
    { yyval.s = "ne"; }
    break;

  case 137:
#line 714 "imcc.y"
    { yyval.s = "gt"; }
    break;

  case 138:
#line 715 "imcc.y"
    { yyval.s = "ge"; }
    break;

  case 139:
#line 716 "imcc.y"
    { yyval.s = "lt"; }
    break;

  case 140:
#line 717 "imcc.y"
    { yyval.s = "le"; }
    break;

  case 145:
#line 728 "imcc.y"
    { yyval.sr = NULL; }
    break;

  case 146:
#line 729 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 147:
#line 732 "imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 149:
#line 736 "imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 150:
#line 737 "imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 151:
#line 742 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 152:
#line 743 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 153:
#line 746 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 154:
#line 747 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 158:
#line 755 "imcc.y"
    { nkeys=0; }
    break;

  case 159:
#line 756 "imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 160:
#line 759 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 161:
#line 760 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 165:
#line 770 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 166:
#line 771 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 167:
#line 772 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 168:
#line 773 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 169:
#line 774 "imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 170:
#line 777 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 171:
#line 778 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 172:
#line 779 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 173:
#line 782 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 174:
#line 783 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2535 "imcparser.c"

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


#line 785 "imcc.y"



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

