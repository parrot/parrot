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
     VAR = 328
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
#line 409 "imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 634 "imcparser.c"
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
#line 655 "imcparser.c"

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
#define YYLAST   325

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  89
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  71
/* YYNRULES -- Number of rules. */
#define YYNRULES  179
/* YYNRULES -- Number of states. */
#define YYNSTATES  316

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   328

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      74,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    76,     2,     2,     2,    82,    84,     2,
       2,     2,    80,    79,     2,    77,    83,    81,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    88,
       2,    75,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    86,     2,    87,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    85,     2,    78,     2,     2,     2,
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
      65,    66,    67,    68,    69,    70,    71,    72,    73
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
     227,   228,   233,   236,   239,   242,   245,   248,   251,   254,
     257,   259,   261,   263,   266,   267,   269,   271,   273,   275,
     277,   281,   286,   291,   296,   302,   308,   314,   320,   326,
     332,   338,   344,   350,   356,   362,   368,   374,   380,   386,
     392,   399,   406,   413,   418,   423,   431,   436,   441,   446,
     451,   452,   456,   461,   469,   474,   481,   488,   493,   498,
     503,   508,   510,   512,   514,   516,   518,   520,   522,   524,
     526,   528,   529,   531,   535,   537,   539,   544,   546,   548,
     550,   552,   554,   556,   557,   560,   562,   566,   568,   570,
     572,   574,   576,   578,   580,   582,   584,   586,   588,   590
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const short yyrhs[] =
{
      90,     0,    -1,    -1,    91,   126,    -1,    93,    -1,    92,
      93,    -1,   129,    94,    74,    -1,    70,    74,    -1,    -1,
      95,    72,    96,    -1,    -1,   146,    -1,    -1,    59,    98,
      92,    60,    -1,   102,   100,    -1,   126,    47,    -1,    99,
      -1,   104,    -1,    97,    -1,    -1,    12,   103,    65,    74,
      -1,    -1,    -1,    51,   105,    65,   113,    74,   106,   107,
     100,    -1,    -1,   108,    74,    -1,   107,   108,    74,    -1,
      -1,    20,   109,   138,    65,    -1,    -1,    48,   112,    74,
     111,   115,   114,   131,    74,   117,    49,    74,    -1,    56,
      -1,    57,    -1,    -1,   112,    -1,    50,   151,    46,   151,
      74,    -1,    50,   151,    74,    -1,    -1,   116,    74,    -1,
     115,   116,    74,    -1,     5,   151,    -1,    -1,   118,    74,
      -1,   117,   118,    74,    -1,    40,   151,    -1,    -1,    18,
     119,   138,    65,    -1,    -1,    52,    74,   121,   124,    53,
      74,    -1,    -1,    54,    74,   123,   124,    55,    74,    -1,
      -1,   124,    74,    -1,   124,   125,    74,    -1,    41,   151,
      -1,   127,    -1,   126,   127,    -1,    -1,   128,   132,    -1,
      70,    74,    -1,   110,    -1,   120,    -1,   122,    -1,    -1,
     130,    -1,   130,   131,    -1,   131,    -1,    58,    -1,   129,
     133,    74,    -1,   101,    -1,   140,    -1,   142,    -1,    13,
      65,    -1,    14,    65,    -1,    -1,    18,   134,   138,    65,
      -1,    -1,    19,   135,   138,    65,    75,   158,    -1,    -1,
      23,   136,   138,    65,    75,   158,    -1,    -1,    20,   137,
     138,    65,    -1,    20,   157,    -1,    40,   151,    -1,     5,
     151,    -1,    41,   151,    -1,     3,   149,    -1,     4,   149,
      -1,    21,   151,    -1,    22,   151,    -1,    10,    -1,    11,
      -1,     9,    -1,    72,   146,    -1,    -1,    26,    -1,    27,
      -1,    28,    -1,   139,    -1,    65,    -1,   144,    75,   151,
      -1,   144,    75,    76,   151,    -1,   144,    75,    77,   151,
      -1,   144,    75,    78,   151,    -1,   144,    75,   151,    79,
     151,    -1,   144,    75,   151,    77,   151,    -1,   144,    75,
     151,    80,   151,    -1,   144,    75,   151,    42,   151,    -1,
     144,    75,   151,    81,   151,    -1,   144,    75,   151,    82,
     151,    -1,   144,    75,   151,    83,   151,    -1,   144,    75,
     151,    24,   151,    -1,   144,    75,   151,    25,   151,    -1,
     144,    75,   151,    43,   151,    -1,   144,    75,   151,    44,
     151,    -1,   144,    75,   151,    45,   151,    -1,   144,    75,
     151,    30,   151,    -1,   144,    75,   151,    84,   151,    -1,
     144,    75,   151,    85,   151,    -1,   144,    75,   151,    78,
     151,    -1,   144,    75,   151,    86,   152,    87,    -1,   151,
      86,   152,    87,    75,   151,    -1,   144,    75,     8,   139,
      46,   151,    -1,   144,    75,     8,   139,    -1,   144,    75,
      29,   151,    -1,   144,    75,    29,   151,    86,   152,    87,
      -1,   144,    75,    39,   151,    -1,   144,    75,    38,    65,
      -1,   144,    75,    37,   159,    -1,    37,   159,    75,   151,
      -1,    -1,     8,   141,    96,    -1,    29,   144,    46,   151,
      -1,    29,   144,    46,   151,    86,   152,    87,    -1,    39,
     144,    46,   151,    -1,     6,   151,   143,   151,     4,   149,
      -1,     7,   151,   143,   151,     4,   149,    -1,     6,   151,
       4,   149,    -1,     7,   151,     4,   149,    -1,     6,   151,
      46,   149,    -1,     7,   151,    46,   149,    -1,    31,    -1,
      32,    -1,    33,    -1,    34,    -1,    35,    -1,    36,    -1,
      73,    -1,   157,    -1,    73,    -1,   157,    -1,    -1,   147,
      -1,   147,    46,   148,    -1,   148,    -1,   150,    -1,   145,
      86,   152,    87,    -1,    65,    -1,    72,    -1,   149,    -1,
     151,    -1,    73,    -1,   156,    -1,    -1,   153,   154,    -1,
     155,    -1,   154,    88,   155,    -1,   151,    -1,   157,    -1,
     158,    -1,    61,    -1,    62,    -1,    63,    -1,    64,    -1,
      69,    -1,    67,    -1,    68,    -1,    66,    -1,    63,    -1,
      66,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   452,   452,   452,   460,   461,   464,   465,   468,   468,
     470,   472,   477,   476,   485,   489,   498,   499,   500,   503,
     503,   509,   511,   509,   521,   522,   523,   526,   526,   530,
     530,   559,   560,   563,   564,   567,   571,   576,   577,   578,
     581,   584,   585,   586,   589,   590,   590,   593,   593,   609,
     609,   626,   627,   628,   631,   634,   635,   638,   638,   640,
     641,   642,   643,   646,   647,   650,   651,   654,   657,   659,
     661,   663,   664,   665,   666,   666,   667,   667,   669,   669,
     671,   671,   673,   674,   675,   676,   677,   678,   679,   680,
     681,   682,   683,   684,   685,   688,   690,   691,   692,   695,
     699,   701,   702,   703,   704,   705,   706,   707,   708,   709,
     710,   711,   712,   713,   714,   715,   716,   717,   718,   719,
     720,   721,   722,   723,   724,   725,   727,   729,   731,   732,
     733,   733,   735,   736,   738,   741,   743,   745,   746,   747,
     748,   752,   754,   755,   756,   757,   758,   762,   763,   765,
     766,   769,   770,   773,   774,   777,   778,   782,   784,   786,
     788,   791,   792,   795,   795,   799,   800,   803,   806,   807,
     810,   811,   812,   813,   814,   817,   818,   819,   822,   823
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
  "FLOATC", "REG", "MACRO", "ENDM", "PARROT_OP", "VAR", "'\\n'", "'='", 
  "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'.'", "'&'", "'|'", 
  "'['", "']'", "';'", "$accept", "program", "@1", "pasmcode", "pasmline", 
  "pasm_inst", "@2", "pasm_args", "emit", "@3", "nsub", "sub_body", "sub", 
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
     325,   326,   327,   328,    10,    61,    33,    45,   126,    43,
      42,    47,    37,    46,    38,   124,    91,    93,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    89,    91,    90,    92,    92,    93,    93,    95,    94,
      94,    96,    98,    97,    99,   100,   101,   101,   101,   103,
     102,   105,   106,   104,   107,   107,   107,   109,   108,   111,
     110,   112,   112,   113,   113,   114,   114,   115,   115,   115,
     116,   117,   117,   117,   118,   119,   118,   121,   120,   123,
     122,   124,   124,   124,   125,   126,   126,   128,   127,   127,
     127,   127,   127,   129,   129,   130,   130,   131,   132,   132,
     133,   133,   133,   133,   134,   133,   135,   133,   136,   133,
     137,   133,   133,   133,   133,   133,   133,   133,   133,   133,
     133,   133,   133,   133,   133,   138,   138,   138,   138,   139,
     140,   140,   140,   140,   140,   140,   140,   140,   140,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   140,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   140,   140,
     141,   140,   140,   140,   140,   142,   142,   142,   142,   142,
     142,   143,   143,   143,   143,   143,   143,   144,   144,   145,
     145,   146,   146,   147,   147,   148,   148,   149,   149,   150,
     150,   151,   151,   153,   152,   154,   154,   155,   156,   156,
     157,   157,   157,   157,   157,   158,   158,   158,   159,   159
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
       1,     1,     2,     2,     0,     4,     0,     6,     0,     6,
       0,     4,     2,     2,     2,     2,     2,     2,     2,     2,
       1,     1,     1,     2,     0,     1,     1,     1,     1,     1,
       3,     4,     4,     4,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       6,     6,     6,     4,     4,     7,     4,     4,     4,     4,
       0,     3,     4,     7,     4,     6,     6,     4,     4,     4,
       4,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     0,     1,     3,     1,     1,     4,     1,     1,     1,
       1,     1,     1,     0,     2,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,    57,     1,     0,     0,     0,     0,    60,    61,
      62,    57,    55,    63,    31,    32,     0,    47,    49,    59,
      56,    19,    21,    67,    12,    18,    16,    69,    57,    17,
      94,    64,    66,    58,    29,    51,    51,     0,     0,    63,
      14,    57,     0,     0,     0,     0,     0,   130,    92,    90,
      91,     0,     0,    74,    76,    80,     0,     0,    78,     0,
       0,     0,     0,     0,   170,   171,   172,   173,   177,   175,
     176,   174,   151,   147,     0,    70,    71,     0,     0,   162,
     148,   169,    65,    37,     0,     0,     0,    33,     0,    63,
       4,     8,    15,   157,   158,    86,    87,   161,    84,   168,
       0,     0,   151,    72,    73,     0,     0,     0,    82,    88,
      89,     0,   147,     0,   148,   178,   179,     0,     0,    83,
      85,   161,     0,    93,   152,   154,   159,   155,   160,   168,
      68,     0,   163,     0,     0,     0,     0,     0,    52,     0,
       0,    20,    34,     0,     7,    13,     5,     0,     0,     0,
     141,   142,   143,   144,   145,   146,     0,     0,     0,     0,
       0,   131,    11,    95,    96,    97,    99,     0,    98,     0,
       0,     0,     0,     0,     0,   163,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   100,     0,     0,    40,     0,
       0,     0,    38,    54,    48,    53,    50,    22,     6,   151,
     137,   139,     0,   138,   140,     0,    75,     0,    81,     0,
     132,   129,   134,     0,   153,   123,   124,   128,   127,   126,
     101,   102,   103,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   163,
       0,   167,   164,   165,     0,     0,    39,    24,     9,     0,
       0,     0,     0,   163,   156,     0,   163,   111,   112,   116,
     107,   113,   114,   115,   105,   119,   104,   106,   108,   109,
     110,   117,   118,     0,     0,     0,     0,    36,    41,    27,
      57,     0,   135,   136,    77,    79,     0,   122,     0,   120,
     121,   166,     0,    45,     0,     0,     0,     0,    23,     0,
      25,   133,   125,    35,     0,    44,     0,     0,    42,     0,
      26,     0,    30,    43,    28,    46
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,    89,    90,   147,   148,   161,    25,    39,
      26,    40,    27,    28,    37,    29,    38,   247,   280,   281,
     297,     8,    83,    16,   143,   190,   134,   135,   295,   296,
     304,     9,    35,    10,    36,    84,   139,    41,    12,    13,
      91,    31,    32,    33,    74,   105,   106,   111,   107,   167,
     168,    75,   102,    76,   157,    77,   122,   162,   124,   125,
     126,   127,   128,   186,   187,   242,   243,    79,    99,    81,
     117
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -175
static const short yypact[] =
{
    -175,    13,    43,  -175,    -8,   -55,   -51,   -18,  -175,  -175,
    -175,     5,  -175,    -4,  -175,  -175,   -14,  -175,  -175,  -175,
    -175,  -175,  -175,  -175,  -175,  -175,  -175,  -175,    43,  -175,
     229,    20,  -175,  -175,  -175,  -175,  -175,    31,    39,   -48,
    -175,    77,   -41,   -41,   242,   242,   242,  -175,  -175,  -175,
    -175,    40,    42,  -175,  -175,   192,   242,   242,  -175,    76,
      14,    76,   242,   242,  -175,  -175,  -175,  -175,  -175,  -175,
    -175,  -175,   210,   -19,    28,  -175,  -175,    35,    22,  -175,
      25,  -175,  -175,   107,   -24,   -11,    52,    -8,    62,     6,
    -175,    67,  -175,  -175,  -175,  -175,  -175,  -175,  -175,  -175,
      37,    54,   210,  -175,  -175,     9,     9,     9,  -175,  -175,
    -175,     9,  -175,    71,  -175,  -175,  -175,    53,   100,  -175,
    -175,    64,    70,  -175,   112,  -175,  -175,  -175,  -175,    74,
    -175,   153,  -175,   242,     2,    88,   242,    91,  -175,    92,
     103,  -175,  -175,   105,  -175,  -175,  -175,   106,   109,   -41,
    -175,  -175,  -175,  -175,  -175,  -175,   -41,   242,   -41,   -41,
     242,  -175,  -175,  -175,  -175,  -175,  -175,    99,  -175,   118,
     119,   120,   242,   242,   242,  -175,   210,   121,   242,    14,
     122,   242,   242,   242,   242,    90,   101,   242,  -175,   242,
      20,   115,  -175,  -175,  -175,  -175,  -175,  -175,  -175,   210,
    -175,  -175,   208,  -175,  -175,   209,  -175,   148,  -175,   149,
     141,  -175,  -175,   154,  -175,   182,   171,  -175,  -175,  -175,
    -175,  -175,  -175,   242,   242,   242,   242,   242,   242,   242,
     242,   242,   242,   242,   242,   242,   242,   242,   242,  -175,
     184,  -175,   172,  -175,   -28,   188,  -175,   243,  -175,   -41,
     -41,    55,    55,  -175,  -175,   242,  -175,  -175,  -175,  -175,
    -175,  -175,  -175,  -175,  -175,  -175,  -175,  -175,  -175,  -175,
    -175,  -175,  -175,   178,   242,   242,   242,  -175,   -12,  -175,
      -9,   193,  -175,  -175,  -175,  -175,   194,  -175,   197,  -175,
    -175,  -175,   206,  -175,   242,    44,   211,     9,  -175,   212,
    -175,  -175,  -175,  -175,     9,  -175,   213,   214,  -175,   224,
    -175,   234,  -175,  -175,  -175,  -175
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -175,  -175,  -175,  -175,   205,  -175,  -175,   108,  -175,  -175,
    -175,    32,  -175,  -175,  -175,  -175,  -175,  -175,  -175,    34,
    -175,  -175,  -175,   226,  -175,  -175,  -175,   166,  -175,    21,
    -175,  -175,  -175,  -175,  -175,   281,  -175,   316,     1,  -175,
     306,  -175,   -27,  -175,  -175,  -175,  -175,  -175,  -175,   -86,
     143,  -175,  -175,  -175,   220,    33,  -175,   250,  -175,   147,
     -40,  -175,   -30,  -174,  -175,  -175,    49,  -175,   -21,  -153,
     146
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -169
static const short yytable[] =
{
      78,   213,    95,    96,    82,    -3,   293,   133,    21,    80,
      23,   279,    20,     3,    98,   100,   101,   136,   276,    17,
     169,   170,    88,    18,    93,   171,   109,   110,   294,   137,
     136,    94,   119,   120,   108,   163,   164,   165,   114,     4,
     114,   149,    20,     5,   140,     6,   277,    22,    14,    15,
     138,   129,   189,     4,    23,    24,    19,     5,   158,     6,
      34,     7,   293,   138,    23,   273,   145,  -161,   150,   151,
     152,   153,   154,   155,   166,     7,    88,   115,    23,   286,
     116,   129,   288,   156,   294,   150,   151,   152,   153,   154,
     155,     4,   113,   306,   118,     5,    86,     6,   284,   285,
     159,   185,   130,   188,    87,   103,   193,   104,   132,   200,
     131,  -168,   133,     7,   223,   224,   201,   172,   203,   204,
     225,    68,    69,    70,    92,     4,   141,   202,   173,     5,
     205,     6,   226,   227,   228,   229,   144,    64,    65,    66,
      67,   -10,   210,   211,   212,    71,   174,     7,   216,   112,
    -149,   219,   220,   221,   222,   129,   175,   241,   176,   244,
    -150,   177,   192,   245,   206,   194,   195,   230,   231,   232,
     233,   234,   235,   236,   237,   238,   239,   196,   129,   197,
     198,   199,   178,   207,   208,   209,   166,   218,   240,   246,
     179,   180,   181,   257,   258,   259,   260,   261,   262,   263,
     264,   265,   266,   267,   268,   269,   270,   271,   272,   282,
     283,   309,   249,   250,    64,    65,    66,    67,   311,    68,
      69,    70,    71,   251,   252,   287,    97,   253,   255,   182,
     183,   184,    42,    43,    44,    45,    46,    47,    48,    49,
      50,   254,    51,    52,   290,   241,   292,    53,    54,    55,
      56,    57,    58,    64,    65,    66,    67,   256,    59,   274,
     275,    71,   278,   279,   305,   289,    60,   300,    61,    62,
      63,    64,    65,    66,    67,    93,    68,    69,    70,    71,
     303,   301,    94,   121,   302,   308,   310,   312,   313,   314,
      64,    65,    66,    67,   146,    68,    69,    70,    71,   315,
     191,    72,    73,    64,    65,    66,    67,   248,    68,    69,
      70,    71,   298,   142,   299,    97,   307,    85,    11,    30,
     215,   160,   123,   214,   291,   217
};

static const unsigned short yycheck[] =
{
      30,   175,    42,    43,    31,     0,    18,     5,    12,    30,
      58,    20,    11,     0,    44,    45,    46,    41,    46,    74,
     106,   107,    70,    74,    65,   111,    56,    57,    40,    53,
      41,    72,    62,    63,    55,    26,    27,    28,    59,    48,
      61,     4,    41,    52,    55,    54,    74,    51,    56,    57,
      74,    72,    50,    48,    58,    59,    74,    52,     4,    54,
      74,    70,    18,    74,    58,   239,    60,    86,    31,    32,
      33,    34,    35,    36,    65,    70,    70,    63,    58,   253,
      66,   102,   256,    46,    40,    31,    32,    33,    34,    35,
      36,    48,    59,    49,    61,    52,    65,    54,   251,   252,
      46,   131,    74,   133,    65,    65,   136,    65,    86,   149,
      75,    86,     5,    70,    24,    25,   156,    46,   158,   159,
      30,    66,    67,    68,    47,    48,    74,   157,    75,    52,
     160,    54,    42,    43,    44,    45,    74,    61,    62,    63,
      64,    74,   172,   173,   174,    69,    46,    70,   178,    73,
      86,   181,   182,   183,   184,   176,    86,   187,    46,   189,
      86,     8,    74,   190,    65,    74,    74,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    74,   199,    74,
      74,    72,    29,    65,    65,    65,    65,    65,    87,    74,
      37,    38,    39,   223,   224,   225,   226,   227,   228,   229,
     230,   231,   232,   233,   234,   235,   236,   237,   238,   249,
     250,   297,     4,     4,    61,    62,    63,    64,   304,    66,
      67,    68,    69,    75,    75,   255,    73,    86,    46,    76,
      77,    78,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    87,    13,    14,   274,   275,   276,    18,    19,    20,
      21,    22,    23,    61,    62,    63,    64,    86,    29,    75,
      88,    69,    74,    20,   294,    87,    37,    74,    39,    40,
      41,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      74,    87,    72,    73,    87,    74,    74,    74,    74,    65,
      61,    62,    63,    64,    89,    66,    67,    68,    69,    65,
     134,    72,    73,    61,    62,    63,    64,   199,    66,    67,
      68,    69,   280,    87,   280,    73,   295,    36,     2,    13,
     177,   101,    72,   176,   275,   179
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    90,    91,     0,    48,    52,    54,    70,   110,   120,
     122,   126,   127,   128,    56,    57,   112,    74,    74,    74,
     127,    12,    51,    58,    59,    97,    99,   101,   102,   104,
     129,   130,   131,   132,    74,   121,   123,   103,   105,    98,
     100,   126,     3,     4,     5,     6,     7,     8,     9,    10,
      11,    13,    14,    18,    19,    20,    21,    22,    23,    29,
      37,    39,    40,    41,    61,    62,    63,    64,    66,    67,
      68,    69,    72,    73,   133,   140,   142,   144,   151,   156,
     157,   158,   131,   111,   124,   124,    65,    65,    70,    92,
      93,   129,    47,    65,    72,   149,   149,    73,   151,   157,
     151,   151,   141,    65,    65,   134,   135,   137,   157,   151,
     151,   136,    73,   144,   157,    63,    66,   159,   144,   151,
     151,    73,   145,   146,   147,   148,   149,   150,   151,   157,
      74,    75,    86,     5,   115,   116,    41,    53,    74,   125,
      55,    74,   112,   113,    74,    60,    93,    94,    95,     4,
      31,    32,    33,    34,    35,    36,    46,   143,     4,    46,
     143,    96,   146,    26,    27,    28,    65,   138,   139,   138,
     138,   138,    46,    75,    46,    86,    46,     8,    29,    37,
      38,    39,    76,    77,    78,   151,   152,   153,   151,    50,
     114,   116,    74,   151,    74,    74,    74,    74,    74,    72,
     149,   149,   151,   149,   149,   151,    65,    65,    65,    65,
     151,   151,   151,   152,   148,   139,   151,   159,    65,   151,
     151,   151,   151,    24,    25,    30,    42,    43,    44,    45,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,   151,   154,   155,   151,   131,    74,   106,    96,     4,
       4,    75,    75,    86,    87,    46,    86,   151,   151,   151,
     151,   151,   151,   151,   151,   151,   151,   151,   151,   151,
     151,   151,   151,   152,    75,    88,    46,    74,    74,    20,
     107,   108,   149,   149,   158,   158,   152,   151,   152,    87,
     151,   155,   151,    18,    40,   117,   118,   109,   100,   108,
      74,    87,    87,    74,   119,   151,    49,   118,    74,   138,
      74,   138,    74,    74,    65,    65
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
#line 452 "imcc.y"
    { open_comp_unit(); }
    break;

  case 3:
#line 453 "imcc.y"
    { yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 6:
#line 464 "imcc.y"
    { yyval.i = 0; }
    break;

  case 7:
#line 465 "imcc.y"
    { yyval.i = 0; }
    break;

  case 8:
#line 468 "imcc.y"
    {clear_state();}
    break;

  case 9:
#line 469 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs,1); free(yyvsp[-1].s); }
    break;

  case 10:
#line 470 "imcc.y"
    { yyval.i = 0;}
    break;

  case 12:
#line 477 "imcc.y"
    { open_comp_unit();
                                          function = "(emit)"; }
    break;

  case 13:
#line 480 "imcc.y"
    { if (optimizer_level & OPT_PASM)
                                                allocate(interp);
                                          emit_flush(interp); yyval.i=0;}
    break;

  case 15:
#line 491 "imcc.y"
    {
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 19:
#line 503 "imcc.y"
    { open_comp_unit(); }
    break;

  case 20:
#line 505 "imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 21:
#line 509 "imcc.y"
    { open_comp_unit(); }
    break;

  case 22:
#line 511 "imcc.y"
    {
          char *name = str_dup(yyvsp[-2].s);
          Instruction *i = iSUBROUTINE(mk_address(yyvsp[-2].s, U_add_uniq_sub));
          i->r[1] = yyval.sr = mk_pcc_sub(name, 0);
          i->r[1]->pcc_sub->prototyped = yyvsp[-1].t;
        }
    break;

  case 23:
#line 518 "imcc.y"
    { yyval.i = 0; }
    break;

  case 24:
#line 521 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 25:
#line 522 "imcc.y"
    { add_pcc_param(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 26:
#line 523 "imcc.y"
    { add_pcc_param(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 27:
#line 526 "imcc.y"
    { is_def=1; }
    break;

  case 28:
#line 527 "imcc.y"
    { yyval.sr = mk_ident(yyvsp[0].s, yyvsp[-1].t); is_def=0; }
    break;

  case 29:
#line 530 "imcc.y"
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
#line 556 "imcc.y"
    { yyval.i = 0; }
    break;

  case 31:
#line 559 "imcc.y"
    { yyval.t = 1; }
    break;

  case 32:
#line 560 "imcc.y"
    { yyval.t = 0; }
    break;

  case 33:
#line 563 "imcc.y"
    { yyval.t = -1; }
    break;

  case 35:
#line 567 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-6].sr, yyvsp[-3].sr);
                  add_pcc_cc(yyvsp[-6].sr, yyvsp[-1].sr);
              }
    break;

  case 36:
#line 571 "imcc.y"
    {
                  add_pcc_sub(yyvsp[-4].sr, yyvsp[-1].sr);
              }
    break;

  case 37:
#line 576 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 38:
#line 577 "imcc.y"
    {  add_pcc_arg(yyvsp[-2].sr, yyvsp[-1].sr);}
    break;

  case 39:
#line 578 "imcc.y"
    {  add_pcc_arg(yyvsp[-3].sr, yyvsp[-1].sr);}
    break;

  case 40:
#line 581 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 41:
#line 584 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 42:
#line 585 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-6].sr, yyvsp[-1].sr); }
    break;

  case 43:
#line 586 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_result(yyvsp[-7].sr, yyvsp[-1].sr); }
    break;

  case 44:
#line 589 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 45:
#line 590 "imcc.y"
    { is_def=1; }
    break;

  case 46:
#line 590 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; yyval.sr=0; }
    break;

  case 47:
#line 593 "imcc.y"
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

  case 48:
#line 606 "imcc.y"
    { yyval.i = 0; }
    break;

  case 49:
#line 609 "imcc.y"
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

  case 50:
#line 623 "imcc.y"
    { yyval.i = 0; }
    break;

  case 51:
#line 626 "imcc.y"
    { yyval.sr = 0; }
    break;

  case 52:
#line 627 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-2].sr, yyvsp[-1].sr); }
    break;

  case 53:
#line 628 "imcc.y"
    { if(yyvsp[-1].sr) add_pcc_return(yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 54:
#line 631 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 57:
#line 638 "imcc.y"
    { clear_state(); }
    break;

  case 58:
#line 639 "imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 59:
#line 640 "imcc.y"
    { yyval.i = 0; }
    break;

  case 60:
#line 641 "imcc.y"
    { yyval.i = 0; }
    break;

  case 63:
#line 646 "imcc.y"
    { yyval.i = NULL; }
    break;

  case 67:
#line 654 "imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 68:
#line 658 "imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 72:
#line 664 "imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 73:
#line 665 "imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 74:
#line 666 "imcc.y"
    { is_def=1; }
    break;

  case 75:
#line 666 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 76:
#line 667 "imcc.y"
    { is_def=1; }
    break;

  case 77:
#line 668 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 0);is_def=0; }
    break;

  case 78:
#line 669 "imcc.y"
    { is_def=1; }
    break;

  case 79:
#line 670 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr, 1);is_def=0; }
    break;

  case 80:
#line 671 "imcc.y"
    { is_def=1; }
    break;

  case 81:
#line 671 "imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            R1(mk_ident(yyvsp[0].s, yyvsp[-1].t)));is_def=0; }
    break;

  case 82:
#line 673 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 83:
#line 674 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 84:
#line 675 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 85:
#line 676 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 86:
#line 677 "imcc.y"
    { yyval.i = MK_I(interp, "bsr",  R1(yyvsp[0].sr)); }
    break;

  case 87:
#line 678 "imcc.y"
    { yyval.i = MK_I(interp, "branch",R1(yyvsp[0].sr)); }
    break;

  case 88:
#line 679 "imcc.y"
    { yyval.i = MK_I(interp, "inc",R1(yyvsp[0].sr)); }
    break;

  case 89:
#line 680 "imcc.y"
    { yyval.i = MK_I(interp, "dec",R1(yyvsp[0].sr)); }
    break;

  case 90:
#line 681 "imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,R0()); }
    break;

  case 91:
#line 682 "imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,R0()); }
    break;

  case 92:
#line 683 "imcc.y"
    { yyval.i = MK_I(interp, "end" ,R0()); }
    break;

  case 93:
#line 684 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs, 1); free(yyvsp[-1].s); }
    break;

  case 94:
#line 685 "imcc.y"
    { yyval.i = 0;}
    break;

  case 95:
#line 689 "imcc.y"
    { yyval.t = 'I'; }
    break;

  case 96:
#line 690 "imcc.y"
    { yyval.t = 'N'; }
    break;

  case 97:
#line 691 "imcc.y"
    { yyval.t = 'S'; }
    break;

  case 98:
#line 692 "imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 100:
#line 700 "imcc.y"
    { yyval.i = MK_I(interp, "set", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 101:
#line 701 "imcc.y"
    { yyval.i = MK_I(interp, "not", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 102:
#line 702 "imcc.y"
    { yyval.i = MK_I(interp, "neg", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 103:
#line 703 "imcc.y"
    { yyval.i = MK_I(interp, "bnot", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 104:
#line 704 "imcc.y"
    { yyval.i = MK_I(interp, "add", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 105:
#line 705 "imcc.y"
    { yyval.i = MK_I(interp, "sub", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 106:
#line 706 "imcc.y"
    { yyval.i = MK_I(interp, "mul", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 107:
#line 707 "imcc.y"
    { yyval.i = MK_I(interp, "pow", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 108:
#line 708 "imcc.y"
    { yyval.i = MK_I(interp, "div", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 109:
#line 709 "imcc.y"
    { yyval.i = MK_I(interp, "mod", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 110:
#line 710 "imcc.y"
    { yyval.i = MK_I(interp, "concat", R3(yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 111:
#line 711 "imcc.y"
    { yyval.i = MK_I(interp, "shl", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 112:
#line 712 "imcc.y"
    { yyval.i = MK_I(interp, "shr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 113:
#line 713 "imcc.y"
    { yyval.i = MK_I(interp, "lsr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 114:
#line 714 "imcc.y"
    { yyval.i = MK_I(interp, "and", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 115:
#line 715 "imcc.y"
    { yyval.i = MK_I(interp, "or", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 116:
#line 716 "imcc.y"
    { yyval.i = MK_I(interp, "xor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 117:
#line 717 "imcc.y"
    { yyval.i = MK_I(interp, "band", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 118:
#line 718 "imcc.y"
    { yyval.i = MK_I(interp, "bor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 119:
#line 719 "imcc.y"
    { yyval.i = MK_I(interp, "bxor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 120:
#line 720 "imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 121:
#line 721 "imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 122:
#line 722 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-5].sr, yyvsp[-2].s, yyvsp[0].sr, 1); }
    break;

  case 123:
#line 723 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, NULL,1); }
    break;

  case 124:
#line 724 "imcc.y"
    { yyval.i = MK_I(interp, "defined",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 125:
#line 725 "imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", R3(yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 126:
#line 727 "imcc.y"
    { yyval.i = MK_I(interp, "clone",R2(yyvsp[-3].sr, yyvsp[0].sr));
    }
    break;

  case 127:
#line 729 "imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          R2(yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once))); }
    break;

  case 128:
#line 731 "imcc.y"
    { yyval.i = MK_I(interp, "find_global",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 129:
#line 732 "imcc.y"
    { yyval.i = MK_I(interp, "store_global",R2(yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 130:
#line 733 "imcc.y"
    { expect_pasm = 1; }
    break;

  case 131:
#line 734 "imcc.y"
    { yyval.i = iANY(interp, "new",0,regs,1);  }
    break;

  case 132:
#line 735 "imcc.y"
    { yyval.i = MK_I(interp, "defined", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 133:
#line 736 "imcc.y"
    { keyvec=KEY_BIT(2);
                                       yyval.i = MK_I(interp, "defined", R3(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 134:
#line 738 "imcc.y"
    { yyval.i = MK_I(interp, "clone", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 135:
#line 742 "imcc.y"
    {yyval.i=MK_I(interp, yyvsp[-3].s,R3(yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 136:
#line 743 "imcc.y"
    {yyval.i=MK_I(interp, inv_op(yyvsp[-3].s),
                                            R3(yyvsp[-4].sr,yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 137:
#line 745 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 138:
#line 746 "imcc.y"
    {yyval.i= MK_I(interp, "unless",R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 139:
#line 747 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 140:
#line 748 "imcc.y"
    {yyval.i= MK_I(interp, "unless", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 141:
#line 753 "imcc.y"
    { yyval.s = "eq"; }
    break;

  case 142:
#line 754 "imcc.y"
    { yyval.s = "ne"; }
    break;

  case 143:
#line 755 "imcc.y"
    { yyval.s = "gt"; }
    break;

  case 144:
#line 756 "imcc.y"
    { yyval.s = "ge"; }
    break;

  case 145:
#line 757 "imcc.y"
    { yyval.s = "lt"; }
    break;

  case 146:
#line 758 "imcc.y"
    { yyval.s = "le"; }
    break;

  case 151:
#line 769 "imcc.y"
    { yyval.sr = NULL; }
    break;

  case 152:
#line 770 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 153:
#line 773 "imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 155:
#line 777 "imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 156:
#line 778 "imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 157:
#line 783 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 158:
#line 784 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 163:
#line 795 "imcc.y"
    { nkeys=0; }
    break;

  case 164:
#line 796 "imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 165:
#line 799 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 166:
#line 800 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 170:
#line 810 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 171:
#line 811 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 172:
#line 812 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 173:
#line 813 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 174:
#line 814 "imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 175:
#line 817 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 176:
#line 818 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 177:
#line 819 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 178:
#line 822 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 179:
#line 823 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2603 "imcparser.c"

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


#line 825 "imcc.y"



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

