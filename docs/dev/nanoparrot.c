/*
 * nanoparrot.c
 *
 * - demonstrates how the interpreter interprets bytecode
 *   its vastly simplified but the very basics are the same
 *
 * - compile with:
 *   -DTRACE ...    turn on opcode tracing (FUNC_CORE, SWITCH_CORE only)
 *   -DFUNC_CORE    run function base opcodes
 *   -DF            same
 *   -DSWITCH_CORE  run switched opcode core
 *   -DS            same
 *                  else run CGOTO core
 *
 * The CGOTO run core works only for compilers like gcc that allow
 * labels as values.
 *
 * e.g.:
 * cc -o nanoparrot -Wall nanoparrot.c -O3 && time ./nanoparrot mops
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

#define REG_INT(x) interpreter->bp[x].int_reg

#if defined(PREDEREF_CORE)
#  define IREG(x)   (_reg_base + pc[x])
#  define ICONST(x) *(INTVAL*)pc[x]
#  define SCONST(x) *(STRING**)pc[x]
#else
#  define IREG(x)   REG_INT(pc[x])
#  define ICONST(x) pc[x]
#  define SCONST(x) interpreter->code->const_table[pc[x]]
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
 * you might skip this uglyness and continue
 * at dispatch loop ~90 lines below
 *
 * or for the curious: look at the preprocessor output
 */

#define OP(x) OP_ ## x
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
run(Interp *interpreter, opcode_t *pc) \
{ \
    while (pc) { \
	printf("PC %2d %s\n", pc - interpreter->code->byte_code, \
		interpreter->op_info[*pc]); \
	pc = interpreter->op_func[*pc](pc, interpreter); \
    } \
}
#  else
#    define ENDRUN \
static void \
run(Interp *interpreter, opcode_t *pc) \
{ \
    while (pc) { \
	pc = interpreter->op_func[*pc](pc, interpreter); \
    } \
}
#  endif

#  define DISPATCH
#  define ENDDISPATCH
#  define CASE(function) \
static opcode_t * \
function (opcode_t *pc, Interp *interpreter) {

#  define NEXT return pc; }
#  define DONE            return 0; }

#else   /* !FUNC_CORE */

#  define ENDRUN  }

#if defined(SWITCH_CORE)

static void
run(Interp *interpreter, opcode_t *pc)
{
#    ifdef TRACE
#       define DISPATCH  \
    for (;;) { \
	printf("PC %2d %s\n", pc - interpreter->code->byte_code, \
		interpreter->op_info[*pc]); \
        switch(*pc) {
#    else
#       define DISPATCH \
    for (;;) { \
        switch(*pc) {
#    endif

#    define CASE(x)         case OP_ ## x:
#    define NEXT            continue;
#    define DONE            return;
#    define ENDDISPATCH     default : printf("illegal instruction"); \
				  exit(1);                           \
			}}
# else  /* CGOTO */

static void
run(Interp *interpreter, opcode_t *pc)
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
            exit(1);
            NEXT
    ENDDISPATCH
ENDRUN

#ifdef FUNC_CORE
#  define DEF_OP(op) \
    interpreter->op_func[OP_ ## op] = op; \
    interpreter->op_info[OP_ ## op] = #op
#  else
#  define DEF_OP(op) \
    interpreter->op_info[OP_ ## op] = #op
#endif

static void
init(Interp *interpreter, opcode_t *prog)
{
    /*
     * create 1 register frame
     */
    interpreter->bp = calloc(NUM_REGISTERS, sizeof(struct Reg));
    /*
     * and some space for opcodes
     */
    interpreter->op_func = malloc(OP_MAX * sizeof(void*));
    interpreter->op_info = malloc(OP_MAX * sizeof(char*));
    /*
     * define opcode function and opcode info
     */
    DEF_OP(end);
    DEF_OP(print_sc);
    DEF_OP(print_i);
    DEF_OP(set_i_ic);
    DEF_OP(if_i_ic);
    DEF_OP(sub_i_i_i);

    /*
     * the "packfile"
     */
    interpreter->code = malloc(sizeof(struct pf));
    interpreter->code->byte_code = prog;

    /*
     * create a simplified constant table
     */
#define N_CONSTS 4
    interpreter->code->const_table = malloc(N_CONSTS * sizeof(char*));
    interpreter->code->const_table[0] = "\n";
    interpreter->code->const_table[1] = "done\n";
    interpreter->code->const_table[2] = "error\n";
    interpreter->code->const_table[3] = "usage: ./nanoparrot mops\n";
}

int
main(int argc, char *argv[]) {
    opcode_t *prog;

    /*
     * the mops main loop
     */
    opcode_t mops[] =
    	{ OP_set_i_ic, 4, 100000000, 	/* set I4, n */
	  OP_print_i, 4, 	/* print I4 */
	  OP_print_sc, 0, 	/* print "\n" */
          OP_set_i_ic, 5, 1, 	/* set I5, 1 */
	  OP_sub_i_i_i, 4, 4, 5,	/* L1: sub I4, I4, I5 */
	  OP_if_i_ic, 4, -4,	/* if I4, L1 */
	  OP_print_sc, 1, 	/* print "done\n" */
	  OP_end 		/* end */
	};
    opcode_t usage[] =
    	{
          OP_set_i_ic, 0, 2, 	/* set I0, 2 */
	  OP_if_i_ic, 0, 6,	/* if I0, L1 */
	  OP_print_sc, 2,	/* print "error\n" */
	  OP_end, 		/* end */
	  OP_print_sc, 3,	/* L1: print "usage...\n" */
	  OP_end 		/* end */
	};
    Interp *interpreter = malloc(sizeof(Interp));

    prog = usage;
    if (argc > 1) {
        if (!strcmp(argv[1], "mops"))
            prog = mops;
    }
    init(interpreter, prog);
    run(interpreter, prog);
    return 0;
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
