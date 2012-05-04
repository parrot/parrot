/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/extend.c - Parrot extension interface

=head1 DESCRIPTION

These are utility functions which extension code may use, but which are
typically not used by Parrot internally. These functions are for EXTENDING
use only, not for EMBEDDING. Embedding should be handed through the embedding
API with c files in directory src/embed/.

Extending situations are things like NCI function libraries, dyn-pmc and
dyn-op libraries which are loaded into Parrot and called from Parrot (as
opposed to embedding, where an external program calls into Parrot). These
functions assume the existance of an interpreter, memory management through
GC and stackwalking, and the presence of an exception-handling infrastructure.

=head2 Functions

=over 4

=cut

*/

/* DO NOT CALL THESE FUNCTIONS WITHOUT LIBPARROT, OR FROM OUTSIDE LIBPARROT!!

   These functions presume that GC is available and is properly configured
   (setting the stacktop for stack walking, etc) and that there is an active
   exception-handling infrastructure. Calling these functions when there are
   no exception handlers available, including a default top-level handler, or
   when the GC is not properly initialized can lead to big problems. Be sure
   to understand the difference between an embedding and an extending
   situation. Using the wrong kind of function in the wrong situation, or
   combining some functions from the Embedding API with functions from the
   Extending API is a recipe for disaster. We (Parrot developers) will not be
   held responsible if you insist on making these kinds of mistakes.

   If there are utility functions that *YOU* as a user of parrot need from
   either the extending or the embedding API, please request them or attempt
   to write them yourself. Blindly mixing things from the wrong API, or
   calling a function in the wrong context will cause you problems.

   You have been warned.

   Notice that the "Extending API" is a loosely-defined concept which is
   currently understood to mean the sum of public APIs for various subsystems.
   This definition may change in the future, but this is what we mean by the
   phrase right now. The functions in this file do not belong to any
   particular subsystem, and are always part of the extending API. Functions
   named "Parrot_xxx_..." where "xxx" is a 2- or 3-letter subsystem
   abbreviation and which are marked with "PARROT_EXPORT" can generally be
   considered to be part of the public API. Subsystems which are properly
   arranged will typically have a folder src/xxx/, and an "api.c" file
   therein for holding API functions from that subsystem. Many of the bigger
   systems are arranged in this way (and the rest of the systems will be
   eventually). If so, that is the canonical source of information regarding
   API functions for that subsystem.

   Other documentation sources, such as the PDDs or other files in the
   docs/ directory may include other information about the extending API.

*/

#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "parrot/events.h"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"

/* HEADERIZER HFILE: none */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void restore_context(PARROT_INTERP,
    ARGIN(Parrot_Context * const initialctx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_restore_context __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(initialctx))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* HEADERIZER HFILE: include/parrot/extend.h */

/*

=item C<Parrot_Int Parrot_PMC_typenum(PARROT_INTERP, const char *_class)>

Returns the internal identifier that represents the named class.

=cut

*/

PARROT_EXPORT
Parrot_Int
Parrot_PMC_typenum(PARROT_INTERP, ARGIN_NULLOK(const char *_class))
{
    ASSERT_ARGS(Parrot_PMC_typenum)
    Parrot_Int retval = Parrot_pmc_get_type_str(interp, Parrot_str_new(interp, _class, 0));
    return retval;
}

/*

=item C<void Parrot_free_cstring(char *string)>

Deallocate a C string that the interpreter has handed to you.

=cut

*/

PARROT_EXPORT
void
Parrot_free_cstring(ARGFREE(char *string))
{
    ASSERT_ARGS(Parrot_free_cstring)
    Parrot_str_free_cstring(string);
}

/*

=item C<void Parrot_ext_call(PARROT_INTERP, Parrot_PMC sub_pmc, const char
*signature, ...)>

Call a Parrot subroutine or method with the given function signature. The
function signature holds one type character for each argument or return, these
are:

    I ... Parrot_Int
    N ... Parrot_Float
    S ... Parrot_String
    P ... Parrot_PMC

Returns come after the arguments, separated by an arrow, so "PN->S" takes a PMC
and a float as arguments and returns a string.

Pass the variables for the arguments and returns in the same order as the
signature, with returns as reference to the variable (so it can be modified).

    Parrot_ext_call(interp, sub, "P->S", pmc_arg, &string_result);

To call a method, pass the object for the method as the first argument, and
mark it in the signature as "Pi" ("i" stands for "invocant").

    Parrot_ext_call(interp, sub, "PiP->S", object_arg, pmc_arg, &string_result);

=cut

*/

PARROT_EXPORT
void
Parrot_ext_call(PARROT_INTERP, ARGIN(Parrot_PMC sub_pmc),
                 ARGIN(const char *signature), ...)
{
    ASSERT_ARGS(Parrot_ext_call)
    va_list args;
    PMC  *call_obj;
    const char *arg_sig, *ret_sig;
    PMC * old_call_obj = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    Parrot_pcc_split_signature_string(signature, &arg_sig, &ret_sig);

    va_start(args, signature);
    call_obj = Parrot_pcc_build_call_from_varargs(interp, PMCNULL,
        arg_sig, &args);

    Parrot_pcc_invoke_from_sig_object(interp, sub_pmc, call_obj);
    call_obj = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    Parrot_pcc_fill_params_from_varargs(interp, call_obj, ret_sig, &args,
            PARROT_ERRORS_RESULT_COUNT_FLAG);
    va_end(args);
    Parrot_pcc_set_signature(interp, CURRENT_CONTEXT(interp), old_call_obj);
}

/*

=item C<static void restore_context(PARROT_INTERP, Parrot_Context * const
initialctx)>

Helper function to restore the caller context in Parrot_ext_try.

=cut

*/

static void
restore_context(PARROT_INTERP, ARGIN(Parrot_Context * const initialctx))
{
    ASSERT_ARGS(restore_context)
    Parrot_Context *curctx = CONTEXT(interp);
    if (curctx != initialctx) {
        Parrot_warn((interp), PARROT_WARNINGS_NONE_FLAG,
                "popping context in Parrot_ext_try");
        do {
            Parrot_pop_context(interp);
            curctx = CONTEXT(interp);
            if (curctx == NULL)
                do_panic((interp), "cannot restore context",
                    __FILE__, __LINE__);
        } while (curctx != initialctx);
    }
}

/*

=item C<void Parrot_ext_try(PARROT_INTERP, void (*cfunction(Parrot_Interp, void
*)), void (*chandler(Parrot_Interp, PMC *, void *)), void *data)>

Executes the cfunction argument wrapped in a exception handler.
If the function throws, the provided handler function is invoked

=cut

*/

PARROT_EXPORT
void
Parrot_ext_try(PARROT_INTERP,
    ARGIN_NULLOK(void (*cfunction)(Parrot_Interp, ARGIN_NULLOK(void *))),
    ARGIN_NULLOK(void (*chandler)(Parrot_Interp, ARGIN_NULLOK(PMC *), ARGIN_NULLOK(void *))),
    ARGIN_NULLOK(void *data))
{
    ASSERT_ARGS(Parrot_ext_try)
    if (cfunction) {
        Parrot_runloop jmp;
        Parrot_Context * const initialctx = CONTEXT(interp);
        switch (setjmp(jmp.resume)) {
          case 0: /* try */
            Parrot_ex_add_c_handler(interp, &jmp);
            (*cfunction)(interp, data);
            restore_context(interp, initialctx);
            Parrot_cx_delete_handler_local(interp);
            break;
          default: /* catch */
            {
                PMC *exception = jmp.exception;
                restore_context(interp, initialctx);
                Parrot_cx_delete_handler_local(interp);
                if (chandler)
                    (*chandler)(interp, exception, data);
            }
        }
    }
}

/*

=back

=head1 SEE ALSO

See F<include/parrot/extend.h> and F<docs/pdds/pdd11_extending.pod>.

=head1 HISTORY

Initial version by Dan Sugalski.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
