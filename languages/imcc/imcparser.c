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
     CONSTANT = 276,
     INC = 277,
     DEC = 278,
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
     LABEL = 303,
     EMIT = 304,
     EOM = 305,
     IREG = 306,
     NREG = 307,
     SREG = 308,
     PREG = 309,
     IDENTIFIER = 310,
     STRINGC = 311,
     INTC = 312,
     FLOATC = 313,
     REG = 314,
     MACRO = 315,
     ENDM = 316,
     PARROT_OP = 317,
     VAR = 318
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
#define CONSTANT 276
#define INC 277
#define DEC 278
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
#define LABEL 303
#define EMIT 304
#define EOM 305
#define IREG 306
#define NREG 307
#define SREG 308
#define PREG 309
#define IDENTIFIER 310
#define STRINGC 311
#define INTC 312
#define FLOATC 313
#define REG 314
#define MACRO 315
#define ENDM 316
#define PARROT_OP 317
#define VAR 318




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
    i = emitb(i);
    clear_state();
    return i;
}


static Instruction * iSUBROUTINE(SymReg * r0) {
    function = r0->name;
    return iLABEL(r0); /* XXX mark label global */
}


/*
 * substr or X = Pkey
 */
static Instruction *
iINDEXFETCH(struct Parrot_Interp *interp, SymReg * r0, SymReg * r1,
    SymReg * r2)
{
    if(r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        SymReg * r3 = mk_const("1", 'I');
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
        SymReg * r3 = mk_const("1", 'I');
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

#if 0
/* return the index of a PMC class */
static int
get_pmc_num(struct Parrot_Interp *interpreter, char *pmc_type)
{
    STRING * s = string_make(interpreter, pmc_type,
            (UINTVAL) strlen(pmc_type), NULL, 0, NULL);
    PMC * key = key_new_string(interpreter, s);
    return interpreter->Parrot_base_classname_hash->vtable->get_integer_keyed(
            interpreter, interpreter->Parrot_base_classname_hash, key);
}

/* only .PmcType */
SymReg *
macro(struct Parrot_Interp *interp, char *name)
{
    SymReg * r;
    char buf[16];
    int type = get_pmc_num(interp, name);
    sprintf(buf, "%d", type);
    r =  mk_const(str_dup(buf), 'I');
    return r;
}
#endif

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
        preg[n] = mk_symreg(buf, 'P');
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
    iNEW(interpreter, preg[0], str_dup("PerlUndef"), 1);
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
                    /* inout is actually in for imcc, the PMC has to exist
                     * previously, so:
                     * goon
                     */
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
        /* set up branch flags */
        if (op_info->jump || !strcmp(name, "end")) {

#if 0
            if (!strcmp(name, "bsr") || !strcmp(name, "ret")) {
                /* ignore subcalls and ret
                 * because they saveall
                 */
            }
            else
#endif
            {

                /* XXX: assume the jump is relative and to the last arg.
                 * usually true.
                 */
                ins->type = ITBRANCH | (1 << (nargs-1));
                if (!strcmp(name, "branch") || !strcmp(name, "end"))
                    ins->type |= IF_goto;
            }
        }
        else if (!strcmp(name, "set") && nargs == 2) {
            /* set Px, Py: both PMCs have the same address */
            if (r[0]->set == 'P' && r[1]->set == 'P')
                ins->type |= ITALIAS;
        }
        else if (!strcmp(name, "set_addr")) {
            /* XXX probably a CATCH block */
            ins->type = ITADDR | IF_r1_branch | ITBRANCH;
        }
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
#line 404 "imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 609 "imcparser.c"
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
#line 630 "imcparser.c"

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
#define YYLAST   264

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  79
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  47
/* YYNRULES -- Number of rules. */
#define YYNRULES  136
/* YYNRULES -- Number of states. */
#define YYNSTATES  233

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   318

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      64,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    66,     2,     2,     2,    72,    74,     2,
       2,     2,    70,    69,     2,    67,    73,    71,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    78,
       2,    65,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    76,     2,    77,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    75,     2,    68,     2,     2,     2,
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
      55,    56,    57,    58,    59,    60,    61,    62,    63
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     4,     7,     9,    12,    16,    19,    21,
      22,    26,    27,    29,    33,    34,    39,    43,    45,    46,
      51,    53,    56,    57,    60,    61,    63,    66,    68,    70,
      74,    76,    78,    80,    83,    86,    87,    92,    93,   100,
     101,   106,   109,   112,   115,   118,   121,   124,   127,   130,
     132,   134,   136,   139,   140,   142,   144,   146,   148,   150,
     154,   159,   164,   169,   175,   181,   187,   193,   199,   205,
     211,   217,   223,   229,   235,   241,   247,   253,   259,   265,
     272,   279,   284,   289,   297,   302,   307,   312,   317,   318,
     324,   329,   337,   342,   344,   351,   356,   361,   366,   371,
     373,   375,   377,   379,   381,   383,   385,   387,   389,   391,
     392,   394,   398,   400,   402,   407,   409,   411,   413,   415,
     417,   418,   421,   423,   427,   429,   431,   433,   435,   437,
     439,   441,   443,   445,   447,   449,   451
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const yysigned_char yyrhs[] =
{
      80,     0,    -1,    -1,    81,    93,    -1,    83,    -1,    82,
      83,    -1,    96,    84,    64,    -1,    60,    64,    -1,    87,
      -1,    -1,    85,    62,    86,    -1,    -1,   113,    -1,    21,
      55,   124,    -1,    -1,    49,    89,    82,    50,    -1,    91,
      93,    47,    -1,    88,    -1,    -1,    12,    92,    55,    64,
      -1,    94,    -1,    93,    94,    -1,    -1,    95,    99,    -1,
      -1,    97,    -1,    97,    98,    -1,    98,    -1,    48,    -1,
      96,   100,    64,    -1,    90,    -1,   106,    -1,   109,    -1,
      13,    55,    -1,    14,    55,    -1,    -1,    18,   101,   104,
      55,    -1,    -1,    19,   102,   104,    55,    65,   124,    -1,
      -1,    20,   103,   104,    55,    -1,    20,   123,    -1,    40,
     117,    -1,     5,   117,    -1,    41,   117,    -1,     3,    55,
      -1,     4,    55,    -1,    22,   117,    -1,    23,   117,    -1,
      10,    -1,    11,    -1,     9,    -1,    62,   113,    -1,    -1,
      26,    -1,    27,    -1,    28,    -1,   105,    -1,    55,    -1,
     111,    65,   117,    -1,   111,    65,    66,   117,    -1,   111,
      65,    67,   117,    -1,   111,    65,    68,   117,    -1,   111,
      65,   117,    69,   117,    -1,   111,    65,   117,    67,   117,
      -1,   111,    65,   117,    70,   117,    -1,   111,    65,   117,
      42,   117,    -1,   111,    65,   117,    71,   117,    -1,   111,
      65,   117,    72,   117,    -1,   111,    65,   117,    73,   117,
      -1,   111,    65,   117,    24,   117,    -1,   111,    65,   117,
      25,   117,    -1,   111,    65,   117,    43,   117,    -1,   111,
      65,   117,    44,   117,    -1,   111,    65,   117,    45,   117,
      -1,   111,    65,   117,    30,   117,    -1,   111,    65,   117,
      74,   117,    -1,   111,    65,   117,    75,   117,    -1,   111,
      65,   117,    68,   117,    -1,   111,    65,   117,    76,   118,
      77,    -1,   117,    76,   118,    77,    65,   117,    -1,   111,
      65,     8,   105,    -1,   111,    65,    29,   117,    -1,   111,
      65,    29,   117,    76,   118,    77,    -1,   111,    65,    39,
     117,    -1,   111,    65,    38,    55,    -1,   111,    65,    37,
     125,    -1,    37,   125,    65,   117,    -1,    -1,     8,   107,
     111,    46,   108,    -1,    29,   111,    46,   117,    -1,    29,
     111,    46,   117,    76,   118,    77,    -1,    39,   111,    46,
     117,    -1,   124,    -1,     6,   117,   110,   117,     4,    55,
      -1,     6,   117,     4,    55,    -1,     7,   117,     4,    55,
      -1,     6,   117,    46,    55,    -1,     7,   117,    46,    55,
      -1,    31,    -1,    32,    -1,    33,    -1,    34,    -1,    35,
      -1,    36,    -1,    63,    -1,   123,    -1,    63,    -1,   123,
      -1,    -1,   114,    -1,   114,    46,   115,    -1,   115,    -1,
     116,    -1,   112,    76,   118,    77,    -1,    55,    -1,    62,
      -1,   117,    -1,    63,    -1,   122,    -1,    -1,   119,   120,
      -1,   121,    -1,   120,    78,   121,    -1,   117,    -1,   123,
      -1,   124,    -1,    51,    -1,    52,    -1,    53,    -1,    54,
      -1,    59,    -1,    57,    -1,    58,    -1,    56,    -1,    53,
      -1,    56,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   440,   440,   440,   448,   449,   452,   453,   454,   457,
     457,   459,   461,   465,   469,   468,   476,   483,   486,   486,
     493,   494,   497,   497,   501,   502,   505,   506,   509,   512,
     514,   516,   518,   519,   520,   521,   521,   522,   522,   524,
     524,   526,   527,   528,   529,   530,   532,   534,   535,   536,
     537,   538,   539,   540,   543,   545,   546,   547,   550,   554,
     556,   557,   558,   559,   560,   561,   562,   563,   564,   565,
     566,   567,   568,   569,   570,   571,   572,   573,   574,   575,
     576,   577,   578,   579,   581,   583,   585,   586,   587,   587,
     589,   590,   592,   595,   599,   602,   604,   606,   608,   613,
     615,   616,   617,   618,   619,   623,   624,   626,   627,   630,
     631,   634,   635,   638,   639,   643,   645,   646,   649,   650,
     653,   653,   657,   658,   661,   664,   665,   668,   669,   670,
     671,   672,   675,   676,   677,   680,   681
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
  "CONSTANT", "INC", "DEC", "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", 
  "STRINGV", "DEFINED", "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", 
  "RELOP_GTE", "RELOP_LT", "RELOP_LTE", "GLOBAL", "ADDR", "CLONE", 
  "RESULT", "RETURN", "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", 
  "COMMA", "ESUB", "LABEL", "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", 
  "IDENTIFIER", "STRINGC", "INTC", "FLOATC", "REG", "MACRO", "ENDM", 
  "PARROT_OP", "VAR", "'\\n'", "'='", "'!'", "'-'", "'~'", "'+'", "'*'", 
  "'/'", "'%'", "'.'", "'&'", "'|'", "'['", "']'", "';'", "$accept", 
  "program", "@1", "pasmcode", "pasmline", "pasm_inst", "@2", "pasm_args", 
  "constant_def", "emit", "@3", "sub", "sub_start", "@4", "statements", 
  "statement", "@5", "labels", "_labels", "label", "instruction", 
  "labeled_inst", "@6", "@7", "@8", "type", "classname", "assignment", 
  "@9", "newtype", "if_statement", "relop", "target", "lhs", "vars", 
  "_vars", "_var_or_i", "var_or_i", "var", "keylist", "@10", "_keylist", 
  "key", "rc", "reg", "const", "string", 0
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
     315,   316,   317,   318,    10,    61,    33,    45,   126,    43,
      42,    47,    37,    46,    38,   124,    91,    93,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    79,    81,    80,    82,    82,    83,    83,    83,    85,
      84,    84,    86,    87,    89,    88,    90,    90,    92,    91,
      93,    93,    95,    94,    96,    96,    97,    97,    98,    99,
      99,   100,   100,   100,   100,   101,   100,   102,   100,   103,
     100,   100,   100,   100,   100,   100,   100,   100,   100,   100,
     100,   100,   100,   100,   104,   104,   104,   104,   105,   106,
     106,   106,   106,   106,   106,   106,   106,   106,   106,   106,
     106,   106,   106,   106,   106,   106,   106,   106,   106,   106,
     106,   106,   106,   106,   106,   106,   106,   106,   107,   106,
     106,   106,   106,   108,   109,   109,   109,   109,   109,   110,
     110,   110,   110,   110,   110,   111,   111,   112,   112,   113,
     113,   114,   114,   115,   115,   116,   116,   116,   117,   117,
     119,   118,   120,   120,   121,   122,   122,   123,   123,   123,
     123,   123,   124,   124,   124,   125,   125
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     2,     3,     2,     1,     0,
       3,     0,     1,     3,     0,     4,     3,     1,     0,     4,
       1,     2,     0,     2,     0,     1,     2,     1,     1,     3,
       1,     1,     1,     2,     2,     0,     4,     0,     6,     0,
       4,     2,     2,     2,     2,     2,     2,     2,     2,     1,
       1,     1,     2,     0,     1,     1,     1,     1,     1,     3,
       4,     4,     4,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     6,
       6,     4,     4,     7,     4,     4,     4,     4,     0,     5,
       4,     7,     4,     1,     6,     4,     4,     4,     4,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     0,
       1,     3,     1,     1,     4,     1,     1,     1,     1,     1,
       0,     2,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,    22,     1,    22,    20,    24,    21,    18,    28,
      14,    17,    30,    22,    53,    25,    27,    23,     0,    24,
      22,     0,     0,     0,     0,     0,    88,    51,    49,    50,
       0,     0,    35,    37,    39,     0,     0,     0,     0,     0,
       0,     0,   127,   128,   129,   130,   134,   132,   133,   131,
     109,   105,     0,    31,    32,     0,     0,   119,   106,   126,
      26,     0,     0,     0,    24,     4,     8,     9,    16,    45,
      46,   118,    43,   125,     0,     0,     0,    33,    34,     0,
       0,     0,    41,    47,    48,   105,     0,   106,   135,   136,
       0,     0,    42,    44,   115,   116,   118,     0,    52,   110,
     112,   113,   117,   125,    29,     0,   120,    19,     0,     7,
      15,     5,     0,     0,     0,    99,   100,   101,   102,   103,
     104,     0,     0,     0,     0,     0,    54,    55,    56,    58,
       0,    57,     0,     0,     0,     0,     0,   120,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    59,     0,     0,
      13,     6,   109,    95,    97,     0,    96,    98,     0,    36,
       0,    40,    90,    87,    92,     0,   111,    81,    82,    86,
      85,    84,    60,    61,    62,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   120,     0,   124,   121,   122,    10,    12,     0,    89,
      93,     0,   120,   114,   120,    70,    71,    75,    66,    72,
      73,    74,    64,    78,    63,    65,    67,    68,    69,    76,
      77,     0,     0,     0,    94,    38,     0,     0,    79,    80,
     123,    91,    83
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,    64,    65,   112,   113,   196,    66,    11,
      19,    12,    13,    18,     4,     5,     6,    67,    15,    16,
      17,    52,    79,    80,    81,   130,   131,    53,    76,   199,
      54,   122,    55,    97,    98,    99,   100,   101,   102,   148,
     149,   194,   195,    57,    73,    59,    90
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -136
static const short yypact[] =
{
    -136,     3,  -136,  -136,     8,  -136,    12,  -136,  -136,  -136,
    -136,  -136,  -136,  -136,   174,   -15,  -136,  -136,   -19,     2,
      -9,   -16,    10,   201,   201,   201,  -136,  -136,  -136,  -136,
      13,    15,  -136,  -136,    64,   201,   201,    25,   -28,    25,
     201,   201,  -136,  -136,  -136,  -136,  -136,  -136,  -136,  -136,
      86,   -22,    -7,  -136,  -136,     1,   -18,  -136,   -13,  -136,
    -136,     7,    17,    16,    -1,  -136,  -136,    21,  -136,  -136,
    -136,  -136,  -136,  -136,     9,     0,    25,  -136,  -136,   -21,
     -21,   -21,  -136,  -136,  -136,  -136,    18,  -136,  -136,  -136,
      22,    29,  -136,  -136,  -136,  -136,    14,    23,  -136,    40,
    -136,  -136,  -136,    28,  -136,    44,  -136,  -136,   -39,  -136,
    -136,  -136,    41,    27,    37,  -136,  -136,  -136,  -136,  -136,
    -136,    38,   201,    51,    54,    67,  -136,  -136,  -136,  -136,
      59,  -136,    69,    70,   201,   201,   201,  -136,    86,    72,
     201,   -28,    73,   201,   201,   201,   201,   175,    42,   201,
    -136,  -136,    86,  -136,  -136,   129,  -136,  -136,   -39,  -136,
      81,  -136,    58,  -136,  -136,    74,  -136,  -136,    71,  -136,
    -136,  -136,  -136,  -136,  -136,   201,   201,   201,   201,   201,
     201,   201,   201,   201,   201,   201,   201,   201,   201,   201,
     201,  -136,    87,  -136,    75,  -136,  -136,  -136,    99,  -136,
    -136,   -39,  -136,  -136,  -136,  -136,  -136,  -136,  -136,  -136,
    -136,  -136,  -136,  -136,  -136,  -136,  -136,  -136,  -136,  -136,
    -136,    78,   201,   201,  -136,  -136,    79,    80,  -136,  -136,
    -136,  -136,  -136
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -136,  -136,  -136,  -136,    94,  -136,  -136,  -136,  -136,  -136,
    -136,  -136,  -136,  -136,   146,    11,  -136,   154,  -136,   171,
    -136,  -136,  -136,  -136,  -136,   -51,    50,  -136,  -136,  -136,
    -136,  -136,   -23,  -136,    39,  -136,    52,  -136,   -14,  -135,
    -136,  -136,   -25,  -136,    -2,  -107,    60
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -126
static const short yytable[] =
{
      56,   150,   165,     3,   123,   126,   127,   128,    -3,    72,
      74,    75,    58,   114,    86,     7,    91,    46,    47,    48,
      62,    83,    84,    62,     8,    88,    92,    93,    89,   132,
     133,     7,    82,     9,   129,    87,    61,    87,    68,    69,
     115,   116,   117,   118,   119,   120,   124,     9,   103,   110,
       9,   200,   139,   125,  -118,   121,   221,   104,   106,    63,
       9,    10,    63,  -125,   134,    70,   105,   226,    77,   227,
      78,   107,   108,   140,    87,   136,    42,    43,    44,    45,
     109,   141,   142,   143,    49,   -11,   138,   135,    85,   152,
    -107,   147,   153,   154,   225,    42,    43,    44,    45,   137,
      46,    47,    48,    49,  -108,   151,   156,    71,   155,   157,
     144,   145,   146,   158,   159,    42,    43,    44,    45,   192,
     162,   163,   164,    49,   160,   161,   168,   129,   170,   171,
     172,   173,   174,   198,   202,   193,   103,    42,    43,    44,
      45,    94,    46,    47,    48,    49,   201,   204,    95,    96,
     103,   203,   222,   223,   224,   228,   231,   232,   111,    20,
      14,   205,   206,   207,   208,   209,   210,   211,   212,   213,
     214,   215,   216,   217,   218,   219,   220,    21,    22,    23,
      24,    25,    26,    27,    28,    29,    60,    30,    31,   167,
     166,   197,    32,    33,    34,     0,    35,    36,   230,   175,
     176,   169,     0,    37,     0,   177,     0,     0,   229,   193,
       0,    38,     0,    39,    40,    41,     0,   178,   179,   180,
     181,     0,     0,     0,     0,    42,    43,    44,    45,     0,
      46,    47,    48,    49,     0,     0,    50,    51,     0,     0,
       0,     0,   182,   183,   184,   185,   186,   187,   188,   189,
     190,   191,    42,    43,    44,    45,     0,    46,    47,    48,
      49,     0,     0,     0,    71
};

static const short yycheck[] =
{
      14,   108,   137,     0,     4,    26,    27,    28,     0,    23,
      24,    25,    14,     4,    37,     4,    39,    56,    57,    58,
      21,    35,    36,    21,    12,    53,    40,    41,    56,    80,
      81,    20,    34,    48,    55,    37,    55,    39,    47,    55,
      31,    32,    33,    34,    35,    36,    46,    48,    50,    50,
      48,   158,     8,    76,    76,    46,   191,    64,    76,    60,
      48,    49,    60,    76,    46,    55,    65,   202,    55,   204,
      55,    64,    55,    29,    76,    46,    51,    52,    53,    54,
      64,    37,    38,    39,    59,    64,    46,    65,    63,    62,
      76,   105,    55,    55,   201,    51,    52,    53,    54,    76,
      56,    57,    58,    59,    76,    64,    55,    63,   122,    55,
      66,    67,    68,    46,    55,    51,    52,    53,    54,    77,
     134,   135,   136,    59,    55,    55,   140,    55,    55,   143,
     144,   145,   146,     4,    76,   149,   138,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    65,    76,    62,    63,
     152,    77,    65,    78,    55,    77,    77,    77,    64,    13,
       6,   175,   176,   177,   178,   179,   180,   181,   182,   183,
     184,   185,   186,   187,   188,   189,   190,     3,     4,     5,
       6,     7,     8,     9,    10,    11,    15,    13,    14,   139,
     138,   152,    18,    19,    20,    -1,    22,    23,   223,    24,
      25,   141,    -1,    29,    -1,    30,    -1,    -1,   222,   223,
      -1,    37,    -1,    39,    40,    41,    -1,    42,    43,    44,
      45,    -1,    -1,    -1,    -1,    51,    52,    53,    54,    -1,
      56,    57,    58,    59,    -1,    -1,    62,    63,    -1,    -1,
      -1,    -1,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    51,    52,    53,    54,    -1,    56,    57,    58,
      59,    -1,    -1,    -1,    63
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    80,    81,     0,    93,    94,    95,    94,    12,    48,
      49,    88,    90,    91,    96,    97,    98,    99,    92,    89,
      93,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      13,    14,    18,    19,    20,    22,    23,    29,    37,    39,
      40,    41,    51,    52,    53,    54,    56,    57,    58,    59,
      62,    63,   100,   106,   109,   111,   117,   122,   123,   124,
      98,    55,    21,    60,    82,    83,    87,    96,    47,    55,
      55,    63,   117,   123,   117,   117,   107,    55,    55,   101,
     102,   103,   123,   117,   117,    63,   111,   123,    53,    56,
     125,   111,   117,   117,    55,    62,    63,   112,   113,   114,
     115,   116,   117,   123,    64,    65,    76,    64,    55,    64,
      50,    83,    84,    85,     4,    31,    32,    33,    34,    35,
      36,    46,   110,     4,    46,   111,    26,    27,    28,    55,
     104,   105,   104,   104,    46,    65,    46,    76,    46,     8,
      29,    37,    38,    39,    66,    67,    68,   117,   118,   119,
     124,    64,    62,    55,    55,   117,    55,    55,    46,    55,
      55,    55,   117,   117,   117,   118,   115,   105,   117,   125,
      55,   117,   117,   117,   117,    24,    25,    30,    42,    43,
      44,    45,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,   117,   120,   121,    86,   113,     4,   108,
     124,    65,    76,    77,    76,   117,   117,   117,   117,   117,
     117,   117,   117,   117,   117,   117,   117,   117,   117,   117,
     117,   118,    65,    78,    55,   124,   118,   118,    77,   117,
     121,    77,    77
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
#line 440 "imcc.y"
    { open_comp_unit(); }
    break;

  case 3:
#line 441 "imcc.y"
    { yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 6:
#line 452 "imcc.y"
    { yyval.i = 0; }
    break;

  case 7:
#line 453 "imcc.y"
    { yyval.i = 0; }
    break;

  case 9:
#line 457 "imcc.y"
    {clear_state();}
    break;

  case 10:
#line 458 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs,1); free(yyvsp[-1].s); }
    break;

  case 11:
#line 459 "imcc.y"
    { yyval.i = 0;}
    break;

  case 13:
#line 465 "imcc.y"
    { /* printf ("%s\n", ); */ }
    break;

  case 14:
#line 469 "imcc.y"
    { open_comp_unit(); }
    break;

  case 15:
#line 471 "imcc.y"
    { emit_flush(interp); yyval.i=0;}
    break;

  case 16:
#line 478 "imcc.y"
    {
          yyval.i = 0;
	  allocate(interp);
	  emit_flush(interp);
        }
    break;

  case 17:
#line 483 "imcc.y"
    { yyval.i=0; }
    break;

  case 18:
#line 486 "imcc.y"
    { open_comp_unit(); }
    break;

  case 19:
#line 488 "imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 22:
#line 497 "imcc.y"
    { clear_state(); }
    break;

  case 23:
#line 498 "imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 24:
#line 501 "imcc.y"
    { yyval.i = NULL; }
    break;

  case 28:
#line 509 "imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 29:
#line 513 "imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 33:
#line 519 "imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 34:
#line 520 "imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 35:
#line 521 "imcc.y"
    { is_def=1; }
    break;

  case 36:
#line 521 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 37:
#line 522 "imcc.y"
    { is_def=1; }
    break;

  case 38:
#line 523 "imcc.y"
    { mk_const_ident(yyvsp[-2].s, yyvsp[-3].t, yyvsp[0].sr);is_def=0; }
    break;

  case 39:
#line 524 "imcc.y"
    { is_def=1; }
    break;

  case 40:
#line 524 "imcc.y"
    { yyval.i = MK_I(interp, "restore",
		                            R1(mk_ident(yyvsp[0].s, yyvsp[-1].t)));is_def=0; }
    break;

  case 41:
#line 526 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 42:
#line 527 "imcc.y"
    { yyval.i = MK_I(interp, "restore", R1(yyvsp[0].sr)); }
    break;

  case 43:
#line 528 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 44:
#line 529 "imcc.y"
    { yyval.i = MK_I(interp, "save", R1(yyvsp[0].sr)); }
    break;

  case 45:
#line 530 "imcc.y"
    { yyval.i = MK_I(interp, "bsr",
                                              R1(mk_address(yyvsp[0].s, U_add_once)));}
    break;

  case 46:
#line 532 "imcc.y"
    { yyval.i = MK_I(interp, "branch",
                                              R1(mk_address(yyvsp[0].s, U_add_once)));}
    break;

  case 47:
#line 534 "imcc.y"
    { yyval.i = MK_I(interp, "inc",R1(yyvsp[0].sr)); }
    break;

  case 48:
#line 535 "imcc.y"
    { yyval.i = MK_I(interp, "dec",R1(yyvsp[0].sr)); }
    break;

  case 49:
#line 536 "imcc.y"
    { yyval.i = MK_I(interp, "saveall" ,R0()); }
    break;

  case 50:
#line 537 "imcc.y"
    { yyval.i = MK_I(interp, "restoreall" ,R0()); }
    break;

  case 51:
#line 538 "imcc.y"
    { yyval.i = MK_I(interp, "end" ,R0()); }
    break;

  case 52:
#line 539 "imcc.y"
    { yyval.i = iANY(interp, yyvsp[-1].s,0,regs, 1); free(yyvsp[-1].s); }
    break;

  case 53:
#line 540 "imcc.y"
    { yyval.i = 0;}
    break;

  case 54:
#line 544 "imcc.y"
    { yyval.t = 'I'; }
    break;

  case 55:
#line 545 "imcc.y"
    { yyval.t = 'N'; }
    break;

  case 56:
#line 546 "imcc.y"
    { yyval.t = 'S'; }
    break;

  case 57:
#line 547 "imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 59:
#line 555 "imcc.y"
    { yyval.i = MK_I(interp, "set", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 60:
#line 556 "imcc.y"
    { yyval.i = MK_I(interp, "not", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 61:
#line 557 "imcc.y"
    { yyval.i = MK_I(interp, "neg", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 62:
#line 558 "imcc.y"
    { yyval.i = MK_I(interp, "bnot", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 63:
#line 559 "imcc.y"
    { yyval.i = MK_I(interp, "add", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 64:
#line 560 "imcc.y"
    { yyval.i = MK_I(interp, "sub", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 65:
#line 561 "imcc.y"
    { yyval.i = MK_I(interp, "mul", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 66:
#line 562 "imcc.y"
    { yyval.i = MK_I(interp, "pow", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 67:
#line 563 "imcc.y"
    { yyval.i = MK_I(interp, "div", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 68:
#line 564 "imcc.y"
    { yyval.i = MK_I(interp, "mod", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 69:
#line 565 "imcc.y"
    { yyval.i = MK_I(interp, "concat", R3(yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 70:
#line 566 "imcc.y"
    { yyval.i = MK_I(interp, "shl", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 71:
#line 567 "imcc.y"
    { yyval.i = MK_I(interp, "shr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 72:
#line 568 "imcc.y"
    { yyval.i = MK_I(interp, "lsr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 73:
#line 569 "imcc.y"
    { yyval.i = MK_I(interp, "and", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 74:
#line 570 "imcc.y"
    { yyval.i = MK_I(interp, "or", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 75:
#line 571 "imcc.y"
    { yyval.i = MK_I(interp, "xor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 76:
#line 572 "imcc.y"
    { yyval.i = MK_I(interp, "band", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 77:
#line 573 "imcc.y"
    { yyval.i = MK_I(interp, "bor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 78:
#line 574 "imcc.y"
    { yyval.i = MK_I(interp, "bxor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 79:
#line 575 "imcc.y"
    { yyval.i = iINDEXFETCH(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 80:
#line 576 "imcc.y"
    { yyval.i = iINDEXSET(interp, yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 81:
#line 577 "imcc.y"
    { yyval.i = iNEW(interp, yyvsp[-3].sr, yyvsp[0].s, 1); }
    break;

  case 82:
#line 578 "imcc.y"
    { yyval.i = MK_I(interp, "defined",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 83:
#line 579 "imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I(interp, "defined", R3(yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 84:
#line 581 "imcc.y"
    { yyval.i = MK_I(interp, "clone",R2(yyvsp[-3].sr, yyvsp[0].sr));
    }
    break;

  case 85:
#line 583 "imcc.y"
    { yyval.i = MK_I(interp, "set_addr",
                                          R2(yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once))); }
    break;

  case 86:
#line 585 "imcc.y"
    { yyval.i = MK_I(interp, "find_global",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 87:
#line 586 "imcc.y"
    { yyval.i = MK_I(interp, "store_global",R2(yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 88:
#line 587 "imcc.y"
    { expect_pasm = 1; }
    break;

  case 89:
#line 588 "imcc.y"
    { yyval.i = MK_I(interp, "new", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 90:
#line 589 "imcc.y"
    { yyval.i = MK_I(interp, "defined", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 91:
#line 590 "imcc.y"
    { keyvec=KEY_BIT(2);
                                       yyval.i = MK_I(interp, "defined", R3(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 92:
#line 592 "imcc.y"
    { yyval.i = MK_I(interp, "clone", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 94:
#line 600 "imcc.y"
    { yyval.i=MK_I(interp, yyvsp[-3].s,R3(yyvsp[-4].sr,yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s,U_add_once))); }
    break;

  case 95:
#line 602 "imcc.y"
    {yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); }
    break;

  case 96:
#line 604 "imcc.y"
    {yyval.i= MK_I(interp, "unless",R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); }
    break;

  case 97:
#line 606 "imcc.y"
    { yyval.i= MK_I(interp, "if", R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); }
    break;

  case 98:
#line 608 "imcc.y"
    { yyval.i= MK_I(interp, "unless", R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); }
    break;

  case 99:
#line 614 "imcc.y"
    { yyval.s = "eq"; }
    break;

  case 100:
#line 615 "imcc.y"
    { yyval.s = "ne"; }
    break;

  case 101:
#line 616 "imcc.y"
    { yyval.s = "gt"; }
    break;

  case 102:
#line 617 "imcc.y"
    { yyval.s = "ge"; }
    break;

  case 103:
#line 618 "imcc.y"
    { yyval.s = "lt"; }
    break;

  case 104:
#line 619 "imcc.y"
    { yyval.s = "le"; }
    break;

  case 109:
#line 630 "imcc.y"
    { yyval.sr = NULL; }
    break;

  case 110:
#line 631 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 111:
#line 634 "imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 113:
#line 638 "imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 114:
#line 639 "imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 115:
#line 644 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 116:
#line 645 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 120:
#line 653 "imcc.y"
    { nkeys=0; }
    break;

  case 121:
#line 654 "imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 122:
#line 657 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 123:
#line 658 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 127:
#line 668 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 128:
#line 669 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 129:
#line 670 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 130:
#line 671 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 131:
#line 672 "imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 132:
#line 675 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 133:
#line 676 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 134:
#line 677 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 135:
#line 680 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 136:
#line 681 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2262 "imcparser.c"

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


#line 683 "imcc.y"



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

