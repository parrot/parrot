/* scheduler.h
 *  Copyright (C) 2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Parrot concurrency scheduler header stuff
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_SCHEDULER_H_GUARD
#define PARROT_SCHEDULER_H_GUARD

#include "parrot/parrot.h"

/* HEADERIZER BEGIN: src/scheduler.c */

PARROT_API
void Parrot_cx_add_handler(PARROT_INTERP, ARGIN(PMC *handler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
PARROT_CAN_RETURN_NULL
PMC * Parrot_cx_find_handler_for_task(PARROT_INTERP, ARGIN(PMC *task))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void Parrot_cx_runloop_end(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_API
void Parrot_cx_schedule_task(PARROT_INTERP, ARGIN(PMC *task))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_cx_init_scheduler(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_cx_runloop_sleep(ARGMOD(PMC *scheduler))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*scheduler);

void Parrot_cx_runloop_wake(PARROT_INTERP, ARGMOD(PMC *scheduler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*scheduler);

/* HEADERIZER END: src/scheduler.c */

#endif /* PARROT_SCHEDULER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
