/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/inter_cb.c - Parrot Interpreter - Callback Function Handling

=head1 DESCRIPTION

NCI callback functions may run, whenever the C code executes the calback.
To be prepared for async callbacks these are converted to callback events.

=head2 Functions

=over 4

=cut

*/

#include <assert.h>
#include "parrot/parrot.h"
#include "inter_cb.str"


/*

=item C<PMC* Parrot_make_cb(Parrot_Interp interpreter, PMC* sub, PMC* user
        STRING* cb_signature)>

Create a callback function according to pdd16.

=cut

*/

PMC*
Parrot_make_cb(Parrot_Interp interpreter, PMC* sub, PMC* user_data,
        STRING *cb_signature)
{
    PMC* interp_pmc, *cb, *cb_sig;
    int type = '?';     /* avoid -Ox warning */
    char * sig_str;
    STRING *sc;
    /*
     * we stuff all the information into the user_data PMC and pass that
     * on to the external sub
     */
    interp_pmc = VTABLE_get_pmc_keyed_int(interpreter, interpreter->iglobals,
            (INTVAL) IGLOBALS_INTERPRETER);
    /* be sure __LINE__ is consistent */
    sc = CONST_STRING(interpreter, "_interpreter");
    VTABLE_setprop(interpreter, user_data, sc, interp_pmc);
    sc = CONST_STRING(interpreter, "_sub");
    VTABLE_setprop(interpreter, user_data, sc, sub);
    /* only ASCII sigs supported */
    sig_str = cb_signature->strstart;
    if (*sig_str == 'U') {
        type = 'D';
    }
    else {
        ++sig_str;
        if (*sig_str == 'U') {
            type = 'C';
        }
        else {
            internal_exception(1, "unhandled signature '%Ss' in make_cb",
                    cb_signature);
        }
    }

    cb_sig = pmc_new(interpreter, enum_class_PerlString);
    VTABLE_set_string_native(interpreter, cb_sig, cb_signature);
    sc = CONST_STRING(interpreter, "_signature");
    VTABLE_setprop(interpreter, user_data, sc, cb_sig);
    /*
     * we are gonna passing this PMC to external code, the PMCs
     * might get out of scope until the callback is called -
     * we don't know, when the callback will be called
     *
     * so anchor the PMC
     */
    dod_register_pmc(interpreter, user_data);

    /*
     * finally the external lib awaits a function pointer
     * create a PMC that points to Parrot_callback_C (or _D)
     * it can be passed on with signature 'p'
     */
    cb = pmc_new(interpreter, enum_class_UnManagedStruct);
    /*
     * we handle currently 2 types only:
     * _C ... user_data is 2nd param
     * _D ... user_data is 1st param
     */
    if (type == 'C')
        PMC_data(cb) = F2DPTR(Parrot_callback_C);
    else
        PMC_data(cb) = F2DPTR(Parrot_callback_D);
    dod_register_pmc(interpreter, cb);

    return cb;
}

/*

=item C<static void verify_CD(void *external_data, PMC *callback_info)>

Verify callback_info PMC then continue with callback_CD

=cut

*/

static void callback_CD(Parrot_Interp, void *, PMC *callback_info);

static void
verify_CD(void *external_data, PMC *callback_info)
{
    Parrot_Interp interpreter = NULL;
    size_t i;

    /*
     * 1.) callback_info is from external code so:
     *     verify that we get a PMC that is one that we have passed in
     *     as user data, when we prepared the callback
     */

    /* a NULL pointer or a pointer not aligned is very likely wrong */
    if (!callback_info || ((UINTVAL)callback_info & 3))
        PANIC("callback_info doesn't look like a pointer");

    /*
     * we don't have an interpreter yet, where this PMC might be
     * located so run through interpreters and check their PMC pools
     */
    LOCK(interpreter_array_mutex);
    for (i = 0; i < n_interpreters; ++i) {
        if (interpreter_array[i] == NULL)
            continue;
        interpreter = interpreter_array[i];
        if (interpreter)
            if (contained_in_pool(interpreter,
                        interpreter->arena_base->pmc_pool, callback_info))
                break;
    }
    UNLOCK(interpreter_array_mutex);
    if (!interpreter)
        PANIC("interpreter not found for callback");

    /*
     * 2) some more checks
     * now we should have the interpreter where that callback
     * did originate - do some further checks on the PMC
     */

    /* if that doesn't look like a PMC we are still lost */
    if (!PObj_is_PMC_TEST(callback_info))
        PANIC("callback_info isn't a PMC");

    if (!callback_info->vtable)
        PANIC("callback_info hasn't a vtable");
    /*
     * ok fine till here
     */
    callback_CD(interpreter, external_data, callback_info);
}

/*

=item C<static void
callback_CD(Parrot_Interp, void *external_data, PMC *callback_info)>

Common callback function handler s. pdd16

=cut

*/

static void
callback_CD(Parrot_Interp interpreter, void *external_data, PMC *callback_info)
{

    PMC *passed_interp;         /* the interp that originated the CB */
    int async = 1;              /* cb is hitting this sub somewhen inmidst */
    STRING *sc;
    /*
     * 3) check interpreter ...
     */
    sc = CONST_STRING(interpreter, "_interpreter");
    passed_interp = VTABLE_getprop(interpreter, callback_info, sc);
    if (PMC_data(passed_interp) != interpreter)
        PANIC("callback gone to wrong interpreter");
    /*
     * 4) check if the call_back is synchronous:
     *    - if yes we are inside the NCI call
     *      we could run the Sub immediately now (I think)
     *    - if no, and that's always safe, post a CALLBACK_EVENT
     */

    if (async) {
        /*
         * create a CB_EVENT, put user_data and data inside and finito
         *
         * *if* this function is finally no void, i.e. the calling
         * C program awaits a return result from the callback,
         * then wait for the CB_EVENT_xx to finish and return the
         * result
         */
        Parrot_new_cb_event(interpreter, callback_info, external_data);
    }
    else {
        /*
         * just call the sub
         */
    }
}

/*

=item C<void
Parrot_run_callback(Parrot_Interp interpreter, PMC* cbi, void* ext)>

Run a callback function. The PMC* cbi (callback_info) holds all
necessary items in its props.

=cut

*/

void
Parrot_run_callback(Parrot_Interp interpreter, PMC* cbi, void* ext)
{
    PMC* user_data, *sig, *sub;
    STRING* sig_str;
    char *p;
    char pasm_sig[4];
    INTVAL   i_param;
    void*    param = NULL;      /* avoid -Ox warning */
    STRING *sc;

    sc = CONST_STRING(interpreter, "_sub");
    sub = VTABLE_getprop(interpreter, cbi, sc);
    sc = CONST_STRING(interpreter, "_signature");
    sig = VTABLE_getprop(interpreter, cbi, sc);
    user_data = cbi;

    sig_str = VTABLE_get_string(interpreter, sig);
    p = sig_str->strstart;

    pasm_sig[0] = 'v';  /* no return value supported yet */
    pasm_sig[1] = 'P';
    if (*p == 'U') /* user_data Z in pdd16 */
        ++p;    /* p is now type of external data */
    switch (*p) {
        case 'v':
            pasm_sig[2] = 'v';
            break;
#if 0
        case '2':
        case '3':
        case '4':
#endif
        case 'l':
            i_param = (INTVAL)(long) ext;
            goto case_I;
        case 'i':
            i_param = (INTVAL)(int)(long) ext;
            goto case_I;
        case 's':
            i_param = (INTVAL)(short)(long) ext;
            goto case_I;
        case 'c':
            i_param = (INTVAL)(char)(long)ext;
case_I:
            pasm_sig[2] = 'I';
            param = (void*) i_param;
            break;
#if 0
        case 'f':
        case 'd':
            /* these types don't fit into a pointer, they will not
             * work
             */
            break;
        case 'p':
            /* TODO created UnManagedStruct */
        case 'P':
            pasm_sig[2] = 'P';
            break;
#endif
        case 't':
            pasm_sig[2] = 'S';
            param = string_from_cstring(interpreter, ext, 0);
            break;
        default:
            internal_exception(1, "unhandled sig char '%c' in run_cb");
    }
    pasm_sig[3] = '\0';
    Parrot_runops_fromc_args_save(interpreter, sub, pasm_sig,
            user_data, param);
}
/*

=item C<void Parrot_callback_C(void *external_data, PMC *callback_info)>

=item C<void Parrot_callback_D(PMC *callback_info, void *external_data)>

NCI callback functions s. ppd16

=cut

*/

void
Parrot_callback_C(void *external_data, PMC *callback_info)
{
    verify_CD(external_data, callback_info);
}

void
Parrot_callback_D(PMC *callback_info, void *external_data)
{
    verify_CD(external_data, callback_info);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/interpreter.h>, L<docs/pdds/pdd16_native_call.pod>.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
