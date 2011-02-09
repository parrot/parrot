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

#include "imc.h"
#include "parrot.h"
#include "parrot/extend.h"

/* HEADERIZER HFILE: compilers/imcc/imc.h */

/* HEADERIZER BEGIN: static */
/* HEADERIZER END: static */

struct _get_compreg_data {
    int is_pasm;
    int add_compreg;
    PMC * compiler;
    PMC * error;
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
imcc_get_pir_compreg_api(PMC * interp_pmc, int add_compreg, PMC **err)
{
    Interp * const interp = (Interp *) VTABLE_get_pointer(NULL, interp_pmc);
    PMC * compiler = PMCNULL;
    _get_compreg_data * const data =
            (_get_compreg_data *)Parrot_gc_allocate_fixed_size_storage(interp, sizeof(_get_compreg_data))
    data->is_pasm = 0;
    data->add_compreg = add_compreg;
    Parrot_ext_try(interp, get_compreg_pmc, get_compreg_handler, data);
    compiler = data->compiler;
    if (PMC_IS_NULL(compiler))
        *err = data->error;
    Parrot_gc_free_fixed_size_storage(interp, sizeof(_get_compreg_data), data);
    return compiler;
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
imcc_get_pasm_compreg_api(PMC * interp_pmc, int add_compreg, PMC **err)
{
    Interp * const interp = (Interp *) VTABLE_get_pointer(NULL, interp_pmc);
    PMC * compiler = PMCNULL;
    _get_compreg_data * const data =
            (_get_compreg_data *)Parrot_gc_allocate_fixed_size_storage(interp, sizeof(_get_compreg_data))
    data->is_pasm = 1;
    data->add_compreg = add_compreg;
    Parrot_ext_try(interp, get_compreg_pmc, get_compreg_handler, data);
    compiler = data->compiler;
    if (PMC_IS_NULL(compiler))
        *err = data->error;
    Parrot_gc_free_fixed_size_storage(interp, sizeof(_get_compreg_data), data);
    return compiler;
}

static void
get_compreg_pmc(PARROT_INTERP, _get_compreg_data * data)
{
    data->compiler = Parrot_pmc_new_init_int(interp, enum_class_IMCCompiler, is_pasm);
    if (data->add_compreg) {
        STRING * const name = VTABLE_get_string(interp, data->compiler);
        Parrot_set_compiler(interp, name, data->compiler);
    }
}

static void
get_compreg_handler(PARROT_INTERP, PMC * ex, _get_compreg_data * data)
{
    data->error = ex;
    data->compiler = PMCNULL;
}

struct _compile_file_data {
    PMC * compiler;
    STRING * file;
    PMC * pbc;
    PMC * error;
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
imcc_compile_file_api(PMC *interp_pmc, PMC *compiler, STRING *file, PMC **error)
{
    Interp * const interp = (Interp *) VTABLE_get_pointer(NULL, interp_pmc);
    PMC * pbc = PMCNULL;
    _compile_file_data * const data =
        (_compile_file_data *)Parrot_gc_allocate_fixed_size_storage(interp, sizeof(_compile_file_data));
    data->compiler = compiler;
    data->file = file;
    Parrot_ext_try(interp, compile_file, compile_file_handler, data);
    pbc = data->pbc;
    if (PMC_IS_NULL(pbc))
        *error = data->error;
    return pbc;
}

static void
compile_file(PARROT_INTERP, _compile_file_data * data)
{
    PMC * result = PMCNULL;
    STRING * const meth_name = Parrot_str_new(interp, "compile_file", 0);
    Parrot_pcc_invoke_method_from_c_args(interp, compiler, meth_name,
            "S->P", file, &result);
    data->pbc = result;
}

static void
compile_file_handler(PARROT_INTERP, PMC * ex, _compile_file_data * data)
{
    data->error = ex;
    data->pbc = PMCNULL;
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
void
imcc_preprocess_file_api(PMC *interp_pmc, PMC *compiler, STRING *file)
{
    /* TODO: Error handling with Parrot_ext_try */
    Interp * const interp = (Interp *) VTABLE_get_pointer(NULL, interp_pmc);
    STRING * const meth_name = Parrot_str_new(interp, "preprocess", 0);
    Parrot_pcc_invoke_method_from_c_args(interp, compiler, meth_name,
            "S->", file);
}

