/* scheduler.h
 *  Copyright (C) 2007, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Parrot concurrency scheduler private core structs and flags
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

#ifndef PARROT_SCHEDULER_PRIVATE_H_GUARD
#define PARROT_SCHEDULER_PRIVATE_H_GUARD

#include "parrot/parrot.h"

/* Scheduler PMC's underlying struct. */
typedef struct Parrot_Scheduler {
    INTVAL        id;             /* The scheduler's ID. */
    INTVAL        max_tid;        /* The highest assigned task ID. */
    INTVAL        pending;        /* A count of pending tasks (cached for fast
                                     lookup). */
    PMC          *task_list;      /* The current list of tasks. */
    PMC          *task_index;     /* An index into the current list of tasks,
                                     ordered by priority. */
    PMC          *wait_index;     /* An unordered index of inactive tasks. */
    PMC          *handlers;       /* The list of currently active handlers. */
    PMC          *messages;       /* A message queue used for communication
                                     between schedulers. */
    Parrot_mutex  msg_lock;       /* Lock to synchronize use of the message queue. */
    Parrot_Interp interp;         /* A link back to the scheduler's interpreter. */
} Parrot_Scheduler;

/* Macro to access underlying structure of a Scheduler PMC. */
#define PARROT_SCHEDULER(s) ((Parrot_Scheduler *) PMC_data(s))

/* SchedulerMessage PMC's underlying struct. */
typedef struct Parrot_SchedulerMessage {
    INTVAL        id;        /* The message's ID. */
    STRING       *type;      /* The message's type. */
    PMC          *data;      /* Additional data for the message. */
} Parrot_SchedulerMessage;

/* Macro to access underlying structure of a Scheduler PMC. */
#define PARROT_SCHEDULERMESSAGE(s) ((Parrot_SchedulerMessage *) PMC_data(s))

/* Task PMC's underlying struct. */
typedef struct Parrot_Task {
    INTVAL        id;        /* The task ID. */
    INTVAL        priority;  /* The priority of the task. */
    FLOATVAL      birthtime; /* A time stamp marking the creation of the task. */
    STRING       *type;      /* The type of the task. */
    STRING       *subtype;   /* The subtype of the task. */
    STRING       *status;    /* The status of the task. */
    Parrot_Interp interp;    /* The interpreter that created the task. */
    PMC          *codeblock; /* An (optional) codeblock for the task. */
    PMC          *data;      /* Additional data for the task. */
    char         *cb_data;   /* Additional data for a callback event. */
} Parrot_Task;

/* Macro to access underlying structure of a Task PMC. */
#define PARROT_TASK(t) ((Parrot_Task *) PMC_data(t))

/* Timer PMC's underlying struct. The first part of the PMC struct is identical
 * to a core Task PMC (and will be constructed automatically by inheritance in
 * the new PMC implementation). */
typedef struct Parrot_Timer {
    INTVAL        id;        /* The task ID. */
    INTVAL        priority;  /* The priority of the task. */
    FLOATVAL      birthtime; /* A time stamp marking the creation of the task. */
    STRING       *type;      /* The type of the task. */
    STRING       *subtype;   /* The subtype of the task. */
    STRING       *status;    /* The status of the task. */
    Parrot_Interp interp;    /* The interpreter that created the task. */
    PMC          *codeblock; /* An (optional) codeblock for the task. */
    PMC          *data;      /* Additional data for the task. */
    char         *cb_data;   /* Additional data for a callback event. */
    FLOATVAL      duration;  /* The duration of the timer pause */
    FLOATVAL      interval;  /* How often to repeat */
    INTVAL        repeat;    /* Whether to repeat: 0 = run once (no repeat), -1 = forever */
} Parrot_Timer;

/* Macro to access underlying structure of a Timer PMC. */
#define PARROT_TIMER(t) ((Parrot_Timer *) PMC_data(t))

/*
 * Scheduler private flags
 */
typedef enum {
    SCHEDULER_cache_valid_FLAG         = PObj_private0_FLAG,
    SCHEDULER_wake_requested_FLAG      = PObj_private1_FLAG,
    SCHEDULER_terminate_requested_FLAG = PObj_private2_FLAG
} scheduler_flags_enum;

#define SCHEDULER_get_FLAGS(o) (PObj_get_FLAGS(o))
#define SCHEDULER_flag_TEST(flag, o) (SCHEDULER_get_FLAGS(o) & SCHEDULER_ ## flag ## _FLAG)
#define SCHEDULER_flag_SET(flag, o) (SCHEDULER_get_FLAGS(o) |= SCHEDULER_ ## flag ## _FLAG)
#define SCHEDULER_flag_CLEAR(flag, o) (SCHEDULER_get_FLAGS(o) &= ~(UINTVAL)(SCHEDULER_ ## flag ## _FLAG))

/* Mark if the scheduler's cache is valid */
#define SCHEDULER_cache_valid_TEST(o)  SCHEDULER_flag_TEST(cache_valid, o)
#define SCHEDULER_cache_valid_SET(o)   SCHEDULER_flag_SET(cache_valid, o)
#define SCHEDULER_cache_valid_CLEAR(o) SCHEDULER_flag_CLEAR(cache_valid, o)

/* Mark if the scheduler received a wake signal */
#define SCHEDULER_wake_requested_TEST(o)  SCHEDULER_flag_TEST(wake_requested, o)
#define SCHEDULER_wake_requested_SET(o)   SCHEDULER_flag_SET(wake_requested, o)
#define SCHEDULER_wake_requested_CLEAR(o) SCHEDULER_flag_CLEAR(wake_requested, o)

/* Mark if the scheduler should terminate the scheduler runloop */
#define SCHEDULER_terminate_requested_TEST(o)  SCHEDULER_flag_TEST(terminate_requested, o)
#define SCHEDULER_terminate_requested_SET(o)   SCHEDULER_flag_SET(terminate_requested, o)
#define SCHEDULER_terminate_requested_CLEAR(o) SCHEDULER_flag_CLEAR(terminate_requested, o)

/*
 * Task private flags
 */
typedef enum {
    TASK_terminate_runloop_FLAG = PObj_private0_FLAG
} task_flags_enum;

#define TASK_get_FLAGS(o) (PObj_get_FLAGS(o))
#define TASK_flag_TEST(flag, o) (TASK_get_FLAGS(o) & TASK_ ## flag ## _FLAG)
#define TASK_flag_SET(flag, o) (TASK_get_FLAGS(o) |= TASK_ ## flag ## _FLAG)
#define TASK_flag_CLEAR(flag, o) (TASK_get_FLAGS(o) &= ~(UINTVAL)(TASK_ ## flag ## _FLAG))

/* Mark a task to terminate the scheduler runloop */
#define TASK_terminate_runloop_TEST(o)  TASK_flag_TEST(terminate_runloop, o)
#define TASK_terminate_runloop_SET(o)   TASK_flag_SET(terminate_runloop, o)
#define TASK_terminate_runloop_CLEAR(o) TASK_flag_CLEAR(terminate_runloop, o)

#endif /* PARROT_SCHEDULER_PRIVATE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
