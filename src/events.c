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
#include "pmc/pmc_arrayiterator.h"
#include "pmc/pmc_exception.h"


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

=item C<void Parrot_cx_delete_handler_local(PARROT_INTERP)>

Remove the top task handler from the context's list of handlers.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_delete_handler_local(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_cx_delete_handler_local)
    PMC *handlers  = Parrot_pcc_get_handlers(interp, interp->ctx);

    if (PMC_IS_NULL(handlers))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "No handler to delete.");

    /* test elements so that we get a nice error message */
    if (!VTABLE_elements(interp, handlers))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "No handler to delete.");

    VTABLE_shift_pmc(interp, handlers);
}


/*

=item C<void Parrot_cx_delete_upto_handler_local(PARROT_INTERP, PMC *handler)>

Remove handlers until the specified handler is reached. The handler itself
is not removed. If the handler is not found, all handlers will be removed
and an exception is thrown.

=cut

*/

PARROT_EXPORT
void
Parrot_cx_delete_upto_handler_local(PARROT_INTERP, ARGIN(PMC *handler))
{
    ASSERT_ARGS(Parrot_cx_delete_upto_handler_local)
    PMC *handlers  = Parrot_pcc_get_handlers(interp, interp->ctx);
    if (!PMC_IS_NULL(handlers)) {
        while (VTABLE_elements(interp, handlers)) {
            PMC * const cand = VTABLE_get_pmc_keyed_int(interp, handlers, 0);
            if (cand == handler)
                return;
            VTABLE_shift_pmc(interp, handlers);
        }
    }
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
	"Specified handler is not in the handler list.");
}


/*

=item C<INTVAL Parrot_cx_count_handlers_local(PARROT_INTERP)>

Count the number of active handlers from the context's list of handlers.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_cx_count_handlers_local(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_cx_count_handlers_local)
    PMC * const handlers = Parrot_pcc_get_handlers(interp, interp->ctx);
    INTVAL elements;

    if (PMC_IS_NULL(handlers))
        return 0;

    return VTABLE_elements(interp, handlers);
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
    STRING * const  handled_str       = CONST_STRING(interp, "handled");
    STRING * const  handler_str       = CONST_STRING(interp, "handler");
    STRING * const  handlers_left_str = CONST_STRING(interp, "handlers_left");
    STRING * const  exception_str     = CONST_STRING(interp, "Exception");
    const Parrot_Int is_exception = (task->vtable->base_type == enum_class_Exception)
                                    || VTABLE_does(interp, task, exception_str);
    PMC            *handlers;
    INTVAL          pos, elements;

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
        if (context) {
            handlers = Parrot_pcc_get_handlers(interp, context);
            elements = !PMC_IS_NULL(handlers) ? VTABLE_elements(interp, handlers) : 0;
            pos = 0;
        }
    }
    else {
        INTVAL handled = 0;
        ++already_doing;

        /* Exceptions store the handler iterator for rethrow, other kinds of
         * tasks don't (though they could). */
        if (is_exception) {
            if (task->vtable->base_type == enum_class_Exception)
                GETATTR_Exception_handled(interp, task, handled);
            else
                handled = VTABLE_get_integer_keyed_str(interp, task, handled_str);
        }
        if (handled == -1) {
            context = (PMC *)VTABLE_get_pointer(interp, task);
            handlers = Parrot_pcc_get_handlers(interp, context);
            elements = !PMC_IS_NULL(handlers) ? VTABLE_elements(interp, handlers) : 0;
            if (task->vtable->base_type == enum_class_Exception)
                GETATTR_Exception_handlers_left(interp, task, pos);
            else
                pos = VTABLE_get_integer_keyed_str(interp, task, handlers_left_str);
            pos = elements - pos;
            if (pos < 0)
                pos = 0;
            if (pos > elements)
                pos = elements;
        }
        else {
            context = CURRENT_CONTEXT(interp);
            handlers = Parrot_pcc_get_handlers(interp, context);
            elements = !PMC_IS_NULL(handlers) ? VTABLE_elements(interp, handlers) : 0;
            pos = 0;
        }
    }

    while (context) {
        keep_context = context;
        /* Loop from newest handler to oldest handler. */
        for (; pos < elements; pos++) {
            PMC * const handler = VTABLE_get_pmc_keyed_int(interp, handlers, pos);

            if (!PMC_IS_NULL(handler)) {
                INTVAL valid_handler = 0;
                Parrot_pcc_invoke_method_from_c_args(interp, handler, CONST_STRING(interp, "can_handle"),
                        "P->I", task, &valid_handler);

                if (valid_handler) {
                    if (is_exception) {
                        /* Store iterator and context for a later rethrow. */
                        VTABLE_set_pointer(interp, task, context);
                        if (task->vtable->base_type == enum_class_Exception) {
                            SETATTR_Exception_handlers_left(interp, task, elements - pos - 1);
                            SETATTR_Exception_handler(interp, task, handler);
                        }
                        else {
                            VTABLE_set_integer_keyed_str(interp, task, handlers_left_str,
                                    elements - pos - 1);
                            VTABLE_set_attr_str(interp, task, handler_str, handler);
                        }
                    }
                    --already_doing;
                    keep_context = NULL;
                    return handler;
                }
            }
        }

        /* Continue the search in the next context up the chain. */
        context = Parrot_pcc_get_caller_ctx(interp, context);
        if (context) {
            handlers = Parrot_pcc_get_handlers(interp, context);
            elements = !PMC_IS_NULL(handlers) ? VTABLE_elements(interp, handlers) : 0;
            pos = 0;
        }
        else
            elements = pos = 0;
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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
