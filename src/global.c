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
 * internal_ns_keyed: Internal function to do keyed namespace lookup
 * relative to a given namespace PMC.  Understands STRINGs, String PMCs,
 * Key pmcs, and array PMCs containing strings.
 */

/* flags for internal_ns_keyed */
#define INTERN_NS_CREAT 1       /* I'm a fan of the classics */

static PMC * internal_ns_keyed(Interp *interp, PMC *base_ns, PMC *pmc_key,
                               STRING *str_key, int flags)
{
    PMC *ns, *sub_ns;
    INTVAL i, n;
    static const INTVAL max_intval = (INTVAL)( (~(UINTVAL)0) >> 1); /*2s comp*/

    ns = base_ns;

    if (str_key)
        n = 1;
    else if (pmc_key->vtable->base_type == enum_class_String) {
        str_key = VTABLE_get_string(interp, pmc_key);
        n = 1;
    }
    else if (pmc_key->vtable->base_type == enum_class_Key)
        n = max_intval;         /* we don't yet know how big the key is */
    else
        n = VTABLE_elements(interp, pmc_key); /* array of strings */

    for (i = 0; i < n; ++i) {
        STRING *part;

        if (str_key)
            part = str_key;
        else if (n == max_intval) {
            part = key_string(interp, pmc_key);
            pmc_key = key_next(interp, pmc_key);
            if (! pmc_key)
                n = i + 1;      /* now we know how big the key is */
        }
        else
            part = VTABLE_get_string_keyed_int(interp, pmc_key, i);

        sub_ns = VTABLE_get_pmc_keyed_str(interp, ns, part);

        if (PMC_IS_NULL(sub_ns)
            /* TODO - stop depending on typed namespace */
            || sub_ns->vtable->base_type != enum_class_NameSpace)
        {
            if (!(flags & INTERN_NS_CREAT))
                return PMCNULL;

            /* TODO - match HLL of enclosing namespace? */
            sub_ns = pmc_new(interp,
                             Parrot_get_ctx_HLL_type(interp,
                                                     enum_class_NameSpace));
            if (PMC_IS_NULL(sub_ns))
                return PMCNULL;
            VTABLE_set_pmc_keyed_str(interp, ns, part, sub_ns);
        }

        ns = sub_ns;
    }

    return ns;
}

/*

=item C<PMC *
Parrot_get_namespace_keyed(Interp *, PMC *base_ns, PMC *pmc_key)>

Find the namespace relative to the namespace C<base_ns> with the key
C<pmc_key>, which may be a String, a Key, or an array of strings.  Return
the namespace, or NULL if not found.

=item C<PMC *
Parrot_get_namespace_keyed_str(Interp *, PMC *base_ns, STRING *str_key)>

Find the namespace relative to the namespace C<base_ns> with the string key
C<str_key>.  Return the namespace, or NULL if not found.

=item C<PMC *
Parrot_make_namespace_keyed(Interp *, PMC *base_ns, PMC *pmc_key)>

Find, or create if necessary, the namespace relative to the namespace
C<base_ns> with the key C<pmc_key>, which may be a String, a Key, or an
array of strings.  Return the namespace.  Errors will result in exceptions.

=item C<PMC *
Parrot_make_namespace_keyed_str(Interp *, PMC *base_ns, STRING *str_key)>

Find, or create if necessary, the namespace relative to the namespace
C<base_ns> with the string key C<str_key>.  Return the namespace.  Errors
will result in exceptions.

=cut

*/


PMC *
Parrot_get_namespace_keyed(Interp *interp, PMC *base_ns, PMC *pmc_key)
{
    return internal_ns_keyed(interp, base_ns,
                             pmc_key, NULL, 0);
}

PMC *
Parrot_get_namespace_keyed_str(Interp *interp, PMC *base_ns, STRING *str_key)
{
    return internal_ns_keyed(interp, base_ns,
                             PMCNULL, str_key, 0);
}

PMC *
Parrot_make_namespace_keyed(Interp *interp, PMC *base_ns, PMC *pmc_key)
{
    return internal_ns_keyed(interp, base_ns,
                             pmc_key, NULL, INTERN_NS_CREAT);
}

PMC *
Parrot_make_namespace_keyed_str(Interp *interp, PMC *base_ns, STRING *str_key)
{
    return internal_ns_keyed(interp, base_ns,
                             NULL, str_key, INTERN_NS_CREAT);
}


/*

=item C<PMC *
Parrot_get_global(Interp *, PMC *ns, STRING *globalname)>

Look up the global named C<globalname> in the namespace C<ns>.  Return the
global, or return PMCNULL if C<ns> is null or if the global is not found.

KLUDGE ALERT: Currently prefers non-namespaces in case of collision.

=item C<PMC *
Parrot_set_global(Interp *, PMC *ns, STRING *globalname, PMC *val)>

Set the global named C<globalname> in the namespace C<ns> to the value C<val>.

=cut

*/

PMC *
Parrot_get_global(Interp *interp, PMC *ns, STRING *globalname)
{
    if (PMC_IS_NULL(ns))
        return PMCNULL;

    return VTABLE_get_pointer_keyed_str(interp, ns, globalname);
}

void
Parrot_set_global(Interp *interp, PMC *ns, STRING *globalname, PMC *val)
{
    VTABLE_set_pmc_keyed_str(interp, ns, globalname, val);
}


/*

=item C<PMC *
Parrot_find_global_n(Interp *, PMC *ns, STRING *globalname)>

Search the namespace PMC C<ns> for an object with name C<globalname>.
Return the object, or NULL if not found.

XXX - For now this function prefers non-namespaces, it will eventually
entirely use the untyped interface.

=item C<PMC *
Parrot_find_global_k(Interp *, PMC *pmc_key, STRING *globalname)>

Search the namespace designated by C<pmc_key>, which may be a key PMC,
an array of namespace name strings, or a string PMC, for an object
with name C<globalname>.  Return the object, or NULL if not found.

XXX - For now this function prefers non-namespaces, it will eventually
entirely use the untyped interface.

=item C<PMC *
Parrot_find_global_s(Interp *, STRING *str_key, STRING *globalname)>

Search the namespace designated by C<str_key>, or the HLL root if
C<str_key> is NULL, for an object with name C<globalname>.  Return the
object, or NULL if not found.

XXX - For now this function prefers non-namespaces, it will eventually
entirely use the untyped interface.

=cut

*/

PMC *
Parrot_find_global_n(Interp *interp, PMC *ns, STRING *globalname)
{
    PMC *res;

#if DEBUG_GLOBAL
    if (globalname)
        PIO_printf(interp, "find_global name '%Ss'\n", globalname);
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
        res = VTABLE_get_pointer_keyed_str(interp, ns, globalname);
    }

    return PMC_IS_NULL(res) ? NULL : res;
}

PMC *
Parrot_find_global_cur(Interp *interp, STRING *globalname)
{
    PMC * const ns = CONTEXT(interp->ctx)->current_namespace;
    return Parrot_find_global_n(interp, ns, globalname);
}

PMC *
Parrot_find_global_k(Interp *interp, PMC *pmc_key, STRING *globalname)
{
    PMC * const ns =
        Parrot_get_namespace_keyed(interp,
                                   Parrot_get_ctx_HLL_namespace(interp),
                                   pmc_key);
    return Parrot_find_global_n(interp, ns, globalname);
}

PMC *
Parrot_find_global_s(Interp *inter, STRING *str_key, STRING *globalname)
{
    PMC *const ns =
        Parrot_get_namespace_keyed_str(inter,
                                       Parrot_get_ctx_HLL_namespace(inter),
                                       str_key);
    return Parrot_find_global_n(inter, ns, globalname);
}

/*

=item C<PMC *
Parrot_store_global_n(Interp *, PMC *ns, STRING *globalname, PMC *val)>

Store the PMC C<val> into the namespace PMC C<ns> with name C<globalname>.

=item C<PMC *
Parrot_store_global_k(Interp *, PMC *pmc_key, STRING *globalname, PMC *val)>

Store the PMC C<val> into the namespace designated by C<pmc_key>,
which may be a key PMC, an array of namespace name strings, or a
string PMC, with name C<globalname>.

XXX - For now this function prefers non-namespaces, it will eventually
entirely use the untyped interface.

=item C<PMC *
Parrot_store_global_s(Interp *, STRING *str_key, STRING *globalname, PMC *val)>

Store the PMC C<val> into the namespace designated by C<str_key>, or
the HLL root if C<str_key> is NULL, with the name C<globalname>.

=cut

*/

void
Parrot_store_global_n(Interp *interp, PMC *ns,
                      STRING *globalname, PMC *val)
{
#if DEBUG_GLOBAL
    if (globalname)
        PIO_printf(interp, "store_global name '%Ss'\n", globalname);
#endif

    if (PMC_IS_NULL(ns))
        return;

    VTABLE_set_pmc_keyed_str(interp, ns, globalname, val);
}

void
Parrot_store_global_cur(Interp *interp, STRING *globalname, PMC *val)
{
    Parrot_store_global_n(interp,
                          CONTEXT(interp->ctx)->current_namespace,
                          globalname, val);

    /* FIXME - method cache invalidation should occur */
}

void
Parrot_store_global_k(Interp *interp, PMC *pmc_key,
                      STRING *globalname, PMC *val)
{
    PMC *ns;

    /*
     * XXX - temporary hack to notice when key is actually a string, so that
     * the legacy logic for invalidating method cache will be called; this is
     * not good enough but it avoids regressesions for now
     */
    if (pmc_key->vtable->base_type == enum_class_String) {
        Parrot_store_global_s(interp, PMC_str_val(pmc_key),
                              globalname, val);
        return;
    }

    ns = Parrot_make_namespace_keyed(interp,
                                     Parrot_get_ctx_HLL_namespace(interp),
                                     pmc_key);

    Parrot_store_global_n(interp, ns, globalname, val);

    /* FIXME - method cache invalidation should occur */
}

void
Parrot_store_global_s(Interp *inter, STRING *str_key,
                      STRING *globalname, PMC *val)
{
    PMC *ns;

    ns = Parrot_make_namespace_keyed_str(inter,
                                         Parrot_get_ctx_HLL_namespace(inter),
                                         str_key);

    Parrot_store_global_n(inter, ns, globalname, val);

    /* FIXME - method cache invalidation should be a namespace function */
    Parrot_invalidate_method_cache(inter, str_key, globalname);
}


/*

=item C<PMC *
Parrot_find_global_op(Interp *, PMC *ns, STRING *globalname, void *next)>

If the global exists in the given namespace PMC, return it.  If not, return
PMCNULL.

=cut

*/

PMC *
Parrot_find_global_op(Interp *interp, PMC *ns,
                      STRING *globalname, void *next)
{
    PMC *res;

    if (!globalname)
        real_exception(interp, next, E_NameError,
                       "Tried to get null global");

    res = Parrot_find_global_n(interp, ns, globalname);
    if (!res)
        res = PMCNULL;

    return res;
}


/*

=item C<PMC *
Parrot_find_name_op(Interp *, STRING *name, void *next)>

TODO - THIS IS BROKEN - it doesn't walk up the scopes yet - TODO

Find the given C<name> in lexicals, then the current namespace, then the HLL
root namespace, and finally Parrot builtins.  If the name isn't found
anywhere, return PMCNULL.

=cut

*/

PMC *
Parrot_find_name_op(Interp *interp, STRING *name, void *next)
{
    parrot_context_t * const ctx = CONTEXT(interp->ctx);
    PMC *g, *lex_pad;

    g = PMCNULL;

    lex_pad = Parrot_find_pad(interp, name, ctx);
    if (!PMC_IS_NULL(lex_pad))
        g = VTABLE_get_pmc_keyed_str(interp, lex_pad, name);

    /* TODO TODO TODO - walk up the scopes!  duh!! */

    if (PMC_IS_NULL(g))
        g = Parrot_find_global_cur(interp, name);

    if (PMC_IS_NULL(g))
        g = Parrot_find_global_n(interp,
                                 Parrot_get_ctx_HLL_namespace(interp),
                                 name);

    if (PMC_IS_NULL(g))
        g = Parrot_find_builtin(interp, name);

    if (! PMC_IS_NULL(g)) {
        if (g->vtable->base_type == enum_class_MultiSub &&
                interp->current_args) {
            /*
             * inside a function call, we have an args signature
             */
            g = Parrot_MMD_search_default_func(interp, name);
            if (! PMC_IS_NULL(g))
                return g;
        }
        else
            return g;
    }

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
 * if pmc_key is provided, it wins.
 * else if str_key is provided, it is used.
 * if neither is provided, the HLL namespace is used.
 */

static void
store_sub(Interp *interp, PMC *pmc_key, STRING *str_key,
          STRING *sub_name, PMC *sub_pmc)
{
    int hll_id;
    PMC *ns;

    if (sub_pmc->vtable->base_type == enum_class_MultiSub) {
        PMC *one_sub;

        one_sub = VTABLE_get_pmc_keyed_int(interp, sub_pmc, 0);
        hll_id = PMC_sub(one_sub)->HLL_id;
    }
    else
        hll_id = PMC_sub(sub_pmc)->HLL_id;

    ns = Parrot_get_HLL_namespace(interp, hll_id);
    if (!PMC_IS_NULL(pmc_key))
        ns = Parrot_make_namespace_keyed(interp, ns, pmc_key);
    else if (str_key)
        ns = Parrot_make_namespace_keyed_str(interp, ns, str_key);

    Parrot_store_global_n(interp, ns, sub_name, sub_pmc);

    /* TEMPORARY HACK - cache invalidation should be a namespace function */
    if (! PMC_IS_NULL(pmc_key)) {
        if (pmc_key->vtable->base_type == enum_class_String)
            Parrot_invalidate_method_cache(interp,
                                           PMC_str_val(pmc_key), sub_name);
    }
    else if (str_key)
        Parrot_invalidate_method_cache(interp, str_key, sub_name);

    /* MultiSub isa R*PMCArray and doesn't have a PMC_sub structure
     * MultiSub could also contain subs from various namespaces,
     * so it doesn't make much sense to associate a namespace
     * with a multi.
     */
    if (sub_pmc->vtable->base_type != enum_class_MultiSub)
        PMC_sub(sub_pmc)->namespace_stash = ns;
}

static void
store_sub_in_namespace(Parrot_Interp interp, PMC* sub_pmc,
                       PMC *pmc_key, STRING *sub_name)
{
    /*
     * pmc_key is either a String, or a Key, or NULL
     */
    if (PMC_IS_NULL(pmc_key))
        store_sub(interp, PMCNULL, NULL, sub_name, sub_pmc);
    else {
        INTVAL type = pmc_key->vtable->base_type;
        switch (type) {
            case enum_class_String:
                store_sub(interp, PMCNULL, PMC_str_val(pmc_key),
                          sub_name, sub_pmc);
                break;
            case enum_class_Key:
                store_sub(interp, pmc_key, NULL, sub_name, sub_pmc);
                break;
            default:
                internal_exception(1,
                                   "Namespace constant is neither "
                                   "String nor Key");
        }
    }
}

/* XXX in mmd.c ? */
STRING* Parrot_multi_long_name(Parrot_Interp interp, PMC* sub_pmc);

STRING*
Parrot_multi_long_name(Parrot_Interp interp, PMC* sub_pmc)
{
    PMC *multi_sig;
    STRING* sub_name, *sig;
    INTVAL i, n;

    sub_name = PMC_sub(sub_pmc)->name;
    multi_sig = PMC_sub(sub_pmc)->multi_signature;
    n = VTABLE_elements(interp, multi_sig);
    /*
     * foo :multi(STRING, Integer) =>
     *
     * foo_@STRING_@Integer
     */
    for (i = 0; i < n; ++i) {
        sig = VTABLE_get_string_keyed_int(interp, multi_sig, i);
        sub_name = string_concat(interp, sub_name,
                const_string(interp, "_@"), 0);
        sub_name = string_concat(interp, sub_name, sig, 0);
    }
    return sub_name;
}

static void
store_named_in_namespace(Parrot_Interp interp, PMC* sub_pmc)
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
        store_sub_in_namespace(interp, sub_pmc, namespace, sub_name);
    }
    else {
        STRING *long_name;
        PMC *multi_sub;
        PMC *stash;

        /* If namespace is NULL, we need to look in the root HLL namespace. But
           since we haven't actually run code yet, the context hasn't been set
           to include the HLL, so we have to do the work ourselves. */
        stash = Parrot_get_HLL_namespace(interp, PMC_sub(sub_pmc)->HLL_id);
        if (! PMC_IS_NULL(namespace))
            stash = VTABLE_get_pmc_keyed(interp, stash, namespace);
        multi_sub = PMC_IS_NULL(stash)
            ? PMCNULL
            : VTABLE_get_pmc_keyed_str(interp, stash, sub_name);

        /* is there an existing MultiSub PMC? or do we need to create one? */
        if (PMC_IS_NULL(multi_sub)) {
            multi_sub = pmc_new(interp, enum_class_MultiSub);
            /* we have to push the sub onto the MultiSub before we try to store
               it because storing requires information from the sub */
            VTABLE_push_pmc(interp, multi_sub, sub_pmc);
            store_sub_in_namespace(interp, multi_sub,
                    namespace, sub_name);
        }
        else
            VTABLE_push_pmc(interp, multi_sub, sub_pmc);

        long_name = Parrot_multi_long_name(interp, sub_pmc);
        store_sub_in_namespace(interp, sub_pmc, namespace, long_name);

        c_meth = string_to_cstring(interp, sub_name);
        if ( (func_nr = Parrot_MMD_method_idx(interp, c_meth))  >= 0) {
            Parrot_mmd_rebuild_table(interp, -1, func_nr);
        }
        string_cstring_free(c_meth);
    }
}

/* TODO - this looks like it doesn't understand nested namespaces */

void
Parrot_store_sub_in_namespace(Parrot_Interp interp, PMC *sub)
{
    if (!(PObj_get_FLAGS(sub) & SUB_FLAG_PF_ANON)) {
        INTVAL cur_id = CONTEXT(interp->ctx)->current_HLL;
        /* PF structures aren't fully constructed yet */
        Parrot_block_DOD(interp);
        /* store relative to HLL namespace */
        CONTEXT(interp->ctx)->current_HLL = PMC_sub(sub)->HLL_id;

        store_named_in_namespace(interp, sub);

        /* restore HLL_id */
        CONTEXT(interp->ctx)->current_HLL = cur_id;
        Parrot_unblock_DOD(interp);
    }
    else {
        PMC *stash =
            Parrot_get_HLL_namespace(interp, PMC_sub(sub)->HLL_id);
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
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
