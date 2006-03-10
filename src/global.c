/*
Copyright: 2004 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/global.c - Access to global PMCs

=head1 DESCRIPTION

tdb

=head2 Functions

tdb

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "global.str"

#define DEBUG_GLOBAL 0
/*

=item C<PMC *
Parrot_find_global(Parrot_Interp interpreter, STRING *class, STRING *globalname)>

If C<class> is NULL search global stash. XXX TODO search current ns.

Return NULL if the global isn't found or the global.

=item C<PMC *
Parrot_get_global(Parrot_Interp interpreter, STRING *class, STRING *globalname)>

If the global exists, return it. If not either throw an exception or return a
C<Null> PMC depending on the interpreter's error settings.

=cut

*/

PMC *
Parrot_find_global(Parrot_Interp interpreter, STRING *class, STRING *globalname)
{
    PMC *stash;

#if DEBUG_GLOBAL
    PIO_printf(interpreter, "find_global class '%Ss' meth '%Ss'\n",
            class, globalname);
#endif
    if (class) {
        stash = VTABLE_get_pmc_keyed_str(interpreter,
                                         interpreter->stash_hash,
                                         class);
        if (!stash)
            return NULL;
    }
    else {
        stash = interpreter->stash_hash;
        /* TODO return relative to current namespace */
    }
    return VTABLE_get_pointer_keyed_str(interpreter,
            stash, globalname);
}

PMC *
Parrot_find_global_p(Parrot_Interp interpreter, PMC *ns, STRING *name)
{

    if (PMC_IS_NULL(ns))
        return Parrot_find_global(interpreter, NULL, name);
    switch (ns->vtable->base_type) {
        case enum_class_String:
            return Parrot_find_global(interpreter, PMC_str_val(ns), name);
        case enum_class_Key:
            ns = VTABLE_get_pmc_keyed(interpreter, interpreter->stash_hash, ns);
            if (!ns)
                return NULL;
            /* fall through */
        case enum_class_NameSpace:
            return VTABLE_get_pointer_keyed_str(interpreter, ns, name);
    }
    return NULL;
}

PMC *
Parrot_get_global(Parrot_Interp interpreter, STRING *class,
        STRING *name, void *next)
{
    PMC *g = Parrot_find_global(interpreter, class, name);
    if (g)
        return g;
    if (PARROT_ERRORS_test(interpreter, PARROT_ERRORS_GLOBALS_FLAG))  {
        real_exception(interpreter, next, E_NameError,
                "Global '%Ss' not found",
                name);
    }
    return PMCNULL;
}

PMC *
Parrot_get_global_p(Parrot_Interp interpreter, PMC *ns, STRING *name)
{
    PMC *g = Parrot_find_global_p(interpreter, ns, name);
    if (g)
        return g;
    if (PARROT_ERRORS_test(interpreter, PARROT_ERRORS_GLOBALS_FLAG))  {
        real_exception(interpreter, NULL, E_NameError,
                "Global '%Ss' not found",
                name);
    }
    return PMCNULL;
}

/*

=item C<PMC* Parrot_get_name(Interp* interpreter, STRING *name)>

Find the name in lexicals, globals, and builtins. If the name
isn't found throw and exception or return the Null PMC, depending on
the interpreter's errors setting.

=cut

*/


PMC *
Parrot_get_name(Interp* interpreter, STRING *name)
{
    PMC *g, *lex_pad, *current_sub, *namespace;
    parrot_context_t *ctx = CONTEXT(interpreter->ctx);

    lex_pad = Parrot_find_pad(interpreter, name, ctx);
    g = NULL;
    if (!PMC_IS_NULL(lex_pad)) {
	g = VTABLE_get_pmc_keyed_str(interpreter, lex_pad, name);
    }
    if (!g) {
        current_sub = CONTEXT(interpreter->ctx)->current_sub;
        if (current_sub &&
                (namespace = PMC_sub(current_sub)->namespace))

            g = Parrot_find_global_p(interpreter, namespace, name);
    }
    if (!g)
        g = Parrot_find_global(interpreter, NULL, name);
    if (!g)
        g = Parrot_find_builtin(interpreter, name);
    if (g) {
        if (g->vtable->base_type == enum_class_MultiSub &&
                interpreter->current_args) {
            /*
             * inside a function call, we have an args signature
             */
            g = Parrot_MMD_search_default_func(interpreter, name);
            if (g)
                return g;
        }
        else
            return g;
    }
    if (PARROT_ERRORS_test(interpreter, PARROT_ERRORS_GLOBALS_FLAG))  {
        real_exception(interpreter, NULL, E_NameError,
                "Name '%Ss' not found", name);
    }

    return PMCNULL;
}

/*

=item C<PMC* Parrot_global_namespace(Interp *, PMC *globals, STRING *ns)>

Return the stash hash of the given namespace in C<globals>.
If it doesn't exist yet, add it to the stash C<globals>.

=cut

*/

PMC*
Parrot_global_namespace(Interp *interpreter, PMC *globals, STRING *class)
{
    PMC *stash;

    /*
     * this routine is called by PackFile_ConstTable_unpack too, which
     * creates const table entries for global subs. During that the
     * constant isn't yet created. Triggering a DOD run in the hash
     * lookup dies then during mark_1_seg.
     */
    Parrot_block_DOD(interpreter);
    stash = VTABLE_get_pmc_keyed_str(interpreter, globals, class);
    if (!stash || stash->vtable->base_type != enum_class_NameSpace) {
        stash = pmc_new(interpreter, enum_class_NameSpace);
        VTABLE_set_pmc_keyed_str(interpreter, globals, class, stash);
    }
    Parrot_unblock_DOD(interpreter);
    return stash;
}

/*

=item C<void
Parrot_store_global(Parrot_Interp, STRING *class, STRING *globalname, PMC *)>

Store the given PMC as global C<globalname> in the namespace C<class>. If
C<class> is NULL, the top-level global namespace is used.

=cut

*/

void
Parrot_store_global(Interp *interpreter, STRING *class,
        STRING *globalname, PMC *pmc)
{
    PMC *globals = interpreter->stash_hash;
    PMC *stash;
    if (class) {
        stash = Parrot_global_namespace(interpreter, globals, class);
    }
    else
        stash = globals;
    VTABLE_set_pmc_keyed_str(interpreter, stash, globalname, pmc);
    Parrot_invalidate_method_cache(interpreter, class, globalname);
}

static void
store_sub_in_namespace(Parrot_Interp interpreter, PMC* sub_pmc,
        PMC *namespace, STRING *sub_name)
{
    PMC *globals = interpreter->stash_hash;
    INTVAL type, class_type;

#if DEBUG_GLOBAL
    fprintf(stderr, "PMC_CONST: store_global: name '%s' ns %s\n",
            (char*)sub_name->strstart,
            namespace ? (char*)PMC_str_val(namespace)->strstart : "(none)");
#endif
    /*
     * namespace is either s String or a Key PMC or NULL
     */
    if (PMC_IS_NULL(namespace)) {
global_ns:
        /* XXX store relative - not absolute */
        Parrot_store_global(interpreter, NULL, sub_name, sub_pmc);
    }
    else {
        STRING *names;
        PMC * stash = NULL, *part;

        type = namespace->vtable->base_type;
        switch (type) {
            case enum_class_String:
                names = PMC_str_val(namespace);
                if (!string_length(interpreter, names))
                    goto global_ns;
                Parrot_store_global(interpreter, names, sub_name, sub_pmc);
                break;
            case enum_class_Key:
                part = namespace;
                /*
                 * a nested key can't be handled by add_method
                 */
                for (; part; part = PMC_data(part)) {
                    STRING *s = key_string(interpreter, part);
#if TRACE_PACKFILE_PMC
                    PIO_printf(interpreter, "key part %Ss\n", s);
#endif
                    stash = Parrot_global_namespace(interpreter, globals, s);
                    globals = stash;
                }
                VTABLE_set_pmc_keyed_str(interpreter, stash, sub_name, sub_pmc);
                PMC_sub(sub_pmc)->namespace_stash = stash;
                break;
            default:
                internal_exception(1, "Unhandled namespace constant");
        }

    }
}

/* XXX in mmd.c ? */
STRING* Parrot_multi_long_name(Parrot_Interp interpreter, PMC* sub_pmc);

STRING*
Parrot_multi_long_name(Parrot_Interp interpreter, PMC* sub_pmc)
{
    PMC *multi_sig;
    STRING* sub_name, *sig;
    INTVAL i, n;

    sub_name = PMC_sub(sub_pmc)->name;
    multi_sig = PMC_sub(sub_pmc)->multi_signature;
    n = VTABLE_elements(interpreter, multi_sig);
    /*
     * foo @MULTI(STRING, Integer) =>
     *
     * foo_@STRING_@Integer
     */
    for (i = 0; i < n; ++i) {
        sig = VTABLE_get_string_keyed_int(interpreter, multi_sig, i);
        sub_name = string_concat(interpreter, sub_name,
                const_string(interpreter, "_@"), 0);
        sub_name = string_concat(interpreter, sub_name, sig, 0);
    }
    return sub_name;
}

void
Parrot_store_sub_in_namespace(Parrot_Interp interpreter, PMC* sub_pmc)
{
    STRING* sub_name;
    PMC *multi_sig;
    PMC *namespace;
    INTVAL func_nr;
    char *c_meth;

    sub_name = PMC_sub(sub_pmc)->name;
    namespace = PMC_sub(sub_pmc)->namespace;
    multi_sig = PMC_sub(sub_pmc)->multi_signature;
    if (PMC_IS_NULL(multi_sig)) {
        store_sub_in_namespace(interpreter, sub_pmc, namespace, sub_name);
    }
    else {
        STRING *long_name;
        PMC *multi_sub;

        multi_sub = Parrot_find_global_p(interpreter, namespace, sub_name);
        if (!multi_sub) {
            multi_sub = pmc_new(interpreter, enum_class_MultiSub);
            store_sub_in_namespace(interpreter, multi_sub,
                    namespace, sub_name);
        }
        VTABLE_push_pmc(interpreter, multi_sub, sub_pmc);
        long_name = Parrot_multi_long_name(interpreter, sub_pmc);
        store_sub_in_namespace(interpreter, sub_pmc, namespace, long_name);

        c_meth = string_to_cstring(interpreter, sub_name);
        if ( (func_nr = Parrot_MMD_method_idx(interpreter, c_meth))  >= 0) {
            Parrot_mmd_rebuild_table(interpreter, -1, func_nr);
        }
        string_cstring_free(c_meth);
    }
}

/*

=back

=head1 SEE ALSO

F<include/parrot/global.h>

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
