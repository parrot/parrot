#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/api.h"
#include "embed_private.h"

/* HEADERIZER HFILE: include/parrot/api.h */

PARROT_API
Parrot_Int
Parrot_api_get_last_error(ARGMOD(PMC * interp_pmc), ARGOUT(Parrot_String * errmsg))
{
    EMBED_API_CALLIN(interp_pmc, interp);
    *errmsg = Parrot_str_new(interp, "Generic Error Message", 0);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_make_interpreter(ARGIN_NULLOK(PMC *parent), Parrot_Int flags, ARGIN_NULLOK(Parrot_Init_Args *args), ARGOUT(PMC **interp))
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
    *interp = VTABLE_get_pmc_keyed_int(interp_raw, interp_raw->iglobals, (Parrot_Int)IGLOBALS_INTERPRETER);
    return !PMC_IS_NULL(*interp);
}

PARROT_API
Parrot_Int
Parrot_api_set_runcore(ARGIN(PMC *interp_pmc), const char * corename, Parrot_UInt trace)
{
    ASSERT_ARGS(Parrot_api_set_runcore)
    EMBED_API_CALLIN(interp_pmc, interp)
    if (trace) {
        Parrot_set_trace(interp, (Parrot_trace_flags)trace);
        Parrot_set_run_core(interp, PARROT_SLOW_CORE);
    } else {
        Parrot_Run_core_t core = PARROT_SLOW_CORE;
        if (!strcmp(corename, "slow"))
            core = PARROT_SLOW_CORE;
        else if (!strcmp(corename, "fast") || !strcmp(corename, "jit") || !strcmp(corename, "function"))
            core = PARROT_FAST_CORE;
        else if (!strcmp(corename, "exec"))
            core = PARROT_EXEC_CORE;
        else if (!strcmp(corename, "trace"))
            core = PARROT_SLOW_CORE; // !!!
        else if (!strcmp(corename, "profiling"))
            core = PARROT_PROFILING_CORE;
        else if (!strcmp(corename, "gcdebug"))
            core = PARROT_GC_DEBUG_CORE;
        else
            Parrot_ex_throw_from_c_args(interp, NULL, 1, "Invalid runcore type %s", corename);
        Parrot_set_trace(interp, (Parrot_trace_flags)trace);
        Parrot_set_run_core(interp, core);
    }
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_debug_flag(ARGMOD(PMC *interp_pmc), Parrot_Int flags, Parrot_Int set)
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
Parrot_api_flag(ARGMOD(PMC *interp_pmc), Parrot_Int flags, Parrot_Int set)
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
Parrot_api_set_executable_name(ARGMOD(PMC *interp_pmc), ARGIN(const char * name))
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
Parrot_api_destroy_interpreter(ARGIN(PMC *interp_pmc))
{
    ASSERT_ARGS(Parrot_api_destroy_interpreter)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_destroy(interp);
    Parrot_exit(interp, 0);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<PARROT_API Parrot_Int Parrot_api_load_bytecode_file(PMC *interp_pmc,
const char *filename, PMC **pbc)>

Load a bytecode file and return a bytecode PMC.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_load_bytecode_file(ARGMOD(PMC *interp_pmc), ARGIN(const char *filename), ARGOUT(PMC **pbc))
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
Parrot_api_load_bytecode_bytes(ARGMOD(PMC *interp_pmc), ARGIN(const unsigned char * const pbc), Parrot_Int bytecode_size, ARGOUT(PMC **pbcpmc))
{
    EMBED_API_CALLIN(interp_pmc, interp);
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

PARROT_API
Parrot_Int
Parrot_api_run_bytecode(ARGMOD(PMC *interp_pmc), ARGIN(PMC *pbc), ARGIN(PMC *mainargs))
{
    ASSERT_ARGS(Parrot_api_run_bytecode)
    EMBED_API_CALLIN(interp_pmc, interp)
    PMC * main_sub = NULL;

    PackFile * const pf = (PackFile *)VTABLE_get_pointer(interp, pbc);
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

    Parrot_ext_call(interp, main_sub, "P->", mainargs);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_disassemble_bytecode(ARGMOD(PMC *interp_pmc), ARGIN(PMC *pbc), ARGIN(const char * const outfile), Parrot_Int opts)
{
    EMBED_API_CALLIN(interp_pmc, interp);
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
Parrot_api_build_argv_array(ARGMOD(PMC *interp_pmc), Parrot_Int argc, ARGIN(char **argv), ARGOUT(PMC **args))
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
Parrot_api_set_warnings(ARGMOD(PMC *interp_pmc), Parrot_Int flags)
{
    ASSERT_ARGS(Parrot_api_set_warnings)
    EMBED_API_CALLIN(interp_pmc, interp)
    /* Activates the given warnings.  (Macro from warnings.h.) */
    PARROT_WARNINGS_on(interp, flags);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_set_output_file(ARGMOD(PMC *interp_pmc), ARGIN_NULLOK(const char * filename))
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
Parrot_api_add_library_search_path(ARGMOD(PMC *interp_pmc), ARGIN(const char *path))
{
    //ASSERT_ARGS(Parrot_api_add_library_search_path)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_lib_add_path_from_cstring(interp, path, PARROT_LIB_PATH_LIBRARY);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_add_include_search_path(ARGMOD(PMC *interp_pmc), ARGIN(const char *path))
{
    //ASSERT_ARGS(Parrot_api_add_include_search_path)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_lib_add_path_from_cstring(interp, path, PARROT_LIB_PATH_INCLUDE);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
Parrot_Int
Parrot_api_add_dynext_search_path(ARGMOD(PMC *interp_pmc), ARGIN(const char *path))
{
    //ASSERT_ARGS(Parrot_api_add_dynext_search_path)
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_lib_add_path_from_cstring(interp, path, PARROT_LIB_PATH_DYNEXT);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<PARROT_API Parrot_Int Parrot_api_set_stdhandles(PMC *interp_pmc,
Parrot_Int stdin, Parrot_Int stdout, Parrot_Int stderr)>

Set the std file descriptors for the embedded interpreter. Any file descriptor
passed as argument and set to C<PIO_INVALID_HANDLE> is ignored.

=cut

*/

PARROT_API
Parrot_Int
Parrot_api_set_stdhandles(ARGIN(PMC *interp_pmc), Parrot_Int stdin, Parrot_Int stdout, Parrot_Int stderr)
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
Parrot_api_get_runtime_path(Parrot_PMC interp_pmc, ARGOUT(Parrot_String *runtime))
{
    EMBED_API_CALLIN(interp_pmc, interp);
    *runtime = Parrot_get_runtime_path(interp);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
Parrot_Int
Parrot_api_set_configuration_hash(Parrot_PMC interp_pmc, Parrot_PMC confighash)
{
    EMBED_API_CALLIN(interp_pmc, interp);
    Parrot_set_config_hash_pmc(interp, confighash);
    Parrot_lib_update_paths_from_config_hash(interp);
    EMBED_API_CALLOUT(interp_pmc, interp);
}


