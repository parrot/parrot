#include "parrot/parrot.h"
#include "parrot/api.h"

#define GET_RAW_INTERP(p) ((Parrot_ParrotInterpreter_attributes)(p)->data)->interp;
#define EMBED_API_CALLIN(p, i) \
    jmp_buf _env; \
    Interp * (i) = PMC_IS_NULL(p) ? NULL : GET_RAW_INTERP(p); \
    if (!(i)) \
        return 0; \
    if (setjmp(_env)) { \
        (i)->api_jmp_buf = NULL; \
        return 0; \
    } else { \
        (i)->api_jmp_buf = _env;
#define EMBED_API_CALLOUT(p, i) \
        return 1; \
    }

PARROT_API
PARROT_CANNOT_RETURN_NULL
PARROT_MALLOC
INTVAL
Parrot_api_make_interpreter(ARGIN_NULLOK(PMC *parent), INTVAL flags, ARGIN_NULLOK(Parrot_Init_Args *args), ARGOUT(PMC **interp))
{
    ASSERT_ARGS(Parrot_api_make_interpreter)
    int alt_stacktop;
    void *stacktop_ptr = &alt_stacktop;
    Parrot_set_config_hash();
    {
        Parrot_Interp * const parent_raw = PMC_IS_NULL(parent) ? NULL : GET_RAW_INTERP(parent);
        Parrot_Interp * const interp_raw = allocate_interpreter(parent_raw, flags);
        if (args) {
            if (args->stack_top)
                stacktop_ptr = args->stacktop;
            if (args->gc_system)
                interp->gc_sys->sys_type = args->gc_system;
            if (args->gc_threshold)
                interp->gc_threshold = args->gc_threshold;
            if (args->hash_seed)
                interp->hash_seed = args->hash_seed;
        }
    }
    initialize_interpreter(interp_raw, stacktop);
    *interp_pmc = VTABLE_get_pmc_keyed_int(interp, iglobals, (INTVAL)IGLOBALS_INTERPRETER);
    return !PMC_IS_NULL(*interp);
}

PARROT_API
INTVAL
Parrot_api_set_runcore(ARGIN(PMC *interp_pmc), Parrot_Run_core_t core, Parrot_Uint trace)
{
    ASSERT_ARGS(Parrot_api_set_runcore)
    if (trace)
        core = PARROT_SLOW_CORE;
    EMBED_API_CALLIN(interp_pmc, interp)
    Parrot_set_trace(interp, (Parrot_trace_flags)trace);
    Parrot_set_run_core(interp, core);
    EMBED_API_CALLOUT(interp_pmc, interp)
}

PARROT_API
INTVAL
Parrot_api_set_executable_name(ARGIN(PMC *interp_pmc), ARGIN(Parrot_String) name)
{
    ASSERT_ARGS(Parrot_api_set_executable_name)
    EMBED_API_CALLIN(interp_pmc, interp);
    PMC * const name_pmc = Parrot_pmc_new(interp, enum_class_String);
    VTABLE_set_string_native(interp, name_pmc, name);
    VTABLE_set_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_EXECUTABLE,
        name_pmc);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
void
Parrot_api_destroy_interpreter(ARGIN(PMC *interp_pmc))
{
    ASSERT_ARGS(Parrot_api_destroy_interpreter)
    EMBED_API_CALLIN(interp_pmc, interp);
    Parrot_destroy(interp);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

PARROT_API
void
Parrot_api_exit_interpreter(ARGIN(PMC *interp_pmc))
{
    ASSERT_ARGS(Parrot_api_exit_interpreter)
    EMBED_API_CALLIN(interp_pmc, interp);
    Parrot_exit(interp);
    EMBED_API_CALLOUT(interp_pmc, interp);
}

/*

=item C<int Parrot_api_load_bytecode_file(PARROT_INTERP, const char *filename)>

Load a bytecode file into the interpreter by name. Returns C<0> on failure,
Success otherwise. Writes error information to the interpreter's error file
stream.

=cut

*/

PARROT_API
INTVAL
Parrot_api_load_bytecode_file(ARGMOD(PMC *interp_pmc), ARGIN(const char *filename), ARGOUT(PMC *)
{
    ASSERT_ARGS(Parrot_api_load_bytecode_file)
    EMBED_API_CALLIN(interp_pmc, interp);
    *result = 0;
    PackFile * const pf = Parrot_pbc_read(interp, filename, 0);
    if (!pf)
        return 1;
    Parrot_pbc_load(interp, pf);
    *result = 1;
    EMBED_API_CALLOUT(interp_pmc, interp);
}

