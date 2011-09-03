/*  Copyright (C) 2011, Parrot Foundation.
 *  Null thread interface definition shims.
 */

#ifndef PARROT_THR_NULL_H_GUARD
#define PARROT_THR_NULL_H_GUARD

#define LOCK(m)
#define UNLOCK(m)
#define COND_WAIT(c, m)
#define COND_TIMED_WAIT(c, m, t)
#define COND_SIGNAL(c)
#define COND_BROADCAST(c)

#define MUTEX_INIT(m)
#define MUTEX_DESTROY(m)

#define COND_INIT(c)
#define COND_DESTROY(c)

#define THREAD_CREATE_DETACHED(t, func, arg)
#define THREAD_CREATE_JOINABLE(t, func, arg)

#define JOIN(t, ret)
#define DETACH(t)

#define CLEANUP_PUSH(f, a)
#define CLEANUP_POP(a)

#define Parrot_mutex int
#define Parrot_cond int
#define Parrot_thread int

typedef void (*Cleanup_Handler)(void *);

#if ! PARROT_HAS_TIMESPEC

/* FIXME?! */
#undef PARROT_HAS_TIMESPEC
#define PARROT_HAS_TIMESPEC 1

struct timespec {
    time_t tv_sec;
    long tv_nsec;
};
#endif /* PARROT_HAS_TIMESPEC */

#endif /* PARROT_THR_NULL_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
