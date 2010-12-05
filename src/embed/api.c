/*
Copyright (C) 2010, Parrot Foundation.

=head1 NAME

src/embed/api.c - TO COME

=head1 DESCRIPTION

TO COME.

=cut

*/

#include "parrot/parrot.h"
#include "parrot/runcore_api.h"
#include "parrot/embed.h"
#include "parrot/api.h"
#include "embed_private.h"

/* HEADERIZER HFILE: include/parrot/api.h */

PARROT_API
Parrot_Int
Parrot_api_get_result(Parrot_PMC interp_pmc, ARGOUT(Parrot_Int *is_error),
        ARGOUT(Parrot_PMC * exception), ARGOUT(Parrot_Int *exit_code),
        ARGOUT(Parrot_String * errmsg))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    *exit_code = interp->exit_code;
    *exception = interp->final_exception;
    if (PMC_IS_NULL(exception)) {
        *is_error = 0;
        *errmsg = STRINGNULL;
    } else {
        *is_error = !interp->exit_code;
        *errmsg = VTABLE_get_string(interp, *exception);
    }
    interp->final_exception = PMCNULL;
    interp->exit_code = 0;
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_get_exception_backtrace(Parrot_PMC interp_pmc,
        Parrot_PMC exception, ARGOUT(Parrot_String * bt))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    STRING * const bts = Parrot_dbg_get_exception_backtrace(interp, exception);
    *bt = bts;
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_make_interpreter(Parrot_PMC parent, Parrot_Int flags,
        ARGIN_NULLOK(Parrot_Init_Args *args), ARGOUT(Parrot_PMC *interp))
{
    ASSERT_ARGS(Parrot_api_make_interpreter)
    int alt_stacktop;
    Parrot_Interp interp_raw;
    void *stacktop_ptr = &alt_stacktop;
    PMC * iglobals;
    const Parrot_Interp parent_raw = PMC_IS_NULL(parent) ? NULL : GET_RAW_INTERP(parent);
    interp_raw = allocate_interpreter(parent_raw, flags);
    if (args) {
        if (args->stacktop)
            stacktop_ptr = args->stacktop;
        if (args->gc_system)
            Parrot_gc_set_system_type(interp_raw, args->gc_system);
        if (args->gc_threshold)
            interp_raw->gc_threshold = args->gc_threshold;
        if (args->hash_seed)
            interp_raw->hash_seed = args->hash_seed;
    }
    initialize_interpreter(interp_raw, stacktop_ptr);
    iglobals = interp_raw->iglobals;
    *interp = VTABLE_get_pmc_keyed_int(
            interp_raw, interp_raw->iglobals, (Parrot_Int)IGLOBALS_INTERPRETER);
    return !PMC_IS_NULL(*interp);
}

PARROT_API
Parrot_Int
Parrot_api_set_runcore(Parrot_PMC interp_pmc, ARGIN(const char * corename),
        Parrot_UInt trace)
{
    ASSERT_ARGS(Parrot_api_set_runcore)
    EMBED_API_CALLIN(interp_pmc, interp)
    if (trace) {
        Parrot_pcc_trace_flags_on(interp, interp->ctx, trace);
        Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
    } else {
        if (!strcmp(corename, "slow") || !strcmp(corename, "bounds"))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
        else if (!strcmp(corename, "fast") ||
            !strcmp(corename, "jit") || !strcmp(corename, "function"))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "fast"));
        else if (!strcmp(corename, "exec"))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "exec"));
        else if (!strcmp(corename, "trace"))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "slow"));
        else if (!strcmp(corename, "profiling"))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "profiling"));
        else if (!strcmp(corename, "gcdebug"))
            Parrot_runcore_switch(interp, Parrot_str_new_constant(interp, "gcdebug"));
        else
            Parrot_ex_throw_from_c_args(interp, NULL, 1, "Invalid runcore type %s", corename);
    }
    EMBED_API_CALLOUT(interp_pmc, interp)
}

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

PARROT_API
Parrot_Int
Parrot_api_set_executable_name(Parrot_PMC interp_pmc, ARGIN(const char * name))
{
    ASSERT_ARGS(Parrot_api_set_executable_name)
    EMBED_API_CALLIN(interp_pmc, interp)
    STRING * const name_str = Parrot_str_new(interp, name, 0);
    PMC * const name_pmc = Parrot_pmc_new(interp, enum_class_String);
    VTABLE_set_string_native(interp, name_pmc, name_str);
    VTABLE_set_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_EXECUTABLE,
        name_pmc);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_destroy_interpreter(Parrot_PMC interp_pmc)
{
    ASSERT_ARGS(Parrot_api_destroy_interpreter)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_destroy(interp);
    Parrot_x_exit(interp, 0);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<PARROT_API Parrot_Int Parrot_api_load_bytecode_file(Parrot_PMC
interp_pmc, const char *filename, Parrot_PMC * pbc)>

Load a bytecode file and return a bytecode PMC.

=cut

*/

// TODO: This only works with the inital bytecode. After this we should use
//       Parrot_append_bytecode or something similar
PARROT_API
Parrot_Int
Parrot_api_load_bytecode_file(Parrot_PMC interp_pmc,
        ARGIN(const char *filename), ARGOUT(Parrot_PMC * pbc))
{
    ASSERT_ARGS(Parrot_api_load_bytecode_file)
    EMBED_API_CALLIN(interp_pmc, interp)
    PackFile * const pf = Parrot_pbc_read(interp, filename, 0);
    if (!pf)
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "Could not load packfile");
    do_sub_pragmas(interp, pf->cur_cs, PBC_PBC, NULL);
    *pbc = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
    VTABLE_set_pointer(interp, *pbc, pf);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_load_bytecode_bytes(Parrot_PMC interp_pmc,
        ARGIN(const unsigned char * const pbc), Parrot_Int bytecode_size,
        ARGOUT(Parrot_PMC * pbcpmc))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    PackFile * const pf = PackFile_new(interp, 0);
    if (!pf)
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "Could not create packfile");

    if (!PackFile_unpack(interp, pf, (const opcode_t *)pbc, bytecode_size))
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "could not unpack packfile");
    do_sub_pragmas(interp, pf->cur_cs, PBC_PBC, NULL);
    *pbcpmc = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
    VTABLE_set_pointer(interp, *pbcpmc, pf);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

// Load the bytecode into the interpreter, but don't execute it
// TODO: This only works with the inital bytecode. After this we should use
//       Parrot_append_bytecode or something similar
PARROT_API
Parrot_Int
Parrot_api_ready_bytecode(Parrot_PMC interp_pmc, Parrot_PMC pbc,
        ARGOUT(Parrot_PMC *main_sub))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    PackFile * const pf = (PackFile *)VTABLE_get_pointer(interp, pbc);

    /* Debugging mode nonsense. */
    if (Interp_debug_TEST(interp, PARROT_START_DEBUG_FLAG)) {
         Parrot_io_eprintf(interp, "*** Parrot VM: %Ss core ***\n",
                 interp->run_core->name);
    }

    if (!pf)
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "Could not get packfile");
    if (pf->cur_cs != NULL)
        Parrot_pbc_load(interp, pf);
    PackFile_fixup_subs(interp, PBC_IMMEDIATE, NULL);
    PackFile_fixup_subs(interp, PBC_POSTCOMP, NULL);
    PackFile_fixup_subs(interp, PBC_MAIN, NULL);
    *main_sub = Parrot_pcc_get_sub(interp, CURRENT_CONTEXT(interp));
    Parrot_pcc_set_constants(interp, interp->ctx, interp->code->const_table);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_run_bytecode(Parrot_PMC interp_pmc, Parrot_PMC pbc,
    Parrot_PMC mainargs)
{
    ASSERT_ARGS(Parrot_api_run_bytecode)
    EMBED_API_CALLIN(interp_pmc, interp)
    PMC * main_sub = NULL;

    PackFile * const pf = (PackFile *)VTABLE_get_pointer(interp, pbc);

    /* Debugging mode nonsense. */
    if (Interp_debug_TEST(interp, PARROT_START_DEBUG_FLAG)) {
         Parrot_io_eprintf(interp, "*** Parrot VM: %Ss core ***\n",
                 interp->run_core->name);
    }

    if (!pf)
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "Could not get packfile");
    if (pf->cur_cs != NULL)
        Parrot_pbc_load(interp, pf);
    PackFile_fixup_subs(interp, PBC_IMMEDIATE, NULL);
    PackFile_fixup_subs(interp, PBC_POSTCOMP, NULL);
    PackFile_fixup_subs(interp, PBC_MAIN, NULL);
    main_sub = Parrot_pcc_get_sub(interp, CURRENT_CONTEXT(interp));

    /* if no sub was marked being :main, we create a dummy sub with offset 0 */

    if (!main_sub)
        main_sub = set_current_sub(interp);

    Parrot_pcc_set_sub(interp, CURRENT_CONTEXT(interp), NULL);
    Parrot_pcc_set_constants(interp, interp->ctx, interp->code->const_table);

    VTABLE_set_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_ARGV_LIST, mainargs);
    Parrot_ext_call(interp, main_sub, "P->", mainargs);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_disassemble_bytecode(Parrot_PMC interp_pmc, Parrot_PMC pbc,
        ARGIN(const char * const outfile), Parrot_Int opts)
{
    EMBED_API_CALLIN(interp_pmc, interp)
    PackFile * const pf = (PackFile *)VTABLE_get_pointer(interp, pbc);
    if (!pf)
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "Could not get packfile");
    if (pf->cur_cs != NULL)
        Parrot_pbc_load(interp, pf);
    Parrot_disassemble(interp, outfile, (Parrot_disassemble_options)opts);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_build_argv_array(Parrot_PMC interp_pmc, Parrot_Int argc,
        ARGIN(char ** argv), ARGOUT(Parrot_PMC * args))
{
    ASSERT_ARGS(Parrot_api_build_argv_array)
    EMBED_API_CALLIN(interp_pmc, interp)
    PMC * const userargv = Parrot_pmc_new(interp, enum_class_ResizableStringArray);
    Parrot_Int i;

    for (i = 0; i < argc; ++i) {
        /* Run through argv, adding everything to the array */
        STRING * const arg = Parrot_str_new_init(interp, argv[i], strlen(argv[i]),
                Parrot_utf8_encoding_ptr, PObj_external_FLAG);
        VTABLE_push_string(interp, userargv, arg);
    }
    *args = userargv;
    EMBED_API_CALLOUT(interp_pmc, interp)
}

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

PARROT_API
Parrot_Int
Parrot_api_set_output_file(Parrot_PMC interp_pmc,
        ARGIN_NULLOK(const char * filename))
{
    ASSERT_ARGS(Parrot_api_set_output_file)
    EMBED_API_CALLIN(interp_pmc, interp)
    if (!filename && !interp->output_file)
        interp->output_file = "-";
    else
        interp->output_file = filename;
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_add_library_search_path(Parrot_PMC interp_pmc,
        ARGIN(const char *path))
{
    //ASSERT_ARGS(Parrot_api_add_library_search_path)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_lib_add_path_from_cstring(interp, path, PARROT_LIB_PATH_LIBRARY);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_add_include_search_path(Parrot_PMC interp_pmc,
        ARGIN(const char *path))
{
    //ASSERT_ARGS(Parrot_api_add_include_search_path)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_lib_add_path_from_cstring(interp, path, PARROT_LIB_PATH_INCLUDE);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_add_dynext_search_path(Parrot_PMC interp_pmc,
        ARGIN(const char *path))
{
    //ASSERT_ARGS(Parrot_api_add_dynext_search_path)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_lib_add_path_from_cstring(interp, path, PARROT_LIB_PATH_DYNEXT);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<PARROT_API Parrot_Int Parrot_api_set_stdhandles(Parrot_PMC interp_pmc,
Parrot_Int stdin, Parrot_Int stdout, Parrot_Int stderr)>

Set the std file descriptors for the embedded interpreter. Any file descriptor
passed as argument and set to C<PIO_INVALID_HANDLE> is ignored.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_set_stdhandles(Parrot_PMC interp_pmc, Parrot_Int stdin,
        Parrot_Int stdout, Parrot_Int stderr)
{
    ASSERT_ARGS(Parrot_api_set_stdhandles)
    EMBED_API_CALLIN(interp_pmc, interp)
    void *dummy;

    if(PIO_INVALID_HANDLE != (PIOHANDLE)stdin) {
        PMC * const pmc = Parrot_pmc_new(interp, enum_class_FileHandle);
        Parrot_io_set_os_handle(interp, pmc, (PIOHANDLE)stdin);
        dummy = (void *)Parrot_io_stdhandle(interp,PIO_STDIN_FILENO,pmc);
    }

    if(PIO_INVALID_HANDLE != (PIOHANDLE)stdout) {
        PMC * const pmc = Parrot_pmc_new(interp, enum_class_FileHandle);
        Parrot_io_set_os_handle(interp, pmc, (PIOHANDLE)stdout);
        dummy = (void *)Parrot_io_stdhandle(interp,PIO_STDOUT_FILENO,pmc);
    }

    if(PIO_INVALID_HANDLE != (PIOHANDLE)stderr) {
        PMC * const pmc = Parrot_pmc_new(interp, enum_class_FileHandle);
        Parrot_io_set_os_handle(interp, pmc, (PIOHANDLE)stderr);
        dummy = (void *)Parrot_io_stdhandle(interp,PIO_STDERR_FILENO,pmc);
    }

    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_get_runtime_path(Parrot_PMC interp_pmc,
        ARGOUT(Parrot_String *runtime))
{
    EMBED_API_CALLIN(interp_pmc, interp)
    *runtime = Parrot_get_runtime_path(interp);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_set_configuration_hash(Parrot_PMC interp_pmc, Parrot_PMC confighash)
{
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_set_config_hash_pmc(interp, confighash);
    Parrot_lib_update_paths_from_config_hash(interp);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*
This is an evil hack to provide a wrapper around IMCC to catch unhandled
exceptions without having to assume IMCC is linked in with libparrot. Delete
this as soon as we don't need it anymore.
*/

PARROT_API
Parrot_Int
Parrot_api_wrap_imcc_hack(Parrot_PMC interp_pmc, const char * sourcefile,
    int argc, const char **argv, Parrot_PMC* bytecodepmc, int *result,
    imcc_hack_func_t func)
{
    EMBED_API_CALLIN(interp_pmc, interp)
    *result = func(interp_pmc, sourcefile, argc, argv, bytecodepmc);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
