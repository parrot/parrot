/*
 * imc.c
 *
 * Main entry point and top level of IMCC compiler.
 *
 * Moved all register allocation and spill code to reg_alloc.c
 */

#include <string.h>
#include <assert.h>
#include "imc.h"
#include "optimizer.h"


/* imc_compile_unit is the main loop of the IMC compiler for each unit. It operates
 * on a single compilation unit at a time.
 */
void
imc_compile_unit(struct Parrot_Interp *interpreter, Instruction * unit)
{
    /* Not much here for now except the allocator */

    imc_reg_alloc(interpreter, unit);
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
