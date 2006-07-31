/* exit.h
 *  Copyright (C) 2001-2003, The Perl Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 *      exit.c
 */

#if !defined(PARROT_EXIT_H_GUARD)
#define PARROT_EXIT_H_GUARD

#include "parrot/compiler.h"    /* compiler capabilities */

typedef void (*exit_handler_f)(Interp *, int , void *);

typedef struct _handler_node_t {
    exit_handler_f function;
    void *arg;
    struct _handler_node_t *next;
} handler_node_t;

PARROT_API int Parrot_on_exit(Interp *, exit_handler_f func, void *arg);
PARROT_API void Parrot_exit(Interp *, int status)
            __attribute__noreturn__;

#endif /* PARROT_EXIT_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
