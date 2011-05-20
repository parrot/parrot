/*
Copyright (C) 2010-2011, Parrot Foundation.

=head1 NAME

src/embed/api.c - The Parrot embedding interface

=head1 DESCRIPTION

This file implements functions of the Parrot embedding interface.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/runcore_api.h"
#include "parrot/embed.h"
#include "parrot/api.h"
#include "embed_private.h"

/* HEADERIZER HFILE: include/parrot/api.h */


/*

=item C<Parrot_Int Parrot_api_get_result(Parrot_PMC interp_pmc, Parrot_Int
*is_error, Parrot_PMC * exception, Parrot_Int *exit_code, Parrot_String *
errmsg)>

Gets the results of the last API function call and stores the results in
C<is_error>, C<exception>, C<exit_code> and C<errmsg>. This function returns
a true value if this call is successful and false value otherwise. The stored
information is as follow:

C<is_error> a true value if an unhandled exception was thrown or the program
terminated with an error condition and a false value otherwise.

C<exception> the last exception thrown.

C<exit_code> the exit code of the running program.

C<errmsg> contains an string with the last error message.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_get_result(Parrot_PMC interp_pmc, ARGOUT(Parrot_Int *is_error),
        ARGOUT(Parrot_PMC * exception), ARGOUT(Parrot_Int *exit_code),
        ARGOUT(Parrot_String * errmsg))
{
    ASSERT_ARGS(Parrot_api_get_result)
    EMBED_API_CALLIN(interp_pmc, interp)
    *exit_code = interp->exit_code;
    *exception = interp->final_exception;
    if (PMC_IS_NULL(*exception)) {
        *is_error = 0;
        *errmsg = STRINGNULL;
    }
    else {
        STRING * const severity_str = Parrot_str_new(interp, "severity", 0);
        INTVAL severity = VTABLE_get_integer_keyed_str(interp, *exception, severity_str);
        *is_error = (severity != EXCEPT_exit);
        *errmsg = VTABLE_get_string(interp, *exception);
    }
    interp->final_exception = PMCNULL;
    interp->exit_code = 0;
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_get_exception_backtrace(Parrot_PMC interp_pmc,
Parrot_PMC exception, Parrot_String * bt)>

Gets the backtrace of the interpreter's call chain for the given exception
C<expcetion> and stores the results in string C<bt>. This function returns a
true value if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_get_exception_backtrace(Parrot_PMC interp_pmc,
        Parrot_PMC exception, ARGOUT(Parrot_String * bt))
{
    ASSERT_ARGS(Parrot_api_get_exception_backtrace)
    EMBED_API_CALLIN(interp_pmc, interp)
    if (PMC_IS_NULL(exception))
        *bt = STRINGNULL;
    else
        *bt = Parrot_ex_build_complete_backtrace_string(interp, exception);
    EMBED_API_CALLOUT(interp_pmc, interp)
}


/*

=item C<Parrot_Int Parrot_api_make_interpreter(Parrot_PMC parent, Parrot_Int
flags, Parrot_Init_Args *args, Parrot_PMC *interp)>

Creates a new interpreter and stores it in C<interp>. It takes three optional
parameters the new interpreter's C<flags>, the initialization paremeters C<args>
and the C<parent> interpreter. This function returns a true value if this call
is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_make_interpreter(Parrot_PMC parent, Parrot_Int flags,
        ARGIN_NULLOK(Parrot_Init_Args *args), ARGOUT(Parrot_PMC *interp))
{
    ASSERT_ARGS(Parrot_api_make_interpreter)
    int alt_stacktop;
    Parrot_Interp interp_raw;
    Parrot_GC_Init_Args gc_args;
    const Parrot_Interp parent_raw = PMC_IS_NULL(parent) ? NULL : GET_RAW_INTERP(parent);
    Parrot_jump_buff env;
    interp_raw = allocate_interpreter(parent_raw, flags);
    if (setjmp(env)) {
        interp_raw->api_jmp_buf = NULL;
        *interp = NULL;
        return !interp_raw->exit_code;
    }
    else {
        interp_raw->api_jmp_buf = &env;
        if (args) {
            gc_args.stacktop          = args->stacktop
                                      ? args->stacktop : &alt_stacktop;
            gc_args.system            = args->gc_system;
            gc_args.nursery_size      = args->gc_nursery_size;
            gc_args.dynamic_threshold = args->gc_dynamic_threshold;
            gc_args.min_threshold     = args->gc_min_threshold;

            if (args->hash_seed)
                interp_raw->hash_seed = args->hash_seed;
        }
        else {
            memset(&gc_args, 0, sizeof (Parrot_GC_Init_Args));
            gc_args.stacktop = &alt_stacktop;
        }
        initialize_interpreter(interp_raw, &gc_args);
        *interp = VTABLE_get_pmc_keyed_int(
                interp_raw, interp_raw->iglobals, (Parrot_Int)IGLOBALS_INTERPRETER);
    }
    interp_raw->api_jmp_buf = NULL;
    return !PMC_IS_NULL(*interp);
}

/*

=item C<Parrot_Int Parrot_api_set_runcore(Parrot_PMC interp_pmc, const char *
corename, Parrot_UInt trace)>

Sets the C<interp_pmc>'s bytecode running core, the core is specified by the
C<corename>. This function returns a true value if this call is successful and
false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_set_runcore(Parrot_PMC interp_pmc, ARGIN(const char * corename),
        Parrot_UInt trace)
{
    ASSERT_ARGS(Parrot_api_set_runcore)
    EMBED_API_CALLIN(interp_pmc, interp)
    if (trace) {
        Interp_trace_SET(interp, PARROT_TRACE_OPS_FLAG);
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
    }
    else {
        if (STREQ(corename, "slow") || STREQ(corename, "bounds"))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
        else if (STREQ(corename, "fast") || STREQ(corename, "jit") || STREQ(corename, "function"))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "fast"));
        else if (STREQ(corename, "exec"))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "exec"));
        else if (STREQ(corename, "trace"))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
        else if (STREQ(corename, "profiling"))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "profiling"));
        else if (STREQ(corename, "gcdebug"))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "gcdebug"));
        else
            Parrot_ex_throw_from_c_args(interp, NULL, 1, "Invalid runcore type %s", corename);
    }
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_debug_flag(Parrot_PMC interp_pmc, Parrot_Int
flags, Parrot_Int set)>

Sets/Unsets the C<interp_pmc>'s debug flags. If C<set> is in a true value debug
flags are set otherwise debug flags are cleared. This function returns a true
value if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_debug_flag(Parrot_PMC interp_pmc, Parrot_Int flags, Parrot_Int set)
{
    ASSERT_ARGS(Parrot_api_debug_flag)
    EMBED_API_CALLIN(interp_pmc, interp)
    if (set)
        interp->debug_flags |= flags;
    else
        interp->debug_flags &= ~flags;
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_flag(Parrot_PMC interp_pmc, Parrot_Int flags,
Parrot_Int set)>

Set/Unset the C<interp_pmc>'s general flags. If C<set> is in a true value general
flags are set otherwise passed flags are cleared. This function returns a true
value if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_flag(Parrot_PMC interp_pmc, Parrot_Int flags, Parrot_Int set)
{
    ASSERT_ARGS(Parrot_api_flag)
    EMBED_API_CALLIN(interp_pmc, interp)
    if (set) {
        Interp_flags_SET(interp, flags);
        if (flags & (PARROT_BOUNDS_FLAG | PARROT_PROFILE_FLAG))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
    }
    else
        Interp_flags_CLEAR(interp, flags);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_set_executable_name(Parrot_PMC interp_pmc, const
char * name)>

Sets the executable name for the C<interp_pmc> interpreter. This function returns
a true value if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_set_executable_name(Parrot_PMC interp_pmc, ARGIN(const char * name))
{
    ASSERT_ARGS(Parrot_api_set_executable_name)
    EMBED_API_CALLIN(interp_pmc, interp)
    STRING * const name_str = Parrot_str_from_platform_cstring(interp, name);
    PMC * const name_pmc = Parrot_pmc_new(interp, enum_class_String);
    VTABLE_set_string_native(interp, name_pmc, name_str);
    VTABLE_set_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_EXECUTABLE,
        name_pmc);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_destroy_interpreter(Parrot_PMC interp_pmc)>

Destroys the C<interp_pmc> interpreter, freeing the memory structures allocated
for it. This function returns a true value if this call is successful and false
value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_destroy_interpreter(Parrot_PMC interp_pmc)
{
    ASSERT_ARGS(Parrot_api_destroy_interpreter)
    Parrot_jump_buff env;
    if (setjmp(env)) {
        /* We can't check for potential errors because the interpreter
         * might have been destroyed. */
        return 1;
    }
    else {
        Interp * const interp = GET_INTERP(interp_pmc);
        void * _oldtop = interp->lo_var_ptr;
        if (_oldtop == NULL)
            interp->lo_var_ptr = &_oldtop;
        interp->api_jmp_buf = &env;
        Parrot_destroy(interp);
        Parrot_x_exit(interp, 0);
        /* Never reached, x_exit calls longjmp */
        return 1;
    }
}

/*

=item C<Parrot_Int Parrot_api_set_warnings(Parrot_PMC interp_pmc, Parrot_Int
flags)>

Enables C<inter_pmc>'s warning messages the type of warning information to be
print out is specified by C<flags>. This function returns a true value if this
call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_set_warnings(Parrot_PMC interp_pmc, Parrot_Int flags)
{
    ASSERT_ARGS(Parrot_api_set_warnings)
    EMBED_API_CALLIN(interp_pmc, interp)
    /* Activates the given warnings.  (Macro from warnings.h.) */
    PARROT_WARNINGS_on(interp, flags);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_add_library_search_path(Parrot_PMC interp_pmc,
const char *path)>

Adds C<path> to the C<inter_pmc>'s library search path list. This function
returns a true value if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_add_library_search_path(Parrot_PMC interp_pmc,
        ARGIN(const char *path))
{
    ASSERT_ARGS(Parrot_api_add_library_search_path)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_lib_add_path_from_cstring(interp, path, PARROT_LIB_PATH_LIBRARY);

    /* EXPERIMENTAL. This line has been added experimentally because it is a
       missing feature, and it may go away at any time without warning. */
    Parrot_lib_add_path_from_cstring(interp, path, PARROT_LIB_PATH_LANG);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_add_include_search_path(Parrot_PMC interp_pmc,
const char *path)>

Adds C<path> to the C<inter_pmc>'s include search path list. This function
returns a true value if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_add_include_search_path(Parrot_PMC interp_pmc,
        ARGIN(const char *path))
{
    ASSERT_ARGS(Parrot_api_add_include_search_path)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_lib_add_path_from_cstring(interp, path, PARROT_LIB_PATH_INCLUDE);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_add_dynext_search_path(Parrot_PMC interp_pmc,
const char *path)>

Adds C<path> to the C<inter_pmc>'s dynext search path list. This function
returns a true value if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_add_dynext_search_path(Parrot_PMC interp_pmc,
        ARGIN(const char *path))
{
    ASSERT_ARGS(Parrot_api_add_dynext_search_path)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_lib_add_path_from_cstring(interp, path, PARROT_LIB_PATH_DYNEXT);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_set_stdhandles(Parrot_PMC interp_pmc, Parrot_Int
in, Parrot_Int out, Parrot_Int err)>

Set the C<interp_pmc>'s standard file descriptors STDIN, STDOUT, STDERR. Any
file descriptor set to C<PIO_INVALID_HANDLE> is ignored. This function returns
a true value if this call is successful and false value otherwise.

=cut

*/
/* Whiteknight told me that theres no way to test this for now, so it should be
commented out, for now.

PARROT_API
Parrot_Int
Parrot_api_set_stdhandles(Parrot_PMC interp_pmc, Parrot_Int in,
    Parrot_Int out, Parrot_Int err)
{
    ASSERT_ARGS(Parrot_api_set_stdhandles)
    EMBED_API_CALLIN(interp_pmc, interp)
    void *dummy;

    if (PIO_INVALID_HANDLE != (PIOHANDLE)in) {
        PMC * const pmc = Parrot_pmc_new(interp, enum_class_FileHandle);
        Parrot_io_set_os_handle(interp, pmc, (PIOHANDLE)in);
        dummy = (void *)Parrot_io_stdhandle(interp, PIO_STDIN_FILENO, pmc);
    }

    if (PIO_INVALID_HANDLE != (PIOHANDLE)out) {
        PMC * const pmc = Parrot_pmc_new(interp, enum_class_FileHandle);
        Parrot_io_set_os_handle(interp, pmc, (PIOHANDLE)out);
        dummy = (void *)Parrot_io_stdhandle(interp, PIO_STDOUT_FILENO, pmc);
    }

    if (PIO_INVALID_HANDLE != (PIOHANDLE)err) {
        PMC * const pmc = Parrot_pmc_new(interp, enum_class_FileHandle);
        Parrot_io_set_os_handle(interp, pmc, (PIOHANDLE)err);
        dummy = (void *)Parrot_io_stdhandle(interp, PIO_STDERR_FILENO, pmc);
    }
    UNUSED(dummy);

    EMBED_API_CALLOUT(interp_pmc, interp)
}*/

/*

=item C<Parrot_Int Parrot_api_get_runtime_path(Parrot_PMC interp_pmc,
Parrot_String *runtime)>

Stores in C<runtime> the C<interp_pmc>'s running path. This function returns a
true value if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_get_runtime_path(Parrot_PMC interp_pmc,
        ARGOUT(Parrot_String *runtime))
{
    ASSERT_ARGS(Parrot_api_get_runtime_path)
    EMBED_API_CALLIN(interp_pmc, interp)
    *runtime = Parrot_get_runtime_path(interp);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_set_configuration_hash(Parrot_PMC interp_pmc,
Parrot_PMC confighash)>

Sets the C<interp_pmc>'s configuration hash passed in C<confighash>. This
function returns a true value if this call is successful and false value
otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_set_configuration_hash(Parrot_PMC interp_pmc, Parrot_PMC confighash)
{
    ASSERT_ARGS(Parrot_api_set_configuration_hash)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_set_config_hash_pmc(interp, confighash);
    Parrot_lib_update_paths_from_config_hash(interp);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_load_language(Parrot_PMC interp_pmc, Parrot_String
lang)>

Loads the HLL compiler libraries for C<lang> into the C<interp_pmc>. This
function returns a true value if this call is successful and false value
otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_load_language(Parrot_PMC interp_pmc, Parrot_String lang)
{
    ASSERT_ARGS(Parrot_api_load_language)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_load_language(interp, lang);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_get_compiler(Parrot_PMC interp_pmc, Parrot_String
type, Parrot_PMC *compiler)>

Gets the compiler PMC and stores it in C<compiler>. This function returns a true
value if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_get_compiler(Parrot_PMC interp_pmc, Parrot_String type,
    ARGOUT(Parrot_PMC *compiler))
{
    ASSERT_ARGS(Parrot_api_get_compiler)
    EMBED_API_CALLIN(interp_pmc, interp)
    *compiler = Parrot_get_compiler(interp, type);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<Parrot_Int Parrot_api_set_compiler(Parrot_PMC interp_pmc, Parrot_String
type, Parrot_PMC compiler)>

Sets the C<compiler> object for the C<type> files. This function returns a true
value if this call is successful and false value otherwise.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_set_compiler(Parrot_PMC interp_pmc, Parrot_String type,
    Parrot_PMC compiler)
{
    ASSERT_ARGS(Parrot_api_set_compiler)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_set_compiler(interp, type, compiler);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_toggle_gc(Parrot_PMC interp_pmc, Parrot_Int on)>

Turn Parrot's GC on or off.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_toggle_gc(Parrot_PMC interp_pmc, Parrot_Int on)
{
    ASSERT_ARGS(Parrot_api_toggle_gc)
    EMBED_API_CALLIN(interp_pmc, interp)
    if (on) {
        Parrot_unblock_GC_mark(interp);
        Parrot_unblock_GC_sweep(interp);
    }
    else {
        Parrot_block_GC_mark(interp);
        Parrot_block_GC_sweep(interp);
    }
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_reset_call_signature(Parrot_PMC interp_pmc,
Parrot_PMC ctx)>

Reset the call signature

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_reset_call_signature(Parrot_PMC interp_pmc, Parrot_PMC ctx)
{
    ASSERT_ARGS(Parrot_api_reset_call_signature)
    EMBED_API_CALLIN(interp_pmc, interp)
    STRING * const callcontext = Parrot_str_new(interp, "CallContext", 0);
    if (!VTABLE_isa(interp, ctx, callcontext))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Not a valid CallContext");
    VTABLE_morph(interp, ctx, PMCNULL);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int Parrot_api_wrap_pointer(Parrot_PMC interp_pmc, void *ptr,
Parrot_Int size, Parrot_PMC *pmc)>

Wrap a user data pointer into a Ptr PMC for passing into Parrot. This PMC
is designed such that Parrot will treat the pointer as being opaque and will
not attempt to dereference, examine, or manipulate it at all.

Optionally a C<size> parameter can be passed. If C<size> is greater than zero,
the size information will be included with the pointer for later use. If
C<size> is less than or equal to zero, it will be ignored and will not be
included in the PMC object.

=item C<Parrot_Int Parrot_api_unwrap_pointer(Parrot_PMC interp_pmc, Parrot_PMC
pmc, void ** ptr, Parrot_Int * size)>

Return a pointer from a PMC. This is typically used in conjunction with
C<Parrot_api_wrap_pointer> to return the original wrapped pointer value from
the PMC. Used with other PMC types besides C<Ptr> or C<PtrBuf> will have
undefined results, and should not be used or relied upon.

If the pointer was stored with size information, C<size> will contain that
size value. Otherwise, C<size> will be -1.

Notice that this function does not destroy or alter the data PMC.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_wrap_pointer(Parrot_PMC interp_pmc, ARGIN_NULLOK(void *ptr),
        Parrot_Int size, ARGOUT(Parrot_PMC *pmc))
{
    ASSERT_ARGS(Parrot_api_wrap_pointer)
    EMBED_API_CALLIN(interp_pmc, interp)
    PMC * ptr_pmc = NULL;
    if (size > 0) {
        ptr_pmc = Parrot_pmc_new(interp, enum_class_PtrBuf);
        VTABLE_set_integer_native(interp, ptr_pmc, size);
    }
    else
        ptr_pmc = Parrot_pmc_new(interp, enum_class_Ptr);
    VTABLE_set_pointer(interp, ptr_pmc, ptr);
    *pmc = ptr_pmc;
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_unwrap_pointer(Parrot_PMC interp_pmc, Parrot_PMC pmc,
        ARGOUT(void ** ptr), ARGOUT(Parrot_Int * size))
{
    ASSERT_ARGS(Parrot_api_unwrap_pointer)
    EMBED_API_CALLIN(interp_pmc, interp)
    *ptr = VTABLE_get_pointer(interp, pmc);
    if (pmc->vtable->base_type == enum_class_PtrBuf)
        *size = VTABLE_get_integer(interp, pmc);
    else
        *size = -1;
    EMBED_API_CALLOUT(interp_pmc, interp);
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

