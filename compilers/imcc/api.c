/*
 *
 * IMCC call-in routines for use with the Parrot embedding API
 *
 * Copyright (C) 2011, Parrot Foundation.
 */

/*

=head1 NAME

compilers/imcc/api.c

=head1 DESCRIPTION

IMCC call-in routines for use with the Parrot embedding API

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "imcc/api.h"
#include "imc.h"

struct _get_compreg_data {
    int is_pasm;
    int add_compreg;
    PMC * compiler;
    PMC * error;
};

struct _compile_file_data {
    PMC * compiler;
    STRING * file;
    PMC * pbc;
    PMC * error;
};

/* HEADERIZER HFILE: include/imcc/api.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void compile_file(PARROT_INTERP, struct _compile_file_data * data)
        __attribute__nonnull__(1);

static void compile_file_handler(PARROT_INTERP,
    PMC * ex,
    struct _compile_file_data * data)
        __attribute__nonnull__(1);

static void get_compreg_handler(PARROT_INTERP,
    PMC * ex,
    struct _get_compreg_data * data)
        __attribute__nonnull__(1);

static void get_compreg_pmc(PARROT_INTERP, struct _get_compreg_data * data)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_compile_file __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_compile_file_handler __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_compreg_handler __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_compreg_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */



PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
imcc_get_pir_compreg_api(Parrot_PMC interp_pmc, int add_compreg, Parrot_PMC *err)
{
    Interp * const interp = (Interp *) VTABLE_get_pointer(NULL, interp_pmc);
    PMC * compiler = PMCNULL;
    struct _get_compreg_data * const data = (struct _get_compreg_data *)
            Parrot_gc_allocate_fixed_size_storage(interp, sizeof(struct _get_compreg_data));
    data->is_pasm = 0;
    data->add_compreg = add_compreg;
    Parrot_ext_try(interp, get_compreg_pmc, get_compreg_handler, data);
    compiler = data->compiler;
    if (PMC_IS_NULL(compiler))
        *err = data->error;
    Parrot_gc_free_fixed_size_storage(interp, sizeof(struct _get_compreg_data), data);
    return compiler;
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
imcc_get_pasm_compreg_api(Parrot_PMC interp_pmc, int add_compreg,
        Parrot_PMC *err)
{
    Interp * const interp = (Interp *) VTABLE_get_pointer(NULL, interp_pmc);
    PMC * compiler = PMCNULL;
    struct _get_compreg_data * const data = (struct _get_compreg_data *)
            Parrot_gc_allocate_fixed_size_storage(interp, sizeof(struct _get_compreg_data));
    data->is_pasm = 1;
    data->add_compreg = add_compreg;
    Parrot_ext_try(interp, get_compreg_pmc, get_compreg_handler, data);
    compiler = data->compiler;
    if (PMC_IS_NULL(compiler))
        *err = data->error;
    Parrot_gc_free_fixed_size_storage(interp, sizeof(struct _get_compreg_data), data);
    return compiler;
}

static void
get_compreg_pmc(PARROT_INTERP, struct _get_compreg_data * data)
{
    data->compiler = Parrot_pmc_new_init_int(interp, enum_class_IMCCompiler, data->is_pasm);
    if (data->add_compreg) {
        STRING * const name = VTABLE_get_string(interp, data->compiler);
        Parrot_set_compiler(interp, name, data->compiler);
    }
}

static void
get_compreg_handler(PARROT_INTERP, PMC * ex, struct _get_compreg_data * data)
{
    data->error = ex;
    data->compiler = PMCNULL;
}



PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
imcc_compile_file_api(Parrot_PMC interp_pmc, Parrot_PMC compiler,
        Parrot_String file, Parrot_PMC *error)
{
    Interp * const interp = (Interp *) VTABLE_get_pointer(NULL, interp_pmc);
    PMC * pbc = PMCNULL;
    struct _compile_file_data * const data = (struct _compile_file_data *)
            Parrot_gc_allocate_fixed_size_storage(interp, sizeof(struct _compile_file_data));
    data->compiler = compiler;
    data->file = file;
    Parrot_ext_try(interp, compile_file, compile_file_handler, data);
    pbc = data->pbc;
    if (PMC_IS_NULL(pbc))
        *error = data->error;
    Parrot_gc_free_fixed_size_storage(interp, sizeof(struct _compile_file_data), data);
    return pbc;
}

static void
compile_file(PARROT_INTERP, struct _compile_file_data * data)
{
    PMC * result = PMCNULL;
    STRING * const meth_name = Parrot_str_new(interp, "compile_file", 0);
    Parrot_pcc_invoke_method_from_c_args(interp, data->compiler, meth_name,
            "S->P", data->file, &result);
    data->pbc = result;
}

static void
compile_file_handler(PARROT_INTERP, PMC * ex, struct _compile_file_data * data)
{
    data->error = ex;
    data->pbc = PMCNULL;
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void
imcc_preprocess_file_api(Parrot_PMC interp_pmc, Parrot_PMC compiler,
        Parrot_String file)
{
    /* TODO: Error handling with Parrot_ext_try */
    Interp * const interp = (Interp *) VTABLE_get_pointer(NULL, interp_pmc);
    STRING * const meth_name = Parrot_str_new(interp, "preprocess", 0);
    Parrot_pcc_invoke_method_from_c_args(interp, compiler, meth_name,
            "S->", file);
}

