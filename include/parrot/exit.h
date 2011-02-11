/* exit.h
 *  Copyright (C) 2001-2010, Parrot Foundation.
 *  Overview:
 *
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 *      exit.c
 */

#ifndef PARROT_EXIT_H_GUARD
#define PARROT_EXIT_H_GUARD

#include "parrot/compiler.h"    /* compiler capabilities */

typedef void (*exit_handler_f)(PARROT_INTERP, int , void *);

typedef struct _handler_node_t {
    exit_handler_f function;
    void *arg;
    struct _handler_node_t *next;
} handler_node_t;

/* HEADERIZER BEGIN: src/exit.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void Parrot_x_exit(PARROT_INTERP, int status)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_DOES_NOT_RETURN
PARROT_COLD
void Parrot_x_jump_out(PARROT_INTERP, int status)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_x_on_exit(PARROT_INTERP,
    ARGIN(exit_handler_f function),
    ARGIN_NULLOK(void *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_x_exit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_x_jump_out __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_x_on_exit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(function))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/exit.c */

#endif /* PARROT_EXIT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
