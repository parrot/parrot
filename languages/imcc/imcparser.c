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
     LABEL = 308,
     EMIT = 309,
     EOM = 310,
     IREG = 311,
     NREG = 312,
     SREG = 313,
     PREG = 314,
     IDENTIFIER = 315,
     STRINGC = 316,
     INTC = 317,
     FLOATC = 318,
     REG = 319,
     MACRO = 320,
     ENDM = 321,
     PARROT_OP = 322,
     VAR = 323
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
#define LABEL 308
#define EMIT 309
#define EOM 310
#define IREG 311
#define NREG 312
#define SREG 313
#define PREG 314
#define IDENTIFIER 315
#define STRINGC 316
#define INTC 317
#define FLOATC 318
#define REG 319
#define MACRO 320
#define ENDM 321
#define PARROT_OP 322
#define VAR 323




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
#line 612 "imcparser.c"
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
#line 633 "imcparser.c"

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
#define YYLAST   297

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  84
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  67
/* YYNRULES -- Number of rules. */
#define YYNRULES  171
/* YYNRULES -- Number of states. */
#define YYNSTATES  296

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   323

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      69,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    71,     2,     2,     2,    77,    79,     2,
       2,     2,    75,    74,     2,    72,    78,    76,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    83,
       2,    70,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    81,     2,    82,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    80,     2,    73,     2,     2,     2,
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
      65,    66,    67,    68
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     4,     7,     9,    12,    16,    19,    20,
      24,    25,    27,    28,    33,    36,    39,    41,    43,    45,
      46,    51,    52,    53,    61,    62,    65,    69,    70,    75,
      76,    88,    89,    95,    99,   100,   103,   107,   110,   111,
     114,   118,   121,   122,   127,   128,   135,   136,   139,   143,
     146,   148,   151,   152,   155,   158,   160,   162,   163,   165,
     168,   170,   172,   176,   178,   180,   182,   185,   188,   189,
     194,   195,   202,   203,   208,   211,   214,   217,   220,   223,
     226,   229,   232,   234,   236,   238,   241,   242,   244,   246,
     248,   250,   252,   256,   261,   266,   271,   277,   283,   289,
     295,   301,   307,   313,   319,   325,   331,   337,   343,   349,
     355,   361,   367,   374,   381,   388,   393,   398,   406,   411,
     416,   421,   426,   427,   431,   436,   444,   449,   456,   461,
     466,   471,   476,   478,   480,   482,   484,   486,   488,   490,
     492,   494,   496,   497,   499,   503,   505,   507,   512,   514,
     516,   518,   520,   522,   524,   526,   527,   530,   532,   536,
     538,   540,   542,   544,   546,   548,   550,   552,   554,   556,
     558,   560
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      85,     0,    -1,    -1,    86,   118,    -1,    88,    -1,    87,
      88,    -1,   121,    89,    69,    -1,    65,    69,    -1,    -1,
      90,    67,    91,    -1,    -1,   137,    -1,    -1,    54,    93,
      87,    55,    -1,    97,    95,    -1,   118,    46,    -1,    94,
      -1,    99,    -1,    92,    -1,    -1,    12,    98,    60,    69,
      -1,    -1,    -1,    50,   100,    60,    69,   101,   102,    95,
      -1,    -1,   103,    69,    -1,   102,   103,    69,    -1,    -1,
      20,   104,   129,    60,    -1,    -1,    47,   107,    69,   106,
     109,   108,   123,    69,   111,    48,    69,    -1,    -1,    49,
     142,    45,   142,    69,    -1,    49,   142,    69,    -1,    -1,
     110,    69,    -1,   109,   110,    69,    -1,     5,   142,    -1,
      -1,   112,    69,    -1,   111,   112,    69,    -1,    39,   142,
      -1,    -1,    18,   113,   129,    60,    -1,    -1,    51,    69,
     115,   116,    52,    69,    -1,    -1,   116,    69,    -1,   116,
     117,    69,    -1,    40,   142,    -1,   119,    -1,   118,   119,
      -1,    -1,   120,   124,    -1,    65,    69,    -1,   105,    -1,
     114,    -1,    -1,   122,    -1,   122,   123,    -1,   123,    -1,
      53,    -1,   121,   125,    69,    -1,    96,    -1,   131,    -1,
     133,    -1,    13,    60,    -1,    14,    60,    -1,    -1,    18,
     126,   129,    60,    -1,    -1,    19,   127,   129,    60,    70,
     149,    -1,    -1,    20,   128,   129,    60,    -1,    20,   148,
      -1,    39,   142,    -1,     5,   142,    -1,    40,   142,    -1,
       3,   140,    -1,     4,   140,    -1,    21,   142,    -1,    22,
     142,    -1,    10,    -1,    11,    -1,     9,    -1,    67,   137,
      -1,    -1,    25,    -1,    26,    -1,    27,    -1,   130,    -1,
      60,    -1,   135,    70,   142,    -1,   135,    70,    71,   142,
      -1,   135,    70,    72,   142,    -1,   135,    70,    73,   142,
      -1,   135,    70,   142,    74,   142,    -1,   135,    70,   142,
      72,   142,    -1,   135,    70,   142,    75,   142,    -1,   135,
      70,   142,    41,   142,    -1,   135,    70,   142,    76,   142,
      -1,   135,    70,   142,    77,   142,    -1,   135,    70,   142,
      78,   142,    -1,   135,    70,   142,    23,   142,    -1,   135,
      70,   142,    24,   142,    -1,   135,    70,   142,    42,   142,
      -1,   135,    70,   142,    43,   142,    -1,   135,    70,   142,
      44,   142,    -1,   135,    70,   142,    29,   142,    -1,   135,
      70,   142,    79,   142,    -1,   135,    70,   142,    80,   142,
      -1,   135,    70,   142,    73,   142,    -1,   135,    70,   142,
      81,   143,    82,    -1,   142,    81,   143,    82,    70,   142,
      -1,   135,    70,     8,   130,    45,   142,    -1,   135,    70,
       8,   130,    -1,   135,    70,    28,   142,    -1,   135,    70,
      28,   142,    81,   143,    82,    -1,   135,    70,    38,   142,
      -1,   135,    70,    37,    60,    -1,   135,    70,    36,   150,
      -1,    36,   150,    70,   142,    -1,    -1,     8,   132,    91,
      -1,    28,   135,    45,   142,    -1,    28,   135,    45,   142,
      81,   143,    82,    -1,    38,   135,    45,   142,    -1,     6,
     142,   134,   142,     4,   140,    -1,     6,   142,     4,   140,
      -1,     7,   142,     4,   140,    -1,     6,   142,    45,   140,
      -1,     7,   142,    45,   140,    -1,    30,    -1,    31,    -1,
      32,    -1,    33,    -1,    34,    -1,    35,    -1,    68,    -1,
     148,    -1,    68,    -1,   148,    -1,    -1,   138,    -1,   138,
      45,   139,    -1,   139,    -1,   141,    -1,   136,    81,   143,
      82,    -1,    60,    -1,    67,    -1,    60,    -1,    67,    -1,
     142,    -1,    68,    -1,   147,    -1,    -1,   144,   145,    -1,
     146,    -1,   145,    83,   146,    -1,   142,    -1,   148,    -1,
     149,    -1,    56,    -1,    57,    -1,    58,    -1,    59,    -1,
      64,    -1,    62,    -1,    63,    -1,    61,    -1,    58,    -1,
      61,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   438,   438,   438,   446,   447,   450,   451,   454,   454,
     456,   458,   463,   462,   471,   475,   484,   485,   486,   489,
     489,   495,   497,   495,   505,   506,   507,   510,   510,   514,
     514,   536,   539,   543,   548,   549,   550,   553,   556,   557,
     558,   561,   562,   562,   565,   565,   581,   582,   583,   586,
     589,   590,   593,   593,   595,   596,   597,   600,   601,   604,
     605,   608,   611,   613,   615,   617,   618,   619,   620,   620,
     621,   621,   623,   623,   625,   626,   627,   628,   629,   630,
     631,   632,   633,   634,   635,   636,   637,   640,   642,   643,
     644,   647,   651,   653,   654,   655,   656,   657,   658,   659,
     660,   661,   662,   663,   664,   665,   666,   667,   668,   669,
     670,   671,   672,   673,   674,   675,   676,   677,   679,   681,
     683,   684,   685,   685,   687,   688,   690,   693,   695,   696,
     697,   698,   702,   704,   705,   706,   707,   708,   712,   713,
     715,   716,   719,   720,   723,   724,   727,   728,   732,   734,
     736,   738,   739,   742,   743,   746,   746,   750,   751,   754,
     757,   758,   761,   762,   763,   764,   765,   768,   769,   770,
     773,   774
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
  "PCC_END_RETURN", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", 
  "PREG", "IDENTIFIER", "STRINGC", "INTC", "FLOATC", "REG", "MACRO", 
  "ENDM", "PARROT_OP", "VAR", "'\\n'", "'='", "'!'", "'-'", "'~'", "'+'", 
  "'*'", "'/'", "'%'", "'.'", "'&'", "'|'", "'['", "']'", "';'", 
  "$accept", "program", "@1", "pasmcode", "pasmline", "pasm_inst", "@2", 
  "pasm_args", "emit", "@3", "nsub", "sub_body", "sub", "sub_start", "@4", 
  "pcc_sub", "@5", "@6", "pcc_params", "pcc_param", "@7", "pcc_sub_call", 
  "@8", "pcc_proto", "pcc_call", "pcc_args", "pcc_arg", "pcc_results", 
  "pcc_result", "@9", "pcc_ret", "@10", "pcc_returns", "pcc_return", 
  "statements", "statement", "@11", "labels", "_labels", "label", 
  "instruction", "labeled_inst", "@12", "@13", "@14", "type", "classname", 
  "assignment", "@15", "if_statement", "relop", "target", "lhs", "vars", 
  "_vars", "_var_or_i", "label_op", "var_or_i", "var", "keylist", "@16", 
  "_keylist", "key", "rc", "reg", "const", "string", 0
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
     315,   316,   317,   318,   319,   320,   321,   322,   323,    10,
      61,    33,    45,   126,    43,    42,    47,    37,    46,    38,
     124,    91,    93,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    84,    86,    85,    87,    87,    88,    88,    90,    89,
      89,    91,    93,    92,    94,    95,    96,    96,    96,    98,
      97,   100,   101,    99,   102,   102,   102,   104,   103,   106,
     105,   107,   108,   108,   109,   109,   109,   110,   111,   111,
     111,   112,   113,   112,   115,   114,   116,   116,   116,   117,
     118,   118,   120,   119,   119,   119,   119,   121,   121,   122,
     122,   123,   124,   124,   125,   125,   125,   125,   126,   125,
     127,   125,   128,   125,   125,   125,   125,   125,   125,   125,
     125,   125,   125,   125,   125,   125,   125,   129,   129,   129,
     129,   130,   131,   131,   131,   131,   131,   131,   131,   131,
     131,   131,   131,   131,   131,   131,   131,   131,   131,   131,
     131,   131,   131,   131,   131,   131,   131,   131,   131,   131,
     131,   131,   132,   131,   131,   131,   131,   133,   133,   133,
     133,   133,   134,   134,   134,   134,   134,   134,   135,   135,
     136,   136,   137,   137,   138,   138,   139,   139,   140,   140,
     141,   141,   141,   142,   142,   144,   143,   145,   145,   146,
     147,   147,   148,   148,   148,   148,   148,   149,   149,   149,
     150,   150
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     2,     3,     2,     0,     3,
       0,     1,     0,     4,     2,     2,     1,     1,     1,     0,
       4,     0,     0,     7,     0,     2,     3,     0,     4,     0,
      11,     0,     5,     3,     0,     2,     3,     2,     0,     2,
       3,     2,     0,     4,     0,     6,     0,     2,     3,     2,
       1,     2,     0,     2,     2,     1,     1,     0,     1,     2,
       1,     1,     3,     1,     1,     1,     2,     2,     0,     4,
       0,     6,     0,     4,     2,     2,     2,     2,     2,     2,
       2,     2,     1,     1,     1,     2,     0,     1,     1,     1,
       1,     1,     3,     4,     4,     4,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     6,     6,     6,     4,     4,     7,     4,     4,
       4,     4,     0,     3,     4,     7,     4,     6,     4,     4,
       4,     4,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     0,     1,     3,     1,     1,     4,     1,     1,
       1,     1,     1,     1,     1,     0,     2,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,    52,     1,    31,     0,     0,    55,    56,    52,
      50,    57,     0,    44,    54,    51,    19,    21,    61,    12,
      18,    16,    63,    52,    17,    86,    58,    60,    53,    29,
      46,     0,     0,    57,    14,    52,     0,     0,     0,     0,
       0,   122,    84,    82,    83,     0,     0,    68,    70,    72,
       0,     0,     0,     0,     0,     0,     0,   162,   163,   164,
     165,   169,   167,   168,   166,   142,   138,     0,    64,    65,
       0,     0,   154,   139,   161,    59,    34,     0,     0,     0,
       0,    57,     4,     8,    15,   148,   149,    78,    79,   153,
      76,   160,     0,     0,   142,    66,    67,     0,     0,     0,
      74,    80,    81,   138,     0,   139,   170,   171,     0,     0,
      75,    77,   150,   151,   153,     0,    85,   143,   145,   146,
     152,   160,    62,     0,   155,     0,     0,     0,     0,     0,
      47,     0,    20,    22,     7,    13,     5,     0,     0,     0,
     132,   133,   134,   135,   136,   137,     0,     0,     0,     0,
     123,    11,    87,    88,    89,    91,     0,    90,     0,     0,
       0,     0,     0,   155,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    92,     0,     0,    37,     0,     0,     0,
      35,    49,    45,    48,    24,     6,   142,   128,   130,     0,
     129,   131,    69,     0,    73,   124,   121,   126,     0,   144,
     115,   116,   120,   119,   118,    93,    94,    95,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   155,     0,   159,   156,   157,     0,
       0,    36,    27,    52,     0,     9,     0,     0,   155,   147,
       0,   155,   103,   104,   108,    99,   105,   106,   107,    97,
     111,    96,    98,   100,   101,   102,   109,   110,     0,     0,
       0,     0,    33,    38,     0,    23,     0,    25,   127,    71,
       0,   114,     0,   112,   113,   158,     0,    42,     0,     0,
       0,     0,    26,   125,   117,    32,     0,    41,     0,     0,
      39,    28,     0,    30,    40,    43
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,    81,    82,   137,   138,   150,    20,    33,
      21,    34,    22,    23,    31,    24,    32,   184,   233,   234,
     264,     7,    76,    12,   178,   126,   127,   279,   280,   286,
       8,    30,    77,   131,    35,    10,    11,    83,    26,    27,
      28,    67,    97,    98,    99,   156,   157,    68,    94,    69,
     147,    70,   115,   151,   117,   118,    87,   119,   120,   174,
     175,   227,   228,    72,    91,    74,   108
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -163
static const short yypact[] =
{
    -163,    10,    43,  -163,  -163,   -45,   -41,  -163,  -163,     4,
    -163,     6,     5,  -163,  -163,  -163,  -163,  -163,  -163,  -163,
    -163,  -163,  -163,    43,  -163,   203,   -19,  -163,  -163,  -163,
    -163,    -3,    23,   -13,  -163,   -24,    82,    82,   216,   216,
     216,  -163,  -163,  -163,  -163,    41,    46,  -163,  -163,    60,
     216,   216,    75,    62,    75,   216,   216,  -163,  -163,  -163,
    -163,  -163,  -163,  -163,  -163,   188,   -18,    33,  -163,  -163,
      51,    31,  -163,    44,  -163,  -163,   121,    -8,    69,    71,
      85,    42,  -163,    87,  -163,  -163,  -163,  -163,  -163,  -163,
    -163,  -163,    54,     3,   188,  -163,  -163,    -6,    -6,    -6,
    -163,  -163,  -163,  -163,   112,  -163,  -163,  -163,    98,   124,
    -163,  -163,  -163,  -163,    90,    91,  -163,   128,  -163,  -163,
    -163,    93,  -163,     9,  -163,   216,     1,   106,   216,   107,
    -163,   109,  -163,  -163,  -163,  -163,  -163,   110,   113,    82,
    -163,  -163,  -163,  -163,  -163,  -163,    82,   216,    82,    82,
    -163,  -163,  -163,  -163,  -163,  -163,   122,  -163,   140,   142,
     216,   216,   216,  -163,   188,   143,   216,    62,   144,   216,
     216,   216,   216,    86,   123,   216,  -163,   216,   -19,   149,
    -163,  -163,  -163,  -163,   161,  -163,   188,  -163,  -163,   215,
    -163,  -163,  -163,   150,  -163,   145,  -163,  -163,   146,  -163,
     182,   148,  -163,  -163,  -163,  -163,  -163,  -163,   216,   216,
     216,   216,   216,   216,   216,   216,   216,   216,   216,   216,
     216,   216,   216,   216,  -163,   160,  -163,   154,  -163,   -40,
     163,  -163,  -163,   -12,   164,  -163,    82,    30,  -163,  -163,
     216,  -163,  -163,  -163,  -163,  -163,  -163,  -163,  -163,  -163,
    -163,  -163,  -163,  -163,  -163,  -163,  -163,  -163,   156,   216,
     216,   216,  -163,    25,    -6,  -163,   171,  -163,  -163,  -163,
     172,  -163,   175,  -163,  -163,  -163,   189,  -163,   216,    57,
     194,   208,  -163,  -163,  -163,  -163,    -6,  -163,   200,   207,
    -163,  -163,   221,  -163,  -163,  -163
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -163,  -163,  -163,  -163,   201,  -163,  -163,    97,  -163,  -163,
    -163,    52,  -163,  -163,  -163,  -163,  -163,  -163,  -163,    53,
    -163,  -163,  -163,  -163,  -163,  -163,   162,  -163,     8,  -163,
    -163,  -163,  -163,  -163,   287,     7,  -163,   279,  -163,   -23,
    -163,  -163,  -163,  -163,  -163,   -87,   126,  -163,  -163,  -163,
    -163,    99,  -163,   227,  -163,   129,   -35,  -163,   -25,  -162,
    -163,  -163,    34,  -163,   -16,    58,   130
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -161
static const short yytable[] =
{
      71,   198,    88,    75,    -3,   261,   125,   148,   232,    73,
       3,   158,   159,    90,    92,    93,    15,   165,    16,   152,
     153,   154,    84,     4,    13,   101,   102,     5,    14,   262,
     110,   111,   128,   100,    18,     4,   105,   166,   105,     5,
      18,     6,    15,   277,   129,   167,   168,   169,   149,   121,
     177,     4,    80,     6,   155,     5,    17,    78,   139,    18,
      19,   130,   258,  -153,   278,    57,    58,    59,    60,     6,
      61,    62,    63,    64,    29,   277,   270,    89,   121,   272,
     170,   171,   172,    79,   140,   141,   142,   143,   144,   145,
       4,    61,    62,    63,     5,    18,   278,   135,   173,   146,
     176,    95,   122,   181,   187,   288,    96,    80,     6,   208,
     209,   188,   124,   190,   191,   210,    57,    58,    59,    60,
     106,   123,   189,   107,    64,  -160,   125,   211,   212,   213,
     214,    57,    58,    59,    60,   195,   196,   197,   132,    64,
     133,   201,    85,   103,   204,   205,   206,   207,   121,    86,
     226,   104,   229,   109,   134,   230,   -10,   160,   215,   216,
     217,   218,   219,   220,   221,   222,   223,   224,   161,   162,
     121,  -140,   163,   164,  -141,   180,   182,   281,   183,   185,
     186,   232,   192,   242,   243,   244,   245,   246,   247,   248,
     249,   250,   251,   252,   253,   254,   255,   256,   257,   292,
     193,   268,   194,   155,   203,   225,    36,    37,    38,    39,
      40,    41,    42,    43,    44,   271,    45,    46,   231,   236,
     237,    47,    48,    49,    50,    51,   238,   240,   239,   241,
     259,    52,   263,   267,   274,   226,   276,   260,   273,    53,
     282,    54,    55,    56,    57,    58,    59,    60,   112,    61,
      62,    63,    64,   287,   283,   113,   114,   284,   285,    57,
      58,    59,    60,   290,    61,    62,    63,    64,   291,   293,
      65,    66,    57,    58,    59,    60,   294,    61,    62,    63,
      64,   295,   136,   235,    89,   265,   266,   289,   179,     9,
      25,   200,   116,   199,   275,   269,     0,   202
};

static const short yycheck[] =
{
      25,   163,    37,    26,     0,    45,     5,     4,    20,    25,
       0,    98,    99,    38,    39,    40,     9,     8,    12,    25,
      26,    27,    46,    47,    69,    50,    51,    51,    69,    69,
      55,    56,    40,    49,    53,    47,    52,    28,    54,    51,
      53,    65,    35,    18,    52,    36,    37,    38,    45,    65,
      49,    47,    65,    65,    60,    51,    50,    60,     4,    53,
      54,    69,   224,    81,    39,    56,    57,    58,    59,    65,
      61,    62,    63,    64,    69,    18,   238,    68,    94,   241,
      71,    72,    73,    60,    30,    31,    32,    33,    34,    35,
      47,    61,    62,    63,    51,    53,    39,    55,   123,    45,
     125,    60,    69,   128,   139,    48,    60,    65,    65,    23,
      24,   146,    81,   148,   149,    29,    56,    57,    58,    59,
      58,    70,   147,    61,    64,    81,     5,    41,    42,    43,
      44,    56,    57,    58,    59,   160,   161,   162,    69,    64,
      69,   166,    60,    68,   169,   170,   171,   172,   164,    67,
     175,    52,   177,    54,    69,   178,    69,    45,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    70,    45,
     186,    81,    81,    45,    81,    69,    69,   264,    69,    69,
      67,    20,    60,   208,   209,   210,   211,   212,   213,   214,
     215,   216,   217,   218,   219,   220,   221,   222,   223,   286,
      60,   236,    60,    60,    60,    82,     3,     4,     5,     6,
       7,     8,     9,    10,    11,   240,    13,    14,    69,     4,
      70,    18,    19,    20,    21,    22,    81,    45,    82,    81,
      70,    28,    69,    69,   259,   260,   261,    83,    82,    36,
      69,    38,    39,    40,    56,    57,    58,    59,    60,    61,
      62,    63,    64,   278,    82,    67,    68,    82,    69,    56,
      57,    58,    59,    69,    61,    62,    63,    64,    60,    69,
      67,    68,    56,    57,    58,    59,    69,    61,    62,    63,
      64,    60,    81,   186,    68,   233,   233,   279,   126,     2,
      11,   165,    65,   164,   260,   237,    -1,   167
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    85,    86,     0,    47,    51,    65,   105,   114,   118,
     119,   120,   107,    69,    69,   119,    12,    50,    53,    54,
      92,    94,    96,    97,    99,   121,   122,   123,   124,    69,
     115,    98,   100,    93,    95,   118,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    13,    14,    18,    19,    20,
      21,    22,    28,    36,    38,    39,    40,    56,    57,    58,
      59,    61,    62,    63,    64,    67,    68,   125,   131,   133,
     135,   142,   147,   148,   149,   123,   106,   116,    60,    60,
      65,    87,    88,   121,    46,    60,    67,   140,   140,    68,
     142,   148,   142,   142,   132,    60,    60,   126,   127,   128,
     148,   142,   142,    68,   135,   148,    58,    61,   150,   135,
     142,   142,    60,    67,    68,   136,   137,   138,   139,   141,
     142,   148,    69,    70,    81,     5,   109,   110,    40,    52,
      69,   117,    69,    69,    69,    55,    88,    89,    90,     4,
      30,    31,    32,    33,    34,    35,    45,   134,     4,    45,
      91,   137,    25,    26,    27,    60,   129,   130,   129,   129,
      45,    70,    45,    81,    45,     8,    28,    36,    37,    38,
      71,    72,    73,   142,   143,   144,   142,    49,   108,   110,
      69,   142,    69,    69,   101,    69,    67,   140,   140,   142,
     140,   140,    60,    60,    60,   142,   142,   142,   143,   139,
     130,   142,   150,    60,   142,   142,   142,   142,    23,    24,
      29,    41,    42,    43,    44,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,   142,   145,   146,   142,
     123,    69,    20,   102,   103,    91,     4,    70,    81,    82,
      45,    81,   142,   142,   142,   142,   142,   142,   142,   142,
     142,   142,   142,   142,   142,   142,   142,   142,   143,    70,
      83,    45,    69,    69,   104,    95,   103,    69,   140,   149,
     143,   142,   143,    82,   142,   146,   142,    18,    39,   111,
     112,   129,    69,    82,    82,    69,   113,   142,    48,   112,
      69,    60,   129,    69,    69,    60
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
          Instruction *i =iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(str_dup(yyvsp[-1].s), 0);
        }
    break;

  case 23:
#line 502 "imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 505 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 25:
#line 506 "imcc.y"
    { add_pcc_param(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 26:
#line 507 "imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 27:
#line 510 "imcc.y"
    { is_def=1; }
    break;

  case 28:
#line 511 "imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 29:
#line 514 "imcc.y"
    {
              char name[128];
              SymReg * r;
              Instruction *i;

              sprintf(name, "#pcc_sub_call_%d", line - 1);
              yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
              /* this mid rule action has the semantic value of the
                 sub SymReg.
                 This is used below to append args & results
              */
              i = iLABEL(r);
              i->type = ITPCCSUB;

           }
    break;

  case 30:
#line 533 "imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 536 "imcc.y"
    { yyval.t = 0; }
    break;

  case 32:
#line 539 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 33:
#line 543 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 34:
#line 548 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 35:
#line 549 "imcc.y"
    {  add_pcc_arg(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 36:
#line 550 "imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 37:
#line 553 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 38:
#line 556 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 39:
#line 557 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 40:
#line 558 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-7].sr, yyvsp[-1].sr); }
    break;

  case 41:
#line 561 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 42:
#line 562 "imcc.y"
    { is_def=1; }
    break;

  case 43:
#line 562 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 44:
#line 565 "imcc.y"
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

  case 45:
#line 578 "imcc.y"
    { yyval.i = 0; }
    break;

  case 46:
#line 581 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 47:
#line 582 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 48:
#line 583 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 49:
#line 586 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 52:
#line 593 "imcc.y"
    { clear_state(); }
    break;

  case 53:
#line 594 "imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 54:
#line 595 "imcc.y"
    { yyval.i = 0; }
    break;

  case 55:
#line 596 "imcc.y"
    { yyval.i = 0; }
    break;

  case 57:
#line 600 "imcc.y"
    { yyval.i = NULL; }
    break;

  case 61:
#line 608 "imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 62:
#line 612 "imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 66:
#line 618 "imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 67:
#line 619 "imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 68:
#line 620 "imcc.y"
    { is_def=1; }
    break;

  case 69:
#line 620 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 70:
#line 621 "imcc.y"
    { is_def=1; }
    break;

  case 71:
#line 622 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr);is_def=0; }
    break;

  case 72:
#line 623 "imcc.y"
    { is_def=1; }
    break;

  case 73:
#line 623 "imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            R1(mk_ident(yyvsp[0].s, yyvsp[-1].t)));is_def=0; }
    break;

  case 74:
#line 625 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 75:
#line 626 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 76:
#line 627 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 77:
#line 628 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 78:
#line 629 "imcc.y"
    { yyval.i = MK_I(interp, "bsr",  R1(yyvsp[0].sr)); }
    break;

  case 79:
#line 630 "imcc.y"
    { yyval.i = MK_I(interp, "branch",R1(yyvsp[0].sr)); }
    break;

  case 80:
#line 631 "imcc.y"
    { yyval.i = MK_I(interp, "inc",R1(yyvsp[0].sr)); }
    break;

  case 81:
#line 632 "imcc.y"
    { yyval.i = MK_I(interp, "dec",R1(yyvsp[0].sr)); }
    break;

  case 82:
#line 633 "imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,R0()); }
    break;

  case 83:
#line 634 "imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,R0()); }
    break;

  case 84:
#line 635 "imcc.y"
    { yyval.i = MK_I(interp, "end" ,R0()); }
    break;

  case 85:
#line 636 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs, 1); free(yyvsp[-1].s); }
    break;

  case 86:
#line 637 "imcc.y"
    { yyval.i = 0;}
    break;

  case 87:
#line 641 "imcc.y"
    { yyval.t = 'I'; }
    break;

  case 88:
#line 642 "imcc.y"
    { yyval.t = 'N'; }
    break;

  case 89:
#line 643 "imcc.y"
    { yyval.t = 'S'; }
    break;

  case 90:
#line 644 "imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 92:
#line 652 "imcc.y"
    { yyval.i = MK_I(interp, "set", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 93:
#line 653 "imcc.y"
    { yyval.i = MK_I(interp, "not", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 94:
#line 654 "imcc.y"
    { yyval.i = MK_I(interp, "neg", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 95:
#line 655 "imcc.y"
    { yyval.i = MK_I(interp, "bnot", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 96:
#line 656 "imcc.y"
    { yyval.i = MK_I(interp, "add", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 97:
#line 657 "imcc.y"
    { yyval.i = MK_I(interp, "sub", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 98:
#line 658 "imcc.y"
    { yyval.i = MK_I(interp, "mul", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 99:
#line 659 "imcc.y"
    { yyval.i = MK_I(interp, "pow", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 100:
#line 660 "imcc.y"
    { yyval.i = MK_I(interp, "div", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 101:
#line 661 "imcc.y"
    { yyval.i = MK_I(interp, "mod", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 102:
#line 662 "imcc.y"
    { yyval.i = MK_I(interp, "concat", R3(yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 103:
#line 663 "imcc.y"
    { yyval.i = MK_I(interp, "shl", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 104:
#line 664 "imcc.y"
    { yyval.i = MK_I(interp, "shr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 105:
#line 665 "imcc.y"
    { yyval.i = MK_I(interp, "lsr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 106:
#line 666 "imcc.y"
    { yyval.i = MK_I(interp, "and", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 107:
#line 667 "imcc.y"
    { yyval.i = MK_I(interp, "or", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 108:
#line 668 "imcc.y"
    { yyval.i = MK_I(interp, "xor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 109:
#line 669 "imcc.y"
    { yyval.i = MK_I(interp, "band", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 110:
#line 670 "imcc.y"
    { yyval.i = MK_I(interp, "bor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 111:
#line 671 "imcc.y"
    { yyval.i = MK_I(interp, "bxor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 112:
#line 672 "imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 113:
#line 673 "imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 114:
#line 674 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 115:
#line 675 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 116:
#line 676 "imcc.y"
    { yyval.i = MK_I(interp, "defined",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 117:
#line 677 "imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", R3(yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 118:
#line 679 "imcc.y"
    { yyval.i = MK_I(interp, "clone",R2(yyvsp[-3].sr, yyvsp[0].sr));
    }
    break;

  case 119:
#line 681 "imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          R2(yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once))); }
    break;

  case 120:
#line 683 "imcc.y"
    { yyval.i = MK_I(interp, "find_global",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 121:
#line 684 "imcc.y"
    { yyval.i = MK_I(interp, "store_global",R2(yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 122:
#line 685 "imcc.y"
    { expect_pasm = 1; }
    break;

  case 123:
#line 686 "imcc.y"
    { yyval.i = iANY(interp, "new",0,regs,1);  }
    break;

  case 124:
#line 687 "imcc.y"
    { yyval.i = MK_I(interp, "defined", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 125:
#line 688 "imcc.y"
    { keyvec=KEY_BIT(2);
                                       yyval.i = MK_I(interp, "defined", R3(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 126:
#line 690 "imcc.y"
    { yyval.i = MK_I(interp, "clone", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 127:
#line 694 "imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,R3(yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 128:
#line 695 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 129:
#line 696 "imcc.y"
    {yyval.i= MK_I(interp, "unless",R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 130:
#line 697 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 131:
#line 698 "imcc.y"
    {yyval.i= MK_I(interp, "unless", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 132:
#line 703 "imcc.y"
    { yyval.s = "eq"; }
    break;

  case 133:
#line 704 "imcc.y"
    { yyval.s = "ne"; }
    break;

  case 134:
#line 705 "imcc.y"
    { yyval.s = "gt"; }
    break;

  case 135:
#line 706 "imcc.y"
    { yyval.s = "ge"; }
    break;

  case 136:
#line 707 "imcc.y"
    { yyval.s = "lt"; }
    break;

  case 137:
#line 708 "imcc.y"
    { yyval.s = "le"; }
    break;

  case 142:
#line 719 "imcc.y"
    { yyval.sr = NULL; }
    break;

  case 143:
#line 720 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 144:
#line 723 "imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 146:
#line 727 "imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 147:
#line 728 "imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 148:
#line 733 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 149:
#line 734 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 150:
#line 737 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 151:
#line 738 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 155:
#line 746 "imcc.y"
    { nkeys=0; }
    break;

  case 156:
#line 747 "imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 157:
#line 750 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 158:
#line 751 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 162:
#line 761 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 163:
#line 762 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 164:
#line 763 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 165:
#line 764 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 166:
#line 765 "imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 167:
#line 768 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 168:
#line 769 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 169:
#line 770 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 170:
#line 773 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 171:
#line 774 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2515 "imcparser.c"

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


#line 776 "imcc.y"



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

