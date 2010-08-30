/*
Copyright (C) 2007-2010, Parrot Foundation.
$Id$

=head1 NAME

src/events.c - Routines supporting the event handling mechanism.

=head1 DESCRIPTION

Users can register event handlers. When events occur, they are dispatched
to the appropriate handler asynchronously.

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/runcore_api.h"
#include "parrot/events.h"

#include "events.str"

/* HEADERIZER HFILE: include/parrot/events.h */

#define CX_DEBUG 0

/*

=item C<void Parrot_cx_add_handler_local(PARROT_INTERP, PMC *handler)>

Add a handler to the current context's list of handlers.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_add_handler_local(PARROT_INTERP, ARGIN(PMC *handler))
{
    ASSERT_ARGS(Parrot_cx_add_handler_local)
    if (PMC_IS_NULL(Parrot_pcc_get_handlers(interp, interp->ctx)))
        Parrot_pcc_set_handlers(interp, interp->ctx,
                                Parrot_pmc_new(interp, enum_class_ResizablePMCArray));

    VTABLE_unshift_pmc(interp, Parrot_pcc_get_handlers(interp, interp->ctx), handler);

}

/*

=item C<void Parrot_cx_delete_handler_local(PARROT_INTERP, STRING
*handler_type)>

Remove the top task handler of a particular type from the context's list of
handlers.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_delete_handler_local(PARROT_INTERP, ARGIN(STRING *handler_type))
{
    ASSERT_ARGS(Parrot_cx_delete_handler_local)
    PMC *handlers  = Parrot_pcc_get_handlers(interp, interp->ctx);

    if (PMC_IS_NULL(handlers))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "No handler to delete.");

    if (STRING_IS_NULL(handler_type) || STRING_IS_EMPTY(handler_type))
        VTABLE_shift_pmc(interp, handlers);
    else {
        /* Loop from newest handler to oldest handler. */
        STRING      *exception_str = CONST_STRING(interp, "exception");
        STRING      *event_str     = CONST_STRING(interp, "event");
        STRING      *handler_str   = CONST_STRING(interp, "ExceptionHandler");
        const INTVAL elements      = VTABLE_elements(interp, handlers);
        INTVAL       index;
        typedef enum { Hunknown,  Hexception, Hevent } Htype;

        const Htype htype =
            Parrot_str_equal(interp, handler_type, exception_str) ?
            Hexception :
            Parrot_str_equal(interp, handler_type, event_str) ?
                Hevent :
                Hunknown;
        STRING * const handler_name = (htype == Hexception) ? handler_str : (STRING *)NULL;

        for (index = 0; index < elements; ++index) {
            PMC * const handler = VTABLE_get_pmc_keyed_int(interp, handlers, index);
            if (!PMC_IS_NULL(handler)) {
                switch (htype) {
                  case Hexception:
                    if (VTABLE_isa(interp, handler, handler_name)) {
                        VTABLE_set_pmc_keyed_int(interp, handlers, index, PMCNULL);
                        return;
                    }
                    break;
                  case Hevent:
                    if (handler->vtable->base_type == enum_class_EventHandler) {
                        VTABLE_set_pmc_keyed_int(interp, handlers, index, PMCNULL);
                        return;
                    }
                    break;
                  default:
                    break;
                }
            }
        }

        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_INVALID_OPERATION, "No handler to delete.");
    }
}


/*

=item C<INTVAL Parrot_cx_count_handlers_local(PARROT_INTERP, STRING
*handler_type)>

Count the number of active handlers of a particular type from the
context's list of handlers.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_cx_count_handlers_local(PARROT_INTERP, ARGIN(STRING *handler_type))
{
    ASSERT_ARGS(Parrot_cx_count_handlers_local)
    PMC * const handlers = Parrot_pcc_get_handlers(interp, interp->ctx);
    INTVAL elements;

    if (PMC_IS_NULL(handlers))
        return 0;

    elements = VTABLE_elements(interp, handlers);

    if (STRING_IS_NULL(handler_type) || STRING_IS_EMPTY(handler_type))
        return elements;

    /* Loop from newest handler to oldest handler. */
    {
        STRING      *exception_str = CONST_STRING(interp, "exception");
        STRING      *event_str     = CONST_STRING(interp, "event");
        STRING      *handler_str   = CONST_STRING(interp, "ExceptionHandler");
        INTVAL       count = 0;
        INTVAL       index;
        typedef enum { Hunknown,  Hexception, Hevent } Htype;

        const Htype htype =
            (Parrot_str_equal(interp, handler_type, exception_str)) ?
            Hexception :
            (Parrot_str_equal(interp, handler_type, event_str)) ?
                Hevent :
                Hunknown;
        STRING * const handler_name = (htype == Hexception) ? handler_str : (STRING *)NULL;

        for (index = 0; index < elements; ++index) {
            PMC * const handler = VTABLE_get_pmc_keyed_int(interp, handlers, index);
            if (!PMC_IS_NULL(handler)) {
                switch (htype) {
                  case Hexception:
                    if (VTABLE_isa(interp, handler, handler_name))
                        ++count;
                    break;
                  case Hevent:
                    if (handler->vtable->base_type == enum_class_EventHandler)
                        ++count;
                    break;
                  default:
                    break;
                }
            }
        }
        return count;
    }
}


/*

=item C<void Parrot_cx_add_handler(PARROT_INTERP, PMC *handler)>

Add a task handler to scheduler's list of handlers.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_add_handler(PARROT_INTERP, ARGIN(PMC *handler))
{
    ASSERT_ARGS(Parrot_cx_add_handler)
    STRING * const add_handler = CONST_STRING(interp, "add_handler");
    if (!interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    Parrot_pcc_invoke_method_from_c_args(interp, interp->scheduler, add_handler, "P->", handler);
}

/*

=item C<void Parrot_cx_delete_handler_typed(PARROT_INTERP, STRING
*handler_type)>

Remove the top task handler of a particular type from the scheduler's list of
handlers.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_delete_handler_typed(PARROT_INTERP, ARGIN(STRING *handler_type))
{
    ASSERT_ARGS(Parrot_cx_delete_handler_typed)
    if (!interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    Parrot_pcc_invoke_method_from_c_args(interp, interp->scheduler, CONST_STRING(interp, "delete_handler"), "S->", handler_type);
}

/*

=item C<INTVAL Parrot_cx_count_handlers_typed(PARROT_INTERP, STRING
*handler_type)>

Count the number of active handlers of a particular type (event, exception) in
the concurrency scheduler.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_cx_count_handlers_typed(PARROT_INTERP, ARGIN(STRING *handler_type))
{
    ASSERT_ARGS(Parrot_cx_count_handlers_typed)
    INTVAL count = 0;

    if (!interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    Parrot_pcc_invoke_method_from_c_args(interp, interp->scheduler, CONST_STRING(interp, "count_handlers"), "S->I", handler_type, &count);

    return count;
}


/*

=back

=head2 Task Interface Functions

Functions that are used to interface with a specific task in the concurrency scheduler.

=over 4

=item C<PMC * Parrot_cx_find_handler_for_task(PARROT_INTERP, PMC *task)>

Retrieve a handler appropriate to a given task. If the scheduler has no
appropriate handler, returns PMCNULL.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_cx_find_handler_for_task(PARROT_INTERP, ARGIN(PMC *task))
{
    ASSERT_ARGS(Parrot_cx_find_handler_for_task)
    PMC *handler = PMCNULL;
#if CX_DEBUG
    fprintf(stderr, "searching for handler\n");
#endif

    if (!interp->scheduler)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Scheduler was not initialized for this interpreter.\n");

    Parrot_pcc_invoke_method_from_c_args(interp, interp->scheduler, CONST_STRING(interp, "find_handler"), "P->P", task, &handler);

#if CX_DEBUG
    fprintf(stderr, "done searching for handler\n");
#endif

    return handler;
}

/*

=item C<PMC * Parrot_cx_find_handler_local(PARROT_INTERP, PMC *task)>

Retrieve a handler appropriate to a given task from the local context. If the
context has no appropriate handler, returns PMCNULL.

=cut

*/


PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_cx_find_handler_local(PARROT_INTERP, ARGIN(PMC *task))
{
    ASSERT_ARGS(Parrot_cx_find_handler_local)

    /*
     * Quick&dirty way to avoid infinite recursion
     * when an exception is thrown while looking
     * for a handler
     */
    static int already_doing = 0;
    static PMC * keep_context = NULL;

    PMC            *context;
    PMC            *iter        = PMCNULL;
    STRING * const  handled_str = CONST_STRING(interp, "handled");
    STRING * const  iter_str    = CONST_STRING(interp, "handler_iter");

    if (already_doing) {
        Parrot_io_eprintf(interp,
            "** Exception caught while looking for a handler, trying next **\n");
        if (! keep_context)
            return NULL;
        /*
         * Note that we are now trying to handle the new exception,
         * not the initial task argument (exception or whatever).
         */
        context = Parrot_pcc_get_caller_ctx(interp, keep_context);
        keep_context = NULL;
        if (context && !PMC_IS_NULL(Parrot_pcc_get_handlers(interp, context)))
            iter = VTABLE_get_iter(interp, Parrot_pcc_get_handlers(interp, context));
        else
            iter = PMCNULL;
    }
    else {
        ++already_doing;

        /* Exceptions store the handler iterator for rethrow, other kinds of
         * tasks don't (though they could). */
        if (task->vtable->base_type == enum_class_Exception
        && VTABLE_get_integer_keyed_str(interp, task, handled_str) == -1) {
            iter    = VTABLE_get_attr_str(interp, task, iter_str);
            context = (PMC *)VTABLE_get_pointer(interp, task);
        }
        else {
            context = CURRENT_CONTEXT(interp);
            if (!PMC_IS_NULL(Parrot_pcc_get_handlers(interp, context)))
                iter = VTABLE_get_iter(interp, Parrot_pcc_get_handlers(interp, context));
        }
    }

    while (context) {
        keep_context = context;
        /* Loop from newest handler to oldest handler. */
        while (!PMC_IS_NULL(iter) && VTABLE_get_bool(interp, iter)) {
            PMC * const handler = VTABLE_shift_pmc(interp, iter);

            if (!PMC_IS_NULL(handler)) {
                INTVAL valid_handler = 0;
                if (handler->vtable->base_type == enum_class_Object)
                    Parrot_pcc_invoke_method_from_c_args(interp, handler, CONST_STRING(interp, "can_handle"),
                        "P->I", task, &valid_handler);
                else
                    Parrot_pcc_invoke_method_from_c_args(interp, handler, CONST_STRING(interp, "can_handle"),
                        "P->I", task, &valid_handler);

                if (valid_handler) {
                    if (task->vtable->base_type == enum_class_Exception) {
                        /* Store iterator and context for a later rethrow. */
                        VTABLE_set_attr_str(interp, task, CONST_STRING(interp, "handler_iter"), iter);
                        VTABLE_set_pointer(interp, task, context);
                    }
                    --already_doing;
                    keep_context = NULL;
                    return handler;
                }
            }
        }

        /* Continue the search in the next context up the chain. */
        context = Parrot_pcc_get_caller_ctx(interp, context);
        if (context && !PMC_IS_NULL(Parrot_pcc_get_handlers(interp, context)))
            iter = VTABLE_get_iter(interp, Parrot_pcc_get_handlers(interp, context));
        else
            iter = PMCNULL;
    }

    /* Reached the end of the context chain without finding a handler. */

    --already_doing;
    return PMCNULL;
}

/*

=back

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
