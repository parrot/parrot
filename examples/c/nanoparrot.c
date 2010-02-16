/*
 * Copyright (C) 2001-2008, Parrot Foundation.
 * $Id$

=head1 NAME

examples/c/nanoparrot.c

=head1 DESCRIPTION

demonstrates how the interpreter interprets bytecode
its vastly simplified but the very basics are the same

 - compile with:
   -DTRACE ...    turn on opcode tracing (FUNC_CORE, SWITCH_CORE only)
   -DFUNC_CORE    run function base opcodes
   -DF            same
   -DSWITCH_CORE  run switched opcode core
   -DS            same
                  else run CGOTO core

The CGOTO run core works only for compilers like gcc that allow
labels as values.

=head1 SYNOPSIS

   cc -o nanoparrot -Wall nanoparrot.c -O3 && time ./nanoparrot mops

=head2 Functions

=over 4

=cut

*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef int INTVAL;
typedef int opcode_t;
typedef double FLOATVAL;
typedef void PMC;
typedef void STRING;

#define NUM_REGISTERS 32

struct Reg {
    INTVAL int_reg;
    FLOATVAL num_reg;
    STRING *string_reg;
    PMC *pmc_reg;
};

#define REG_INT(interp, x) (interp)->bp[(x)].int_reg

#if defined(PREDEREF_CORE)
#  define IREG(x)   (_reg_base + pc[(x)])
#  define ICONST(x) *(INTVAL*)pc[(x)]
#  define SCONST(x) *(STRING**)pc[(x)]
#else
#  define IREG(x)   REG_INT(interp, pc[(x)])
#  define ICONST(x) pc[(x)]
#  define SCONST(x) interp->code->const_table[pc[(x)]]
#endif

struct pf {
    opcode_t *byte_code;
    char **const_table;
};

typedef struct Interp {
    struct Reg *bp;
    struct pf *code;
    opcode_t *(**op_func)(opcode_t *, struct Interp*);
    const char **op_info;
    int flags;
} Interp;

/*
 * list of all opcodes
 */

#define OPCODES OP(end),      OP(print_sc), OP(print_i),  \
                OP(set_i_ic), OP(if_i_ic),  OP(sub_i_i_i), \
                OP(MAX)

/*
 * some macros to get 3 different kinds of run loops
 * you might skip this ugliness and continue
 * at dispatch loop ~90 lines below
 *
 * or for the curious: look at the preprocessor output
 */

#define OP(x) OP_##x
typedef enum { OPCODES } opcodes;
#undef OP

#ifdef F
#  define FUNC_CORE
#endif
#ifdef S
#  define SWITCH_CORE
#endif

#if defined(FUNC_CORE)
#  ifdef TRACE
#    define ENDRUN \
static void \
run(Interp *interp, opcode_t *pc) \
{ \
    while (pc) { \
        printf("PC %2d %s\n", pc - interp->code->byte_code, \
                interp->op_info[*pc]); \
        pc = interp->op_func[*pc](pc, interp); \
    } \
}
#  else
#    define ENDRUN \
static void \
run(Interp *interp, opcode_t *pc) \
{ \
    while (pc) { \
        pc = interp->op_func[*pc](pc, interp); \
    } \
}
#  endif

#  define DISPATCH
#  define ENDDISPATCH
#  define CASE(function) \
static opcode_t * \
function(opcode_t *pc, Interp *interp) \
{ \

#  define NEXT return pc; }
#  define DONE            return 0; }

#else   /* !FUNC_CORE */

#  define ENDRUN  }

#  if defined(SWITCH_CORE)

/*

=item C<static void run(Interp *interp, opcode_t *pc)>

Execute a single opcode.

=cut

*/

static void
run(Interp *interp, opcode_t *pc)
{
#    ifdef TRACE
#      define DISPATCH  \
    for (;;) { \
        printf("PC %2d %s\n", pc - interp->code->byte_code, \
                interp->op_info[*pc]); \
        switch (*pc) {
#    else
#      define DISPATCH \
    for (;;) { \
        switch (*pc) {
#    endif

#    define CASE(x)         case OP_##x:
#    define NEXT            continue;
#    define DONE            return;
#    define ENDDISPATCH     default : printf("illegal instruction"); \
                                  exit(EXIT_FAILURE);                \
                        }}
#  else  /* CGOTO */

static void
run(Interp *interp, opcode_t *pc)
{
#    define OP(x)          &&lOP_##x
    static  void *labels[] = { OPCODES };
#    undef OP
#    define CASE(x)         lOP_##x:
#    define NEXT            goto *labels[*pc];
#    define DISPATCH        NEXT
#    define ENDDISPATCH
#    define DONE            return;

#  endif        /* SWITCH or CGOTO */
#endif  /* !FUNC_CORE */

/*
 * dispatch loop / opcode (function) bodies i.e. the .ops files
 */

    DISPATCH
        CASE(end)
            DONE
        CASE(print_sc)
            printf("%s", SCONST(1));
            pc += 2;
            NEXT
        CASE(print_i)
            printf("%d", IREG(1));
            pc += 2;
            NEXT
        CASE(set_i_ic)
            IREG(1) = ICONST(2);
            pc += 3;
            NEXT
        CASE(if_i_ic)
            if (IREG(1))
                pc += ICONST(2);
            else
                pc += 3;
            NEXT
        CASE(sub_i_i_i)
            IREG(1) = IREG(2) - IREG(3);
            pc += 4;
            NEXT
        CASE(MAX)
            printf("illegal opcode\n");
            exit(EXIT_FAILURE);
            NEXT
    ENDDISPATCH
ENDRUN

#ifdef FUNC_CORE
#  define DEF_OP(op) \
    interp->op_func[OP_##op] = (op); \
    interp->op_info[OP_##op] = #op
#else
#  define DEF_OP(op) \
    interp->op_info[OP_##op] = #op
#endif

/*

=item C<static void init(Interp *interp, opcode_t *prog)>

=cut

*/

static void
init(Interp *interp, opcode_t *prog)
{
    /*
     * create 1 register frame
     */
    interp->bp = calloc(NUM_REGISTERS, sizeof (struct Reg));
    /*
     * and some space for opcodes
     */
    interp->op_func = malloc(OP_MAX * sizeof (void*));
    interp->op_info = malloc(OP_MAX * sizeof (char*));
    /*
     * define opcode function and opcode info
     */
    DEF_OP(end);
    DEF_OP(print_sc);
    DEF_OP(print_i);
    DEF_OP(set_i_ic);
    DEF_OP(if_i_ic);
    DEF_OP(sub_i_i_i);
    DEF_OP(MAX);

    /*
     * the "packfile"
     */
    interp->code = malloc(sizeof (struct pf));
    interp->code->byte_code = prog;

    /*
     * create a simplified constant table
     */
#define N_CONSTS 4
    interp->code->const_table = malloc(N_CONSTS * sizeof (char*));
    interp->code->const_table[0] = "\n";
    interp->code->const_table[1] = "done\n";
    interp->code->const_table[2] = "error\n";
    interp->code->const_table[3] = "usage: ./nanoparrot mops\n";
}

/*

=item C<int main(int argc, char *argv[])>

Initialize a minimal Parrotesque interpreter and run some hard-coded bytecode.

=cut

*/

int
main(int argc, char *argv[])
{
    opcode_t *prog;

    /*
     * the mops main loop
     */
    opcode_t mops[] =
        { OP_set_i_ic, 4, 100000000,    /* set I4, n */
          OP_print_i, 4,        /* print I4 */
          OP_print_sc, 0,       /* print "\n" */
          OP_set_i_ic, 5, 1,    /* set I5, 1 */
          OP_sub_i_i_i, 4, 4, 5,        /* L1: sub I4, I4, I5 */
          OP_if_i_ic, 4, -4,    /* if I4, L1 */
          OP_print_sc, 1,       /* print "done\n" */
          OP_end                /* end */
        };
    opcode_t usage[] =
        {
          OP_set_i_ic, 0, 2,    /* set I0, 2 */
          OP_if_i_ic, 0, 6,     /* if I0, L1 */
          OP_print_sc, 2,       /* print "error\n" */
          OP_end,               /* end */
          OP_print_sc, 3,       /* L1: print "usage...\n" */
          OP_end                /* end */
        };
    Interp *interp = malloc(sizeof (Interp));

    prog = usage;
    if (argc > 1) {
        if (strcmp(argv[1], "mops") == 0)
            prog = mops;
    }
    init(interp, prog);
    run(interp, prog);
    return 0;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
