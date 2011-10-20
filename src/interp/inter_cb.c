/*
Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

src/interp/inter_cb.c - Parrot Interpreter - Callback Function Handling

=head1 DESCRIPTION

NCI callback functions may run whenever the C code executes the callback.
To be prepared for asynchronous callbacks these are converted to callback
events.

Often callbacks should run synchronously. This can only happen when
the C-library calls the callback, because Parrot called a function in
the C-library.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "pmc/pmc_parrotinterpreter.h"
#include "inter_cb.str"

static Interp * default_interp = NULL;

/* HEADERIZER HFILE: include/parrot/interpreter.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void callback_CD(PARROT_INTERP,
    ARGIN(char *external_data),
    ARGMOD(PMC *user_data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*user_data);

static void verify_CD(
    ARGIN(char *external_data),
    ARGMOD_NULLOK(PMC *user_data))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*user_data);

#define ASSERT_ARGS_callback_CD __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(external_data) \
    , PARROT_ASSERT_ARG(user_data))
#define ASSERT_ARGS_verify_CD __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(external_data))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<PMC* Parrot_make_cb(PARROT_INTERP, PMC* sub, PMC* user_data, STRING
*cb_signature)>

Create a callback function according to pdd16.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC*
Parrot_make_cb(PARROT_INTERP, ARGMOD(PMC* sub), ARGIN(PMC* user_data),
        ARGIN(STRING *cb_signature))
{
    ASSERT_ARGS(Parrot_make_cb)
    PMC *cb, *cb_sig;
    int type = 0;
    STRING *sc;

    /*
     * we stuff all the information into the user_data PMC and pass that
     * on to the external sub
     */
    PMC * const interp_pmc = VTABLE_get_pmc_keyed_int(interp, interp->iglobals,
            (INTVAL) IGLOBALS_INTERPRETER);

    if (default_interp == NULL)
        default_interp = interp;

    /* be sure __LINE__ is consistent */
    sc = CONST_STRING(interp, "_interpreter");
    VTABLE_setprop(interp, user_data, sc, interp_pmc);
    sc = CONST_STRING(interp, "_sub");
    VTABLE_setprop(interp, user_data, sc, sub);
    /* only ASCII signatures are supported */
    if (STRING_length(cb_signature) == 3) {
        /* Callback return type ignored */

        if (STRING_ord(interp, cb_signature, 1) == 'U') {
            type = 'D';
        }
        else {
            if (STRING_ord(interp, cb_signature, 2) == 'U') {
                type = 'C';
            }
        }
    }
    if (type != 'C' && type != 'D')
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "unhandled signature '%Ss' in make_cb", cb_signature);

    cb_sig = Parrot_pmc_new(interp, enum_class_String);
    VTABLE_set_string_native(interp, cb_sig, cb_signature);
    sc = CONST_STRING(interp, "_signature");
    VTABLE_setprop(interp, user_data, sc, cb_sig);
    /*
     * We are going to be passing the user_data PMC to external code, but
     * it may go out of scope until the callback is called -- we don't know
     * for certain as we don't know when the callback will be called.
     * Therefore, to prevent the PMC from being destroyed by a GC sweep,
     * we need to anchor it.
     *
     */
    Parrot_pmc_gc_register(interp, user_data);

    /*
     * Finally, the external lib awaits a function pointer.
     * Create a PMC that points to Parrot_callback_C (or _D);
     * it can be passed on with signature 'p'.
     */
    cb = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
    /*
     * Currently, we handle only 2 types:
     * _C ... user_data is 2nd parameter
     * _D ... user_data is 1st parameter
     */
    if (type == 'C')
        VTABLE_set_pointer(interp, cb, F2DPTR(Parrot_callback_C));
    else
        VTABLE_set_pointer(interp, cb, F2DPTR(Parrot_callback_D));
    Parrot_pmc_gc_register(interp, cb);

    return cb;
}

/*

=item C<static void verify_CD(char *external_data, PMC *user_data)>

Verify user_data PMC then continue with callback_CD

=cut

*/

static void
verify_CD(ARGIN(char *external_data), ARGMOD_NULLOK(PMC *user_data))
{
    ASSERT_ARGS(verify_CD)
    PARROT_INTERP = default_interp;
    PMC    *interp_pmc;
    STRING *sc;

    /*
     * 1.) user_data is from external code so:
     *     verify that we get a PMC that is one that we have passed in
     *     as user data, when we prepared the callback
     */

    /* a NULL pointer or a pointer not aligned is very likely wrong */
    if (!user_data)
        PANIC(interp, "user_data is NULL");
    if (PMC_IS_NULL(user_data))
        PANIC(interp, "user_data is PMCNULL");
    if ((UINTVAL)user_data & 3)
        PANIC(interp, "user_data doesn't look like a pointer");

    /* Fetch original interpreter from prop */
    sc          = CONST_STRING(interp, "_interpreter");
    interp_pmc  = VTABLE_getprop(interp, user_data, sc);
    GETATTR_ParrotInterpreter_interp(interp, interp_pmc, interp);
    if (!interp)
        PANIC(interp, "interpreter not found for callback");

    /*
     * 2) some more checks
     * now we should have the interpreter where that callback
     * did originate - do some further checks on the PMC
     */

    /* if that doesn't look like a PMC we are still lost */
    if (!PObj_is_PMC_TEST(user_data))
        PANIC(interp, "user_data isn't a PMC");

    if (!user_data->vtable)
        PANIC(interp, "user_data hasn't a vtable");
    /*
     * ok fine till here
     */
    callback_CD(interp, external_data, user_data);
}

/*

=item C<static void callback_CD(PARROT_INTERP, char *external_data, PMC
*user_data)>

Common callback function handler. See pdd16.

=cut

*/

static void
callback_CD(PARROT_INTERP, ARGIN(char *external_data), ARGMOD(PMC *user_data))
{
    ASSERT_ARGS(callback_CD)

    PMC *passed_interp;       /* the interp that originated the CB */
    PMC *passed_synchronous;  /* flagging synchronous execution */
    int synchronous = 0;      /* cb is hitting this sub somewhen
                               * inmidst, or not */
    STRING *sc;
    /*
     * 3) check interpreter ...
     */
    sc = CONST_STRING(interp, "_interpreter");
    passed_interp = VTABLE_getprop(interp, user_data, sc);
    if (VTABLE_get_pointer(interp, passed_interp) != interp)
        PANIC(interp, "callback gone to wrong interpreter");

    sc = CONST_STRING(interp, "_synchronous");
    passed_synchronous = VTABLE_getprop(interp, user_data, sc);
    if (!PMC_IS_NULL(passed_synchronous) &&
            VTABLE_get_bool(interp, passed_synchronous))
        synchronous = 1;

    /*
     * 4) check if the call_back is synchronous:
     *    - if yes we are inside the NCI call
     *      we could run the Sub immediately now (I think)
     *    - if no, and that's always safe, post a callback event
     */

    if (synchronous) {
        /*
         * just call the sub
         */
        Parrot_run_callback(interp, user_data, external_data);
    }
    else {
        /*
         * create a CB_EVENT, put user_data and data inside and finito
         *
         * *if* this function is finally no void, i.e. the calling
         * C program awaits a return result from the callback,
         * then wait for the CB_EVENT_xx to finish and return the
         * result
         */
        Parrot_cx_schedule_callback(interp, user_data, external_data);
    }
}

/*

=item C<void Parrot_run_callback(PARROT_INTERP, PMC* user_data, char*
external_data)>

Run a callback function. The PMC* user_data holds all
necessary items in its properties.

=cut

*/

PARROT_EXPORT
void
Parrot_run_callback(PARROT_INTERP,
        ARGMOD(PMC* user_data), ARGIN(char* external_data))
{
    ASSERT_ARGS(Parrot_run_callback)
    PMC     *signature;
    PMC     *sub;
    STRING  *sig_str;
    INTVAL   ch;
    char     pasm_sig[5];
    INTVAL   i_param;
    PMC     *p_param;
    void    *param = NULL;      /* avoid -Ox warning */
    STRING  *sc;

    sc        = CONST_STRING(interp, "_sub");
    sub       = VTABLE_getprop(interp, user_data, sc);
    sc        = CONST_STRING(interp, "_signature");
    signature = VTABLE_getprop(interp, user_data, sc);
    sig_str   = VTABLE_get_string(interp, signature);

    pasm_sig[0] = 'P';
    ch = STRING_ord(interp, sig_str, 1);
    if (ch == 'U') /* user_data Z in pdd16 */
        ch = STRING_ord(interp, sig_str, 2); /* ch is now type of external data */
    switch (ch) {
      case 'v':
        pasm_sig[1] = 'v';
        break;
      case 'l':
        i_param = (INTVAL)(long) external_data;
        goto case_I;
      case 'i':
        i_param = (INTVAL)(int)(long) external_data;
        goto case_I;
      case 's':
        i_param = (INTVAL)(short)(long) external_data;
        goto case_I;
      case 'c':
        i_param = (INTVAL)(char)(long)external_data;
case_I:
        pasm_sig[1] = 'I';
        param = (void*) i_param;
        break;
      case 'p':
        /* created a UnManagedStruct */
        p_param = Parrot_pmc_new(interp, enum_class_UnManagedStruct);
        VTABLE_set_pointer(interp, p_param, external_data);
        pasm_sig[1] = 'P';
        param = (void*) p_param;
        break;
      case 't':
        pasm_sig[1] = 'S';
        param = Parrot_str_new(interp, external_data, 0);
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "unhandled signature char '%c' in run_cb", ch);
    }
    pasm_sig[2] = '-';
    pasm_sig[3] = '>';  /* no return value supported yet */
    pasm_sig[4] = '\0';
    Parrot_ext_call(interp, sub, pasm_sig, user_data, param);
}
/*

=item C<void Parrot_callback_C(char *external_data, PMC *user_data)>

=item C<void Parrot_callback_D(PMC *user_data, char *external_data)>

NCI callback functions. See pdd16.

=cut

*/

PARROT_EXPORT
void
Parrot_callback_C(ARGIN(char *external_data), ARGMOD_NULLOK(PMC *user_data))
{
    ASSERT_ARGS(Parrot_callback_C)
    verify_CD(external_data, user_data);
}

PARROT_EXPORT
void
Parrot_callback_D(ARGMOD(PMC *user_data), ARGMOD_NULLOK(char *external_data))
{
    ASSERT_ARGS(Parrot_callback_D)
    verify_CD(external_data, user_data);
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
