/*
 * nanoparrot.c
 *
 * - demonstrates how the interpreter basically is working
 *   its vastly simplified but the very basics are the same
 *   and it totally lacks any error checking
 *
 * - proof of concept of the new indirect register addressing scheme
 *
 * - compile with:
 *   -DMOPS  ... run mops main loop
 *   -DINDIRECT ... use indirect register pointer
 *   -TRACE ... turn on opcode tracing
 *
 * e.g.:
 * cc -o nanoparrot -Wall nanoparrot.c -O3  -DMOPS && time ./nanoparrot
 */

#include <stdlib.h>
#include <stdio.h>

typedef int INTVAL;
typedef int opcode_t;
typedef double FLOATVAL;
typedef void PMC;
typedef void STRING;

#define NUM_REGISTERS 32

#ifdef INDIRECT

struct Reg {
    INTVAL int_reg;
    FLOATVAL num_reg;
    STRING *string_reg;
    PMC *pmc_reg;
};

#define REG_INT(x) interpreter->bp[x].int_reg

#else

struct IReg {
    INTVAL registers[NUM_REGISTERS];
};

struct NReg {
    FLOATVAL registers[NUM_REGISTERS];
};

struct SReg {
    STRING *registers[NUM_REGISTERS];
};

struct PReg {
    PMC *registers[NUM_REGISTERS];
};

#define REG_INT(x) interpreter->int_reg.registers[x]

#endif

struct pf {
    opcode_t *byte_code;
    char **const_table;
};

typedef struct Parrot_Interp {
#ifdef INDIRECT
    struct Reg *bp;
#else
    struct IReg int_reg;
    struct NReg num_reg;
    struct SReg string_reg;
    struct PReg pmc_reg;
#endif
    struct pf *code;
    opcode_t *(**op_func)(opcode_t *, struct Parrot_Interp*);
    const char **op_info;
    int flags;
} Interp;

static opcode_t *
end(opcode_t *pc, Interp *interpreter) {
    return 0;
}

static opcode_t *
set_i_ic(opcode_t *pc, Interp *interpreter) {
    REG_INT(pc[1]) = pc[2];
    return pc + 3;
}

static opcode_t *
print_i(opcode_t *pc, Interp *interpreter) {
    printf("%d", REG_INT(pc[1]));
    return pc + 2;
}

static opcode_t *
add_bp_ic(opcode_t *pc, Interp *interpreter) {
#ifdef INDIRECT
    interpreter->bp += pc[1];
#endif
    return pc + 2;
}

static opcode_t *
if_i_ic(opcode_t *pc, Interp *interpreter) {
    if (REG_INT(pc[1]))
	return pc + pc[2];
    return pc + 3;
}

static opcode_t *
sub_i_i_i(opcode_t *pc, Interp *interpreter) {
    REG_INT(pc[1]) = REG_INT(pc[2]) - REG_INT(pc[3]);
    return pc + 4;
}

static opcode_t *
print_sc(opcode_t *pc, Interp *interpreter) {
    printf("%s", interpreter->code->const_table[pc[1]]);
    return pc + 2;
}

static void
init(Interp *interpreter, opcode_t *prog)
{
#ifdef INDIRECT
    interpreter->bp = calloc(32, sizeof(struct Reg));
#endif
#define N_OPS 7
#define N_CONSTS 2
    interpreter->op_func = malloc(N_OPS * sizeof(void*));
    interpreter->op_func[0] = end;
    interpreter->op_func[1] = set_i_ic;
    interpreter->op_func[2] = print_i;
    interpreter->op_func[3] = add_bp_ic;
    interpreter->op_func[4] = if_i_ic;
    interpreter->op_func[5] = sub_i_i_i;
    interpreter->op_func[6] = print_sc;
    interpreter->op_info = malloc(N_OPS * sizeof(char*));
    interpreter->op_info[0] = "end";
    interpreter->op_info[1] = "set_i_ic";
    interpreter->op_info[2] = "print_i";
    interpreter->op_info[3] = "add_bp_ic";
    interpreter->op_info[4] = "if_i_ic";
    interpreter->op_info[5] = "sub_i_i_i";
    interpreter->op_info[6] = "print_sc";
    interpreter->code = malloc(sizeof(struct pf));
    interpreter->code->byte_code = prog;
    interpreter->code->const_table = malloc(N_CONSTS * sizeof(char*));
    interpreter->code->const_table[0] = "\n";
    interpreter->code->const_table[1] = "done\n";
}

static void
run(Interp *interpreter)
{
    opcode_t *pc = interpreter->code->byte_code;

    while (pc) {
#ifdef TRACE
	printf("PC %2d %s\n", pc - interpreter->code->byte_code,
		interpreter->op_info[*pc]);
#endif
	pc = interpreter->op_func[*pc](pc, interpreter);
    }
}

int
main(int argc, char *argv[]) {
#ifdef MOPS
    /*
     * run the mops main loop
     */
    opcode_t prog[] =
    	{ 1, 4, 100000000, 	/* set I4, n */
	  2, 4, 	/* print I4 */
	  6, 0, 	/* print "\n" */
          1, 5, 1, 	/* set I5, 1 */
	  5, 4, 4, 5,	/* L1: sub I4, I4, I5 */
	  4, 4, -4,	/* if I4, L1 */
	  6, 1, 	/* print "done\n" */
	  0 		/* end */
	};
#else
    /*
     * show moving the register base pointer
     */
    opcode_t prog[] =
    	{ 1, 4, 4, 	/* set I4, 4 */
          1, 5, 5, 	/* set I5, 5 */
	  2, 4, 	/* print I4 */
	  6, 0, 	/* print "\n" */
	  2, 5, 	/* print I5 */
	  6, 0, 	/* print "\n" */
	  3, 1,		/* add_pb 1 */
	  2, 4, 	/* print I4 */
	  6, 0, 	/* print "\n" */
	  0 		/* end */
	};
#endif
    Interp *interpreter = malloc(sizeof(Interp));
    init(interpreter, prog);
    run(interpreter);
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
