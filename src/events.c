/* events.c
 *  Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
 *  CVS Info
 *     $Id$
 *  Overview:
 *     User-level event handling stuff
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#include "parrot/parrot.h"

static void
sig_handler(int signum)
{
    switch (signum) {
        default:
            /* quick hack to test signals and exceptions
             */
            do_exception(0, -signum);
            break;
    }
}

void
Parrot_init_signals(void)
{
    /* quick hack to test signals and exceptions
     * s. t/op/hacks_4.pasm
     */
    /*    Parrot_set_sighandler(SIGFPE, sig_handler);*/
}

/*
 * initialize the event system
 */
void
Parrot_init_events(Parrot_Interp interpreter)
{
    /*
     * remember op_func_table
     */
    interpreter->save_func_table = interpreter->op_func_table;
}

/*
 * insert event into task queue
 */
void
Parrot_schedule_event(Parrot_Interp interpreter, parrot_event* ev)
{
}

void
Parrot_do_check_events(Parrot_Interp interpreter)
{
}

void
Parrot_do_handle_events(Parrot_Interp interpreter)
{
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
