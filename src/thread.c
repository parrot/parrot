/* thread.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     Thread handling stuff
 *  Data Structure and Algorithms:
 *     Threads are created by creating new ParrotInterpreter objects.
 *  History:
 *     2003.12.18 leo initial rev
 *  Notes:
 *  References:
 *     classes/parrotinterpreter.pmc
 *     docs/dev/events.pod
 *
 */

#include "parrot/parrot.h"
#include <assert.h>


/*
 * the actual thread function
 */
static void*
thread_func(void *arg)
{
    PMC *self = (PMC*) arg;
    Parrot_Interp interpreter = PMC_data(self);
    runops(interpreter, (opcode_t *)self->cache.struct_val -
			(opcode_t *)interpreter->code->byte_code);

    /*
     * TODO pass return value
     */
    return NULL;
}

/*
 * helper functions used also for running plain interpreters
 */

/*
 * copy / clone interpreter packfile / code
 * all resources are created in the destination interpreter
 */
void
pt_clone_code(Parrot_Interp d, Parrot_Interp s)
{
    Interp_flags_SET(d, PARROT_EXTERN_CODE_FLAG);
    d->code = s->code;
}

/*
 * setup code, create ret continuation
 */
void
pt_thread_prepare_for_run(Parrot_Interp d, Parrot_Interp s)
{
    PMC *ret_c;
    pt_clone_code(d, s);
    /*
     * provide a return continuation, so that CPS returns
     * are working - create it in the new interpreters mem space
     */
    ret_c = pmc_new(d, enum_class_RetContinuation);
    d->pmc_reg.registers[1] = ret_c;
}

/*
 * ParrotThread emthods
 *
 * pt_thread_run
 * run the sub PMC in a separate thread using interpreter in dest_interp
 */
int
pt_thread_run(Parrot_Interp interp, PMC* dest_interp, PMC* sub)
{
    Parrot_Interp interpreter = PMC_data(dest_interp);

    dest_interp->cache.struct_val = sub->cache.struct_val;
    pt_thread_prepare_for_run(interpreter, interp);
    /*
     * set regs according to pdd03
     * P0 = sub, P2 = object
     * XXX P5, P6 are still used to invoke the thread method
     *     these should be the first params though
     */
    REG_PMC(0) = sub;
    REG_PMC(2) = dest_interp;
    /*
     * for now create a detached thread - enough for testing
     */
    THREAD_CREATE_DETACHED(interpreter->thread_data->thread,
            thread_func, dest_interp);
    return 0;
}

/*
 * pt_yield
 * religuish the processor
 */

void
pt_thread_yield(void)
{
    YIELD;
}

/*
 * join (wait for) a joinable thread
 */
void*
pt_thread_join(UINTVAL tid)
{
    return NULL;
}

/*
 * detach (make non-joinable) thread
 * returns whatever the Sub returned
 */
void
pt_thread_detach(UINTVAL tid)
{
}

/*
 * threaded interpreter book-keeping
 */

/*
 * all threaded interpreters are stored in an array
 */
void
pt_add_to_interpreters(Parrot_Interp interpreter, Parrot_Interp new_interp)
{
    size_t i;

    new_interp->thread_data = mem_sys_allocate_zeroed(sizeof(Thread_data));
    if (n_interpreters == 0) {
        /*
         * first time - add master interpreter and thread
         */
        interpreter_array = mem_sys_allocate(2 * sizeof(Parrot_Interp));
        interpreter_array[0] = interpreter;
        interpreter_array[1] = new_interp;
        interpreter->thread_data =
            mem_sys_allocate_zeroed(sizeof(Thread_data));
        interpreter->thread_data->tid = 0;
        new_interp ->thread_data->tid = 1;
        n_interpreters = 2;
        return;
    }
    /*
     * look for an empty slot
     */
    for (i = 0; i < n_interpreters; ++i) {
        if (interpreter_array[i] == NULL) {
            interpreter_array[i] = new_interp;
            new_interp->thread_data->tid = i;
            return;
        }
    }
    /*
     * need to resize
     */
    interpreter_array = mem_sys_realloc(interpreter_array,
            (n_interpreters + 1) * sizeof(Parrot_Interp));
    interpreter_array[n_interpreters] = new_interp;
    new_interp->thread_data->tid = n_interpreters;
    ++n_interpreters;
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
