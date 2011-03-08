/* Copyright (C) 2010, Parrot Foundation.



=head1 NAME

src/nci/libffi.c - LibFFI Native Call Interface frame builder

=head1 DESCRIPTION

This file implements a native call frame (thunk) factory using libffi.

=head2 Functions

=over 4

=cut

*/
#include "parrot/parrot.h"
#include "pmc/pmc_nci.h"
#include "pmc/pmc_unmanagedstruct.h"
#include "pmc/pmc_managedstruct.h"

#if (INTVAL_SIZE == 4)
#  define ffi_type_parrot_intval ffi_type_sint32
#elif(INTVAL_SIZE == 8)
#  define ffi_type_parrot_intval ffi_type_sint64
#else
#  error "unhandled INTVAL_SIZE value"
#endif

#if (NUMVAL_SIZE == 4)
#  define ffi_type_parrot_numval ffi_type_float
#elif(NUMVAL_SIZE == 8)
#  define ffi_type_parrot_numval ffi_type_double
#elif(NUMVAL_SIZE == 12)
#  define ffi_type_parrot_numval ffi_type_longdouble
#else
#  error "unhandled NUMVAL_SIZE value"
#endif

typedef struct ffi_thunk_t {
    ffi_cif    cif;
    ffi_type **arg_types;

    ffi_cif    pcc_cif;
    ffi_type **pcc_arg_types;
} ffi_thunk_t;

typedef struct pmc_holder_t {
    PMC  *pmc;
    void *ptr;
    union {
        short  s;
        int    i;
        long   l;
        void  *p;
    };
} pmc_holder_t;

typedef struct  parrot_var_t {
    INTVAL    i;
    FLOATVAL  n;
    STRING   *s;
    PMC      *p;
} parrot_var_t;

/* HEADERIZER HFILE: include/parrot/nci.h */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
static PMC * build_ffi_thunk(PARROT_INTERP,
    SHIM(PMC *user_data),
    ARGIN(PMC *sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

static void call_ffi_thunk(PARROT_INTERP,
    ARGMOD(PMC *nci_pmc),
    ARGMOD(PMC *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*nci_pmc)
        FUNC_MODIFIES(*self);

PARROT_CANNOT_RETURN_NULL
static PMC * clone_ffi_thunk(PARROT_INTERP,
    ARGIN(PMC *thunk),
    ARGIN(void *_thunk_data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void free_ffi_thunk(PARROT_INTERP,
    SHIM(void *thunk_func),
    ARGFREE(void *thunk_data))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static PMC * init_thunk_pmc(PARROT_INTERP, ARGMOD(ffi_thunk_t *thunk_data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*thunk_data);

PARROT_CAN_RETURN_NULL
static ffi_type * nci_to_ffi_type(PARROT_INTERP, nci_sig_elem_t nci_t)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_build_ffi_thunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sig))
#define ASSERT_ARGS_call_ffi_thunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(nci_pmc) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_clone_ffi_thunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(thunk) \
    , PARROT_ASSERT_ARG(_thunk_data))
#define ASSERT_ARGS_free_ffi_thunk __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_init_thunk_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(thunk_data))
#define ASSERT_ARGS_nci_to_ffi_type __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<void Parrot_nci_libffi_register(PARROT_INTERP)>

Register the LibFFI frame builder with the NCI subsystem.

=cut

*/

void
Parrot_nci_libffi_register(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_nci_libffi_register)
    PMC *iglobals = interp->iglobals;
    PMC *nci_framebuilder_callback = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
    PMC *nci_framebuilder_userdata = PMCNULL;

    if (PMC_IS_NULL(iglobals))
        PANIC(interp, "iglobals isn't created yet");

    SETATTR_UnManagedStruct_ptr(interp, nci_framebuilder_callback, (void *)build_ffi_thunk);

    VTABLE_set_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FB_CB, nci_framebuilder_callback);
    VTABLE_set_pmc_keyed_int(interp, iglobals, IGLOBALS_NCI_FB_UD, nci_framebuilder_userdata);
    Parrot_warn_experimental(interp, "NCI_FB_CB and NCI_DB_UD in iglobals are experimental");
}


/*

=item C<static PMC * init_thunk_pmc(PARROT_INTERP, ffi_thunk_t *thunk_data)>

Properly encapsulate C<thunk_data> in a C<ManagedStruct>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static PMC *
init_thunk_pmc(PARROT_INTERP, ARGMOD(ffi_thunk_t *thunk_data))
{
    ASSERT_ARGS(init_thunk_pmc)
    PMC *thunk = Parrot_pmc_new(interp, enum_class_ManagedStruct);
    SETATTR_ManagedStruct_ptr(interp, thunk, (void *)call_ffi_thunk);
    SETATTR_ManagedStruct_custom_clone_func(interp, thunk, clone_ffi_thunk);
    SETATTR_ManagedStruct_custom_clone_priv(interp, thunk, thunk_data);
    SETATTR_ManagedStruct_custom_free_func(interp, thunk, free_ffi_thunk);
    SETATTR_ManagedStruct_custom_free_priv(interp, thunk, thunk_data);
    return thunk;
}


/*

=item C<static PMC * build_ffi_thunk(PARROT_INTERP, PMC *user_data, PMC *sig)>

Build a C<ManagedStruct>-encapsulated C<ffi_thunk_t> from C<sig_str>.
Suitable for use as C<IGLOBALS_NCI_FB_CB>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static PMC *
build_ffi_thunk(PARROT_INTERP, SHIM(PMC *user_data), ARGIN(PMC *sig))
{
    ASSERT_ARGS(build_ffi_thunk)
    ffi_thunk_t *thunk_data = mem_gc_allocate_zeroed_typed(interp, ffi_thunk_t);
    PMC         *thunk      = init_thunk_pmc(interp, thunk_data);

    STRING *pcc_ret_sig, *pcc_params_sig;
    Parrot_nci_sig_to_pcc(interp, sig, &pcc_params_sig, &pcc_ret_sig);

    /* generate Parrot_pcc_fill_params_from_c_args dynamic call infrastructure */
    {
        INTVAL     argc  = Parrot_str_length(interp, pcc_params_sig) + 3;
        ffi_type **arg_t =  thunk_data->pcc_arg_types =
                            mem_gc_allocate_n_zeroed_typed(interp, argc, ffi_type *);
        int        i;

        arg_t[0] = &ffi_type_pointer; /* interp */
        arg_t[1] = &ffi_type_pointer; /* call object */
        arg_t[2] = &ffi_type_pointer; /* pcc signature */
        for (i = 3; i < argc; i++)
            arg_t[i] = &ffi_type_pointer; /* INSP pointer */

        if (ffi_prep_cif(&thunk_data->pcc_cif, FFI_DEFAULT_ABI, argc, &ffi_type_void, arg_t) !=
            FFI_OK)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
                                        "invalid ffi signature");
    }

    /* generate target function dynamic call infrastructure */
    {
        INTVAL     argc  = VTABLE_elements(interp, sig) - 1;
        ffi_type  *ret_t = nci_to_ffi_type(interp,
                                (nci_sig_elem_t)VTABLE_get_integer_keyed_int(interp, sig, 0));
        ffi_type **arg_t =  thunk_data->arg_types =
                            mem_gc_allocate_n_zeroed_typed(interp, argc, ffi_type *);
        int        i;

        for (i = 0; i < argc; i++)
            arg_t[i] = nci_to_ffi_type(interp,
                            (nci_sig_elem_t)VTABLE_get_integer_keyed_int(interp, sig, i + 1));

        if (ffi_prep_cif(&thunk_data->cif, FFI_DEFAULT_ABI, argc, ret_t, arg_t) != FFI_OK)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
                                        "invalid ffi signature");
    }

    return thunk;
}


/*

=item C<static ffi_type * nci_to_ffi_type(PARROT_INTERP, nci_sig_elem_t nci_t)>

Convert an NCI type specification into the corresponding LibFFI type.

=cut

*/

PARROT_CAN_RETURN_NULL
static ffi_type *
nci_to_ffi_type(PARROT_INTERP, nci_sig_elem_t nci_t)
{
    ASSERT_ARGS(nci_to_ffi_type)
    switch (nci_t) {
      case enum_nci_sig_void:   return &ffi_type_void;
      case enum_nci_sig_null:   return &ffi_type_pointer;
      case enum_nci_sig_interp: return &ffi_type_pointer;

      case enum_nci_sig_float:  return &ffi_type_float;
      case enum_nci_sig_double: return &ffi_type_double;
      case enum_nci_sig_numval: return &ffi_type_parrot_numval;

      case enum_nci_sig_char:   return &ffi_type_schar;
      case enum_nci_sig_short:  return &ffi_type_sshort;
      case enum_nci_sig_int:    return &ffi_type_sint;
      case enum_nci_sig_long:   return &ffi_type_slong;
      case enum_nci_sig_intval: return &ffi_type_parrot_intval;

      case enum_nci_sig_string:
      case enum_nci_sig_cstring:
      case enum_nci_sig_bufref:
                                return &ffi_type_pointer;

      case enum_nci_sig_ptr:
      case enum_nci_sig_pmc:
      case enum_nci_sig_pmcinv:
      case enum_nci_sig_ptrref:
      case enum_nci_sig_shortref:
      case enum_nci_sig_intref:
      case enum_nci_sig_longref:
                                return &ffi_type_pointer;

      default:
                                return NULL;
    }
}


/*

=item C<static void call_ffi_thunk(PARROT_INTERP, PMC *nci_pmc, PMC *self)>

Call the native function described in C<nci_pmc> using the precomputed
thunk contained in C<self>.

=cut

*/

static void
call_ffi_thunk(PARROT_INTERP, ARGMOD(PMC *nci_pmc), ARGMOD(PMC *self))
{
    ASSERT_ARGS(call_ffi_thunk)
    Parrot_NCI_attributes *nci = PARROT_NCI(nci_pmc);
    ffi_thunk_t           *thunk;

    PMC *call_object = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));

    void **values;
    parrot_var_t *pcc_arg;
    void **translation_pointers; /* Data translation pointers, used to hold values
                                           that are passed by reference so we can update
                                           the objects after the FFI call is over */
    void **middle_man; /* An array to hold various pointers so they are not lost if
                          the function changes values by reference */
    void *return_data; /* Holds return data from FFI call */
    int i, j;

    {
        void *v;
        GETATTR_ManagedStruct_custom_free_priv(interp, self, v);
        thunk = (ffi_thunk_t *)v;
    }

    /* dynamic call to Parrot_pcc_fill_params_from_c_args */
    {
        INTVAL  pcc_argc = Parrot_str_length(interp, nci->pcc_params_signature);
        char   *pcc_sig  = Parrot_str_to_cstring(interp, nci->pcc_params_signature);

        void **pcc_arg_ptr, **call_arg;

        ffi_arg ffi_ret_dummy;

        pcc_arg     = mem_gc_allocate_n_zeroed_typed(interp, pcc_argc, parrot_var_t);
        pcc_arg_ptr = mem_gc_allocate_n_zeroed_typed(interp, pcc_argc, void *);
        call_arg    = mem_gc_allocate_n_zeroed_typed(interp, pcc_argc + 3, void*);

        /* setup Parrot_pcc_fill_params_from_c_args required arguments */
        call_arg[0] = &interp;
        call_arg[1] = &call_object;
        call_arg[2] = &pcc_sig;

        /* TODO: eliminate PCC signature parsing somehow */
        for (i = 0; i < pcc_argc; i++) {
            switch (pcc_sig[i]) {
                case 'I':
                    pcc_arg_ptr[i] = &pcc_arg[i].i;
                    break;
                case 'N':
                    pcc_arg_ptr[i] = &pcc_arg[i].n;
                    break;
                case 'S':
                    pcc_arg_ptr[i] = &pcc_arg[i].s;
                    break;
                case 'P':
                    pcc_arg_ptr[i] = &pcc_arg[i].p;
                    break;
                default:
                    PARROT_ASSERT(!"Impossible PCC signature");
                    break;
            }

            call_arg[i + 3] = &pcc_arg_ptr[i];
        }

        ffi_call(&thunk->pcc_cif, FFI_FN(Parrot_pcc_fill_params_from_c_args),
                &ffi_ret_dummy, call_arg);

        mem_gc_free(interp, call_arg);
        mem_gc_free(interp, pcc_arg_ptr);
        Parrot_str_free_cstring(pcc_sig);
    }

    {
        values = mem_gc_allocate_n_zeroed_typed(interp, nci->arity, void *);
        middle_man = mem_gc_allocate_n_zeroed_typed(interp, nci->arity, void *);

        /*
         *  Apply Argument Transformations
         *   this is mostly to transform STRING* into char*
         *   and add the parrot interp argument if it needs it
         *   but other transformations might apply later, like packing an
         *   object into a ManagedStruct
         */
        translation_pointers = mem_internal_allocate_n_zeroed_typed(nci->arity, void*);
        for (i = 0, j = 0; i < nci->arity; i++) {
            pmc_holder_t *pmc_holder;
            switch (VTABLE_get_integer_keyed_int(interp, nci->signature, i + 1)) {
              case enum_nci_sig_interp:
                values[i] = &interp;
                break;
              case enum_nci_sig_string:
                translation_pointers[i] = pcc_arg[j++].s;
                values[i]               = &translation_pointers[i];
                break;
              case enum_nci_sig_cstring:
                translation_pointers[i] = STRING_IS_NULL(pcc_arg[j].s) ?
                    (char *)NULL :
                    Parrot_str_to_cstring(interp, pcc_arg[j].s);
                j++;
                values[i] = &translation_pointers[i];
                break;
              case enum_nci_sig_bufref:
                translation_pointers[i] = STRING_IS_NULL(pcc_arg[j].s) ?
                    (char *)NULL :
                    Parrot_str_to_cstring(interp, pcc_arg[j].s);
                j++;
                middle_man[i]           = &translation_pointers[i];
                values[i]               = &middle_man[i];
                break;
              case enum_nci_sig_char:
                translation_pointers[i]            = mem_internal_allocate_zeroed_typed(char);
                *(char *)(translation_pointers[i]) = (char)pcc_arg[j++].i;
                values[i]                          = translation_pointers[i];
                break;
              case enum_nci_sig_shortref:
                pmc_holder              = mem_internal_allocate_zeroed_typed(pmc_holder_t);
                translation_pointers[i] = pmc_holder;
                pmc_holder->pmc         = pcc_arg[j].p;
                pmc_holder->ptr         = &pmc_holder->s;
                pmc_holder->s           = (short)VTABLE_get_integer(interp, pcc_arg[j].p);
                j++;
                values[i]               = &pmc_holder->ptr;
                break;
              case enum_nci_sig_short:
                translation_pointers[i]           = mem_internal_allocate_zeroed_typed(short);
                *(short *)translation_pointers[i] = (short)pcc_arg[j++].i;
                values[i]                         = translation_pointers[i];
                break;
              case enum_nci_sig_intref:
                pmc_holder              = mem_internal_allocate_zeroed_typed(pmc_holder_t);
                translation_pointers[i] = pmc_holder;
                pmc_holder->pmc         = pcc_arg[j].p;
                pmc_holder->ptr         = &pmc_holder->i;
                pmc_holder->i           = (int)VTABLE_get_integer(interp, pcc_arg[j].p);
                j++;
                values[i]               = &pmc_holder->ptr;
                break;
              case enum_nci_sig_int:
                translation_pointers[i]           = mem_internal_allocate_zeroed_typed(int);
                *(int *)(translation_pointers[i]) = (int)pcc_arg[j++].i;
                values[i]                         = translation_pointers[i];
                break;
              case enum_nci_sig_longref:
                pmc_holder              = mem_internal_allocate_zeroed_typed(pmc_holder_t);
                translation_pointers[i] = pmc_holder;
                pmc_holder->pmc         = pcc_arg[j].p;
                pmc_holder->ptr         = &pmc_holder->l;
                pmc_holder->l           = (long)VTABLE_get_integer(interp, pcc_arg[j].p);
                j++;
                values[i]               = &pmc_holder->ptr;
                break;
              case enum_nci_sig_long:
                translation_pointers[i]            = mem_internal_allocate_zeroed_typed(long);
                *(long *)(translation_pointers[i]) = (long)pcc_arg[j++].i;
                values[i]                          = translation_pointers[i];
                break;
              case enum_nci_sig_ptrref:
                pmc_holder              = mem_internal_allocate_zeroed_typed(pmc_holder_t);
                translation_pointers[i] = pmc_holder;
                pmc_holder->pmc         = pcc_arg[j].p;
                pmc_holder->ptr         = &pmc_holder->p;
                pmc_holder->p           = PMC_IS_NULL(pcc_arg[j].p) ?
                    (void *)NULL :
                    (void *)VTABLE_get_pointer(interp, pcc_arg[j].p);
                j++;
                values[i]               = &pmc_holder->ptr;
                break;
              case enum_nci_sig_pmc:
                translation_pointers[i] = pcc_arg[j++].p;
                values[i]               = &translation_pointers[i];
                break;
              case enum_nci_sig_ptr:
                translation_pointers[i] = PMC_IS_NULL(pcc_arg[j].p) ?
                    (void *)NULL : VTABLE_get_pointer(interp, pcc_arg[j].p);
                j++;
                values[i]               = &translation_pointers[i];
                break;
              case enum_nci_sig_float:
                translation_pointers[i]           = mem_internal_allocate_zeroed_typed(float);
                *(float *)translation_pointers[i] = (float)pcc_arg[j++].n;
                values[i]                         = translation_pointers[i];
                break;
              case enum_nci_sig_double:
                translation_pointers[i]            = mem_internal_allocate_zeroed_typed(double);
                *(double *)translation_pointers[i] = (double)pcc_arg[j++].n;
                values[i]                          = translation_pointers[i];
                break;
              case enum_nci_sig_numval:
                translation_pointers[i] = mem_internal_allocate_zeroed_typed(FLOATVAL);
                *(FLOATVAL *)translation_pointers[i] = pcc_arg[j++].n;
                values[i]                            = translation_pointers[i];
                break;
              default:
                PARROT_ASSERT("!Unhandled NCI signature");
                break;
            }
        }

        mem_gc_free(interp, pcc_arg);
    }

    /*
     *  This will allow for any type of datat to be returned.
     *  Including one day Structures
     */
    return_data = mem_sys_allocate(thunk->cif.rtype->size);

    ffi_call(&thunk->cif, FFI_FN(nci->orig_func), return_data, values);

    if (thunk->cif.rtype != &ffi_type_void) {
        char         *s;
        PMC          *ret_object;
        parrot_var_t  final_destination;
        s = Parrot_str_to_cstring(interp, nci->pcc_return_signature);
        switch (VTABLE_get_integer_keyed_int(interp, nci->signature, 0)) {
            case enum_nci_sig_ptr:
                final_destination.p = PMCNULL;

                if (*(void **)return_data != NULL) {
                    final_destination.p = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
                    VTABLE_set_pointer(interp, final_destination.p, *(void **)return_data);
                }
                ret_object = Parrot_pcc_build_call_from_c_args(interp,
                        call_object,
                        s, final_destination.p);
                break;
            case enum_nci_sig_cstring:
                final_destination.s = Parrot_str_new(interp, *(char **)return_data, 0);
                ret_object = Parrot_pcc_build_call_from_c_args(interp,
                        call_object,
                        s, final_destination.s);
                break;
            case enum_nci_sig_float:
                final_destination.n = *(float *)return_data;

                ret_object = Parrot_pcc_build_call_from_c_args(interp,
                        call_object,
                        s, final_destination.n);
                break;
            default:
                switch (s[0]) {
                    case 'N':
                        ret_object = Parrot_pcc_build_call_from_c_args(interp,
                                call_object,
                                s, *(FLOATVAL *)return_data);
                    case 'I':
                        ret_object = Parrot_pcc_build_call_from_c_args(interp,
                                call_object,
                                s, *(INTVAL *)return_data);
                    case 'P':
                    case 'S':
                    default:
                        ret_object = Parrot_pcc_build_call_from_c_args(interp,
                                call_object,
                                s, *(void **)return_data);
                }
                break;
        }
        Parrot_str_free_cstring(s);
    }

    /*
     * Free memory used for cstrings,
     * and any other translations that use temporary memory
     */
    for (i = 0; i < nci->arity; i++) {
        switch (VTABLE_get_integer_keyed_int(interp, nci->signature, i + 1)) {
            case enum_nci_sig_bufref:
                if (translation_pointers[i]) {
                    Parrot_str_free_cstring((char*)translation_pointers[i]);
                }
                break;
            case enum_nci_sig_cstring:
                if (translation_pointers[i]) {
                    Parrot_str_free_cstring((char*)translation_pointers[i]);
                }
                break;
            case enum_nci_sig_shortref:
                VTABLE_set_integer_native(interp,
                        ((pmc_holder_t*)translation_pointers[i])->pmc,
                        ((pmc_holder_t*)translation_pointers[i])->s);
                mem_sys_free(translation_pointers[i]);
                break;
            case enum_nci_sig_intref:
                VTABLE_set_integer_native(interp,
                        ((pmc_holder_t*)translation_pointers[i])->pmc,
                        ((pmc_holder_t*)translation_pointers[i])->i);
                mem_sys_free(translation_pointers[i]);
                break;
            case enum_nci_sig_longref:
                VTABLE_set_integer_native(interp,
                        ((pmc_holder_t*)translation_pointers[i])->pmc,
                        ((pmc_holder_t*)translation_pointers[i])->l);
                mem_sys_free(translation_pointers[i]);
                break;
            case enum_nci_sig_ptrref:
                VTABLE_set_pointer(interp,
                        ((pmc_holder_t*)translation_pointers[i])->pmc,
                        ((pmc_holder_t*)translation_pointers[i])->p);
                mem_sys_free(translation_pointers[i]);
                break;
            case enum_nci_sig_double:
            case enum_nci_sig_char:
            case enum_nci_sig_short:
            case enum_nci_sig_int:
            case enum_nci_sig_long:
                if (translation_pointers[i]) {
                    mem_sys_free(translation_pointers[i]);
                }
                break;
            default:
                break;
        }
    }

    mem_gc_free(interp, middle_man);
    mem_gc_free(interp, return_data);
    mem_gc_free(interp, values);
}


/*

=item C<static PMC * clone_ffi_thunk(PARROT_INTERP, PMC *thunk, void
*_thunk_data)>

Clone a C<ManagedStruct> containing a C<ffi_thunk_t>. Suitable to be used by
C<ManagedStruct> as a C<custom_clone_func> callback.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static PMC *
clone_ffi_thunk(PARROT_INTERP, ARGIN(PMC *thunk), ARGIN(void *_thunk_data))
{
    ASSERT_ARGS(clone_ffi_thunk)
    ffi_thunk_t *thunk_data = (ffi_thunk_t *)_thunk_data;
    ffi_thunk_t *clone_data = mem_gc_allocate_zeroed_typed(interp, ffi_thunk_t);
    PMC         *clone      = init_thunk_pmc(interp, clone_data);

    memcpy(clone_data, thunk_data, sizeof (ffi_thunk_t));

    clone_data->pcc_arg_types = mem_gc_allocate_n_zeroed_typed(interp,
                                    thunk_data->pcc_cif.nargs, ffi_type *);
    mem_copy_n_typed(clone_data->pcc_arg_types, thunk_data->pcc_arg_types,
                        thunk_data->pcc_cif.nargs, ffi_type *);

    clone_data->arg_types     = mem_gc_allocate_n_zeroed_typed(interp,
                                    thunk_data->cif.nargs, ffi_type *);
    mem_copy_n_typed(clone_data->arg_types, thunk_data->arg_types,
                        thunk_data->cif.nargs, ffi_type *);

    return clone;
}


/*

=item C<static void free_ffi_thunk(PARROT_INTERP, void *thunk_func, void
*thunk_data)>

Free an C<ffi_thunk_t>. Suitable to be used by C<ManagedStruct> as a
C<custom_free_func> callback.

=cut

*/

static void
free_ffi_thunk(PARROT_INTERP, SHIM(void *thunk_func), ARGFREE(void *thunk_data))
{
    ASSERT_ARGS(free_ffi_thunk)
    ffi_thunk_t *thunk = (ffi_thunk_t *)thunk_data;
    if (thunk->arg_types)
        mem_gc_free(interp, thunk->arg_types);

    if (thunk->pcc_arg_types)
        mem_gc_free(interp, thunk->pcc_arg_types);

    mem_gc_free(interp, thunk);
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

