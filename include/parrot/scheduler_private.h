/* scheduler.h
 *  Copyright (C) 2007, Parrot Foundation.
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

/* Scheduler private flags */
typedef enum {
    SCHEDULER_resched_requested_FLAG   = PObj_private0_FLAG,
    SCHEDULER_wake_requested_FLAG      = PObj_private1_FLAG,
    SCHEDULER_terminate_requested_FLAG = PObj_private2_FLAG
} scheduler_flags_enum;

void Parrot_pmc_list_insert_by_number(PARROT_INTERP, PMC *list, PMC *value);

#define SCHEDULER_get_FLAGS(o) (PObj_get_FLAGS(o))
#define SCHEDULER_flag_TEST(flag, o) (SCHEDULER_get_FLAGS(o) & SCHEDULER_ ## flag ## _FLAG)
#define SCHEDULER_flag_SET(flag, o) (SCHEDULER_get_FLAGS(o) |= SCHEDULER_ ## flag ## _FLAG)
#define SCHEDULER_flag_CLEAR(flag, o) (SCHEDULER_get_FLAGS(o) &= ~(UINTVAL)(SCHEDULER_ ## flag ## _FLAG))

/* Should the scheduler swap tasks at its next opportunity? */
#define SCHEDULER_resched_requested_TEST(o)  SCHEDULER_flag_TEST(resched_requested, o)
#define SCHEDULER_resched_requested_SET(o)   SCHEDULER_flag_SET(resched_requested, o)
#define SCHEDULER_resched_requested_CLEAR(o) SCHEDULER_flag_CLEAR(resched_requested, o)

/* Should the scheduler wake up, check events, and stuff? */
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
