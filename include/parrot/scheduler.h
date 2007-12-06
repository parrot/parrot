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
void Parrot_cx_init_scheduler(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_API
void Parrot_cx_runloop_end(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_API
void Parrot_cx_schedule_task(PARROT_INTERP, NOTNULL(PMC *task))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_cx_runloop_sleep(NOTNULL(PMC *scheduler))
        __attribute__nonnull__(1);

void Parrot_cx_runloop_wake(PARROT_INTERP, NOTNULL(PMC *scheduler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/scheduler.c */

#endif /* PARROT_SCHEDULER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
