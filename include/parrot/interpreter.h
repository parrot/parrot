/* interpreter.h
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The interpreter api handles running the operations
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#if !defined(PARROT_INTERPRETER_H_GUARD)
#define PARROT_INTERPRETER_H_GUARD

#include "parrot/parrot.h"

#include "parrot/op_info.h"
#include "parrot/interp_guts.h"

struct Parrot_Interp {
    struct IReg *int_reg;            /* Current top of int reg stack */
    struct NReg *num_reg;            /* Current top of the float reg stack */
    struct SReg *string_reg;         /* Current top of the string stack */
    struct PReg *pmc_reg;            /* Current top of the PMC stack */
    struct Stack *stack_top;         /* Current top of the generic stack */
    struct IRegChunk *int_reg_base;            /* base of the int reg stack */
    struct NRegChunk *num_reg_base;            /* Base of the float reg stack */
    struct SRegChunk *string_reg_base;         /* Base of the string stack */
    struct PRegChunk *pmc_reg_base;            /* Base of the PMC stack */
    struct StackFrame *stack_base;             /* Base of the generic stack */
    struct Stash *perl_stash;             /* Pointer to the global */
                                          /* variable area */
    struct Arenas *arena_base;            /* Pointer to this */
                                          /* interpreter's arena */

    op_info_t * opcode_info;              /* Opcode info table (name, nargs, arg types) */
    opcode_t     *(**opcode_funcs)();     /* Opcode function table */
    STRING_FUNCS *(**string_funcs)();     /* String function table */
    INTVAL flags;				  /* Various interpreter flags
                                           that signal that runops
                                           should do something */
    opcode_t * resume_addr;
    struct PackFile * code;               /* The code we are executing */
};

#define PARROT_DEBUG_FLAG 0x01		/* Bit in the flags that says
                                           we're debugging */
#define PARROT_TRACE_FLAG 0x02		/* We're tracing execution */
#define PARROT_BOUNDS_FLAG 0x04		/* We're tracking byte code bounds during execution */

#define PCONST(i) PF_CONST(interpreter->code, (i))
#define PNCONST   PF_NCONST(interpreter->code)

struct Parrot_Interp *
make_interpreter();

typedef opcode_t * (*runops_core_f)(struct Parrot_Interp *, opcode_t *);

opcode_t *
runops_t0b0_core(struct Parrot_Interp *, opcode_t *);

opcode_t *
runops_t0b1_core(struct Parrot_Interp *, opcode_t *);

opcode_t *
runops_t1b0_core(struct Parrot_Interp *, opcode_t *);

opcode_t *
runops_t1b1_core(struct Parrot_Interp *, opcode_t *);

void
runops_generic();

void
runops(struct Parrot_Interp *, struct PackFile *);

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil 
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
