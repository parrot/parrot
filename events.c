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

#ifdef PARROT_HAS_HEADER_SETJMP
/* XXX s. exceptions.c */
void do_exception(exception_severity severity, long error);
void Parrot_init_signals(void);
#endif

static void
sig_handler(int signum)
{
    switch (signum) {
        default:
#ifdef PARROT_HAS_HEADER_SETJMP
            /* quick hack to test signals and exceptions
             */
            do_exception(0, -signum);
#endif
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
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
