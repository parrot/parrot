/* interpreter.h
 *
 * "Insert apropos quote here"
 *
 * This include file defines the structures used by the interpreter
 *
 */

#if !defined(PARROT_INTERPRETER_H_GUARD)
#define PARROT_INTERPRETER_H_GUARD

#include "parrot/parrot.h"

struct Perl_Interp {
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
  IV *(*(*opcode_funcs)[2048])();			/* Opcode */
                                       /* function table */
  STRING_FUNCS *(*(*string_funcs)[64])();  /* String function table */
};

struct Perl_Interp *make_interpreter();

void runops(struct Perl_Interp *, IV *);

#endif
