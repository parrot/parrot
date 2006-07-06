/*
Copyright (C) 2004, The Perl Foundation.
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
Parrot_find_namespace_gen(Interp *, int hll_id, PMC *ns_key, STRING *ns_name)>

Find the namespace belonging to the given HLL and designted by C<ns_key> or C<ns_name>:

   If C<ns_key> is not null, then using C<ns_key> as an index from the given HLL root.
     The value of C<ns_key> may be a key PMC, an array of namespace name strings, or a
     string PMC.

   Otherwise, if C<ns_name> is not NULL, then using C<ns_name> as the one-level index.

   Otherwise, using the HLL root namespace itself.

Return the namespace, or NULL if not found.

=item C<PMC *
Parrot_find_namespace_k(Interp *, PMC *ns_key)>

Find the namespace beloinging to the current HLL and designated by C<ns_key>, which may be
a key PMC, an array of namespace name strings, or a string PMC.

=item C<PMC *
Parrot_find_namespace_s(Interp *, STRING *ns_name)>

Find the namespace beloinging to the current HLL and designated by C<ns_name>.

=cut

*/

PMC *
Parrot_find_namespace_gen(Interp *interpreter, int hll_id,
                          PMC *ns_key, STRING *ns_name)
{
    PMC *ns;

    ns = Parrot_get_HLL_namespace(interpreter, hll_id);

    if (! PMC_IS_NULL(ns_key) || ns_name) {
        if (! PMC_IS_NULL(ns_key))
            ns = VTABLE_get_pmc_keyed(interpreter, ns, ns_key);
        else
            ns = VTABLE_get_pmc_keyed_str(interpreter, ns, ns_name);

        /* XXX - We should use the typed interface.  For now, if we're looking for a
         * namespace and we got something else, return failure. */

        if (! PMC_IS_NULL(ns)
            && ns->vtable->base_type != enum_class_NameSpace)
            return NULL;
    }

    return PMC_IS_NULL(ns) ? NULL: ns;
}

PMC *
Parrot_find_namespace_k(Interp *interpreter, PMC *ns_key)
{
    return Parrot_find_namespace_gen(interpreter,
                                     CONTEXT(interpreter->ctx)->current_HLL,
                                     ns_key, NULL);
}

PMC *
Parrot_find_namespace_s(Interp *interpreter, STRING *ns_name)
{
    return Parrot_find_namespace_gen(interpreter,
                                     CONTEXT(interpreter->ctx)->current_HLL,
                                     PMCNULL, ns_name);
}

/*

=item C<PMC *
Parrot_make_namespace_gen(Interp *, int hll_id, PMC *ns_key, STRING *ns_name)>

Find, or create if not found, a namespace belonging to the given HLL and designated by
C<ns_key> or C<ns_name>:

   If C<ns_key> is not null, then using C<ns_key> as an index from the given HLL root.
     The value of C<ns_key> may be a key PMC, an array of namespace name strings, or a
     string PMC.

   Otherwise, if C<ns_name> is not NULL, then using C<ns_name> as the one-level index.

   Otherwise, using the HLL root namespace itself.

Return the namespace, or NULL if not found.

=item C<PMC *
Parrot_make_namespace_k(Interp *, PMC *ns_key)>

Find, or create, the namespace beloinging to the current HLL and designated by C<ns_key>,
which may be a key PMC, an array of namespace name strings, or a string PMC.

=item C<PMC *
Parrot_make_namespace_s(Interp *, STRING *ns_name)>

Find, or create, the namespace beloinging to the current HLL and designated by C<ns_name>.
Should always return a valid PMC.

=cut

*/

PMC *
Parrot_make_namespace_gen(Interp *interpreter, int hll_id,
                          PMC *ns_key, STRING *ns_name)
{
    PMC *ns;
    INTVAL sub_ns_type;
    PMC *sub_ns;

    sub_ns = Parrot_find_namespace_gen(interpreter, hll_id, ns_key, ns_name);
    if (sub_ns)
        return sub_ns;

    /* OK, let's do this the hard way */

    ns = Parrot_get_HLL_namespace(interpreter, hll_id);

    sub_ns_type = Parrot_get_HLL_type(interpreter, hll_id, enum_class_NameSpace);
    sub_ns = pmc_new(interpreter, sub_ns_type);
    if (PMC_IS_NULL(sub_ns))
        return NULL;

    /* TODO - intermediate namespaces may not be created with correct types;
     * see namespace.set_pmc_keyed(). */

    if (! PMC_IS_NULL(ns_key))
        VTABLE_set_pmc_keyed(interpreter, ns, ns_key, sub_ns);
    else
        VTABLE_set_pmc_keyed_str(interpreter, ns, ns_name, sub_ns);

    return sub_ns;
}

PMC *
Parrot_make_namespace_k(Interp *interpreter, PMC *ns_key)
{
    return Parrot_make_namespace_gen(interpreter,
                                     CONTEXT(interpreter->ctx)->current_HLL,
                                     ns_key, NULL);
}

PMC *
Parrot_make_namespace_s(Interp *interpreter, STRING *ns_name)
{
    return Parrot_make_namespace_gen(interpreter,
                                     CONTEXT(interpreter->ctx)->current_HLL,
                                     PMCNULL, ns_name);
}

/*

=item C<PMC *
Parrot_find_global_n(Interp *, PMC *ns, STRING *globalname)>

Search the namespace PMC C<ns> for an object with name C<globalname>.  Return the object,
or NULL if not found.

XXX - For now this function prefers non-namespaces, it will eventually entirely use the
untyped interface.

=item C<PMC *
Parrot_find_global_k(Interp *, PMC *ns_key, STRING *globalname)>

Search the namespace designated by C<ns_key>, which may be a key PMC, an array of
namespace name strings, or a string PMC, for an object with name C<globalname>.  Return
the object, or NULL if not found.

XXX - For now this function prefers non-namespaces, it will eventually entirely use the
untyped interface.

=item C<PMC *
Parrot_find_global_s(Interp *, STRING *ns_name, STRING *globalname)>

Search the namespace designated by C<ns_name>, or the HLL root if C<ns_name> is NULL,
for an object with name C<globalname>.  Return the object, or NULL if not found.

XXX - For now this function prefers non-namespaces, it will eventually entirely use the
untyped interface.

=cut

*/

PMC *
Parrot_find_global_n(Interp *interpreter, PMC *ns, STRING *globalname)
{
    PMC *res;

#if DEBUG_GLOBAL
    if (globalname)
        PIO_printf(interpreter, "find_global name '%Ss'\n", globalname);
#endif

    if (PMC_IS_NULL(ns))
        res = PMCNULL;
    else {
        /*
         * XXX - we should be able to use 'get_pmc_keyed' here,
         * but we can't because Parrot's default namespaces are not
         * fully typed and there's a pseudo-typed interface that
         * distinguishes 'get_pmc_keyed' from 'get_pointer_keyed';
         * the former is for NS and the latter is for non-NS.
         */
        res = VTABLE_get_pointer_keyed_str(interpreter, ns, globalname);
    }

    return PMC_IS_NULL(res) ? NULL : res;
}

PMC *
Parrot_find_global_cur(Interp *interpreter, STRING *globalname)
{
    return Parrot_find_global_n(interpreter,
                                CONTEXT(interpreter->ctx)->current_namespace,
                                globalname);
}

PMC *
Parrot_find_global_k(Interp *interpreter, PMC *ns_key, STRING *globalname)
{
    return Parrot_find_global_n(interpreter,
                                Parrot_find_namespace_k(interpreter, ns_key),
                                globalname);
}

PMC *
Parrot_find_global_s(Interp *interpreter, STRING *ns_name, STRING *globalname)
{
    return Parrot_find_global_n(interpreter,
                                Parrot_find_namespace_s(interpreter, ns_name),
                                globalname);
}

/*

=item C<PMC *
Parrot_store_global_n(Interp *, PMC *ns, STRING *globalname, PMC *val)>

Store the PMC C<val> into the namespace PMC C<ns> with name C<globalname>.

=item C<PMC *
Parrot_store_global_k(Interp *, PMC *ns_key, STRING *globalname, PMC *val)>

Store the PMC C<val> into the namespace designated by C<ns_key>, which may be a key PMC,
an array of namespace name strings, or a string PMC, with name C<globalname>.

XXX - For now this function prefers non-namespaces, it will eventually entirely use the
untyped interface.

=item C<PMC *
Parrot_store_global_s(Interp *, STRING *ns_name, STRING *globalname, PMC *val)>

Store the PMC C<val> into the namespace designated by C<ns_name>, or the HLL root if
C<ns_name> is NULL, with the name C<globalname>.

=cut

*/

void
Parrot_store_global_n(Interp *interpreter, PMC *ns, STRING *globalname, PMC *val)
{
#if DEBUG_GLOBAL
    if (globalname)
        PIO_printf(interpreter, "store_global name '%Ss'\n", globalname);
#endif

    if (PMC_IS_NULL(ns))
        return;

    VTABLE_set_pmc_keyed_str(interpreter, ns, globalname, val);
}

void
Parrot_store_global_cur(Interp *interpreter, STRING *globalname, PMC *val)
{
    Parrot_store_global_n(interpreter,
                          CONTEXT(interpreter->ctx)->current_namespace,
                          globalname, val);

    /* FIXME - method cache invalidation should occur */
}

void
Parrot_store_global_k(Interp *interpreter, PMC *ns_key, STRING *globalname, PMC *val)
{
    /*
     * XXX - temporary hack to notice when key is actually a string, so that
     * the legacy logic for invalidating method cache will be called; this is
     * not good enough but it avoids regressesions for now
     */
    if (ns_key->vtable->base_type == enum_class_String) {
        Parrot_store_global_s(interpreter, PMC_str_val(ns_key), globalname, val);
        return;
    }

    Parrot_store_global_n(interpreter,
                          Parrot_make_namespace_k(interpreter, ns_key),
                          globalname, val);

    /* FIXME - method cache invalidation should occur */
}

void
Parrot_store_global_s(Interp *interpreter, STRING *ns_name, STRING *globalname, PMC *val)
{
    Parrot_store_global_n(interpreter,
                          Parrot_make_namespace_s(interpreter, ns_name),
                          globalname, val);

    /* FIXME - method cache invalidation should be a namespace function */
    Parrot_invalidate_method_cache(interpreter, ns_name, globalname);
}


/*

=item C<PMC *
Parrot_find_global_op(Interp *, PMC *ns, STRING *globalname, void *next)>

If the global exists in the given namespace PMC, return it.  If not, either throw an
exception or return a C<Null> PMC, depending on the interpreter's error settings.

=cut

*/

PMC *
Parrot_find_global_op(Interp *interpreter, PMC *ns, STRING *globalname, void *next)
{
    PMC *res;

    if (!globalname)
	internal_exception(1, "Tried to find null global.");

    res = Parrot_find_global_n(interpreter, ns, globalname);
    if (!res) {
        if (PARROT_ERRORS_test(interpreter, PARROT_ERRORS_GLOBALS_FLAG))
            real_exception(interpreter, next, E_NameError,
                           "Global '%Ss' not found",
                           globalname);
        res = PMCNULL;
    }

    return res;
}

/*

=item C<PMC *
Parrot_find_name_op(Interp *, STRING *name, void *next)>

Find the given C<name> in lexicals, then the current namespace, then the HLL root
namespace, and finally Parrot builtins.  If the name isn't found anywhere, then depending
on the interpreter's errors setting, either throw an exception or return a C<Null> PMC .

=cut

*/


PMC *
Parrot_find_name_op(Interp *interpreter, STRING *name, void *next)
{
    parrot_context_t * const ctx = CONTEXT(interpreter->ctx);
    PMC *g, *lex_pad;

    g = PMCNULL;

    lex_pad = Parrot_find_pad(interpreter, name, ctx);
    if (!PMC_IS_NULL(lex_pad))
        g = VTABLE_get_pmc_keyed_str(interpreter, lex_pad, name);

    /* TODO TODO TODO - walk up the scopes!  duh!! */

    if (PMC_IS_NULL(g))
        g = Parrot_find_global_cur(interpreter, name);

    if (PMC_IS_NULL(g))
        g = Parrot_find_global_n(interpreter,
                                 Parrot_get_ctx_HLL_namespace(interpreter),
                                 name);

    if (PMC_IS_NULL(g))
        g = Parrot_find_builtin(interpreter, name);

    if (! PMC_IS_NULL(g)) {
        if (g->vtable->base_type == enum_class_MultiSub &&
                interpreter->current_args) {
            /*
             * inside a function call, we have an args signature
             */
            g = Parrot_MMD_search_default_func(interpreter, name);
            if (! PMC_IS_NULL(g))
                return g;
        }
        else
            return g;
    }

    if (PARROT_ERRORS_test(interpreter, PARROT_ERRORS_GLOBALS_FLAG))
        real_exception(interpreter, next, E_NameError,
                "Name '%Ss' not found", name);

    return PMCNULL;
}

/*
 * store a subroutine
 *
 * FIXME - This should not be here!
 * It's generic logic that should apply whenever a Sub is stored anywhere,
 *  and since lots of things can be invoked, maybe more than just Subs.
 * Where it _should_ be, I don't know for sure.
 *
 * if ns_key is provided, it wins.
 * else if ns_name is provided, it is used.
 * if neither is provided, the HLL namespace is used.
 */

static void
store_sub(Interp *interpreter, PMC *ns_key, STRING *ns_name, STRING *sub_name, PMC *sub_pmc)
{
    int hll_id;
    PMC *ns;

    if (sub_pmc->vtable->base_type == enum_class_MultiSub) {
        PMC *one_sub;

        one_sub = VTABLE_get_pmc_keyed_int(interpreter, sub_pmc, 0);
        hll_id = PMC_sub(one_sub)->HLL_id;
    }
    else
        hll_id = PMC_sub(sub_pmc)->HLL_id;

    ns = Parrot_make_namespace_gen(interpreter, hll_id, ns_key, ns_name);

    Parrot_store_global_n(interpreter, ns, sub_name, sub_pmc);

    if (! PMC_IS_NULL(ns_key))
        ; /* FIXME FIXME - can't invalidate by key? */
    else if (ns_name)
        Parrot_invalidate_method_cache(interpreter, ns_name, sub_name);

    /* MultiSub isa R*PMCArray and doesn't have a PMC_sub structure 
     * MultiSub could also contain subs from various namespaces,
     * so it doesn't make much sense to associate a namespace
     * with a multi.
     *
     */
    if (sub_pmc->vtable->base_type != enum_class_MultiSub)
        PMC_sub(sub_pmc)->namespace_stash = ns;
}

static void
store_sub_in_namespace(Parrot_Interp interpreter, PMC* sub_pmc, PMC *ns_key, STRING *sub_name)
{
    /*
     * ns_key is either a String, or a Key, or NULL
     */
    if (PMC_IS_NULL(ns_key))
        store_sub(interpreter, PMCNULL, NULL, sub_name, sub_pmc);
    else {
        INTVAL type = ns_key->vtable->base_type;
        switch (type) {
            case enum_class_String:
                store_sub(interpreter, PMCNULL, PMC_str_val(ns_key), sub_name, sub_pmc);
                break;
            case enum_class_Key:
                store_sub(interpreter, ns_key, NULL, sub_name, sub_pmc);
                break;
            default:
                internal_exception(1, "Namespace constant is neither String nor Key");
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
     * foo :multi(STRING, Integer) =>
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

static void
store_named_in_namespace(Parrot_Interp interpreter, PMC* sub_pmc)
{
    STRING* sub_name;
    PMC *multi_sig;
    PMC *namespace;
    INTVAL func_nr;
    char *c_meth;

    sub_name  = PMC_sub(sub_pmc)->name;
    namespace = PMC_sub(sub_pmc)->namespace;
    multi_sig = PMC_sub(sub_pmc)->multi_signature;
    
    if (PMC_IS_NULL(multi_sig)) {
        store_sub_in_namespace(interpreter, sub_pmc, namespace, sub_name);
    }
    else {
        STRING *long_name;
        PMC *multi_sub;
        PMC *stash;
        
        /* If namespace is NULL, we need to look in the root HLL namespace. But
           since we haven't actually run code yet, the context hasn't been set
           to include the HLL, so we have to do the work ourselves. */
        stash = Parrot_get_HLL_namespace(interpreter, PMC_sub(sub_pmc)->HLL_id);
        if (! PMC_IS_NULL(namespace))
            stash = VTABLE_get_pmc_keyed(interpreter, stash, namespace);
        multi_sub = PMC_IS_NULL(stash)
            ? PMCNULL
            : VTABLE_get_pmc_keyed_str(interpreter, stash, sub_name);
        
        /* is there an existing MultiSub PMC? or do we need to create one? */
        if (PMC_IS_NULL(multi_sub)) {
            multi_sub = pmc_new(interpreter, enum_class_MultiSub);
            /* we have to push the sub onto the MultiSub before we try to store
               it because storing requires information from the sub */
            VTABLE_push_pmc(interpreter, multi_sub, sub_pmc);
            store_sub_in_namespace(interpreter, multi_sub,
                    namespace, sub_name);
        }
        else
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

/* TODO - this looks like it doesn't understand nested namespaces */

void
Parrot_store_sub_in_namespace(Parrot_Interp interpreter, PMC *sub)
{
    if (!(PObj_get_FLAGS(sub) & SUB_FLAG_PF_ANON)) {
        INTVAL cur_id = CONTEXT(interpreter->ctx)->current_HLL;
        /* PF structures aren't fully constructed yet */
        Parrot_block_DOD(interpreter);
        /* store relative to HLL namespace */
        CONTEXT(interpreter->ctx)->current_HLL = PMC_sub(sub)->HLL_id;
        
        store_named_in_namespace(interpreter, sub);
        
        /* restore HLL_id */
        CONTEXT(interpreter->ctx)->current_HLL = cur_id;
        Parrot_unblock_DOD(interpreter);
    }
    else {
        PMC *stash = Parrot_get_HLL_namespace(interpreter, PMC_sub(sub)->HLL_id);
        PMC_sub(sub)->namespace_stash = stash;
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
