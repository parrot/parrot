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
        debug(interpreter, DEBUG_PARSER,"%s %s\t%s\n", name, format, fullname);
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
#define YYLAST   329

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  91
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  72
/* YYNRULES -- Number of rules. */
#define YYNRULES  185
/* YYNRULES -- Number of states. */
#define YYNSTATES  322

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
       0,     0,     3,     4,     7,     9,    11,    13,    15,    17,
      20,    22,    25,    29,    32,    34,    36,    37,    41,    42,
      44,    45,    50,    53,    56,    57,    62,    63,    64,    73,
      74,    77,    81,    82,    87,    88,   100,   102,   104,   105,
     107,   113,   117,   118,   121,   125,   128,   129,   132,   136,
     139,   140,   145,   146,   153,   154,   161,   162,   165,   169,
     172,   174,   177,   178,   181,   184,   186,   188,   190,   192,
     194,   195,   197,   200,   202,   204,   208,   210,   212,   215,
     218,   219,   224,   225,   232,   233,   240,   241,   246,   249,
     252,   255,   258,   261,   264,   267,   270,   272,   274,   276,
     279,   280,   282,   284,   286,   288,   290,   294,   299,   304,
     309,   315,   321,   327,   333,   339,   345,   351,   357,   363,
     369,   375,   381,   387,   393,   399,   405,   412,   419,   426,
     431,   436,   444,   449,   454,   459,   464,   465,   469,   474,
     482,   487,   494,   501,   506,   511,   516,   521,   523,   525,
     527,   529,   531,   533,   535,   537,   539,   541,   542,   544,
     548,   550,   552,   557,   559,   561,   563,   565,   567,   569,
     570,   573,   575,   579,   581,   583,   585,   587,   589,   591,
     593,   595,   597,   599,   601,   603
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      92,     0,    -1,    -1,    93,    95,    -1,   103,    -1,   107,
      -1,   101,    -1,    76,    -1,    94,    -1,    95,    94,    -1,
      97,    -1,    96,    97,    -1,   132,    98,    76,    -1,    70,
      76,    -1,    75,    -1,    74,    -1,    -1,    99,    72,   100,
      -1,    -1,   149,    -1,    -1,    59,   102,    96,    60,    -1,
     105,   104,    -1,   129,    47,    -1,    -1,    12,   106,    65,
      76,    -1,    -1,    -1,    51,   108,    65,   116,    76,   109,
     110,   104,    -1,    -1,   111,    76,    -1,   110,   111,    76,
      -1,    -1,    20,   112,   141,    65,    -1,    -1,    48,   115,
      76,   114,   118,   117,   134,    76,   120,    49,    76,    -1,
      56,    -1,    57,    -1,    -1,   115,    -1,    50,   154,    46,
     154,    76,    -1,    50,   154,    76,    -1,    -1,   119,    76,
      -1,   118,   119,    76,    -1,     5,   154,    -1,    -1,   121,
      76,    -1,   120,   121,    76,    -1,    40,   154,    -1,    -1,
      18,   122,   141,    65,    -1,    -1,    52,    76,   124,   127,
      53,    76,    -1,    -1,    54,    76,   126,   127,    55,    76,
      -1,    -1,   127,    76,    -1,   127,   128,    76,    -1,    41,
     154,    -1,   130,    -1,   129,   130,    -1,    -1,   131,   135,
      -1,    70,    76,    -1,   113,    -1,   123,    -1,   125,    -1,
      75,    -1,    74,    -1,    -1,   133,    -1,   133,   134,    -1,
     134,    -1,    58,    -1,   132,   136,    76,    -1,   143,    -1,
     145,    -1,    13,    65,    -1,    14,    65,    -1,    -1,    18,
     137,   141,    65,    -1,    -1,    19,   138,   141,    65,    77,
     161,    -1,    -1,    23,   139,   141,    65,    77,   161,    -1,
      -1,    20,   140,   141,    65,    -1,    20,   160,    -1,    40,
     154,    -1,     5,   154,    -1,    41,   154,    -1,     3,   152,
      -1,     4,   152,    -1,    21,   154,    -1,    22,   154,    -1,
      10,    -1,    11,    -1,     9,    -1,    72,   149,    -1,    -1,
      26,    -1,    27,    -1,    28,    -1,   142,    -1,    65,    -1,
     147,    77,   154,    -1,   147,    77,    78,   154,    -1,   147,
      77,    79,   154,    -1,   147,    77,    80,   154,    -1,   147,
      77,   154,    81,   154,    -1,   147,    77,   154,    79,   154,
      -1,   147,    77,   154,    82,   154,    -1,   147,    77,   154,
      42,   154,    -1,   147,    77,   154,    83,   154,    -1,   147,
      77,   154,    84,   154,    -1,   147,    77,   154,    85,   154,
      -1,   147,    77,   154,    24,   154,    -1,   147,    77,   154,
      25,   154,    -1,   147,    77,   154,    43,   154,    -1,   147,
      77,   154,    44,   154,    -1,   147,    77,   154,    45,   154,
      -1,   147,    77,   154,    30,   154,    -1,   147,    77,   154,
      86,   154,    -1,   147,    77,   154,    87,   154,    -1,   147,
      77,   154,    80,   154,    -1,   147,    77,   154,    88,   155,
      89,    -1,   154,    88,   155,    89,    77,   154,    -1,   147,
      77,     8,   142,    46,   154,    -1,   147,    77,     8,   142,
      -1,   147,    77,    29,   154,    -1,   147,    77,    29,   154,
      88,   155,    89,    -1,   147,    77,    39,   154,    -1,   147,
      77,    38,    65,    -1,   147,    77,    37,   162,    -1,    37,
     162,    77,   154,    -1,    -1,     8,   144,   100,    -1,    29,
     147,    46,   154,    -1,    29,   147,    46,   154,    88,   155,
      89,    -1,    39,   147,    46,   154,    -1,     6,   154,   146,
     154,     4,   152,    -1,     7,   154,   146,   154,     4,   152,
      -1,     6,   154,     4,   152,    -1,     7,   154,     4,   152,
      -1,     6,   154,    46,   152,    -1,     7,   154,    46,   152,
      -1,    31,    -1,    32,    -1,    33,    -1,    34,    -1,    35,
      -1,    36,    -1,    73,    -1,   160,    -1,    73,    -1,   160,
      -1,    -1,   150,    -1,   150,    46,   151,    -1,   151,    -1,
     153,    -1,   148,    88,   155,    89,    -1,    65,    -1,    72,
      -1,   152,    -1,   154,    -1,    73,    -1,   159,    -1,    -1,
     156,   157,    -1,   158,    -1,   157,    90,   158,    -1,   154,
      -1,   160,    -1,   161,    -1,    61,    -1,    62,    -1,    63,
      -1,    64,    -1,    69,    -1,    67,    -1,    68,    -1,    66,
      -1,    63,    -1,    66,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   459,   459,   459,   463,   464,   465,   466,   469,   470,
     474,   475,   478,   479,   480,   481,   484,   484,   486,   488,
     493,   492,   501,   505,   514,   514,   520,   522,   520,   532,
     533,   534,   537,   537,   541,   541,   570,   571,   574,   575,
     578,   582,   587,   588,   589,   592,   595,   596,   597,   600,
     601,   601,   604,   604,   620,   620,   637,   638,   639,   642,
     645,   646,   649,   649,   651,   652,   653,   654,   655,   656,
     659,   660,   663,   664,   667,   670,   673,   675,   676,   677,
     678,   678,   679,   679,   681,   681,   683,   683,   685,   686,
     687,   688,   689,   690,   691,   692,   693,   694,   695,   696,
     697,   700,   702,   703,   704,   707,   711,   713,   714,   715,
     716,   717,   718,   719,   720,   721,   722,   723,   724,   725,
     726,   727,   728,   729,   730,   731,   732,   733,   734,   735,
     736,   737,   739,   741,   743,   744,   745,   745,   747,   748,
     750,   753,   755,   757,   758,   759,   760,   764,   766,   767,
     768,   769,   770,   774,   775,   777,   778,   781,   782,   785,
     786,   789,   790,   794,   796,   798,   800,   803,   804,   807,
     807,   811,   812,   815,   818,   819,   822,   823,   824,   825,
     826,   829,   830,   831,   834,   835
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
  "@1", "compilation_unit", "compilation_units", "pasmcode", "pasmline", 
  "pasm_inst", "@2", "pasm_args", "emit", "@3", "sub", "sub_body", 
  "sub_start", "@4", "pcc_sub", "@5", "@6", "pcc_params", "pcc_param", 
  "@7", "pcc_sub_call", "@8", "pcc_proto", "pcc_sub_proto", "pcc_call", 
  "pcc_args", "pcc_arg", "pcc_results", "pcc_result", "@9", "pcc_ret", 
  "@10", "pcc_yield", "@11", "pcc_returns", "pcc_return", "statements", 
  "statement", "@12", "labels", "_labels", "label", "instruction", 
  "labeled_inst", "@13", "@14", "@15", "@16", "type", "classname", 
  "assignment", "@17", "if_statement", "relop", "target", "lhs", "vars", 
  "_vars", "_var_or_i", "label_op", "var_or_i", "var", "keylist", "@18", 
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
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,    10,    61,    33,    45,
     126,    43,    42,    47,    37,    46,    38,   124,    91,    93,
      59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    91,    93,    92,    94,    94,    94,    94,    95,    95,
      96,    96,    97,    97,    97,    97,    99,    98,    98,   100,
     102,   101,   103,   104,   106,   105,   108,   109,   107,   110,
     110,   110,   112,   111,   114,   113,   115,   115,   116,   116,
     117,   117,   118,   118,   118,   119,   120,   120,   120,   121,
     122,   121,   124,   123,   126,   125,   127,   127,   127,   128,
     129,   129,   131,   130,   130,   130,   130,   130,   130,   130,
     132,   132,   133,   133,   134,   135,   136,   136,   136,   136,
     137,   136,   138,   136,   139,   136,   140,   136,   136,   136,
     136,   136,   136,   136,   136,   136,   136,   136,   136,   136,
     136,   141,   141,   141,   141,   142,   143,   143,   143,   143,
     143,   143,   143,   143,   143,   143,   143,   143,   143,   143,
     143,   143,   143,   143,   143,   143,   143,   143,   143,   143,
     143,   143,   143,   143,   143,   143,   144,   143,   143,   143,
     143,   145,   145,   145,   145,   145,   145,   146,   146,   146,
     146,   146,   146,   147,   147,   148,   148,   149,   149,   150,
     150,   151,   151,   152,   152,   153,   153,   154,   154,   156,
     155,   157,   157,   158,   159,   159,   160,   160,   160,   160,
     160,   161,   161,   161,   162,   162
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     1,     1,     1,     1,     2,
       1,     2,     3,     2,     1,     1,     0,     3,     0,     1,
       0,     4,     2,     2,     0,     4,     0,     0,     8,     0,
       2,     3,     0,     4,     0,    11,     1,     1,     0,     1,
       5,     3,     0,     2,     3,     2,     0,     2,     3,     2,
       0,     4,     0,     6,     0,     6,     0,     2,     3,     2,
       1,     2,     0,     2,     2,     1,     1,     1,     1,     1,
       0,     1,     2,     1,     1,     3,     1,     1,     2,     2,
       0,     4,     0,     6,     0,     6,     0,     4,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     1,     1,     2,
       0,     1,     1,     1,     1,     1,     3,     4,     4,     4,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     6,     6,     6,     4,
       4,     7,     4,     4,     4,     4,     0,     3,     4,     7,
       4,     6,     6,     4,     4,     4,     4,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     0,     1,     3,
       1,     1,     4,     1,     1,     1,     1,     1,     1,     0,
       2,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,     0,     1,    24,    26,    20,     7,     8,     3,
       6,     4,    62,     5,     0,     0,    70,     9,     0,     0,
       0,     0,    69,    68,    22,    65,    66,    67,    62,    60,
      70,     0,    38,    74,     0,    15,    14,    70,    10,    16,
      71,    73,    36,    37,     0,    52,    54,    64,    23,    61,
     100,    63,    25,    39,     0,    13,    21,    11,     0,     0,
      72,    34,    56,    56,     0,     0,     0,     0,     0,   136,
      98,    96,    97,     0,     0,    80,    82,    86,     0,     0,
      84,     0,     0,     0,     0,     0,   176,   177,   178,   179,
     183,   181,   182,   180,   157,   153,     0,    76,    77,     0,
       0,   168,   154,   175,    27,    12,   157,    42,     0,     0,
     163,   164,    92,    93,   167,    90,   174,     0,     0,   157,
      78,    79,     0,     0,     0,    88,    94,    95,     0,   153,
       0,   154,   184,   185,     0,     0,    89,    91,   167,     0,
      99,   158,   160,   165,   161,   166,   174,    75,     0,   169,
      29,    17,    19,     0,     0,     0,     0,     0,    57,     0,
       0,     0,   147,   148,   149,   150,   151,   152,     0,     0,
       0,     0,     0,   137,   101,   102,   103,   105,     0,   104,
       0,     0,     0,     0,     0,     0,   169,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   106,     0,     0,    32,
      62,     0,    45,     0,     0,     0,    43,    59,    53,    58,
      55,   143,   145,     0,   144,   146,     0,    81,     0,    87,
       0,   138,   135,   140,     0,   159,   129,   130,   134,   133,
     132,   107,   108,   109,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
     169,     0,   173,   170,   171,     0,    28,     0,    30,     0,
       0,    44,     0,     0,     0,     0,   169,   162,     0,   169,
     117,   118,   122,   113,   119,   120,   121,   111,   125,   110,
     112,   114,   115,   116,   123,   124,     0,     0,     0,     0,
      31,     0,    41,    46,   141,   142,    83,    85,     0,   128,
       0,   126,   127,   172,    33,     0,    50,     0,     0,     0,
     139,   131,    40,     0,    49,     0,     0,    47,     0,    35,
      48,    51
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,     8,     9,    37,    38,    58,    59,   151,
      10,    16,    11,    24,    12,    14,    13,    15,   150,   200,
     201,   255,    25,   107,    44,    54,   204,   154,   155,   308,
     309,   313,    26,    62,    27,    63,   108,   159,    28,    29,
      30,    39,    40,    41,    51,    96,   122,   123,   128,   124,
     178,   179,    97,   119,    98,   169,    99,   139,   152,   141,
     142,   143,   144,   145,   197,   198,   253,   254,   101,   116,
     103,   134
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -182
static const short yypact[] =
{
    -182,    22,     0,  -182,  -182,  -182,  -182,  -182,  -182,     0,
    -182,  -182,   106,  -182,   -38,   -12,   210,  -182,    -9,   -11,
      -1,    11,  -182,  -182,  -182,  -182,  -182,  -182,    66,  -182,
      34,    21,    -9,  -182,    23,  -182,  -182,   219,  -182,    25,
      34,  -182,  -182,  -182,    26,  -182,  -182,  -182,  -182,  -182,
     203,  -182,  -182,  -182,    28,  -182,  -182,  -182,    29,     6,
    -182,  -182,  -182,  -182,   -59,   -59,   247,   247,   247,  -182,
    -182,  -182,  -182,    43,    50,  -182,  -182,    88,   247,   247,
    -182,    20,   -21,    20,   247,   247,  -182,  -182,  -182,  -182,
    -182,  -182,  -182,  -182,   234,    33,    40,  -182,  -182,    60,
      67,  -182,    68,  -182,  -182,  -182,   234,   154,   -32,   -30,
    -182,  -182,  -182,  -182,  -182,  -182,  -182,    92,   215,   234,
    -182,  -182,    12,    12,    12,  -182,  -182,  -182,    12,  -182,
     118,  -182,  -182,  -182,   100,   132,  -182,  -182,    91,    94,
    -182,   137,  -182,  -182,  -182,  -182,   112,  -182,    -6,  -182,
     183,  -182,  -182,   247,     2,   129,   247,   139,  -182,   144,
     151,   -59,  -182,  -182,  -182,  -182,  -182,  -182,   -59,   247,
     -59,   -59,   247,  -182,  -182,  -182,  -182,  -182,   163,  -182,
     164,   165,   166,   247,   247,   247,  -182,   234,   168,   247,
     -21,   169,   247,   247,   247,   247,    87,   146,   247,  -182,
      16,   160,  -182,   247,    34,   176,  -182,  -182,  -182,  -182,
    -182,  -182,  -182,   235,  -182,  -182,   241,  -182,   177,  -182,
     178,   170,  -182,  -182,   167,  -182,   207,   171,  -182,  -182,
    -182,  -182,  -182,  -182,   247,   247,   247,   247,   247,   247,
     247,   247,   247,   247,   247,   247,   247,   247,   247,   247,
    -182,   185,  -182,   173,  -182,    12,  -182,   184,  -182,   -26,
     197,  -182,   -59,   -59,    95,    95,  -182,  -182,   247,  -182,
    -182,  -182,  -182,  -182,  -182,  -182,  -182,  -182,  -182,  -182,
    -182,  -182,  -182,  -182,  -182,  -182,   189,   247,   247,   209,
    -182,   247,  -182,   -10,  -182,  -182,  -182,  -182,   192,  -182,
     193,  -182,  -182,  -182,  -182,   211,  -182,   247,    31,   212,
    -182,  -182,  -182,    12,  -182,   214,   216,  -182,   218,  -182,
    -182,  -182
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -182,  -182,  -182,   277,  -182,  -182,   254,  -182,  -182,   186,
    -182,  -182,  -182,   104,  -182,  -182,  -182,  -182,  -182,  -182,
     117,  -182,  -182,  -182,   280,  -182,  -182,  -182,   172,  -182,
      10,  -182,  -182,  -182,  -182,  -182,   256,  -182,  -182,   293,
    -182,   292,  -182,   -39,  -182,  -182,  -182,  -182,  -182,  -182,
    -109,   135,  -182,  -182,  -182,   206,   -57,  -182,   231,  -182,
     140,   -61,  -182,   -50,  -181,  -182,  -182,    41,  -182,   -40,
    -170,   138
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -175
static const short yytable[] =
{
     100,    60,   188,   112,   113,   224,   110,   153,   306,   156,
     102,   156,     4,   111,   180,   181,   115,   117,   118,   182,
     291,   157,     3,   189,   130,   160,   135,    31,   126,   127,
     307,   190,   191,   192,   136,   137,   199,   125,   174,   175,
     176,   131,   132,   131,   158,   133,   158,    42,    43,   306,
     292,     5,   203,    32,   146,    86,    87,    88,    89,     6,
      90,    91,    92,    93,    18,    45,   146,   114,    19,   286,
      20,   307,   193,   194,   195,    46,     7,   177,   106,   146,
     315,    86,    87,    88,    89,   298,    21,    47,   300,    93,
      22,    23,    33,   129,   296,   297,   161,    52,   196,    55,
     211,   -18,    61,   202,   104,   105,   207,   212,   120,   214,
     215,   234,   235,    48,    18,   121,   147,   236,    19,   213,
      20,  -167,   216,   162,   163,   164,   165,   166,   167,   237,
     238,   239,   240,   221,   222,   223,    21,   148,   168,   227,
      22,    23,   230,   231,   232,   233,   289,   146,   252,    86,
      87,    88,    89,   259,    18,   149,  -174,    93,    19,   153,
      20,    90,    91,    92,   183,   260,   241,   242,   243,   244,
     245,   246,   247,   248,   249,   250,    21,   184,   185,  -155,
      22,    23,   186,   187,   270,   271,   272,   273,   274,   275,
     276,   277,   278,   279,   280,   281,   282,   283,   284,   285,
    -156,   294,   295,   199,   318,   206,    64,    65,    66,    67,
      68,    69,    70,    71,    72,   208,    73,    74,   299,   170,
     209,    75,    76,    77,    78,    79,    80,   210,   217,   218,
     219,   220,    81,   177,   229,   251,   258,   302,   252,   262,
      82,   305,    83,    84,    85,   263,   162,   163,   164,   165,
     166,   167,   261,   268,   264,   265,   267,   314,   266,   269,
     290,   171,   287,   288,    86,    87,    88,    89,    33,    90,
      91,    92,    93,   293,   304,    94,    95,    33,   301,    56,
      34,   310,   311,   321,    35,    36,    17,   312,   317,    34,
     319,    57,   320,    35,    36,    86,    87,    88,    89,   110,
      90,    91,    92,    93,   256,   173,   111,   138,    86,    87,
      88,    89,    53,    90,    91,    92,    93,   257,   316,   109,
     114,    49,    50,   226,   172,   140,   205,   225,   228,   303
};

static const unsigned short yycheck[] =
{
      50,    40,     8,    64,    65,   186,    65,     5,    18,    41,
      50,    41,    12,    72,   123,   124,    66,    67,    68,   128,
      46,    53,     0,    29,    81,    55,    83,    65,    78,    79,
      40,    37,    38,    39,    84,    85,    20,    77,    26,    27,
      28,    81,    63,    83,    76,    66,    76,    56,    57,    18,
      76,    51,    50,    65,    94,    61,    62,    63,    64,    59,
      66,    67,    68,    69,    48,    76,   106,    73,    52,   250,
      54,    40,    78,    79,    80,    76,    76,    65,    72,   119,
      49,    61,    62,    63,    64,   266,    70,    76,   269,    69,
      74,    75,    58,    73,   264,   265,     4,    76,   148,    76,
     161,    76,    76,   153,    76,    76,   156,   168,    65,   170,
     171,    24,    25,    47,    48,    65,    76,    30,    52,   169,
      54,    88,   172,    31,    32,    33,    34,    35,    36,    42,
      43,    44,    45,   183,   184,   185,    70,    77,    46,   189,
      74,    75,   192,   193,   194,   195,   255,   187,   198,    61,
      62,    63,    64,   203,    48,    88,    88,    69,    52,     5,
      54,    66,    67,    68,    46,   204,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    70,    77,    46,    88,
      74,    75,    88,    46,   234,   235,   236,   237,   238,   239,
     240,   241,   242,   243,   244,   245,   246,   247,   248,   249,
      88,   262,   263,    20,   313,    76,     3,     4,     5,     6,
       7,     8,     9,    10,    11,    76,    13,    14,   268,     4,
      76,    18,    19,    20,    21,    22,    23,    76,    65,    65,
      65,    65,    29,    65,    65,    89,    76,   287,   288,     4,
      37,   291,    39,    40,    41,     4,    31,    32,    33,    34,
      35,    36,    76,    46,    77,    77,    89,   307,    88,    88,
      76,    46,    77,    90,    61,    62,    63,    64,    58,    66,
      67,    68,    69,    76,    65,    72,    73,    58,    89,    60,
      70,    89,    89,    65,    74,    75,     9,    76,    76,    70,
      76,    37,    76,    74,    75,    61,    62,    63,    64,    65,
      66,    67,    68,    69,   200,   119,    72,    73,    61,    62,
      63,    64,    32,    66,    67,    68,    69,   200,   308,    63,
      73,    28,    30,   188,   118,    94,   154,   187,   190,   288
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    92,    93,     0,    12,    51,    59,    76,    94,    95,
     101,   103,   105,   107,   106,   108,   102,    94,    48,    52,
      54,    70,    74,    75,   104,   113,   123,   125,   129,   130,
     131,    65,    65,    58,    70,    74,    75,    96,    97,   132,
     133,   134,    56,    57,   115,    76,    76,    76,    47,   130,
     132,   135,    76,   115,   116,    76,    60,    97,    98,    99,
     134,    76,   124,   126,     3,     4,     5,     6,     7,     8,
       9,    10,    11,    13,    14,    18,    19,    20,    21,    22,
      23,    29,    37,    39,    40,    41,    61,    62,    63,    64,
      66,    67,    68,    69,    72,    73,   136,   143,   145,   147,
     154,   159,   160,   161,    76,    76,    72,   114,   127,   127,
      65,    72,   152,   152,    73,   154,   160,   154,   154,   144,
      65,    65,   137,   138,   140,   160,   154,   154,   139,    73,
     147,   160,    63,    66,   162,   147,   154,   154,    73,   148,
     149,   150,   151,   152,   153,   154,   160,    76,    77,    88,
     109,   100,   149,     5,   118,   119,    41,    53,    76,   128,
      55,     4,    31,    32,    33,    34,    35,    36,    46,   146,
       4,    46,   146,   100,    26,    27,    28,    65,   141,   142,
     141,   141,   141,    46,    77,    46,    88,    46,     8,    29,
      37,    38,    39,    78,    79,    80,   154,   155,   156,    20,
     110,   111,   154,    50,   117,   119,    76,   154,    76,    76,
      76,   152,   152,   154,   152,   152,   154,    65,    65,    65,
      65,   154,   154,   154,   155,   151,   142,   154,   162,    65,
     154,   154,   154,   154,    24,    25,    30,    42,    43,    44,
      45,    79,    80,    81,    82,    83,    84,    85,    86,    87,
      88,    89,   154,   157,   158,   112,   104,   111,    76,   154,
     134,    76,     4,     4,    77,    77,    88,    89,    46,    88,
     154,   154,   154,   154,   154,   154,   154,   154,   154,   154,
     154,   154,   154,   154,   154,   154,   155,    77,    90,   141,
      76,    46,    76,    76,   152,   152,   161,   161,   155,   154,
     155,    89,   154,   158,    65,   154,    18,    40,   120,   121,
      89,    89,    76,   122,   154,    49,   121,    76,   141,    76,
      76,    65
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
#line 459 "imcc.y"
    { open_comp_unit(); yyval.i = 0;}
    break;

  case 3:
#line 460 "imcc.y"
    { close_comp_unit(); yyval.i = 0; }
    break;

  case 7:
#line 466 "imcc.y"
    { yyval.i = 0; }
    break;

  case 12:
#line 478 "imcc.y"
    { yyval.i = 0; }
    break;

  case 13:
#line 479 "imcc.y"
    { yyval.i = 0; }
    break;

  case 14:
#line 480 "imcc.y"
    { yyval.i = 0; }
    break;

  case 15:
#line 481 "imcc.y"
    { yyval.i = 0; }
    break;

  case 16:
#line 484 "imcc.y"
    {clear_state();}
    break;

  case 17:
#line 485 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs,1); free(yyvsp[-1].s); }
    break;

  case 18:
#line 486 "imcc.y"
    { yyval.i = 0;}
    break;

  case 20:
#line 493 "imcc.y"
    { open_comp_unit();
                                          function = "(emit)"; }
    break;

  case 21:
#line 496 "imcc.y"
    { if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); yyval.i=0;}
    break;

  case 23:
#line 507 "imcc.y"
    {
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 24:
#line 514 "imcc.y"
    { open_comp_unit(); }
    break;

  case 25:
#line 516 "imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 26:
#line 520 "imcc.y"
    { open_comp_unit(); }
    break;

  case 27:
#line 522 "imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 28:
#line 529 "imcc.y"
    { yyval.i = 0; }
    break;

  case 29:
#line 532 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 30:
#line 533 "imcc.y"
    { add_pcc_param(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 31:
#line 534 "imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 32:
#line 537 "imcc.y"
    { is_def=1; }
    break;

  case 33:
#line 538 "imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 34:
#line 541 "imcc.y"
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

  case 35:
#line 567 "imcc.y"
    { yyval.i = 0; }
    break;

  case 36:
#line 570 "imcc.y"
    { yyval.t = 1; }
    break;

  case 37:
#line 571 "imcc.y"
    { yyval.t = 0; }
    break;

  case 38:
#line 574 "imcc.y"
    { yyval.t = -1; }
    break;

  case 40:
#line 578 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 41:
#line 582 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 42:
#line 587 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 43:
#line 588 "imcc.y"
    {  add_pcc_arg(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 44:
#line 589 "imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 45:
#line 592 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 46:
#line 595 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 47:
#line 596 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 48:
#line 597 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-7].sr, yyvsp[-1].sr); }
    break;

  case 49:
#line 600 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 50:
#line 601 "imcc.y"
    { is_def=1; }
    break;

  case 51:
#line 601 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 52:
#line 604 "imcc.y"
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

  case 53:
#line 617 "imcc.y"
    { yyval.i = 0; }
    break;

  case 54:
#line 620 "imcc.y"
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

  case 55:
#line 634 "imcc.y"
    { yyval.i = 0; }
    break;

  case 56:
#line 637 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 57:
#line 638 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 58:
#line 639 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 59:
#line 642 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 62:
#line 649 "imcc.y"
    { clear_state(); }
    break;

  case 63:
#line 650 "imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 64:
#line 651 "imcc.y"
    { yyval.i = 0; }
    break;

  case 65:
#line 652 "imcc.y"
    { yyval.i = 0; }
    break;

  case 68:
#line 655 "imcc.y"
    { yyval.i = 0; }
    break;

  case 69:
#line 656 "imcc.y"
    { yyval.i = 0; }
    break;

  case 70:
#line 659 "imcc.y"
    { yyval.i = NULL; }
    break;

  case 74:
#line 667 "imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 75:
#line 671 "imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 78:
#line 676 "imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 79:
#line 677 "imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 80:
#line 678 "imcc.y"
    { is_def=1; }
    break;

  case 81:
#line 678 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 82:
#line 679 "imcc.y"
    { is_def=1; }
    break;

  case 83:
#line 680 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 84:
#line 681 "imcc.y"
    { is_def=1; }
    break;

  case 85:
#line 682 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 86:
#line 683 "imcc.y"
    { is_def=1; }
    break;

  case 87:
#line 683 "imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            R1(mk_ident(yyvsp[0].s, yyvsp[-1].t)));is_def=0; }
    break;

  case 88:
#line 685 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 89:
#line 686 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 90:
#line 687 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 91:
#line 688 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 92:
#line 689 "imcc.y"
    { yyval.i = MK_I(interp, "bsr",  R1(yyvsp[0].sr)); }
    break;

  case 93:
#line 690 "imcc.y"
    { yyval.i = MK_I(interp, "branch",R1(yyvsp[0].sr)); }
    break;

  case 94:
#line 691 "imcc.y"
    { yyval.i = MK_I(interp, "inc",R1(yyvsp[0].sr)); }
    break;

  case 95:
#line 692 "imcc.y"
    { yyval.i = MK_I(interp, "dec",R1(yyvsp[0].sr)); }
    break;

  case 96:
#line 693 "imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,R0()); }
    break;

  case 97:
#line 694 "imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,R0()); }
    break;

  case 98:
#line 695 "imcc.y"
    { yyval.i = MK_I(interp, "end" ,R0()); }
    break;

  case 99:
#line 696 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs, 1); free(yyvsp[-1].s); }
    break;

  case 100:
#line 697 "imcc.y"
    { yyval.i = 0;}
    break;

  case 101:
#line 701 "imcc.y"
    { yyval.t = 'I'; }
    break;

  case 102:
#line 702 "imcc.y"
    { yyval.t = 'N'; }
    break;

  case 103:
#line 703 "imcc.y"
    { yyval.t = 'S'; }
    break;

  case 104:
#line 704 "imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 106:
#line 712 "imcc.y"
    { yyval.i = MK_I(interp, "set", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 107:
#line 713 "imcc.y"
    { yyval.i = MK_I(interp, "not", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 108:
#line 714 "imcc.y"
    { yyval.i = MK_I(interp, "neg", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 109:
#line 715 "imcc.y"
    { yyval.i = MK_I(interp, "bnot", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 110:
#line 716 "imcc.y"
    { yyval.i = MK_I(interp, "add", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 111:
#line 717 "imcc.y"
    { yyval.i = MK_I(interp, "sub", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 112:
#line 718 "imcc.y"
    { yyval.i = MK_I(interp, "mul", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 113:
#line 719 "imcc.y"
    { yyval.i = MK_I(interp, "pow", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 114:
#line 720 "imcc.y"
    { yyval.i = MK_I(interp, "div", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 115:
#line 721 "imcc.y"
    { yyval.i = MK_I(interp, "mod", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 116:
#line 722 "imcc.y"
    { yyval.i = MK_I(interp, "concat", R3(yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 117:
#line 723 "imcc.y"
    { yyval.i = MK_I(interp, "shl", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 118:
#line 724 "imcc.y"
    { yyval.i = MK_I(interp, "shr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 119:
#line 725 "imcc.y"
    { yyval.i = MK_I(interp, "lsr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 120:
#line 726 "imcc.y"
    { yyval.i = MK_I(interp, "and", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 121:
#line 727 "imcc.y"
    { yyval.i = MK_I(interp, "or", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 122:
#line 728 "imcc.y"
    { yyval.i = MK_I(interp, "xor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 123:
#line 729 "imcc.y"
    { yyval.i = MK_I(interp, "band", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 124:
#line 730 "imcc.y"
    { yyval.i = MK_I(interp, "bor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 125:
#line 731 "imcc.y"
    { yyval.i = MK_I(interp, "bxor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 126:
#line 732 "imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 127:
#line 733 "imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 128:
#line 734 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 129:
#line 735 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 130:
#line 736 "imcc.y"
    { yyval.i = MK_I(interp, "defined",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 131:
#line 737 "imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", R3(yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 132:
#line 739 "imcc.y"
    { yyval.i = MK_I(interp, "clone",R2(yyvsp[-3].sr, yyvsp[0].sr));
    }
    break;

  case 133:
#line 741 "imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          R2(yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once))); }
    break;

  case 134:
#line 743 "imcc.y"
    { yyval.i = MK_I(interp, "find_global",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 135:
#line 744 "imcc.y"
    { yyval.i = MK_I(interp, "store_global",R2(yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 136:
#line 745 "imcc.y"
    { expect_pasm = 1; }
    break;

  case 137:
#line 746 "imcc.y"
    { yyval.i = iANY(interp, "new",0,regs,1);  }
    break;

  case 138:
#line 747 "imcc.y"
    { yyval.i = MK_I(interp, "defined", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 139:
#line 748 "imcc.y"
    { keyvec=KEY_BIT(2);
                                       yyval.i = MK_I(interp, "defined", R3(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 140:
#line 750 "imcc.y"
    { yyval.i = MK_I(interp, "clone", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 141:
#line 754 "imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,R3(yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 142:
#line 755 "imcc.y"
    {yyval.i=MK_I(interp, inv_op(yyvsp[-3].s),
                                            R3(yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 143:
#line 757 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 144:
#line 758 "imcc.y"
    {yyval.i= MK_I(interp, "unless",R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 145:
#line 759 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 146:
#line 760 "imcc.y"
    {yyval.i= MK_I(interp, "unless", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 147:
#line 765 "imcc.y"
    { yyval.s = "eq"; }
    break;

  case 148:
#line 766 "imcc.y"
    { yyval.s = "ne"; }
    break;

  case 149:
#line 767 "imcc.y"
    { yyval.s = "gt"; }
    break;

  case 150:
#line 768 "imcc.y"
    { yyval.s = "ge"; }
    break;

  case 151:
#line 769 "imcc.y"
    { yyval.s = "lt"; }
    break;

  case 152:
#line 770 "imcc.y"
    { yyval.s = "le"; }
    break;

  case 157:
#line 781 "imcc.y"
    { yyval.sr = NULL; }
    break;

  case 158:
#line 782 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 159:
#line 785 "imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 161:
#line 789 "imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 162:
#line 790 "imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 163:
#line 795 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 164:
#line 796 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 169:
#line 807 "imcc.y"
    { nkeys=0; }
    break;

  case 170:
#line 808 "imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 171:
#line 811 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 172:
#line 812 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 176:
#line 822 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 177:
#line 823 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 178:
#line 824 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 179:
#line 825 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 180:
#line 826 "imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 181:
#line 829 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 182:
#line 830 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 183:
#line 831 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 184:
#line 834 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 185:
#line 835 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2644 "imcparser.c"

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


#line 839 "imcc.y"



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

