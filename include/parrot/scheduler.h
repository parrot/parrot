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

/* HEADERIZER END: src/scheduler.c */

/* Scheduler PMC's underlying struct. */
typedef struct Parrot_Scheduler {
    int  id;              /* The scheduler's ID. */
    int  max_tid;         /* The highest assigned task ID. */
    PMC *task_list;       /* The current list of tasks. */
    PMC *task_index;      /* An index into the current list of tasks, ordered by priority. */
    PMC *handlers;        /* The list of currently active handlers. */
} Parrot_Scheduler;

/* Macro to access underlying structure of a Scheduler PMC. */
#define PARROT_SCHEDULER(s) ((Parrot_Scheduler *) PMC_data(s))

/* Task PMC's underlying struct. */
typedef struct Parrot_Task {
    int     id;           /* The task ID. */
    int     priority;     /* The priority of the task. */
    int     birthtime;    /* A time stamp marking the creation of the task. */
    STRING *type;         /* The type of the task. */
    STRING *status;       /* The status of the task. */
    PMC    *codeblock;    /* An (optional) codeblock for the task. */
    PMC    *interp;       /* An (optional) interpreter structure for the task. */
} Parrot_Task;

/* Macro to access underlying structure of a Task PMC. */
#define PARROT_TASK(t) ((Parrot_Task *) PMC_data(t))

/*
 * Scheduler private flags
 */
typedef enum {
    SCHEDULER_cache_valid_FLAG = PObj_private0_FLAG
} scheduler_flags_enum;

#define SCHEDULER_get_FLAGS(o) (PObj_get_FLAGS(o))
#define SCHEDULER_flag_TEST(flag, o) (SCHEDULER_get_FLAGS(o) & SCHEDULER_ ## flag ## _FLAG)
#define SCHEDULER_flag_SET(flag, o) (SCHEDULER_get_FLAGS(o) |= SCHEDULER_ ## flag ## _FLAG)
#define SCHEDULER_flag_CLEAR(flag, o) (SCHEDULER_get_FLAGS(o) &= ~(UINTVAL)(SCHEDULER_ ## flag ## _FLAG))

/* Mark if the scheduler's cache is valid */
#define SCHEDULER_cache_valid_TEST(o)  SCHEDULER_flag_TEST(cache_valid, o)
#define SCHEDULER_cache_valid_SET(o)   SCHEDULER_flag_SET(cache_valid, o)
#define SCHEDULER_cache_valid_CLEAR(o) SCHEDULER_flag_CLEAR(cache_valid, o)

#endif /* PARROT_SCHEDULER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
