/* Copyright (C) 2010, Parrot Foundation.
 * $Id$
 */

#ifndef PARROT_EVENTS_H_GUARD
#define PARROT_EVENTS_H_GUARD

/* HEADERIZER BEGIN: src/events.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_cx_add_handler(PARROT_INTERP, ARGIN(PMC *handler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_cx_add_handler_local(PARROT_INTERP, ARGIN(PMC *handler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
INTVAL Parrot_cx_count_handlers_local(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
INTVAL Parrot_cx_count_handlers_typed(PARROT_INTERP,
    ARGIN(STRING *handler_type))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_cx_delete_handler_local(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_cx_delete_handler_typed(PARROT_INTERP,
    ARGIN(STRING *handler_type))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_cx_delete_upto_handler_local(PARROT_INTERP, ARGIN(PMC *handler))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC * Parrot_cx_find_handler_for_task(PARROT_INTERP, ARGIN(PMC *task))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC * Parrot_cx_find_handler_local(PARROT_INTERP, ARGIN(PMC *task))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_cx_add_handler __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handler))
#define ASSERT_ARGS_Parrot_cx_add_handler_local __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handler))
#define ASSERT_ARGS_Parrot_cx_count_handlers_local \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_cx_count_handlers_typed \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handler_type))
#define ASSERT_ARGS_Parrot_cx_delete_handler_local \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_cx_delete_handler_typed \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handler_type))
#define ASSERT_ARGS_Parrot_cx_delete_upto_handler_local \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(handler))
#define ASSERT_ARGS_Parrot_cx_find_handler_for_task \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(task))
#define ASSERT_ARGS_Parrot_cx_find_handler_local __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(task))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/events.c */

#endif /* PARROT_EVENTS_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
