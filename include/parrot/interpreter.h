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
    IV *(*(*opcode_funcs)[2048])();	  /* Opcode */
                                          /* function table */
    STRING_FUNCS *(*(*string_funcs)[64])();  /* String function table */
    IV flags;				  /* Various interpreter flags
                                           that signal that runops
                                           should do something */
};

#define PARROT_DEBUG_FLAG 0x01		/* Bit in the flags that says
                                           we're debugging */
#define PARROT_TRACE_FLAG 0x02		/* We're tracing execution */

struct Parrot_Interp *
make_interpreter();

void
runops(struct Parrot_Interp *, IV *, IV);

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
