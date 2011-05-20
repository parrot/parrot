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

#if PARROT_HAS_LONGLONG
#  if (LONGLONG_SIZE == 8)
#    define ffi_type_slonglong ffi_type_sint64
#  else
#    error "unhandled long long size"
#  endif
#endif

typedef struct ffi_thunk_t {
    ffi_cif    cif;
    ffi_type **arg_types;

    ffi_cif    pcc_arg_cif;
    ffi_type **pcc_arg_types;

    ffi_cif    pcc_ret_cif;
    ffi_type **pcc_ret_types;
} ffi_thunk_t;

typedef union parrot_var_t {
    INTVAL    i;
    FLOATVAL  n;
    STRING   *s;
    PMC      *p;
} parrot_var_t;

typedef union nci_var_t {
    float   f; double   d; long double ld;
    char    c; short    s; int i; long l;
#if PARROT_HAS_LONGLONG
    long long ll;
#endif
    Parrot_Int1 i8; Parrot_Int2 i16; Parrot_Int4 i32;
#if PARROT_HAS_INT64
    Parrot_Int8 i64;
#endif
    void   *p;
    INTVAL  I; FLOATVAL N; STRING *S; PMC *P;
} nci_var_t;


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
static ffi_type * nci_to_ffi_type(PARROT_INTERP, PARROT_DATA_TYPE nci_t)
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

        if (ffi_prep_cif(&thunk_data->pcc_arg_cif, FFI_DEFAULT_ABI, argc, &ffi_type_void, arg_t) !=
            FFI_OK)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
                                        "invalid ffi signature");
    }

    /* generate target function dynamic call infrastructure */
    {
        INTVAL     argc  = VTABLE_elements(interp, sig) - 1;
        ffi_type  *ret_t = nci_to_ffi_type(interp,
                                (PARROT_DATA_TYPE)VTABLE_get_integer_keyed_int(interp, sig, 0));
        ffi_type **arg_t =  thunk_data->arg_types =
                            mem_gc_allocate_n_zeroed_typed(interp, argc, ffi_type *);
        int        i;

        for (i = 0; i < argc; i++)
            arg_t[i] = nci_to_ffi_type(interp,
                            (PARROT_DATA_TYPE)VTABLE_get_integer_keyed_int(interp, sig, i + 1));

        if (ffi_prep_cif(&thunk_data->cif, FFI_DEFAULT_ABI, argc, ret_t, arg_t) != FFI_OK)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
                                        "invalid ffi signature");
    }

    /* generate Parrot_pcc_build_call_from_c_args dynamic call infrastructure */
    {
        INTVAL     retc  = Parrot_str_length(interp, pcc_ret_sig) + 3;
        ffi_type **ret_t =  thunk_data->pcc_ret_types =
                            mem_gc_allocate_n_zeroed_typed(interp, retc, ffi_type *);
        int i = 0;

        ret_t[0] = &ffi_type_pointer; /* interp */
        ret_t[1] = &ffi_type_pointer; /* callsig object */
        ret_t[2] = &ffi_type_pointer; /* pcc signature */

        for (i = 3; i < retc; i++) {
            switch ((char)Parrot_str_indexed(interp, pcc_ret_sig, i - 3)) {
              case 'I':
                ret_t[i] = &ffi_type_parrot_intval;
                break;
              case 'N':
                ret_t[i] = &ffi_type_parrot_numval;
                break;
              case 'S':
              case 'P':
                ret_t[i] = &ffi_type_pointer;
                break;
              default:
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
                                            "invalid pcc signature");
            }
        }

        if (FFI_OK != ffi_prep_cif(&thunk_data->pcc_ret_cif, FFI_DEFAULT_ABI,
                                    retc, &ffi_type_pointer, ret_t))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_JIT_ERROR,
                                        "invalid ffi signature");
    }

    return thunk;
}


/*

=item C<static ffi_type * nci_to_ffi_type(PARROT_INTERP, PARROT_DATA_TYPE
nci_t)>

Convert an NCI type specification into the corresponding LibFFI type.

=cut

*/

PARROT_CAN_RETURN_NULL
static ffi_type *
nci_to_ffi_type(PARROT_INTERP, PARROT_DATA_TYPE nci_t)
{
    ASSERT_ARGS(nci_to_ffi_type)
    switch (nci_t) {
      case enum_type_void:       return &ffi_type_void;

      case enum_type_float:      return &ffi_type_float;
      case enum_type_double:     return &ffi_type_double;
      case enum_type_longdouble: return &ffi_type_longdouble;
      case enum_type_FLOATVAL:   return &ffi_type_parrot_numval;

      case enum_type_char:       return &ffi_type_schar;
      case enum_type_short:      return &ffi_type_sshort;
      case enum_type_int:        return &ffi_type_sint;
      case enum_type_long:       return &ffi_type_slong;
#if PARROT_HAS_LONGLONG
      case enum_type_longlong:   return &ffi_type_slonglong;
#endif
      case enum_type_int8:       return &ffi_type_sint8;
      case enum_type_int16:      return &ffi_type_sint16;
      case enum_type_int32:      return &ffi_type_sint32;
#if PARROT_HAS_INT64
      case enum_type_int64:      return &ffi_type_sint64;
#endif
      case enum_type_INTVAL:     return &ffi_type_parrot_intval;

      case enum_type_STRING:
      case enum_type_ptr:
      case enum_type_PMC:
                                 return &ffi_type_pointer;

      default:
        if (nci_t & enum_type_ref_flag)
                                 return &ffi_type_pointer;
        else
                                 return NULL;
    }
}


/*

=item C<static void prep_pcc_ret_arg(PARROT_INTERP, PARROT_DATA_TYPE t,
parrot_var_t *pv, void **rv, void *val)>

=cut

*/

PARROT_INLINE
static void
prep_pcc_ret_arg(PARROT_INTERP, PARROT_DATA_TYPE t, parrot_var_t *pv, void **rv, void *val) {
    switch (t) {
      case enum_type_float:
        pv->n = *(float *)val;
        *rv   = &pv->n;
        break;
      case enum_type_double:
        pv->n = *(double *)val;
        *rv   = &pv->n;
        break;
      case enum_type_longdouble:
        pv->n = *(long double *)val;
        *rv   = &pv->n;
        break;
      case enum_type_FLOATVAL:
        pv->n = *(FLOATVAL *)val;
        *rv   = &pv->n;
        break;

      case enum_type_char:
        pv->i = *(char *)val;
        *rv   = &pv->i;
        break;
      case enum_type_short:
        pv->i = *(short *)val;
        *rv   = &pv->i;
        break;
      case enum_type_int:
        pv->i = *(int *)val;
        *rv   = &pv->i;
        break;
      case enum_type_long:
        pv->i = *(long *)val;
        *rv   = &pv->i;
        break;
#if PARROT_HAS_LONGLONG
      case enum_type_longlong:
        pv->i = *(long long *)val;
        *rv   = &pv->i;
        break;
#endif
      case enum_type_int8:
        pv->i = *(Parrot_Int1 *)val;
        *rv   = &pv->i;
        break;
      case enum_type_int16:
        pv->i = *(Parrot_Int2 *)val;
        *rv   = &pv->i;
        break;
      case enum_type_int32:
        pv->i = *(Parrot_Int4 *)val;
        *rv   = &pv->i;
        break;
#if PARROT_HAS_INT64
      case enum_type_int64:
        pv->i = *(Parrot_Int8 *)val;
        *rv   = &pv->i;
        break;
#endif
      case enum_type_INTVAL:
        pv->i = *(INTVAL *)val;
        *rv   = &pv->i;
        break;

      case enum_type_STRING:
        pv->s = *(STRING **)val;
        *rv   = &pv->s;
        break;
      case enum_type_PMC:
        pv->p = *(PMC **)val;
        *rv   = &pv->p;
        break;
      case enum_type_ptr:
        if (*(void **)val) {
            pv->p = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
            VTABLE_set_pointer(interp, pv->p, *(void **)val);
        }
        else {
            pv->p = PMCNULL;
        }
        *rv = &pv->p;
        break;

      default:
        Parrot_ex_throw_from_c_args(interp, NULL, 0, "Impossible NCI signature code");
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

    parrot_var_t  *pcc_arg;     /* values of pcc arguments */
    nci_var_t     *nci_val;     /* values of nci arguments */
    void         **nci_arg;     /* pointers for pass-by-ref arguments */
    void         **nci_arg_ptr; /* pointers to arguments for libffi */

    void *return_data; /* Holds return data from FFI call */
    int i;

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

        ffi_call(&thunk->pcc_arg_cif, FFI_FN(Parrot_pcc_fill_params_from_c_args),
                &ffi_ret_dummy, call_arg);

        mem_gc_free(interp, call_arg);
        mem_gc_free(interp, pcc_arg_ptr);
        Parrot_str_free_cstring(pcc_sig);
    }

    if (nci->arity) {
        nci_val     = mem_gc_allocate_n_zeroed_typed(interp, nci->arity, nci_var_t);
        nci_arg     = mem_gc_allocate_n_zeroed_typed(interp, nci->arity, void *);
        nci_arg_ptr = mem_gc_allocate_n_zeroed_typed(interp, nci->arity, void *);

        for (i = 0; i < nci->arity; i++) {
            PARROT_DATA_TYPE t = (PARROT_DATA_TYPE)
                                    VTABLE_get_integer_keyed_int(interp, nci->signature, i + 1);
            switch (t & ~enum_type_ref_flag) {
              case enum_type_char:
                nci_val[i].c   = pcc_arg[i].i;
                nci_arg_ptr[i] = &nci_val[i].c;
                break;
              case enum_type_short:
                nci_val[i].s   = pcc_arg[i].i;
                nci_arg_ptr[i] = &nci_val[i].s;
                break;
              case enum_type_int:
                nci_val[i].i   = pcc_arg[i].i;
                nci_arg_ptr[i] = &nci_val[i].i;
                break;
              case enum_type_long:
                nci_val[i].l   = pcc_arg[i].i;
                nci_arg_ptr[i] = &nci_val[i].l;
                break;
#if PARROT_HAS_LONGLONG
              case enum_type_longlong:
                nci_val[i].ll  = pcc_arg[i].i;
                nci_arg_ptr[i] = &nci_val[i].ll;
                break;
#endif
              case enum_type_int8:
                nci_val[i].i8  = pcc_arg[i].i;
                nci_arg_ptr[i] = &nci_val[i].i8;
                break;
              case enum_type_int16:
                nci_val[i].i16 = pcc_arg[i].i;
                nci_arg_ptr[i] = &nci_val[i].i16;
                break;
              case enum_type_int32:
                nci_val[i].i32 = pcc_arg[i].i;
                nci_arg_ptr[i] = &nci_val[i].i32;
                break;
#if PARROT_HAS_INT64
              case enum_type_int64:
                nci_val[i].i64 = pcc_arg[i].i;
                nci_arg_ptr[i] = &nci_val[i].i64;
                break;
#endif
              case enum_type_INTVAL:
                nci_val[i].I   = pcc_arg[i].i;
                nci_arg_ptr[i] = &nci_val[i].I;
                break;

              case enum_type_float:
                nci_val[i].f   = pcc_arg[i].n;
                nci_arg_ptr[i] = &nci_val[i].f;
                break;
              case enum_type_double:
                nci_val[i].d   = pcc_arg[i].n;
                nci_arg_ptr[i] = &nci_val[i].d;
                break;
              case enum_type_longdouble:
                nci_val[i].ld  = pcc_arg[i].n;
                nci_arg_ptr[i] = &nci_val[i].ld;
                break;
              case enum_type_FLOATVAL:
                nci_val[i].N   = pcc_arg[i].n;
                nci_arg_ptr[i] = &nci_val[i].N;
                break;

              case enum_type_STRING:
                nci_val[i].S   = pcc_arg[i].s;
                nci_arg_ptr[i] = &nci_val[i].S;
                break;
              case enum_type_PMC:
                nci_val[i].P   = pcc_arg[i].p;
                nci_arg_ptr[i] = &nci_val[i].P;
                break;
              case enum_type_ptr:
                nci_val[i].p   = PMC_IS_NULL(pcc_arg[i].p) ?
                                    NULL :
                                    VTABLE_get_pointer(interp, pcc_arg[i].p);
                nci_arg_ptr[i] = &nci_val[i].p;
                break;

              default:
                PARROT_ASSERT("Unhandled NCI signature");
                break;
            }

            if (t & enum_type_ref_flag) {
                nci_arg[i]     = nci_arg_ptr[i];
                nci_arg_ptr[i] = &nci_arg[i];
            }
        }
    }

    mem_gc_free(interp, pcc_arg);

    return_data = mem_sys_allocate(thunk->cif.rtype->size);

    ffi_call(&thunk->cif, FFI_FN(nci->orig_func), return_data, nci_arg_ptr);

    /* dynamic call to Parrot_pcc_build_call_from_c_args */
    if (thunk->pcc_ret_cif.nargs > 3) {
        PMC           *ffi_ret_unused;
        INTVAL         pcc_retc    = Parrot_str_length(interp, nci->pcc_return_signature);
        char          *pcc_ret_sig = Parrot_str_to_cstring(interp, nci->pcc_return_signature);
        void         **call_arg    = mem_gc_allocate_n_zeroed_typed(interp, pcc_retc + 3, void *);
        parrot_var_t  *pcc_retv    = mem_gc_allocate_n_zeroed_typed(interp, pcc_retc, parrot_var_t);

        PARROT_DATA_TYPE arg_t;
        int              i = 0;
        int              j;

        call_arg[0] = &interp;
        call_arg[1] = &call_object;
        call_arg[2] = &pcc_ret_sig;

        /* populate return slot (non-existant if void) */
        if (enum_type_void !=
            (arg_t = (PARROT_DATA_TYPE)VTABLE_get_integer_keyed_int(interp, nci->signature, 0))) {
            prep_pcc_ret_arg(interp, arg_t, &pcc_retv[i], &call_arg[i + 3], return_data);
            i++;
        }

        /* also return call-by-reference arguments (if any) */
        for (j = 1; i < pcc_retc; j++) {
            arg_t = (PARROT_DATA_TYPE)VTABLE_get_integer_keyed_int(interp, nci->signature, j);
            if (arg_t & enum_type_ref_flag) {
                prep_pcc_ret_arg(interp, (PARROT_DATA_TYPE)(arg_t & ~enum_type_ref_flag),
                                    &pcc_retv[i], &call_arg[i + 3], nci_arg[j - 1]);
                i++;
            }
        }

        ffi_call(&thunk->pcc_ret_cif, FFI_FN(Parrot_pcc_build_call_from_c_args),
                &ffi_ret_unused, call_arg);

        Parrot_str_free_cstring(pcc_ret_sig);
        mem_gc_free(interp, call_arg);
        mem_gc_free(interp, pcc_retv);
    }

    if (nci->arity) {
        mem_gc_free(interp, nci_val);
        mem_gc_free(interp, nci_arg);
        mem_gc_free(interp, nci_arg_ptr);
    }

    mem_gc_free(interp, return_data);
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
                                    thunk_data->pcc_arg_cif.nargs, ffi_type *);
    mem_copy_n_typed(clone_data->pcc_arg_types, thunk_data->pcc_arg_types,
                        thunk_data->pcc_arg_cif.nargs, ffi_type *);

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

