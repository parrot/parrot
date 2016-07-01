/* scheduler.h
 *  Copyright (C) 2007-2011, Parrot Foundation.
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
    SCHEDULER_wake_requested_FLAG      = PObj_private1_FLAG,
    SCHEDULER_terminate_requested_FLAG = PObj_private2_FLAG,
    SCHEDULER_in_handler_FLAG          = PObj_private3_FLAG
} scheduler_flags_enum;

#define SCHEDULER_get_FLAGS(o) (PObj_get_FLAGS(o))
#define SCHEDULER_flag_TEST(flag, o) (SCHEDULER_get_FLAGS(o) & SCHEDULER_ ## flag ## _FLAG)
#define SCHEDULER_flag_SET(flag, o) (SCHEDULER_get_FLAGS(o) |= SCHEDULER_ ## flag ## _FLAG)
#define SCHEDULER_flag_CLEAR(flag, o) (SCHEDULER_get_FLAGS(o) &= ~(UINTVAL)(SCHEDULER_ ## flag ## _FLAG))

/* Mark if the scheduler received a wake signal */
#define SCHEDULER_wake_requested_TEST(o)  SCHEDULER_flag_TEST(wake_requested, o)
#define SCHEDULER_wake_requested_SET(o)   SCHEDULER_flag_SET(wake_requested, o)
#define SCHEDULER_wake_requested_CLEAR(o) SCHEDULER_flag_CLEAR(wake_requested, o)

/* Mark if the scheduler should terminate the scheduler runloop */
#define SCHEDULER_terminate_requested_TEST(o)  SCHEDULER_flag_TEST(terminate_requested, o)
#define SCHEDULER_terminate_requested_SET(o)   SCHEDULER_flag_SET(terminate_requested, o)
#define SCHEDULER_terminate_requested_CLEAR(o) SCHEDULER_flag_CLEAR(terminate_requested, o)

/* Mark if the scheduler is inside a handler */
#define SCHEDULER_in_handler_TEST(o)  SCHEDULER_flag_TEST(in_handler, o)
#define SCHEDULER_in_handler_SET(o)   SCHEDULER_flag_SET(in_handler, o)
#define SCHEDULER_in_handler_CLEAR(o) SCHEDULER_flag_CLEAR(in_handler, o)

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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
