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

/* HEADERIZER HFILE: include/imcc/api.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC * get_compreg_pmc(PARROT_INTERP, int is_pasm, int add_compreg)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_get_compreg_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#define GET_RAW_INTERP(p) Parrot_interp_get_from_pmc(p)
#define GET_INTERP(p) (PMC_IS_NULL(p) ? NULL : GET_RAW_INTERP(p))

#define IMCC_API_CALLIN(p, i)                    \
    Parrot_jump_buff env;                        \
    if (setjmp(env)) {                           \
        Interp * const __interp = GET_INTERP(p); \
        __interp->api_jmp_buf = NULL;            \
        return !__interp->exit_code;             \
    }                                            \
    else {                                       \
        Interp * const (i) = GET_INTERP(p);      \
        void * _oldtop = (i)->lo_var_ptr;        \
        if (_oldtop == NULL)                     \
            (i)->lo_var_ptr = &_oldtop;          \
        (i)->api_jmp_buf = &env;                 \
        {

#define IMCC_API_CALLOUT(p, i)                                     \
        }                                                          \
        (i)->api_jmp_buf = NULL;                                   \
        if (!_oldtop) {                                            \
            PARROT_ASSERT((i)->lo_var_ptr == &_oldtop);            \
            (i)->lo_var_ptr = NULL;                                \
        }                                                          \
        return 1;                                                  \
    }

/*

=item C<Parrot_Int imcc_get_pir_compreg_api(Parrot_PMC interp_pmc, int
add_compreg, Parrot_PMC *compiler)>

Get a registerable compiler object for the "PIR" language. If C<add_compreg>
is 1, register that compiler with Parrot under the name "PIR".

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
Parrot_Int
imcc_get_pir_compreg_api(Parrot_PMC interp_pmc, int add_compreg, ARGOUT(Parrot_PMC *compiler))
{
    ASSERT_ARGS(imcc_get_pir_compreg_api)
    IMCC_API_CALLIN(interp_pmc, interp)
    *compiler = get_compreg_pmc(interp, 0, add_compreg);
    if (PMC_IS_NULL(*compiler))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Could not create PIR compiler PMC");
    IMCC_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int imcc_get_pasm_compreg_api(Parrot_PMC interp_pmc, int
add_compreg, Parrot_PMC *compiler)>

Get a registerable compiler object for the "PASM" language. If C<add_compreg>
is 1, register that compiler with Parrot under the name "PASM".

=cut

*/

PARROT_EXPORT
Parrot_Int
imcc_get_pasm_compreg_api(Parrot_PMC interp_pmc, int add_compreg, ARGOUT(Parrot_PMC *compiler))
{
    ASSERT_ARGS(imcc_get_pasm_compreg_api)
    IMCC_API_CALLIN(interp_pmc, interp)
    *compiler = get_compreg_pmc(interp, 1, add_compreg);
    if (PMC_IS_NULL(*compiler))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Could not create PASM compiler PMC");
    IMCC_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<static PMC * get_compreg_pmc(PARROT_INTERP, int is_pasm, int
add_compreg)>

Get an IMCC compiler PMC. Register it under its preferred name if
C<add_compreg> is 1.

=cut
*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC *
get_compreg_pmc(PARROT_INTERP, int is_pasm, int add_compreg)
{
    ASSERT_ARGS(get_compreg_pmc)
    PMC * const comp = Parrot_pmc_new_init_int(interp, enum_class_IMCCompiler, is_pasm);
    if (add_compreg) {
        STRING * const name = VTABLE_get_string(interp, comp);
        Parrot_interp_set_compiler(interp, name, comp);
    }
    return comp;
}

/*

=item C<Parrot_Int imcc_compile_file_api(Parrot_PMC interp_pmc, Parrot_PMC
compiler, Parrot_String file, Parrot_PMC *pbc)>

Compile a file using the given IMCCompiler PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
Parrot_Int
imcc_compile_file_api(Parrot_PMC interp_pmc, Parrot_PMC compiler,
        Parrot_String file, ARGOUT(Parrot_PMC *pbc))
{
    ASSERT_ARGS(imcc_compile_file_api)
    IMCC_API_CALLIN(interp_pmc, interp)
    STRING * const meth_name = Parrot_str_new(interp, "compile_file", 0);
    PMC * result = PMCNULL;

    Parrot_pcc_invoke_method_from_c_args(interp, compiler, meth_name,
            "S->P", file, &result);

    *pbc = result;
    IMCC_API_CALLOUT(interp_pmc, interp)
}

/*

=item C<Parrot_Int imcc_preprocess_file_api(Parrot_PMC interp_pmc, Parrot_PMC
compiler, Parrot_String file)>

Preprocess the specified file only, using the given IMCCompiler PMC. Currently
the preprocessed text is dumped directly to stdout.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
Parrot_Int
imcc_preprocess_file_api(Parrot_PMC interp_pmc, Parrot_PMC compiler,
        Parrot_String file)
{
    ASSERT_ARGS(imcc_preprocess_file_api)
    IMCC_API_CALLIN(interp_pmc, interp)
    STRING * const meth_name = Parrot_str_new(interp, "preprocess", 0);
    Parrot_pcc_invoke_method_from_c_args(interp, compiler, meth_name,
            "S->", file);
    IMCC_API_CALLOUT(interp_pmc, interp)
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
