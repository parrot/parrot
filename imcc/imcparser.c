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
     GLOBAL_CONST = 278,
     SHIFT_LEFT = 279,
     SHIFT_RIGHT = 280,
     INTV = 281,
     FLOATV = 282,
     STRINGV = 283,
     DEFINED = 284,
     LOG_XOR = 285,
     RELOP_EQ = 286,
     RELOP_NE = 287,
     RELOP_GT = 288,
     RELOP_GTE = 289,
     RELOP_LT = 290,
     RELOP_LTE = 291,
     GLOBAL = 292,
     ADDR = 293,
     CLONE = 294,
     RESULT = 295,
     RETURN = 296,
     POW = 297,
     SHIFT_RIGHT_U = 298,
     LOG_AND = 299,
     LOG_OR = 300,
     COMMA = 301,
     ESUB = 302,
     PCC_BEGIN = 303,
     PCC_END = 304,
     PCC_CALL = 305,
     PCC_SUB = 306,
     PCC_BEGIN_RETURN = 307,
     PCC_END_RETURN = 308,
     PCC_BEGIN_YIELD = 309,
     PCC_END_YIELD = 310,
     PROTOTYPED = 311,
     NON_PROTOTYPED = 312,
     LABEL = 313,
     EMIT = 314,
     EOM = 315,
     IREG = 316,
     NREG = 317,
     SREG = 318,
     PREG = 319,
     IDENTIFIER = 320,
     STRINGC = 321,
     INTC = 322,
     FLOATC = 323,
     REG = 324,
     MACRO = 325,
     ENDM = 326,
     PARROT_OP = 327,
     VAR = 328,
     LINECOMMENT = 329,
     FILECOMMENT = 330
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
#define GLOBAL_CONST 278
#define SHIFT_LEFT 279
#define SHIFT_RIGHT 280
#define INTV 281
#define FLOATV 282
#define STRINGV 283
#define DEFINED 284
#define LOG_XOR 285
#define RELOP_EQ 286
#define RELOP_NE 287
#define RELOP_GT 288
#define RELOP_GTE 289
#define RELOP_LT 290
#define RELOP_LTE 291
#define GLOBAL 292
#define ADDR 293
#define CLONE 294
#define RESULT 295
#define RETURN 296
#define POW 297
#define SHIFT_RIGHT_U 298
#define LOG_AND 299
#define LOG_OR 300
#define COMMA 301
#define ESUB 302
#define PCC_BEGIN 303
#define PCC_END 304
#define PCC_CALL 305
#define PCC_SUB 306
#define PCC_BEGIN_RETURN 307
#define PCC_END_RETURN 308
#define PCC_BEGIN_YIELD 309
#define PCC_END_YIELD 310
#define PROTOTYPED 311
#define NON_PROTOTYPED 312
#define LABEL 313
#define EMIT 314
#define EOM 315
#define IREG 316
#define NREG 317
#define SREG 318
#define PREG 319
#define IDENTIFIER 320
#define STRINGC 321
#define INTC 322
#define FLOATC 323
#define REG 324
#define MACRO 325
#define ENDM 326
#define PARROT_OP 327
#define VAR 328
#define LINECOMMENT 329
#define FILECOMMENT 330




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
#include "parrot/dynext.h"

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
    if (op < 0)         /* still wrong, try to find an existing op */
        op = try_find_op(interpreter, name, r, nargs, emit);
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
        else if (!strcmp(name, "warningson")) {
            /* emit a debug seg, if this op is seen */
            PARROT_WARNINGS_on(interpreter, PARROT_WARNINGS_ALL_FLAG);
        }
        if (!strcmp(name, "load_pmc")) {
            SymReg *r0 = r[0];   /* lib name */
            STRING *lib = string_from_cstring(interpreter, r0->name + 1,
                strlen(r0->name) - 2);
            Parrot_load_pmc(interpreter, lib, NULL);
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

static char * inv_op(char *op) {
    int n;
    return (char *) get_neg_op(op, &n);
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
#line 413 "imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 642 "imcparser.c"
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
#line 663 "imcparser.c"

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
#define YYLAST   376

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  91
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  71
/* YYNRULES -- Number of rules. */
#define YYNRULES  183
/* YYNRULES -- Number of states. */
#define YYNSTATES  320

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   330

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      76,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    78,     2,     2,     2,    84,    86,     2,
       2,     2,    82,    81,     2,    79,    85,    83,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    90,
       2,    77,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    88,     2,    89,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    87,     2,    80,     2,     2,     2,
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
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     4,     7,     9,    12,    16,    19,    21,
      23,    24,    28,    29,    31,    32,    37,    40,    43,    45,
      47,    49,    50,    55,    56,    57,    66,    67,    70,    74,
      75,    80,    81,    93,    95,    97,    98,   100,   106,   110,
     111,   114,   118,   121,   122,   125,   129,   132,   133,   138,
     139,   146,   147,   154,   155,   158,   162,   165,   167,   170,
     171,   174,   177,   179,   181,   183,   185,   187,   188,   190,
     193,   195,   197,   201,   203,   205,   207,   210,   213,   214,
     219,   220,   227,   228,   235,   236,   241,   244,   247,   250,
     253,   256,   259,   262,   265,   267,   269,   271,   274,   275,
     277,   279,   281,   283,   285,   289,   294,   299,   304,   310,
     316,   322,   328,   334,   340,   346,   352,   358,   364,   370,
     376,   382,   388,   394,   400,   407,   414,   421,   426,   431,
     439,   444,   449,   454,   459,   460,   464,   469,   477,   482,
     489,   496,   501,   506,   511,   516,   518,   520,   522,   524,
     526,   528,   530,   532,   534,   536,   537,   539,   543,   545,
     547,   552,   554,   556,   558,   560,   562,   564,   565,   568,
     570,   574,   576,   578,   580,   582,   584,   586,   588,   590,
     592,   594,   596,   598
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      92,     0,    -1,    -1,    93,   128,    -1,    95,    -1,    94,
      95,    -1,   131,    96,    76,    -1,    70,    76,    -1,    75,
      -1,    74,    -1,    -1,    97,    72,    98,    -1,    -1,   148,
      -1,    -1,    59,   100,    94,    60,    -1,   104,   102,    -1,
     128,    47,    -1,   101,    -1,   106,    -1,    99,    -1,    -1,
      12,   105,    65,    76,    -1,    -1,    -1,    51,   107,    65,
     115,    76,   108,   109,   102,    -1,    -1,   110,    76,    -1,
     109,   110,    76,    -1,    -1,    20,   111,   140,    65,    -1,
      -1,    48,   114,    76,   113,   117,   116,   133,    76,   119,
      49,    76,    -1,    56,    -1,    57,    -1,    -1,   114,    -1,
      50,   153,    46,   153,    76,    -1,    50,   153,    76,    -1,
      -1,   118,    76,    -1,   117,   118,    76,    -1,     5,   153,
      -1,    -1,   120,    76,    -1,   119,   120,    76,    -1,    40,
     153,    -1,    -1,    18,   121,   140,    65,    -1,    -1,    52,
      76,   123,   126,    53,    76,    -1,    -1,    54,    76,   125,
     126,    55,    76,    -1,    -1,   126,    76,    -1,   126,   127,
      76,    -1,    41,   153,    -1,   129,    -1,   128,   129,    -1,
      -1,   130,   134,    -1,    70,    76,    -1,   112,    -1,   122,
      -1,   124,    -1,    75,    -1,    74,    -1,    -1,   132,    -1,
     132,   133,    -1,   133,    -1,    58,    -1,   131,   135,    76,
      -1,   103,    -1,   142,    -1,   144,    -1,    13,    65,    -1,
      14,    65,    -1,    -1,    18,   136,   140,    65,    -1,    -1,
      19,   137,   140,    65,    77,   160,    -1,    -1,    23,   138,
     140,    65,    77,   160,    -1,    -1,    20,   139,   140,    65,
      -1,    20,   159,    -1,    40,   153,    -1,     5,   153,    -1,
      41,   153,    -1,     3,   151,    -1,     4,   151,    -1,    21,
     153,    -1,    22,   153,    -1,    10,    -1,    11,    -1,     9,
      -1,    72,   148,    -1,    -1,    26,    -1,    27,    -1,    28,
      -1,   141,    -1,    65,    -1,   146,    77,   153,    -1,   146,
      77,    78,   153,    -1,   146,    77,    79,   153,    -1,   146,
      77,    80,   153,    -1,   146,    77,   153,    81,   153,    -1,
     146,    77,   153,    79,   153,    -1,   146,    77,   153,    82,
     153,    -1,   146,    77,   153,    42,   153,    -1,   146,    77,
     153,    83,   153,    -1,   146,    77,   153,    84,   153,    -1,
     146,    77,   153,    85,   153,    -1,   146,    77,   153,    24,
     153,    -1,   146,    77,   153,    25,   153,    -1,   146,    77,
     153,    43,   153,    -1,   146,    77,   153,    44,   153,    -1,
     146,    77,   153,    45,   153,    -1,   146,    77,   153,    30,
     153,    -1,   146,    77,   153,    86,   153,    -1,   146,    77,
     153,    87,   153,    -1,   146,    77,   153,    80,   153,    -1,
     146,    77,   153,    88,   154,    89,    -1,   153,    88,   154,
      89,    77,   153,    -1,   146,    77,     8,   141,    46,   153,
      -1,   146,    77,     8,   141,    -1,   146,    77,    29,   153,
      -1,   146,    77,    29,   153,    88,   154,    89,    -1,   146,
      77,    39,   153,    -1,   146,    77,    38,    65,    -1,   146,
      77,    37,   161,    -1,    37,   161,    77,   153,    -1,    -1,
       8,   143,    98,    -1,    29,   146,    46,   153,    -1,    29,
     146,    46,   153,    88,   154,    89,    -1,    39,   146,    46,
     153,    -1,     6,   153,   145,   153,     4,   151,    -1,     7,
     153,   145,   153,     4,   151,    -1,     6,   153,     4,   151,
      -1,     7,   153,     4,   151,    -1,     6,   153,    46,   151,
      -1,     7,   153,    46,   151,    -1,    31,    -1,    32,    -1,
      33,    -1,    34,    -1,    35,    -1,    36,    -1,    73,    -1,
     159,    -1,    73,    -1,   159,    -1,    -1,   149,    -1,   149,
      46,   150,    -1,   150,    -1,   152,    -1,   147,    88,   154,
      89,    -1,    65,    -1,    72,    -1,   151,    -1,   153,    -1,
      73,    -1,   158,    -1,    -1,   155,   156,    -1,   157,    -1,
     156,    90,   157,    -1,   153,    -1,   159,    -1,   160,    -1,
      61,    -1,    62,    -1,    63,    -1,    64,    -1,    69,    -1,
      67,    -1,    68,    -1,    66,    -1,    63,    -1,    66,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   458,   458,   458,   466,   467,   470,   471,   472,   473,
     476,   476,   478,   480,   485,   484,   493,   497,   506,   507,
     508,   511,   511,   517,   519,   517,   529,   530,   531,   534,
     534,   538,   538,   567,   568,   571,   572,   575,   579,   584,
     585,   586,   589,   592,   593,   594,   597,   598,   598,   601,
     601,   617,   617,   634,   635,   636,   639,   642,   643,   646,
     646,   648,   649,   650,   651,   652,   653,   656,   657,   660,
     661,   664,   667,   669,   671,   673,   674,   675,   676,   676,
     677,   677,   679,   679,   681,   681,   683,   684,   685,   686,
     687,   688,   689,   690,   691,   692,   693,   694,   695,   698,
     700,   701,   702,   705,   709,   711,   712,   713,   714,   715,
     716,   717,   718,   719,   720,   721,   722,   723,   724,   725,
     726,   727,   728,   729,   730,   731,   732,   733,   734,   735,
     737,   739,   741,   742,   743,   743,   745,   746,   748,   751,
     753,   755,   756,   757,   758,   762,   764,   765,   766,   767,
     768,   772,   773,   775,   776,   779,   780,   783,   784,   787,
     788,   792,   794,   796,   798,   801,   802,   805,   805,   809,
     810,   813,   816,   817,   820,   821,   822,   823,   824,   827,
     828,   829,   832,   833
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
  "INC", "DEC", "GLOBAL_CONST", "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", 
  "FLOATV", "STRINGV", "DEFINED", "LOG_XOR", "RELOP_EQ", "RELOP_NE", 
  "RELOP_GT", "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "GLOBAL", "ADDR", 
  "CLONE", "RESULT", "RETURN", "POW", "SHIFT_RIGHT_U", "LOG_AND", 
  "LOG_OR", "COMMA", "ESUB", "PCC_BEGIN", "PCC_END", "PCC_CALL", 
  "PCC_SUB", "PCC_BEGIN_RETURN", "PCC_END_RETURN", "PCC_BEGIN_YIELD", 
  "PCC_END_YIELD", "PROTOTYPED", "NON_PROTOTYPED", "LABEL", "EMIT", "EOM", 
  "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "STRINGC", "INTC", 
  "FLOATC", "REG", "MACRO", "ENDM", "PARROT_OP", "VAR", "LINECOMMENT", 
  "FILECOMMENT", "'\\n'", "'='", "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", 
  "'%'", "'.'", "'&'", "'|'", "'['", "']'", "';'", "$accept", "program", 
  "@1", "pasmcode", "pasmline", "pasm_inst", "@2", "pasm_args", "emit", 
  "@3", "nsub", "sub_body", "sub", "sub_start", "@4", "pcc_sub", "@5", 
  "@6", "pcc_params", "pcc_param", "@7", "pcc_sub_call", "@8", 
  "pcc_proto", "pcc_sub_proto", "pcc_call", "pcc_args", "pcc_arg", 
  "pcc_results", "pcc_result", "@9", "pcc_ret", "@10", "pcc_yield", "@11", 
  "pcc_returns", "pcc_return", "statements", "statement", "@12", "labels", 
  "_labels", "label", "instruction", "labeled_inst", "@13", "@14", "@15", 
  "@16", "type", "classname", "assignment", "@17", "if_statement", 
  "relop", "target", "lhs", "vars", "_vars", "_var_or_i", "label_op", 
  "var_or_i", "var", "keylist", "@18", "_keylist", "key", "rc", "reg", 
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
     325,   326,   327,   328,   329,   330,    10,    61,    33,    45,
     126,    43,    42,    47,    37,    46,    38,   124,    91,    93,
      59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    91,    93,    92,    94,    94,    95,    95,    95,    95,
      97,    96,    96,    98,   100,    99,   101,   102,   103,   103,
     103,   105,   104,   107,   108,   106,   109,   109,   109,   111,
     110,   113,   112,   114,   114,   115,   115,   116,   116,   117,
     117,   117,   118,   119,   119,   119,   120,   121,   120,   123,
     122,   125,   124,   126,   126,   126,   127,   128,   128,   130,
     129,   129,   129,   129,   129,   129,   129,   131,   131,   132,
     132,   133,   134,   134,   135,   135,   135,   135,   136,   135,
     137,   135,   138,   135,   139,   135,   135,   135,   135,   135,
     135,   135,   135,   135,   135,   135,   135,   135,   135,   140,
     140,   140,   140,   141,   142,   142,   142,   142,   142,   142,
     142,   142,   142,   142,   142,   142,   142,   142,   142,   142,
     142,   142,   142,   142,   142,   142,   142,   142,   142,   142,
     142,   142,   142,   142,   143,   142,   142,   142,   142,   144,
     144,   144,   144,   144,   144,   145,   145,   145,   145,   145,
     145,   146,   146,   147,   147,   148,   148,   149,   149,   150,
     150,   151,   151,   152,   152,   153,   153,   155,   154,   156,
     156,   157,   158,   158,   159,   159,   159,   159,   159,   160,
     160,   160,   161,   161
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     2,     3,     2,     1,     1,
       0,     3,     0,     1,     0,     4,     2,     2,     1,     1,
       1,     0,     4,     0,     0,     8,     0,     2,     3,     0,
       4,     0,    11,     1,     1,     0,     1,     5,     3,     0,
       2,     3,     2,     0,     2,     3,     2,     0,     4,     0,
       6,     0,     6,     0,     2,     3,     2,     1,     2,     0,
       2,     2,     1,     1,     1,     1,     1,     0,     1,     2,
       1,     1,     3,     1,     1,     1,     2,     2,     0,     4,
       0,     6,     0,     6,     0,     4,     2,     2,     2,     2,
       2,     2,     2,     2,     1,     1,     1,     2,     0,     1,
       1,     1,     1,     1,     3,     4,     4,     4,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     6,     6,     6,     4,     4,     7,
       4,     4,     4,     4,     0,     3,     4,     7,     4,     6,
       6,     4,     4,     4,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     1,     3,     1,     1,
       4,     1,     1,     1,     1,     1,     1,     0,     2,     1,
       3,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,    59,     1,     0,     0,     0,     0,    66,    65,
      62,    63,    64,    59,    57,    67,    33,    34,     0,    49,
      51,    61,    58,    21,    23,    71,    14,    20,    18,    73,
      59,    19,    98,    68,    70,    60,    31,    53,    53,     0,
       0,    67,    16,    59,     0,     0,     0,     0,     0,   134,
      96,    94,    95,     0,     0,    78,    80,    84,     0,     0,
      82,     0,     0,     0,     0,     0,   174,   175,   176,   177,
     181,   179,   180,   178,   155,   151,     0,    74,    75,     0,
       0,   166,   152,   173,    69,    39,     0,     0,     0,    35,
       0,     9,     8,    67,     4,    10,    17,   161,   162,    90,
      91,   165,    88,   172,     0,     0,   155,    76,    77,     0,
       0,     0,    86,    92,    93,     0,   151,     0,   152,   182,
     183,     0,     0,    87,    89,   165,     0,    97,   156,   158,
     163,   159,   164,   172,    72,     0,   167,     0,     0,     0,
       0,     0,    54,     0,     0,    22,    36,     0,     7,    15,
       5,     0,     0,     0,   145,   146,   147,   148,   149,   150,
       0,     0,     0,     0,     0,   135,    13,    99,   100,   101,
     103,     0,   102,     0,     0,     0,     0,     0,     0,   167,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   104,
       0,     0,    42,     0,     0,     0,    40,    56,    50,    55,
      52,    24,     6,   155,   141,   143,     0,   142,   144,     0,
      79,     0,    85,     0,   136,   133,   138,     0,   157,   127,
     128,   132,   131,   130,   105,   106,   107,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   167,     0,   171,   168,   169,     0,     0,
      41,    26,    11,     0,     0,     0,     0,   167,   160,     0,
     167,   115,   116,   120,   111,   117,   118,   119,   109,   123,
     108,   110,   112,   113,   114,   121,   122,     0,     0,     0,
       0,    38,    43,    29,    59,     0,   139,   140,    81,    83,
       0,   126,     0,   124,   125,   170,     0,    47,     0,     0,
       0,     0,    25,     0,    27,   137,   129,    37,     0,    46,
       0,     0,    44,     0,    28,     0,    32,    45,    30,    48
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,    93,    94,   151,   152,   165,    27,    41,
      28,    42,    29,    30,    39,    31,    40,   251,   284,   285,
     301,    10,    85,    18,   147,   194,   138,   139,   299,   300,
     308,    11,    37,    12,    38,    86,   143,    43,    14,    15,
      95,    33,    34,    35,    76,   109,   110,   115,   111,   171,
     172,    77,   106,    78,   161,    79,   126,   166,   128,   129,
     130,   131,   132,   190,   191,   246,   247,    81,   103,    83,
     121
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -193
static const short yypact[] =
{
    -193,    36,   182,  -193,    45,   -55,   -35,   -21,  -193,  -193,
    -193,  -193,  -193,     6,  -193,     8,  -193,  -193,    -5,  -193,
    -193,  -193,  -193,  -193,  -193,  -193,  -193,  -193,  -193,  -193,
     182,  -193,   290,    17,  -193,  -193,  -193,  -193,  -193,    12,
      33,    -1,  -193,   170,   -28,   -28,   303,   303,   303,  -193,
    -193,  -193,  -193,    47,    50,  -193,  -193,   125,   303,   303,
    -193,   112,   -58,   112,   303,   303,  -193,  -193,  -193,  -193,
    -193,  -193,  -193,  -193,   271,   -10,    34,  -193,  -193,    40,
      31,  -193,    35,  -193,  -193,   111,   -31,   -30,    48,    45,
      49,  -193,  -193,    39,  -193,    54,  -193,  -193,  -193,  -193,
    -193,  -193,  -193,  -193,   103,   136,   271,  -193,  -193,    -9,
      -9,    -9,  -193,  -193,  -193,    -9,  -193,    82,  -193,  -193,
    -193,    56,    85,  -193,  -193,    53,    55,  -193,    96,  -193,
    -193,  -193,  -193,    59,  -193,   212,  -193,   303,     2,    72,
     303,    75,  -193,    76,    84,  -193,  -193,    86,  -193,  -193,
    -193,    87,    92,   -28,  -193,  -193,  -193,  -193,  -193,  -193,
     -28,   303,   -28,   -28,   303,  -193,  -193,  -193,  -193,  -193,
    -193,    93,  -193,   101,   113,   114,   303,   303,   303,  -193,
     271,   118,   303,   -58,   119,   303,   303,   303,   303,     5,
      88,   303,  -193,   303,    17,   115,  -193,  -193,  -193,  -193,
    -193,  -193,  -193,   271,  -193,  -193,   186,  -193,  -193,   188,
    -193,   116,  -193,   138,   128,  -193,  -193,   124,  -193,   173,
     135,  -193,  -193,  -193,  -193,  -193,  -193,   303,   303,   303,
     303,   303,   303,   303,   303,   303,   303,   303,   303,   303,
     303,   303,   303,  -193,   148,  -193,   139,  -193,   -34,   150,
    -193,   208,  -193,   -28,   -28,    28,    28,  -193,  -193,   303,
    -193,  -193,  -193,  -193,  -193,  -193,  -193,  -193,  -193,  -193,
    -193,  -193,  -193,  -193,  -193,  -193,  -193,   142,   303,   303,
     303,  -193,    21,  -193,    52,   156,  -193,  -193,  -193,  -193,
     144,  -193,   146,  -193,  -193,  -193,   161,  -193,   303,    13,
     162,    -9,  -193,   163,  -193,  -193,  -193,  -193,    -9,  -193,
     166,   167,  -193,   189,  -193,   190,  -193,  -193,  -193,  -193
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -193,  -193,  -193,  -193,   160,  -193,  -193,    57,  -193,  -193,
    -193,   -26,  -193,  -193,  -193,  -193,  -193,  -193,  -193,   -25,
    -193,  -193,  -193,   172,  -193,  -193,  -193,   126,  -193,   -37,
    -193,  -193,  -193,  -193,  -193,   225,  -193,   263,     0,  -193,
     252,  -193,   -29,  -193,  -193,  -193,  -193,  -193,  -193,   -87,
      89,  -193,  -193,  -193,   164,     7,  -193,   194,  -193,    91,
     -42,  -193,   -32,  -178,  -193,  -193,    -7,  -193,   -23,  -192,
      94
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -173
static const short yytable[] =
{
      80,   217,    99,   100,    84,   119,    -3,   137,   120,    82,
     140,   140,   280,    22,   102,   104,   105,   167,   168,   169,
      23,    19,   141,   173,   174,   144,   113,   114,   175,   227,
     228,   297,   123,   124,   112,   229,     3,    97,   118,   297,
     118,    20,   281,    22,    98,   142,   142,   230,   231,   232,
     233,   133,   193,   298,     4,    21,   170,    25,     5,    24,
       6,   298,   310,   288,   289,   277,    25,    26,   117,    90,
     122,    36,   283,    91,    92,    25,     7,    88,  -165,   290,
       8,     9,   292,   133,   234,   235,   236,   237,   238,   239,
     240,   241,   242,   243,    70,    71,    72,    25,    89,   149,
       4,    16,    17,   189,     5,   192,     6,   153,   197,    90,
     134,   204,   107,    91,    92,   108,   137,   135,   205,   136,
     207,   208,     7,  -172,   145,   148,     8,     9,   176,   206,
     -12,   178,   209,   177,   154,   155,   156,   157,   158,   159,
     162,  -153,   180,   179,   214,   215,   216,  -154,   196,   160,
     220,   198,   199,   223,   224,   225,   226,   133,   210,   245,
     200,   248,   201,   202,   203,   249,   211,   154,   155,   156,
     157,   158,   159,    66,    67,    68,    69,   244,   212,   213,
     133,    73,   163,   170,   222,   116,    66,    67,    68,    69,
     253,   250,   254,   255,    73,   261,   262,   263,   264,   265,
     266,   267,   268,   269,   270,   271,   272,   273,   274,   275,
     276,   286,   287,   258,   313,   256,   257,    96,     4,   259,
     181,   315,     5,   260,     6,   278,   282,   291,   283,   279,
       4,   293,   304,   305,     5,   306,     6,   307,   312,   314,
       7,   182,   316,   317,     8,     9,   294,   245,   296,   183,
     184,   185,     7,   150,   318,   319,     8,     9,   302,   303,
     252,   146,   311,    87,   195,    13,   309,    32,   127,   164,
     219,   218,   295,    66,    67,    68,    69,   221,    70,    71,
      72,    73,     0,     0,     0,   101,     0,     0,     0,     0,
     186,   187,   188,    44,    45,    46,    47,    48,    49,    50,
      51,    52,     0,    53,    54,     0,     0,     0,    55,    56,
      57,    58,    59,    60,     0,     0,     0,     0,     0,    61,
       0,     0,     0,     0,     0,     0,     0,    62,     0,    63,
      64,    65,    66,    67,    68,    69,    97,    70,    71,    72,
      73,     0,     0,    98,   125,     0,     0,     0,     0,     0,
       0,    66,    67,    68,    69,     0,    70,    71,    72,    73,
       0,     0,    74,    75,    66,    67,    68,    69,     0,    70,
      71,    72,    73,     0,     0,     0,   101
};

static const short yycheck[] =
{
      32,   179,    44,    45,    33,    63,     0,     5,    66,    32,
      41,    41,    46,    13,    46,    47,    48,    26,    27,    28,
      12,    76,    53,   110,   111,    55,    58,    59,   115,    24,
      25,    18,    64,    65,    57,    30,     0,    65,    61,    18,
      63,    76,    76,    43,    72,    76,    76,    42,    43,    44,
      45,    74,    50,    40,    48,    76,    65,    58,    52,    51,
      54,    40,    49,   255,   256,   243,    58,    59,    61,    70,
      63,    76,    20,    74,    75,    58,    70,    65,    88,   257,
      74,    75,   260,   106,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    66,    67,    68,    58,    65,    60,
      48,    56,    57,   135,    52,   137,    54,     4,   140,    70,
      76,   153,    65,    74,    75,    65,     5,    77,   160,    88,
     162,   163,    70,    88,    76,    76,    74,    75,    46,   161,
      76,    46,   164,    77,    31,    32,    33,    34,    35,    36,
       4,    88,    46,    88,   176,   177,   178,    88,    76,    46,
     182,    76,    76,   185,   186,   187,   188,   180,    65,   191,
      76,   193,    76,    76,    72,   194,    65,    31,    32,    33,
      34,    35,    36,    61,    62,    63,    64,    89,    65,    65,
     203,    69,    46,    65,    65,    73,    61,    62,    63,    64,
       4,    76,     4,    77,    69,   227,   228,   229,   230,   231,
     232,   233,   234,   235,   236,   237,   238,   239,   240,   241,
     242,   253,   254,    89,   301,    77,    88,    47,    48,    46,
       8,   308,    52,    88,    54,    77,    76,   259,    20,    90,
      48,    89,    76,    89,    52,    89,    54,    76,    76,    76,
      70,    29,    76,    76,    74,    75,   278,   279,   280,    37,
      38,    39,    70,    93,    65,    65,    74,    75,   284,   284,
     203,    89,   299,    38,   138,     2,   298,    15,    74,   105,
     181,   180,   279,    61,    62,    63,    64,   183,    66,    67,
      68,    69,    -1,    -1,    -1,    73,    -1,    -1,    -1,    -1,
      78,    79,    80,     3,     4,     5,     6,     7,     8,     9,
      10,    11,    -1,    13,    14,    -1,    -1,    -1,    18,    19,
      20,    21,    22,    23,    -1,    -1,    -1,    -1,    -1,    29,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    37,    -1,    39,
      40,    41,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    -1,    -1,    72,    73,    -1,    -1,    -1,    -1,    -1,
      -1,    61,    62,    63,    64,    -1,    66,    67,    68,    69,
      -1,    -1,    72,    73,    61,    62,    63,    64,    -1,    66,
      67,    68,    69,    -1,    -1,    -1,    73
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    92,    93,     0,    48,    52,    54,    70,    74,    75,
     112,   122,   124,   128,   129,   130,    56,    57,   114,    76,
      76,    76,   129,    12,    51,    58,    59,    99,   101,   103,
     104,   106,   131,   132,   133,   134,    76,   123,   125,   105,
     107,   100,   102,   128,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    13,    14,    18,    19,    20,    21,    22,
      23,    29,    37,    39,    40,    41,    61,    62,    63,    64,
      66,    67,    68,    69,    72,    73,   135,   142,   144,   146,
     153,   158,   159,   160,   133,   113,   126,   126,    65,    65,
      70,    74,    75,    94,    95,   131,    47,    65,    72,   151,
     151,    73,   153,   159,   153,   153,   143,    65,    65,   136,
     137,   139,   159,   153,   153,   138,    73,   146,   159,    63,
      66,   161,   146,   153,   153,    73,   147,   148,   149,   150,
     151,   152,   153,   159,    76,    77,    88,     5,   117,   118,
      41,    53,    76,   127,    55,    76,   114,   115,    76,    60,
      95,    96,    97,     4,    31,    32,    33,    34,    35,    36,
      46,   145,     4,    46,   145,    98,   148,    26,    27,    28,
      65,   140,   141,   140,   140,   140,    46,    77,    46,    88,
      46,     8,    29,    37,    38,    39,    78,    79,    80,   153,
     154,   155,   153,    50,   116,   118,    76,   153,    76,    76,
      76,    76,    76,    72,   151,   151,   153,   151,   151,   153,
      65,    65,    65,    65,   153,   153,   153,   154,   150,   141,
     153,   161,    65,   153,   153,   153,   153,    24,    25,    30,
      42,    43,    44,    45,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,   153,   156,   157,   153,   133,
      76,   108,    98,     4,     4,    77,    77,    88,    89,    46,
      88,   153,   153,   153,   153,   153,   153,   153,   153,   153,
     153,   153,   153,   153,   153,   153,   153,   154,    77,    90,
      46,    76,    76,    20,   109,   110,   151,   151,   160,   160,
     154,   153,   154,    89,   153,   157,   153,    18,    40,   119,
     120,   111,   102,   110,    76,    89,    89,    76,   121,   153,
      49,   120,    76,   140,    76,   140,    76,    76,    65,    65
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
#line 458 "imcc.y"
    { open_comp_unit(); }
    break;

  case 3:
#line 459 "imcc.y"
    { yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 6:
#line 470 "imcc.y"
    { yyval.i = 0; }
    break;

  case 7:
#line 471 "imcc.y"
    { yyval.i = 0; }
    break;

  case 8:
#line 472 "imcc.y"
    { yyval.i = 0; }
    break;

  case 9:
#line 473 "imcc.y"
    { yyval.i = 0; }
    break;

  case 10:
#line 476 "imcc.y"
    {clear_state();}
    break;

  case 11:
#line 477 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs,1); free(yyvsp[-1].s); }
    break;

  case 12:
#line 478 "imcc.y"
    { yyval.i = 0;}
    break;

  case 14:
#line 485 "imcc.y"
    { open_comp_unit();
                                          function = "(emit)"; }
    break;

  case 15:
#line 488 "imcc.y"
    { if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); yyval.i=0;}
    break;

  case 17:
#line 499 "imcc.y"
    {
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 21:
#line 511 "imcc.y"
    { open_comp_unit(); }
    break;

  case 22:
#line 513 "imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 23:
#line 517 "imcc.y"
    { open_comp_unit(); }
    break;

  case 24:
#line 519 "imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 25:
#line 526 "imcc.y"
    { yyval.i = 0; }
    break;

  case 26:
#line 529 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 27:
#line 530 "imcc.y"
    { add_pcc_param(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 28:
#line 531 "imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 29:
#line 534 "imcc.y"
    { is_def=1; }
    break;

  case 30:
#line 535 "imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 31:
#line 538 "imcc.y"
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

  case 32:
#line 564 "imcc.y"
    { yyval.i = 0; }
    break;

  case 33:
#line 567 "imcc.y"
    { yyval.t = 1; }
    break;

  case 34:
#line 568 "imcc.y"
    { yyval.t = 0; }
    break;

  case 35:
#line 571 "imcc.y"
    { yyval.t = -1; }
    break;

  case 37:
#line 575 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 38:
#line 579 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 39:
#line 584 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 40:
#line 585 "imcc.y"
    {  add_pcc_arg(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 41:
#line 586 "imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 42:
#line 589 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 43:
#line 592 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 44:
#line 593 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 45:
#line 594 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-7].sr, yyvsp[-1].sr); }
    break;

  case 46:
#line 597 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 47:
#line 598 "imcc.y"
    { is_def=1; }
    break;

  case 48:
#line 598 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 49:
#line 601 "imcc.y"
    {
                Instruction *i, *ins = instructions;
                SymReg *r;
                char name[128];
                if (!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
                    fataly(EX_SOFTWARE, "pcc_ret", line,
                        "pcc_return not inside pcc subroutine\n");
                sprintf(name, "#pcc_sub_ret_%d", line - 1);
                yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
                i = iLABEL(r);
                i->type = ITPCCSUB | ITLABEL;
        }
    break;

  case 50:
#line 614 "imcc.y"
    { yyval.i = 0; }
    break;

  case 51:
#line 617 "imcc.y"
    {
                Instruction *i, *ins = instructions;
                SymReg *r;
                char name[128];
                if (!ins || !ins->r[1] || ins->r[1]->type != VT_PCC_SUB)
                    fataly(EX_SOFTWARE, "pcc_yield", line,
                        "pcc_yield not inside pcc subroutine\n");
                ins->r[1]->pcc_sub->calls_a_sub = 1;
                sprintf(name, "#pcc_sub_yield_%d", line - 1);
                yyval.sr = r = mk_pcc_sub(str_dup(name), 0);
                i = iLABEL(r);
                i->type = ITPCCSUB | ITLABEL | ITPCCYIELD;
        }
    break;

  case 52:
#line 631 "imcc.y"
    { yyval.i = 0; }
    break;

  case 53:
#line 634 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 54:
#line 635 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 55:
#line 636 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 56:
#line 639 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 59:
#line 646 "imcc.y"
    { clear_state(); }
    break;

  case 60:
#line 647 "imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 61:
#line 648 "imcc.y"
    { yyval.i = 0; }
    break;

  case 62:
#line 649 "imcc.y"
    { yyval.i = 0; }
    break;

  case 65:
#line 652 "imcc.y"
    { yyval.i = 0; }
    break;

  case 66:
#line 653 "imcc.y"
    { yyval.i = 0; }
    break;

  case 67:
#line 656 "imcc.y"
    { yyval.i = NULL; }
    break;

  case 71:
#line 664 "imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 72:
#line 668 "imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 76:
#line 674 "imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 77:
#line 675 "imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 78:
#line 676 "imcc.y"
    { is_def=1; }
    break;

  case 79:
#line 676 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 80:
#line 677 "imcc.y"
    { is_def=1; }
    break;

  case 81:
#line 678 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 82:
#line 679 "imcc.y"
    { is_def=1; }
    break;

  case 83:
#line 680 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 84:
#line 681 "imcc.y"
    { is_def=1; }
    break;

  case 85:
#line 681 "imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            R1(mk_ident(yyvsp[0].s, yyvsp[-1].t)));is_def=0; }
    break;

  case 86:
#line 683 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 87:
#line 684 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 88:
#line 685 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 89:
#line 686 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 90:
#line 687 "imcc.y"
    { yyval.i = MK_I(interp, "bsr",  R1(yyvsp[0].sr)); }
    break;

  case 91:
#line 688 "imcc.y"
    { yyval.i = MK_I(interp, "branch",R1(yyvsp[0].sr)); }
    break;

  case 92:
#line 689 "imcc.y"
    { yyval.i = MK_I(interp, "inc",R1(yyvsp[0].sr)); }
    break;

  case 93:
#line 690 "imcc.y"
    { yyval.i = MK_I(interp, "dec",R1(yyvsp[0].sr)); }
    break;

  case 94:
#line 691 "imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,R0()); }
    break;

  case 95:
#line 692 "imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,R0()); }
    break;

  case 96:
#line 693 "imcc.y"
    { yyval.i = MK_I(interp, "end" ,R0()); }
    break;

  case 97:
#line 694 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs, 1); free(yyvsp[-1].s); }
    break;

  case 98:
#line 695 "imcc.y"
    { yyval.i = 0;}
    break;

  case 99:
#line 699 "imcc.y"
    { yyval.t = 'I'; }
    break;

  case 100:
#line 700 "imcc.y"
    { yyval.t = 'N'; }
    break;

  case 101:
#line 701 "imcc.y"
    { yyval.t = 'S'; }
    break;

  case 102:
#line 702 "imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 104:
#line 710 "imcc.y"
    { yyval.i = MK_I(interp, "set", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 105:
#line 711 "imcc.y"
    { yyval.i = MK_I(interp, "not", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 106:
#line 712 "imcc.y"
    { yyval.i = MK_I(interp, "neg", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 107:
#line 713 "imcc.y"
    { yyval.i = MK_I(interp, "bnot", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 108:
#line 714 "imcc.y"
    { yyval.i = MK_I(interp, "add", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 109:
#line 715 "imcc.y"
    { yyval.i = MK_I(interp, "sub", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 110:
#line 716 "imcc.y"
    { yyval.i = MK_I(interp, "mul", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 111:
#line 717 "imcc.y"
    { yyval.i = MK_I(interp, "pow", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 112:
#line 718 "imcc.y"
    { yyval.i = MK_I(interp, "div", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 113:
#line 719 "imcc.y"
    { yyval.i = MK_I(interp, "mod", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 114:
#line 720 "imcc.y"
    { yyval.i = MK_I(interp, "concat", R3(yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 115:
#line 721 "imcc.y"
    { yyval.i = MK_I(interp, "shl", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 116:
#line 722 "imcc.y"
    { yyval.i = MK_I(interp, "shr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 117:
#line 723 "imcc.y"
    { yyval.i = MK_I(interp, "lsr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 118:
#line 724 "imcc.y"
    { yyval.i = MK_I(interp, "and", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 119:
#line 725 "imcc.y"
    { yyval.i = MK_I(interp, "or", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 120:
#line 726 "imcc.y"
    { yyval.i = MK_I(interp, "xor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 121:
#line 727 "imcc.y"
    { yyval.i = MK_I(interp, "band", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 122:
#line 728 "imcc.y"
    { yyval.i = MK_I(interp, "bor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 123:
#line 729 "imcc.y"
    { yyval.i = MK_I(interp, "bxor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 124:
#line 730 "imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 125:
#line 731 "imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 126:
#line 732 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 127:
#line 733 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 128:
#line 734 "imcc.y"
    { yyval.i = MK_I(interp, "defined",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 129:
#line 735 "imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", R3(yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 130:
#line 737 "imcc.y"
    { yyval.i = MK_I(interp, "clone",R2(yyvsp[-3].sr, yyvsp[0].sr));
    }
    break;

  case 131:
#line 739 "imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          R2(yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once))); }
    break;

  case 132:
#line 741 "imcc.y"
    { yyval.i = MK_I(interp, "find_global",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 133:
#line 742 "imcc.y"
    { yyval.i = MK_I(interp, "store_global",R2(yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 134:
#line 743 "imcc.y"
    { expect_pasm = 1; }
    break;

  case 135:
#line 744 "imcc.y"
    { yyval.i = iANY(interp, "new",0,regs,1);  }
    break;

  case 136:
#line 745 "imcc.y"
    { yyval.i = MK_I(interp, "defined", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 137:
#line 746 "imcc.y"
    { keyvec=KEY_BIT(2);
                                       yyval.i = MK_I(interp, "defined", R3(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 138:
#line 748 "imcc.y"
    { yyval.i = MK_I(interp, "clone", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 139:
#line 752 "imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,R3(yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 140:
#line 753 "imcc.y"
    {yyval.i=MK_I(interp, inv_op(yyvsp[-3].s),
                                            R3(yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 141:
#line 755 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 142:
#line 756 "imcc.y"
    {yyval.i= MK_I(interp, "unless",R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 143:
#line 757 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 144:
#line 758 "imcc.y"
    {yyval.i= MK_I(interp, "unless", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 145:
#line 763 "imcc.y"
    { yyval.s = "eq"; }
    break;

  case 146:
#line 764 "imcc.y"
    { yyval.s = "ne"; }
    break;

  case 147:
#line 765 "imcc.y"
    { yyval.s = "gt"; }
    break;

  case 148:
#line 766 "imcc.y"
    { yyval.s = "ge"; }
    break;

  case 149:
#line 767 "imcc.y"
    { yyval.s = "lt"; }
    break;

  case 150:
#line 768 "imcc.y"
    { yyval.s = "le"; }
    break;

  case 155:
#line 779 "imcc.y"
    { yyval.sr = NULL; }
    break;

  case 156:
#line 780 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 157:
#line 783 "imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 159:
#line 787 "imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 160:
#line 788 "imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 161:
#line 793 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 162:
#line 794 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 167:
#line 805 "imcc.y"
    { nkeys=0; }
    break;

  case 168:
#line 806 "imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 169:
#line 809 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 170:
#line 810 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 174:
#line 820 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 175:
#line 821 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 176:
#line 822 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 177:
#line 823 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 178:
#line 824 "imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 179:
#line 827 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 180:
#line 828 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 181:
#line 829 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 182:
#line 832 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 183:
#line 833 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2648 "imcparser.c"

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


#line 837 "imcc.y"



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

