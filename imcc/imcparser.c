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
#define YYPURE	0

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
     PRINT = 261,
     IF = 262,
     UNLESS = 263,
     NEW = 264,
     END = 265,
     SAVEALL = 266,
     RESTOREALL = 267,
     SUB = 268,
     NAMESPACE = 269,
     ENDNAMESPACE = 270,
     CLASS = 271,
     ENDCLASS = 272,
     SYM = 273,
     LOCAL = 274,
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
     LABEL = 302,
     EMIT = 303,
     EOM = 304,
     IREG = 305,
     NREG = 306,
     SREG = 307,
     PREG = 308,
     IDENTIFIER = 309,
     STRINGC = 310,
     INTC = 311,
     FLOATC = 312,
     REG = 313,
     MACRO = 314,
     PARROT_OP = 315,
     VAR = 316
   };
#endif
#define CALL 258
#define GOTO 259
#define ARG 260
#define PRINT 261
#define IF 262
#define UNLESS 263
#define NEW 264
#define END 265
#define SAVEALL 266
#define RESTOREALL 267
#define SUB 268
#define NAMESPACE 269
#define ENDNAMESPACE 270
#define CLASS 271
#define ENDCLASS 272
#define SYM 273
#define LOCAL 274
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
#define LABEL 302
#define EMIT 303
#define EOM 304
#define IREG 305
#define NREG 306
#define SREG 307
#define PREG 308
#define IDENTIFIER 309
#define STRINGC 310
#define INTC 311
#define FLOATC 312
#define REG 313
#define MACRO 314
#define PARROT_OP 315
#define VAR 316




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

int         yylex();


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

Instruction * iANY(char * name, char *fmt, SymReg **r, int emit);

/*
 * MK_I: build and emitb instruction by iANY
 *
 * fmt may contain:
 *   op %s, %s # comment
 * or just
 *   op
 *
 */
static Instruction * MK_I(char * fmt, SymReg ** r) {
    char opname[64];
    char *p, *q;
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
    return iANY(opname, fmt, r, 1);
}

/*
 * special instructions
 *
 * labels and such
 */


static void clear_state()
{
    nargs = 0;
    keyvec = 0;
    memset(regs, 0, sizeof(regs));
}

static Instruction * iLABEL(SymReg * r0) {
    Instruction *i = emitb(_mk_instruction("","%s:", R1(r0), 0));
    i->type = ITLABEL;
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
static Instruction * iINDEXFETCH(SymReg * r0, SymReg * r1, SymReg * r2) {
    if(r0->set == 'S' && r1->set == 'S' && r2->set == 'I') {
        SymReg * r3 = mk_const("1", 'I');
        return MK_I("substr %s, %s, %s, 1", R4(r0, r1, r2, r3));
    }
    keyvec |= KEY_BIT(2);
    return MK_I("set %s, %s[%s]", R3(r0,r1,r2));
}

/*
 * substr or Pkey = X
 */

static Instruction * iINDEXSET(SymReg * r0, SymReg * r1, SymReg * r2) {
    if(r0->set == 'S' && r1->set == 'I' && r2->set == 'S') {
        SymReg * r3 = mk_const("1", 'I');
        MK_I("substr %s, %s, %s, %s", R4(r0, r1,r3, r2));
    }
    else if (r0->set == 'P') {
        keyvec |= KEY_BIT(1);
	MK_I("set %s[%s], %s", R3(r0,r1,r2));
    }
    else {
        fataly(EX_SOFTWARE, "iINDEXSET", line,"unsupported indexed set op\n");
    }
    return 0;
}

/* return the index of a PMC class */
static int get_pmc_num(char *pmc_type)
{
    STRING * s = string_make(interpreter, pmc_type,
            (UINTVAL) strlen(pmc_type), NULL, 0, NULL);
    PMC * key = key_new_string(interpreter, s);
    return Parrot_base_classname_hash->vtable->get_integer_keyed(
            interpreter, Parrot_base_classname_hash, key);
}

/* only .PmcType */
SymReg * macro(char *name)
{
    SymReg * r;
    char buf[16];
    int type = get_pmc_num(name);
    sprintf(buf, "%d", type);
    r =  mk_const(str_dup(buf), 'I');
    return r;
}

static Instruction *
multi_keyed(char *name, SymReg ** regs, int nr, int emit)
{
    int i, keys, kv, n;
    char buf[16];
    static int p = 0;
    SymReg *preg[IMCC_MAX_REGS];    /* px,py,pz */
    SymReg *nreg[IMCC_MAX_REGS];
    Instruction * ins;

    /* count keys in keyvec */
    kv = keyvec;
    for (i = keys = 0; i < nr; i++, kv >>= 1)
        if (kv & 1)
            keys++;
    if (keys <= 1)
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
            if (regs[i]->set != 'P') {
                fataly(EX_SOFTWARE, "multi_keyed", line,"not an aggregate\n");
            }
            nargs = 3;
            /* don't emit LHS yet */
            if (i == 0) {
                keyvec = 1 << 1;
                nreg[0] = regs[i];
                nreg[1] = regs[i+1];
                nreg[2] = preg[n];
                /* set p_k px */
                ins = iANY(str_dup("set"), 0, nreg, 0);
            }
            else {
                keyvec = 1 << 2;
                nreg[0] = preg[n];
                nreg[1] = regs[i];
                nreg[2] = regs[i+1];
                /* set py|z p_k */
                iANY(str_dup("set"), 0, nreg, 1);
            }
            i++;
        }
        /* non keyed */
        else {
            nargs = 2;
            keyvec = 0;
            if (i == 0) {
                nreg[0] = regs[i];
                nreg[1] = preg[n];
                /* set n, px */
                ins = iANY(str_dup("set"), 0, nreg, 0);
            }
            else {
                nreg[0] = preg[n];
                nreg[1] = regs[i];
                /* set px, n */
                iANY(str_dup("set"), 0, nreg, 1);
            }
        }
    }
    /* make a new undef */
    iNEW(preg[0], str_dup("PerlUndef"), 1);
    /* emit the operand */
    nargs = 3;
    keyvec = 0;
    iANY(name, 0, preg, 1);
    /* emit the LHS op */
    emitb(ins);
    return ins;
}

Instruction * iANY(char * name, char *fmt, SymReg **regs, int emit) {
    char fullname[64];
    int i;
    int dirs = 0;
    int op;
    Instruction * ins;

#if 1
    ins = multi_keyed(name, regs, nargs, emit);
    if (ins)
        return ins;
#endif
    op_fullname(fullname, name, regs, nargs);
    op = interpreter->op_lib->op_code(fullname, 1);
    if (op >= 0) {
        op_info_t * info = &interpreter->op_info_table[op];
	char format[128];
	int len;

        *format = '\0';
        /* info->arg_count is offset by one, first is opcode
         * build instruction format
         * set LV_in / out flags */
        for (i = 0; i < info->arg_count-1; i++) {
            switch (info->dirs[i+1]) {
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
        memset(regs + nargs, 0, sizeof(*regs) * (IMCC_MAX_REGS - nargs));
#if 1
        debug(1,"%s %s\t%s\n", name, format, fullname);
#endif
        /* make the instruction */

        ins = _mk_instruction(name, format, regs, dirs);
        if (emit)
             emitb(ins);
        ins->keys |= keyvec;
        /* fill iin oplib's info */
        ins->opnum = op;
        ins->opsize = info->arg_count;
        /* set up branch flags */
        if (info->jump) {
            if (!strcmp(name, "bsr") || !strcmp(name, "ret")) {
                /* ignore subcalls and ret
                 * because they saveall
                 */
            }
            else {
                /* XXX: assume the jump is relative and to the last arg.
                 * usually true.
                 */
                ins->type = ITBRANCH | (1 << (nargs-1));
                if (!strcmp(name, "branch"))
                    ins->type |= IF_goto;
            }
        }
        else if (!strcmp(name, "set") && nargs == 2) {
            /* set Px, Py: both PMCs have the same address */
            if (regs[0]->set == 'P' && regs[1]->set == 'P')
                ins->type |= ITALIAS;
        }
        else if (!strcmp(name, "set_addr")) {
            /* XXX probably a CATCH block */
            ins->type = ITADDR | IF_r1_branch | ITBRANCH;
        }
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
#line 362 "imcc.y"
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
/* Line 193 of /usr/share/bison/yacc.c.  */
#line 563 "imcparser.c"
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
#line 584 "imcparser.c"

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
#define YYLAST   251

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  77
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  45
/* YYNRULES -- Number of rules. */
#define YYNRULES  132
/* YYNRULES -- Number of states. */
#define YYNSTATES  223

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   316

#define YYTRANSLATE(X) \
  ((unsigned)(X) <= YYMAXUTOK ? yytranslate[X] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      62,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    64,     2,     2,     2,    70,    72,     2,
       2,     2,    68,    67,     2,    65,    71,    69,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    76,
       2,    63,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    74,     2,    75,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,    73,     2,    66,     2,     2,     2,
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
      55,    56,    57,    58,    59,    60,    61
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     4,     7,     9,    12,    16,    17,    21,
      22,    24,    25,    30,    34,    36,    37,    42,    44,    47,
      48,    51,    52,    54,    57,    59,    61,    65,    67,    69,
      71,    74,    77,    78,    83,    84,    89,    92,    95,    98,
     101,   104,   107,   110,   113,   116,   118,   120,   122,   125,
     126,   128,   130,   132,   134,   136,   140,   145,   150,   155,
     161,   167,   173,   179,   185,   191,   197,   203,   209,   215,
     221,   227,   233,   239,   245,   251,   258,   265,   270,   275,
     283,   288,   293,   298,   303,   304,   310,   315,   323,   328,
     330,   337,   342,   347,   352,   357,   359,   361,   363,   365,
     367,   369,   371,   373,   375,   377,   378,   380,   384,   386,
     388,   393,   395,   397,   399,   401,   403,   404,   407,   409,
     413,   415,   417,   419,   421,   423,   425,   427,   429,   431,
     433,   435,   437
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const yysigned_char yyrhs[] =
{
      78,     0,    -1,    -1,    79,    90,    -1,    81,    -1,    80,
      81,    -1,    93,    82,    62,    -1,    -1,    83,    60,    84,
      -1,    -1,   109,    -1,    -1,    48,    86,    80,    49,    -1,
      88,    90,    46,    -1,    85,    -1,    -1,    13,    89,    54,
      62,    -1,    91,    -1,    90,    91,    -1,    -1,    92,    96,
      -1,    -1,    94,    -1,    94,    95,    -1,    95,    -1,    47,
      -1,    93,    97,    62,    -1,    87,    -1,   102,    -1,   105,
      -1,    14,    54,    -1,    15,    54,    -1,    -1,    19,    98,
     100,    54,    -1,    -1,    20,    99,   100,    54,    -1,    20,
     119,    -1,    39,   113,    -1,     5,   113,    -1,    40,   113,
      -1,     3,    54,    -1,     4,    54,    -1,    21,   113,    -1,
      22,   113,    -1,     6,   113,    -1,    11,    -1,    12,    -1,
      10,    -1,    60,   109,    -1,    -1,    25,    -1,    26,    -1,
      27,    -1,   101,    -1,    54,    -1,   107,    63,   113,    -1,
     107,    63,    64,   113,    -1,   107,    63,    65,   113,    -1,
     107,    63,    66,   113,    -1,   107,    63,   113,    67,   113,
      -1,   107,    63,   113,    65,   113,    -1,   107,    63,   113,
      68,   113,    -1,   107,    63,   113,    41,   113,    -1,   107,
      63,   113,    69,   113,    -1,   107,    63,   113,    70,   113,
      -1,   107,    63,   113,    71,   113,    -1,   107,    63,   113,
      23,   113,    -1,   107,    63,   113,    24,   113,    -1,   107,
      63,   113,    42,   113,    -1,   107,    63,   113,    43,   113,
      -1,   107,    63,   113,    44,   113,    -1,   107,    63,   113,
      29,   113,    -1,   107,    63,   113,    72,   113,    -1,   107,
      63,   113,    73,   113,    -1,   107,    63,   113,    66,   113,
      -1,   107,    63,   113,    74,   114,    75,    -1,   113,    74,
     114,    75,    63,   113,    -1,   107,    63,     9,   101,    -1,
     107,    63,    28,   113,    -1,   107,    63,    28,   113,    74,
     114,    75,    -1,   107,    63,    38,   113,    -1,   107,    63,
      37,    54,    -1,   107,    63,    36,   121,    -1,    36,   121,
      63,   113,    -1,    -1,     9,   103,   107,    45,   104,    -1,
      28,   107,    45,   113,    -1,    28,   107,    45,   113,    74,
     114,    75,    -1,    38,   107,    45,   113,    -1,    59,    -1,
       7,   113,   106,   113,     4,    54,    -1,     7,   113,     4,
      54,    -1,     8,   113,     4,    54,    -1,     7,   113,    45,
      54,    -1,     8,   113,    45,    54,    -1,    30,    -1,    31,
      -1,    32,    -1,    33,    -1,    34,    -1,    35,    -1,    61,
      -1,   119,    -1,    61,    -1,   119,    -1,    -1,   110,    -1,
     110,    45,   111,    -1,   111,    -1,   112,    -1,   108,    74,
     114,    75,    -1,    54,    -1,   113,    -1,    59,    -1,    61,
      -1,   118,    -1,    -1,   115,   116,    -1,   117,    -1,   116,
      76,   117,    -1,   113,    -1,   119,    -1,   120,    -1,    50,
      -1,    51,    -1,    52,    -1,    53,    -1,    58,    -1,    56,
      -1,    57,    -1,    55,    -1,    52,    -1,    55,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,   397,   397,   397,   405,   406,   409,   411,   411,   413,
     416,   421,   420,   428,   435,   438,   438,   445,   446,   449,
     449,   453,   454,   457,   458,   461,   464,   466,   468,   470,
     471,   472,   473,   473,   474,   474,   476,   477,   478,   479,
     480,   482,   484,   485,   486,   487,   488,   489,   490,   491,
     494,   496,   497,   498,   501,   505,   507,   508,   509,   510,
     511,   512,   513,   514,   515,   516,   517,   518,   519,   520,
     521,   522,   523,   524,   525,   526,   527,   528,   529,   530,
     532,   534,   536,   537,   538,   538,   540,   541,   543,   546,
     549,   552,   554,   556,   558,   563,   565,   566,   567,   568,
     569,   573,   574,   576,   577,   580,   581,   584,   585,   588,
     589,   593,   595,   596,   599,   600,   603,   603,   607,   608,
     611,   614,   615,   618,   619,   620,   621,   622,   625,   626,
     627,   630,   631
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "CALL", "GOTO", "ARG", "PRINT", "IF", 
  "UNLESS", "NEW", "END", "SAVEALL", "RESTOREALL", "SUB", "NAMESPACE", 
  "ENDNAMESPACE", "CLASS", "ENDCLASS", "SYM", "LOCAL", "PARAM", "INC", 
  "DEC", "SHIFT_LEFT", "SHIFT_RIGHT", "INTV", "FLOATV", "STRINGV", 
  "DEFINED", "LOG_XOR", "RELOP_EQ", "RELOP_NE", "RELOP_GT", "RELOP_GTE", 
  "RELOP_LT", "RELOP_LTE", "GLOBAL", "ADDR", "CLONE", "RESULT", "RETURN", 
  "POW", "SHIFT_RIGHT_U", "LOG_AND", "LOG_OR", "COMMA", "ESUB", "LABEL", 
  "EMIT", "EOM", "IREG", "NREG", "SREG", "PREG", "IDENTIFIER", "STRINGC", 
  "INTC", "FLOATC", "REG", "MACRO", "PARROT_OP", "VAR", "'\\n'", "'='", 
  "'!'", "'-'", "'~'", "'+'", "'*'", "'/'", "'%'", "'.'", "'&'", "'|'", 
  "'['", "']'", "';'", "$accept", "program", "@1", "pasmcode", "pasmline", 
  "pasm_inst", "@2", "pasm_args", "emit", "@3", "sub", "sub_start", "@4", 
  "statements", "statement", "@5", "labels", "_labels", "label", 
  "instruction", "labeled_inst", "@6", "@7", "type", "classname", 
  "assignment", "@8", "newtype", "if_statement", "relop", "target", "lhs", 
  "vars", "_vars", "_var_or_i", "var_or_i", "var", "keylist", "@9", 
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
     315,   316,    10,    61,    33,    45,   126,    43,    42,    47,
      37,    46,    38,   124,    91,    93,    59
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    77,    79,    78,    80,    80,    81,    83,    82,    82,
      84,    86,    85,    87,    87,    89,    88,    90,    90,    92,
      91,    93,    93,    94,    94,    95,    96,    96,    97,    97,
      97,    97,    98,    97,    99,    97,    97,    97,    97,    97,
      97,    97,    97,    97,    97,    97,    97,    97,    97,    97,
     100,   100,   100,   100,   101,   102,   102,   102,   102,   102,
     102,   102,   102,   102,   102,   102,   102,   102,   102,   102,
     102,   102,   102,   102,   102,   102,   102,   102,   102,   102,
     102,   102,   102,   102,   103,   102,   102,   102,   102,   104,
     105,   105,   105,   105,   105,   106,   106,   106,   106,   106,
     106,   107,   107,   108,   108,   109,   109,   110,   110,   111,
     111,   112,   112,   112,   113,   113,   115,   114,   116,   116,
     117,   118,   118,   119,   119,   119,   119,   119,   120,   120,
     120,   121,   121
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     0,     2,     1,     2,     3,     0,     3,     0,
       1,     0,     4,     3,     1,     0,     4,     1,     2,     0,
       2,     0,     1,     2,     1,     1,     3,     1,     1,     1,
       2,     2,     0,     4,     0,     4,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     1,     1,     1,     2,     0,
       1,     1,     1,     1,     1,     3,     4,     4,     4,     5,
       5,     5,     5,     5,     5,     5,     5,     5,     5,     5,
       5,     5,     5,     5,     5,     6,     6,     4,     4,     7,
       4,     4,     4,     4,     0,     5,     4,     7,     4,     1,
       6,     4,     4,     4,     4,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     0,     1,     3,     1,     1,
       4,     1,     1,     1,     1,     1,     0,     2,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       2,     0,    19,     1,    19,    17,    21,    18,    15,    25,
      11,    14,    27,    19,    49,    22,    24,    20,     0,    21,
      19,     0,     0,     0,     0,     0,     0,    84,    47,    45,
      46,     0,     0,    32,    34,     0,     0,     0,     0,     0,
       0,     0,   123,   124,   125,   126,   130,   128,   129,   127,
     105,   101,     0,    28,    29,     0,     0,   115,   102,   122,
      23,     0,    21,     4,     7,    13,    40,    41,   114,    38,
     121,    44,     0,     0,     0,    30,    31,     0,     0,    36,
      42,    43,   101,     0,   102,   131,   132,     0,     0,    37,
      39,   111,   113,   114,     0,    48,   106,   108,   109,   112,
     121,    26,     0,   116,    16,    12,     5,     0,     0,     0,
      95,    96,    97,    98,    99,   100,     0,     0,     0,     0,
       0,    50,    51,    52,    54,     0,    53,     0,     0,     0,
       0,   116,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    55,     0,     0,     6,   105,    91,    93,     0,    92,
      94,     0,    33,    35,    86,    83,    88,     0,   107,    77,
      78,    82,    81,    80,    56,    57,    58,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,   116,     0,   120,   117,   118,     8,    10,
       0,    89,    85,   116,   110,   116,    66,    67,    71,    62,
      68,    69,    70,    60,    74,    59,    61,    63,    64,    65,
      72,    73,     0,     0,     0,    90,     0,     0,    75,    76,
     119,    87,    79
};

/* YYDEFGOTO[NTERM-NUM]. */
static const short yydefgoto[] =
{
      -1,     1,     2,    62,    63,   107,   108,   188,    11,    19,
      12,    13,    18,     4,     5,     6,    64,    15,    16,    17,
      52,    77,    78,   125,   126,    53,    74,   192,    54,   117,
      55,    94,    95,    96,    97,    98,    99,   142,   143,   186,
     187,    57,    70,    59,    87
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -131
static const short yypact[] =
{
    -131,    14,  -131,  -131,    18,  -131,    -6,  -131,  -131,  -131,
    -131,  -131,  -131,  -131,   166,   -28,  -131,  -131,   -31,   -28,
     -22,   -29,   -20,   140,   140,   140,   140,  -131,  -131,  -131,
    -131,   -19,   -15,  -131,   -21,   140,   140,   190,    -7,   190,
     140,   140,  -131,  -131,  -131,  -131,  -131,  -131,  -131,  -131,
     178,   -24,   -16,  -131,  -131,   -12,   -13,  -131,    -8,  -131,
    -131,    -4,   -41,  -131,    -3,  -131,  -131,  -131,  -131,  -131,
    -131,  -131,   180,    -2,   190,  -131,  -131,   -10,   -10,  -131,
    -131,  -131,  -131,     7,  -131,  -131,  -131,    -9,    15,  -131,
    -131,  -131,  -131,     4,     5,  -131,    17,  -131,  -131,  -131,
       8,  -131,    19,  -131,  -131,  -131,  -131,     2,    21,    13,
    -131,  -131,  -131,  -131,  -131,  -131,    32,   140,    33,    35,
      23,  -131,  -131,  -131,  -131,    38,  -131,    39,   140,   140,
     140,  -131,   178,    40,   140,    -7,    41,   140,   140,   140,
     140,    67,    22,   140,  -131,   178,  -131,  -131,    94,  -131,
    -131,    42,  -131,  -131,    25,  -131,  -131,    27,  -131,  -131,
      26,  -131,  -131,  -131,  -131,  -131,  -131,   140,   140,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   140,   140,
     140,   140,   140,  -131,    43,  -131,    28,  -131,  -131,  -131,
      51,  -131,  -131,  -131,  -131,  -131,  -131,  -131,  -131,  -131,
    -131,  -131,  -131,  -131,  -131,  -131,  -131,  -131,  -131,  -131,
    -131,  -131,    37,   140,   140,  -131,    44,    46,  -131,  -131,
    -131,  -131,  -131
};

/* YYPGOTO[NTERM-NUM].  */
static const short yypgoto[] =
{
    -131,  -131,  -131,  -131,    45,  -131,  -131,  -131,  -131,  -131,
    -131,  -131,  -131,   100,     0,  -131,   111,  -131,   103,  -131,
    -131,  -131,  -131,    49,   -11,  -131,  -131,  -131,  -131,  -131,
     -34,  -131,   -17,  -131,    10,  -131,   -14,  -130,  -131,  -131,
     -84,  -131,    -1,  -131,    11
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, parse error.  */
#define YYTABLE_NINF -122
static const short yytable[] =
{
      56,   157,   118,    83,     7,    88,     9,     8,   105,    69,
      71,    72,    73,    58,     3,   121,   122,   123,    -3,     9,
       7,    80,    81,    61,    65,    66,    89,    90,   133,    42,
      43,    44,    45,    79,    67,    75,    84,    49,    84,    76,
     120,     9,    10,   119,   124,    85,   101,   134,    86,   100,
    -114,   102,   128,   212,   129,   135,   136,   137,   104,    -9,
     130,   103,   132,   216,   144,   217,  -121,   146,   151,    42,
      43,    44,    45,    84,    46,    47,    48,    49,  -103,   131,
      68,   145,  -104,   138,   139,   140,   147,   149,   141,   150,
     167,   168,   152,   153,   124,   162,   169,   184,   190,   193,
     195,   191,   194,   148,   214,   215,   213,   106,   170,   171,
     172,   173,   218,    20,   154,   155,   156,    14,    60,   221,
     160,   222,   159,   163,   164,   165,   166,   127,   189,   185,
     220,   100,   174,   175,   176,   177,   178,   179,   180,   181,
     182,   183,   158,     0,   100,     0,   161,     0,     0,     0,
       0,     0,     0,   196,   197,   198,   199,   200,   201,   202,
     203,   204,   205,   206,   207,   208,   209,   210,   211,    21,
      22,    23,    24,    25,    26,    27,    28,    29,    30,     0,
      31,    32,     0,     0,   109,    33,    34,    35,    36,     0,
      42,    43,    44,    45,    37,    46,    47,    48,    49,   219,
     185,    68,    38,     0,    39,    40,    41,     0,     0,     0,
     110,   111,   112,   113,   114,   115,    42,    43,    44,    45,
       0,    46,    47,    48,    49,   116,    50,    51,    42,    43,
      44,    45,    91,    46,    47,    48,    49,    92,     0,    93,
      42,    43,    44,    45,     0,     0,     0,     0,    49,     0,
       0,    82
};

static const short yycheck[] =
{
      14,   131,     4,    37,     4,    39,    47,    13,    49,    23,
      24,    25,    26,    14,     0,    25,    26,    27,     0,    47,
      20,    35,    36,    54,    46,    54,    40,    41,     9,    50,
      51,    52,    53,    34,    54,    54,    37,    58,    39,    54,
      74,    47,    48,    45,    54,    52,    62,    28,    55,    50,
      74,    63,    45,   183,    63,    36,    37,    38,    62,    62,
      45,    74,    45,   193,    62,   195,    74,    54,    45,    50,
      51,    52,    53,    74,    55,    56,    57,    58,    74,    74,
      61,    60,    74,    64,    65,    66,    54,    54,   102,    54,
      23,    24,    54,    54,    54,    54,    29,    75,     4,    74,
      74,    59,    75,   117,    76,    54,    63,    62,    41,    42,
      43,    44,    75,    13,   128,   129,   130,     6,    15,    75,
     134,    75,   133,   137,   138,   139,   140,    78,   145,   143,
     214,   132,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,   132,    -1,   145,    -1,   135,    -1,    -1,    -1,
      -1,    -1,    -1,   167,   168,   169,   170,   171,   172,   173,
     174,   175,   176,   177,   178,   179,   180,   181,   182,     3,
       4,     5,     6,     7,     8,     9,    10,    11,    12,    -1,
      14,    15,    -1,    -1,     4,    19,    20,    21,    22,    -1,
      50,    51,    52,    53,    28,    55,    56,    57,    58,   213,
     214,    61,    36,    -1,    38,    39,    40,    -1,    -1,    -1,
      30,    31,    32,    33,    34,    35,    50,    51,    52,    53,
      -1,    55,    56,    57,    58,    45,    60,    61,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    -1,    61,
      50,    51,    52,    53,    -1,    -1,    -1,    -1,    58,    -1,
      -1,    61
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    78,    79,     0,    90,    91,    92,    91,    13,    47,
      48,    85,    87,    88,    93,    94,    95,    96,    89,    86,
      90,     3,     4,     5,     6,     7,     8,     9,    10,    11,
      12,    14,    15,    19,    20,    21,    22,    28,    36,    38,
      39,    40,    50,    51,    52,    53,    55,    56,    57,    58,
      60,    61,    97,   102,   105,   107,   113,   118,   119,   120,
      95,    54,    80,    81,    93,    46,    54,    54,    61,   113,
     119,   113,   113,   113,   103,    54,    54,    98,    99,   119,
     113,   113,    61,   107,   119,    52,    55,   121,   107,   113,
     113,    54,    59,    61,   108,   109,   110,   111,   112,   113,
     119,    62,    63,    74,    62,    49,    81,    82,    83,     4,
      30,    31,    32,    33,    34,    35,    45,   106,     4,    45,
     107,    25,    26,    27,    54,   100,   101,   100,    45,    63,
      45,    74,    45,     9,    28,    36,    37,    38,    64,    65,
      66,   113,   114,   115,    62,    60,    54,    54,   113,    54,
      54,    45,    54,    54,   113,   113,   113,   114,   111,   101,
     113,   121,    54,   113,   113,   113,   113,    23,    24,    29,
      41,    42,    43,    44,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,   113,   116,   117,    84,   109,
       4,    59,   104,    74,    75,    74,   113,   113,   113,   113,
     113,   113,   113,   113,   113,   113,   113,   113,   113,   113,
     113,   113,   114,    63,    76,    54,   114,   114,    75,   113,
     117,    75,    75
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

#define YYLEX	yylex ()

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


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of parse errors so far.  */
int yynerrs;


int
yyparse (YYPARSE_PARAM_ARG)
     YYPARSE_PARAM_DECL
{
  
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
#line 397 "imcc.y"
    { open_comp_unit(); }
    break;

  case 3:
#line 398 "imcc.y"
    { yyval.i = 0;
	  allocate();
	  emit_flush();
        }
    break;

  case 6:
#line 409 "imcc.y"
    { yyval.i = 0; }
    break;

  case 7:
#line 411 "imcc.y"
    {clear_state();}
    break;

  case 8:
#line 412 "imcc.y"
    { yyval.i = iANY(yyvsp[-1].s,0,regs,1); free(yyvsp[-1].s); }
    break;

  case 9:
#line 413 "imcc.y"
    { yyval.i = 0;}
    break;

  case 11:
#line 421 "imcc.y"
    { open_comp_unit(); }
    break;

  case 12:
#line 423 "imcc.y"
    { emit_flush(); yyval.i=0;}
    break;

  case 13:
#line 430 "imcc.y"
    {
          yyval.i = 0;
	  allocate();
	  emit_flush();
        }
    break;

  case 14:
#line 435 "imcc.y"
    { yyval.i=0; }
    break;

  case 15:
#line 438 "imcc.y"
    { open_comp_unit(); }
    break;

  case 16:
#line 440 "imcc.y"
    { yyval.i = 0;
          iSUBROUTINE(mk_address(yyvsp[-1].s, U_add_uniq_sub));
        }
    break;

  case 19:
#line 449 "imcc.y"
    { clear_state(); }
    break;

  case 20:
#line 450 "imcc.y"
    { yyval.i = yyvsp[0].i; }
    break;

  case 21:
#line 453 "imcc.y"
    { yyval.i = NULL; }
    break;

  case 25:
#line 461 "imcc.y"
    { yyval.i = iLABEL(mk_address(yyvsp[0].s, U_add_uniq_label)); }
    break;

  case 26:
#line 465 "imcc.y"
    { yyval.i = yyvsp[-1].i; }
    break;

  case 30:
#line 471 "imcc.y"
    { push_namespace(yyvsp[0].s); }
    break;

  case 31:
#line 472 "imcc.y"
    { pop_namespace(yyvsp[0].s); }
    break;

  case 32:
#line 473 "imcc.y"
    { is_def=1; }
    break;

  case 33:
#line 473 "imcc.y"
    { mk_ident(yyvsp[0].s, yyvsp[-1].t);is_def=0; }
    break;

  case 34:
#line 474 "imcc.y"
    { is_def=1; }
    break;

  case 35:
#line 474 "imcc.y"
    { yyval.i = MK_I("restore",
		                            R1(mk_ident(yyvsp[0].s, yyvsp[-1].t)));is_def=0; }
    break;

  case 36:
#line 476 "imcc.y"
    { yyval.i = MK_I("restore", R1(yyvsp[0].sr)); }
    break;

  case 37:
#line 477 "imcc.y"
    { yyval.i = MK_I("restore", R1(yyvsp[0].sr)); }
    break;

  case 38:
#line 478 "imcc.y"
    { yyval.i = MK_I("save", R1(yyvsp[0].sr)); }
    break;

  case 39:
#line 479 "imcc.y"
    { yyval.i = MK_I("save", R1(yyvsp[0].sr)); }
    break;

  case 40:
#line 480 "imcc.y"
    { yyval.i = MK_I("bsr",
                                              R1(mk_address(yyvsp[0].s, U_add_once)));}
    break;

  case 41:
#line 482 "imcc.y"
    { yyval.i = MK_I("branch",
                                              R1(mk_address(yyvsp[0].s, U_add_once)));}
    break;

  case 42:
#line 484 "imcc.y"
    { yyval.i = MK_I("inc",R1(yyvsp[0].sr)); }
    break;

  case 43:
#line 485 "imcc.y"
    { yyval.i = MK_I("dec",R1(yyvsp[0].sr)); }
    break;

  case 44:
#line 486 "imcc.y"
    { yyval.i = MK_I("print",R1(yyvsp[0].sr)); }
    break;

  case 45:
#line 487 "imcc.y"
    { yyval.i = MK_I("saveall" ,R0()); }
    break;

  case 46:
#line 488 "imcc.y"
    { yyval.i = MK_I("restoreall" ,R0()); }
    break;

  case 47:
#line 489 "imcc.y"
    { yyval.i = MK_I("end" ,R0()); }
    break;

  case 48:
#line 490 "imcc.y"
    { yyval.i = iANY(yyvsp[-1].s,0,regs, 1); free(yyvsp[-1].s); }
    break;

  case 49:
#line 491 "imcc.y"
    { yyval.i = 0;}
    break;

  case 50:
#line 495 "imcc.y"
    { yyval.t = 'I'; }
    break;

  case 51:
#line 496 "imcc.y"
    { yyval.t = 'N'; }
    break;

  case 52:
#line 497 "imcc.y"
    { yyval.t = 'S'; }
    break;

  case 53:
#line 498 "imcc.y"
    { yyval.t = 'P'; free(yyvsp[0].s); }
    break;

  case 55:
#line 506 "imcc.y"
    { yyval.i = MK_I("set", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 56:
#line 507 "imcc.y"
    { yyval.i = MK_I("not", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 57:
#line 508 "imcc.y"
    { yyval.i = MK_I("neg", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 58:
#line 509 "imcc.y"
    { yyval.i = MK_I("bnot", R2(yyvsp[-3].sr, yyvsp[0].sr));}
    break;

  case 59:
#line 510 "imcc.y"
    { yyval.i = MK_I("add", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 60:
#line 511 "imcc.y"
    { yyval.i = MK_I("sub", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 61:
#line 512 "imcc.y"
    { yyval.i = MK_I("mul", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 62:
#line 513 "imcc.y"
    { yyval.i = MK_I("pow", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 63:
#line 514 "imcc.y"
    { yyval.i = MK_I("div", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 64:
#line 515 "imcc.y"
    { yyval.i = MK_I("mod", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 65:
#line 516 "imcc.y"
    { yyval.i = MK_I("concat", R3(yyvsp[-4].sr,yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 66:
#line 517 "imcc.y"
    { yyval.i = MK_I("shl", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 67:
#line 518 "imcc.y"
    { yyval.i = MK_I("shr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 68:
#line 519 "imcc.y"
    { yyval.i = MK_I("lsr", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 69:
#line 520 "imcc.y"
    { yyval.i = MK_I("and", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 70:
#line 521 "imcc.y"
    { yyval.i = MK_I("or", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 71:
#line 522 "imcc.y"
    { yyval.i = MK_I("xor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 72:
#line 523 "imcc.y"
    { yyval.i = MK_I("band", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 73:
#line 524 "imcc.y"
    { yyval.i = MK_I("bor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 74:
#line 525 "imcc.y"
    { yyval.i = MK_I("bxor", R3(yyvsp[-4].sr, yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 75:
#line 526 "imcc.y"
    { yyval.i = iINDEXFETCH(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr); }
    break;

  case 76:
#line 527 "imcc.y"
    { yyval.i = iINDEXSET(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[0].sr); }
    break;

  case 77:
#line 528 "imcc.y"
    { yyval.i = iNEW(yyvsp[-3].sr, yyvsp[0].s, 1); }
    break;

  case 78:
#line 529 "imcc.y"
    { yyval.i = MK_I("defined",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 79:
#line 530 "imcc.y"
    { keyvec=KEY_BIT(2);
                                     yyval.i = MK_I("defined", R3(yyvsp[-6].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 80:
#line 532 "imcc.y"
    { yyval.i = MK_I("clone",R2(yyvsp[-3].sr, yyvsp[0].sr));
    }
    break;

  case 81:
#line 534 "imcc.y"
    { yyval.i = MK_I("set_addr",
                                          R2(yyvsp[-3].sr, mk_address(yyvsp[0].s,U_add_once))); }
    break;

  case 82:
#line 536 "imcc.y"
    { yyval.i = MK_I("find_global",R2(yyvsp[-3].sr,yyvsp[0].sr)); }
    break;

  case 83:
#line 537 "imcc.y"
    { yyval.i = MK_I("store_global",R2(yyvsp[-2].sr,yyvsp[0].sr)); }
    break;

  case 84:
#line 538 "imcc.y"
    { expect_pasm = 1; }
    break;

  case 85:
#line 539 "imcc.y"
    { yyval.i = iNEW(yyvsp[-2].sr, yyvsp[0].s, 1); }
    break;

  case 86:
#line 540 "imcc.y"
    { yyval.i = MK_I("defined", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 87:
#line 541 "imcc.y"
    { keyvec=KEY_BIT(2);
                                       yyval.i = MK_I("defined", R3(yyvsp[-5].sr, yyvsp[-3].sr, yyvsp[-1].sr));}
    break;

  case 88:
#line 543 "imcc.y"
    { yyval.i = MK_I("clone", R2(yyvsp[-2].sr, yyvsp[0].sr)); }
    break;

  case 90:
#line 550 "imcc.y"
    { yyval.i=MK_I(yyvsp[-3].s,R3(yyvsp[-4].sr,yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s,U_add_once))); }
    break;

  case 91:
#line 552 "imcc.y"
    {yyval.i= MK_I("if", R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); }
    break;

  case 92:
#line 554 "imcc.y"
    {yyval.i= MK_I("unless",R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); }
    break;

  case 93:
#line 556 "imcc.y"
    { yyval.i= MK_I("if", R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); }
    break;

  case 94:
#line 558 "imcc.y"
    { yyval.i= MK_I("unless", R2(yyvsp[-2].sr,
                                          mk_address(yyvsp[0].s, U_add_once))); }
    break;

  case 95:
#line 564 "imcc.y"
    { yyval.s = "eq"; }
    break;

  case 96:
#line 565 "imcc.y"
    { yyval.s = "ne"; }
    break;

  case 97:
#line 566 "imcc.y"
    { yyval.s = "gt"; }
    break;

  case 98:
#line 567 "imcc.y"
    { yyval.s = "ge"; }
    break;

  case 99:
#line 568 "imcc.y"
    { yyval.s = "lt"; }
    break;

  case 100:
#line 569 "imcc.y"
    { yyval.s = "le"; }
    break;

  case 105:
#line 580 "imcc.y"
    { yyval.sr = NULL; }
    break;

  case 106:
#line 581 "imcc.y"
    { yyval.sr = yyvsp[0].sr; }
    break;

  case 107:
#line 584 "imcc.y"
    { yyval.sr = regs[0]; }
    break;

  case 109:
#line 588 "imcc.y"
    { regs[nargs++] = yyvsp[0].sr; }
    break;

  case 110:
#line 589 "imcc.y"
    { regs[nargs++] = yyvsp[-3].sr;
                                          keyvec |= KEY_BIT(nargs);
                                          regs[nargs++] = yyvsp[-1].sr; yyval.sr = yyvsp[-3].sr; }
    break;

  case 111:
#line 594 "imcc.y"
    { yyval.sr = mk_address(yyvsp[0].s, U_add_once); }
    break;

  case 113:
#line 596 "imcc.y"
    { yyval.sr = macro(yyvsp[0].s); free(yyvsp[0].s); }
    break;

  case 116:
#line 603 "imcc.y"
    { nkeys=0; }
    break;

  case 117:
#line 604 "imcc.y"
    { yyval.sr = link_keys(nkeys, keys); }
    break;

  case 118:
#line 607 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; }
    break;

  case 119:
#line 608 "imcc.y"
    { keys[nkeys++] = yyvsp[0].sr; yyval.sr =  keys[0]; }
    break;

  case 123:
#line 618 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'I'); }
    break;

  case 124:
#line 619 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'N'); }
    break;

  case 125:
#line 620 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 126:
#line 621 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'P'); }
    break;

  case 127:
#line 622 "imcc.y"
    { yyval.sr = mk_pasm_reg(yyvsp[0].s); }
    break;

  case 128:
#line 625 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'I'); }
    break;

  case 129:
#line 626 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'N'); }
    break;

  case 130:
#line 627 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;

  case 131:
#line 630 "imcc.y"
    { yyval.sr = mk_symreg(yyvsp[0].s, 'S'); }
    break;

  case 132:
#line 631 "imcc.y"
    { yyval.sr = mk_const(yyvsp[0].s, 'S'); }
    break;


    }

/* Line 1016 of /usr/share/bison/yacc.c.  */
#line 2189 "imcparser.c"

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


#line 633 "imcc.y"



int yyerror(char * s)
{
    fprintf(stderr, "last token = [%s]\n", yylval.s);
    fprintf(stderr, "(error) line %ld: %s\n", line, s );
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

