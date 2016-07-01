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
#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"

/* HEADERIZER HFILE: include/parrot/extend.h */

/*

=item C<int Parrot_vfprintf(PARROT_INTERP, Parrot_PMC pio, const char *s,
va_list args)>

Writes a C string format with a varargs list to a PIO.

=item C<int Parrot_fprintf(PARROT_INTERP, Parrot_PMC pio, const char *s, ...)>

Writes a C string format with varargs to a PIO.

=item C<int Parrot_printf(NULLOK_INTERP, const char *s, ...)>

Writes a C string format with varargs to C<stdout>.

=item C<int Parrot_eprintf(NULLOK_INTERP, const char *s, ...)>

Writes a C string format with varargs to C<stderr>.

=cut

*/

PARROT_EXPORT
int
Parrot_vfprintf(PARROT_INTERP, ARGIN(Parrot_PMC pio),
        ARGIN(const char *s), va_list args)
{
    ASSERT_ARGS(Parrot_vfprintf)
    STRING * str;
    INTVAL retval;

    str = Parrot_vsprintf_c(interp, s, args);
    retval = Parrot_io_putps(interp, pio, str);

    return retval;
}

PARROT_EXPORT
int
Parrot_fprintf(PARROT_INTERP, ARGIN(Parrot_PMC pio),
        ARGIN(const char *s), ...)
{
    ASSERT_ARGS(Parrot_fprintf)
    va_list args;
    INTVAL retval;

    va_start(args, s);
    retval = Parrot_vfprintf(interp, pio, s, args);
    va_end(args);

    return retval;
}

PARROT_EXPORT
int
Parrot_printf(NULLOK_INTERP, ARGIN(const char *s), ...)
{
    ASSERT_ARGS(Parrot_printf)
    va_list args;
    INTVAL retval;
    va_start(args, s);

    if (interp)
        retval = Parrot_vfprintf(interp, Parrot_io_STDOUT(interp), s, args);
    else
        retval = vfprintf(stdout, s, args);
    va_end(args);

    return retval;
}

PARROT_EXPORT
int
Parrot_eprintf(NULLOK_INTERP, ARGIN(const char *s), ...)
{
    ASSERT_ARGS(Parrot_eprintf)
    va_list args;
    INTVAL retval;

    va_start(args, s);

    if (interp)
        retval = Parrot_vfprintf(interp, Parrot_io_STDERR(interp), s, args);
    else
        retval = vfprintf(stderr, s, args);

    va_end(args);

    return retval;
}

/*

=item C<Parrot_PMC Parrot_get_root_namespace(PARROT_INTERP)>

Return the root namespace

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_PMC
Parrot_get_root_namespace(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_get_root_namespace)

    return interp->root_namespace;
}

/*

=item C<Parrot_PMC Parrot_PMC_new(PARROT_INTERP, Parrot_Int type)>

Create and return a new PMC.

=cut

*/

PARROT_EXPORT
Parrot_PMC
Parrot_PMC_new(PARROT_INTERP, Parrot_Int type)
{
    ASSERT_ARGS(Parrot_PMC_new)
    Parrot_PMC newpmc = Parrot_pmc_new_noinit(interp, type);
    VTABLE_init(interp, newpmc);
    return newpmc;
}

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

=item C<Parrot_PMC Parrot_PMC_null(void)>

Returns the special C<NULL> PMC.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
Parrot_PMC
Parrot_PMC_null(void)
{
    ASSERT_ARGS(Parrot_PMC_null)
    return PMCNULL;
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

=item C<void Parrot_ext_try(PARROT_INTERP, void (*cfunction(Parrot_Interp, void
*)), void (*chandler(Parrot_Interp, PMC *, void *)), void *data)>

Executes the cfunction argument wrapped in a exception handler.
If the function throws, the provided handler function is invoked

=cut

*/

#define POP_CONTEXT(interp, curctx, intialctx)                \
        Parrot_warn((interp), PARROT_WARNINGS_NONE_FLAG,      \
                "popping context in Parrot_ext_try");         \
        do {                                                  \
            if ((curctx) == NULL)                             \
                do_panic((interp), "cannot restore context",  \
                    __FILE__, __LINE__);                      \
        } while (((curctx) = CONTEXT(interp)) != initialctx); \


PARROT_EXPORT
void
Parrot_ext_try(PARROT_INTERP,
                ARGIN_NULLOK(void (*cfunction)(Parrot_Interp, void *)),
                ARGIN_NULLOK(void (*chandler)(Parrot_Interp, PMC *, void *)),
                ARGIN_NULLOK(void *data))
{
    ASSERT_ARGS(Parrot_ext_try)
    if (cfunction) {
        Parrot_runloop jmp;
        Parrot_Context *initialctx, *curctx;
        initialctx = CONTEXT(interp);
        switch (setjmp(jmp.resume)) {
          case 0: /* try */
            Parrot_ex_add_c_handler(interp, &jmp);
            (*cfunction)(interp, data);
            curctx = CONTEXT(interp);
            if (curctx != initialctx) {
                POP_CONTEXT(interp, curctx, initialctx);
            }
            Parrot_cx_delete_handler_local(interp, STRINGNULL);
            break;
          default: /* catch */
            {
                PMC *exception = jmp.exception;
                curctx = CONTEXT(interp);
                if (curctx != initialctx) {
                    POP_CONTEXT(interp, curctx, initialctx);
                }
                Parrot_cx_delete_handler_local(interp, STRINGNULL);
                if (chandler)
                    (*chandler)(interp, exception, data);
            }
        }
    }
}

/*

=item C<Parrot_Int Parrot_get_intreg(PARROT_INTERP, Parrot_Int regnum)>

Return the value of an integer register.

DEPRECATED: Do not use. See TT #2133

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_Int
Parrot_get_intreg(PARROT_INTERP, Parrot_Int regnum)
{
    ASSERT_ARGS(Parrot_get_intreg)
    return REG_INT(interp, regnum);
}

/*

=item C<Parrot_Float Parrot_get_numreg(PARROT_INTERP, Parrot_Int regnum)>

Return the value of a numeric register.

DEPRECATED: Do not use. See TT #2133

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_Float
Parrot_get_numreg(PARROT_INTERP, Parrot_Int regnum)
{
    ASSERT_ARGS(Parrot_get_numreg)

    return REG_NUM(interp, regnum);
}

/*

=item C<Parrot_String Parrot_get_strreg(PARROT_INTERP, Parrot_Int regnum)>

Return the value of a string register.

DEPRECATED: Do not use. See TT #2133

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_String
Parrot_get_strreg(PARROT_INTERP, Parrot_Int regnum)
{
    ASSERT_ARGS(Parrot_get_strreg)
    return REG_STR(interp, regnum);
}

/*

=item C<Parrot_PMC Parrot_get_pmcreg(PARROT_INTERP, Parrot_Int regnum)>

Return the value of a PMC register.

DEPRECATED: Do not use. See TT #2133

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
Parrot_PMC
Parrot_get_pmcreg(PARROT_INTERP, Parrot_Int regnum)
{
    ASSERT_ARGS(Parrot_get_pmcreg)
    return REG_PMC(interp, regnum);
}

/*

=item C<void Parrot_set_intreg(PARROT_INTERP, Parrot_Int regnum, Parrot_Int
value)>

Set the value of an I register.

DEPRECATED: Do not use. See TT #2133

=cut

*/

PARROT_EXPORT
void
Parrot_set_intreg(PARROT_INTERP, Parrot_Int regnum,
                  Parrot_Int value)
{
    ASSERT_ARGS(Parrot_set_intreg)
    REG_INT(interp, regnum) = value;
}

/*

=item C<void Parrot_set_numreg(PARROT_INTERP, Parrot_Int regnum, Parrot_Float
value)>

Set the value of an N register.

DEPRECATED: Do not use. See TT #2133

=cut

*/

PARROT_EXPORT
void
Parrot_set_numreg(PARROT_INTERP, Parrot_Int regnum,
                  Parrot_Float value)
{
    ASSERT_ARGS(Parrot_set_numreg)
    REG_NUM(interp, regnum) = value;
}

/*

=item C<void Parrot_set_strreg(PARROT_INTERP, Parrot_Int regnum, Parrot_String
value)>

Set the value of an S register.

DEPRECATED: Do not use. See TT #2133

=cut

*/

PARROT_EXPORT
void
Parrot_set_strreg(PARROT_INTERP, Parrot_Int regnum,
                  Parrot_String value)
{
    ASSERT_ARGS(Parrot_set_strreg)

    REG_STR(interp, regnum) = value;
    PARROT_GC_WRITE_BARRIER(interp, CURRENT_CONTEXT(interp));
}

/*

=item C<void Parrot_set_pmcreg(PARROT_INTERP, Parrot_Int regnum, Parrot_PMC
value)>

Set the value of a P register.

DEPRECATED: Do not use. See TT #2133

=cut

*/

PARROT_EXPORT
void
Parrot_set_pmcreg(PARROT_INTERP, Parrot_Int regnum,
                  Parrot_PMC value)
{
    ASSERT_ARGS(Parrot_set_pmcreg)

    REG_PMC(interp, regnum) = value;
    PARROT_GC_WRITE_BARRIER(interp, CURRENT_CONTEXT(interp));
}

/*=for api extend Parrot_new_string
 *
 */
/*

=item C<Parrot_String Parrot_new_string(PARROT_INTERP, const char *buffer,
Parrot_UInt length, const char * const encoding_name, Parrot_UInt flags)>

Create a new Parrot string from a passed-in buffer. Pass in a 0 for
flags for right now.

A copy of the buffer is made.

DEPRECATED: Use Parrot_str_new or Parrot_str_new_init instead. See TT #2133

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Parrot_String
Parrot_new_string(PARROT_INTERP, ARGIN_NULLOK(const char *buffer),
    Parrot_UInt length, ARGIN_NULLOK(const char * const encoding_name),
    Parrot_UInt flags)
{
    ASSERT_ARGS(Parrot_new_string)
    Parrot_String retval;
    const STR_VTABLE *encoding;

    if (encoding_name) {
        encoding = Parrot_find_encoding(interp, encoding_name);
        if (!encoding)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNIMPLEMENTED,
                "Can't make '%s' encoding strings", encoding_name);
    }
    else
        encoding = Parrot_default_encoding_ptr;

    retval = Parrot_str_new_init(interp, buffer, length, encoding, flags);

    return retval;
}

/*

=item C<void Parrot_register_pmc(PARROT_INTERP, Parrot_PMC pmc)>

Add a reference of the PMC to the interpreter's GC registry. This prevents PMCs
only known to extension from getting destroyed during GC runs.

DEPRECATED: Use Parrot_pmc_gc_register instead

=cut

*/

PARROT_EXPORT
void
Parrot_register_pmc(PARROT_INTERP, Parrot_PMC pmc)
{
    ASSERT_ARGS(Parrot_register_pmc)
    Parrot_pmc_gc_register(interp, pmc);
}

/*

=item C<void Parrot_unregister_pmc(PARROT_INTERP, Parrot_PMC pmc)>

Remove a reference of the PMC from the interpreter's GC registry. If the
reference count reaches zero, the PMC will be destroyed during the next GC run.

DEPRECATED: Use Parrot_pmc_gc_unregister instead

=cut

*/

PARROT_EXPORT
void
Parrot_unregister_pmc(PARROT_INTERP, Parrot_PMC pmc)
{
    ASSERT_ARGS(Parrot_unregister_pmc)
    Parrot_pmc_gc_unregister(interp, pmc);
}

/*

=item C<void Parrot_register_string(PARROT_INTERP, Parrot_String s)>

Add a reference of the string to the interpreter's GC registry. This prevents
strings only known to extension from getting destroyed during GC runs.

DEPRECATED: Use Parrot_str_gc_register instead

=cut

*/

PARROT_EXPORT
void
Parrot_register_string(PARROT_INTERP, Parrot_String s)
{
    ASSERT_ARGS(Parrot_register_string)
    Parrot_str_gc_register(interp, s);
}

/*

=item C<void Parrot_unregister_string(PARROT_INTERP, Parrot_String s)>

Remove a reference of the string from the interpreter's GC registry. If the
reference count reaches zero, the string will be destroyed during the next GC
run.

DEPRECATED: Use Parrot_str_gc_unregister instead

=cut

*/

PARROT_EXPORT
void
Parrot_unregister_string(PARROT_INTERP, Parrot_String s)
{
    ASSERT_ARGS(Parrot_unregister_string)
    Parrot_str_gc_unregister(interp, s);
}

/*

=item C<Parrot_PMC Parrot_sub_new_from_c_func(PARROT_INTERP, void (*func(void)),
const char * signature)>

Returns a PMC sub wrapper for a c function.

TODO: Clean this up, move it some place more appropriate

=cut

*/

PARROT_EXPORT
Parrot_PMC
Parrot_sub_new_from_c_func(PARROT_INTERP,
        ARGIN(void (*func)(void)), ARGIN(const char * signature))
{
    ASSERT_ARGS(Parrot_sub_new_from_c_func)

    Parrot_String sig;
    Parrot_PMC sub;

    sig = Parrot_new_string(interp, signature, strlen(signature),
        (char *) NULL, 0);

    sub = Parrot_pmc_new(interp, enum_class_NCI);
    VTABLE_set_pointer_keyed_str(interp, sub, sig, F2DPTR(func));
    return sub;
}

/*

=item C<Parrot_PMC Parrot_PMC_newclass(PARROT_INTERP, Parrot_PMC classtype)>

Create a class with the type given

TODO: Clean this up, move this to src/oo.c

=cut

*/

PARROT_EXPORT
Parrot_PMC
Parrot_PMC_newclass(PARROT_INTERP, Parrot_PMC classtype)
{
    ASSERT_ARGS(Parrot_PMC_newclass)
    return Parrot_pmc_new_init(interp, enum_class_Class, classtype);
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
