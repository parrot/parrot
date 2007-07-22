/*
Copyright (C) 2004-2007, The Perl Foundation.
$Id$

=head1 NAME

src/global.c - Access to global PMCs

=head1 DESCRIPTION

=head2 Functions

*/

#include "parrot/parrot.h"
#include "global.str"

/* HEADERIZER HFILE: include/parrot/global.h */
/* HEADERIZER BEGIN: static */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC * get_namespace_pmc( PARROT_INTERP, NOTNULL(PMC *sub) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC * internal_ns_keyed( PARROT_INTERP,
    NOTNULL(PMC *base_ns),
    NULLOK(PMC *pmc_key),
    NULLOK(STRING *str_key),
    int flags )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void store_sub_in_multi( PARROT_INTERP,
    NOTNULL(PMC *sub),
    NOTNULL(PMC *ns) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

/* HEADERIZER END: static */

#define DEBUG_GLOBAL 0

/*
 * internal_ns_keyed: Internal function to do keyed namespace lookup
 * relative to a given namespace PMC.  Understands STRINGs, String PMCs,
 * Key pmcs, and array PMCs containing strings.
 */

/* flags for internal_ns_keyed */
#define INTERN_NS_CREAT 1       /* I'm a fan of the classics */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC *
internal_ns_keyed(PARROT_INTERP, NOTNULL(PMC *base_ns), NULLOK(PMC *pmc_key),
                               NULLOK(STRING *str_key), int flags)
{
    PMC *ns, *sub_ns;
    INTVAL i, n;
    static const INTVAL max_intval = (INTVAL)((~(UINTVAL)0) >> 1); /*2s comp*/

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
    } /* for */

    return ns;
}

/*

FUNCDOC: Parrot_get_namespace_keyed

Find the namespace relative to the namespace C<base_ns> with the key
C<pmc_key>, which may be a String, a Key, or an array of strings.  Return
the namespace, or NULL if not found.

FUNCDOC: Parrot_get_namespace_keyed_str

Find the namespace relative to the namespace C<base_ns> with the string key
C<str_key>.  Return the namespace, or NULL if not found.

FUNCDOC: Parrot_make_namespace_keyed

Find, or create if necessary, the namespace relative to the namespace
C<base_ns> with the key C<pmc_key>, which may be a String, a Key, or an
array of strings.  Return the namespace.  Errors will result in exceptions.

FUNCDOC: Parrot_make_namespace_keyed_str

Find, or create if necessary, the namespace relative to the namespace
C<base_ns> with the string key C<str_key>.  Return the namespace.  Errors
will result in exceptions.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_get_namespace_keyed(PARROT_INTERP, NOTNULL(PMC *base_ns), NULLOK(PMC *pmc_key))
{
    return internal_ns_keyed(interp, base_ns, pmc_key, NULL, 0);
}

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_get_namespace_keyed_str(PARROT_INTERP, NOTNULL(PMC *base_ns), NULLOK(STRING *str_key))
{
    return internal_ns_keyed(interp, base_ns, PMCNULL, str_key, 0);
}

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_make_namespace_keyed(PARROT_INTERP, NOTNULL(PMC *base_ns), NULLOK(PMC *pmc_key))
{
    return internal_ns_keyed(interp, base_ns, pmc_key, NULL, INTERN_NS_CREAT);
}

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_make_namespace_keyed_str(PARROT_INTERP, NOTNULL(PMC *base_ns), NULLOK(STRING *str_key))
{
    return internal_ns_keyed(interp, base_ns, NULL, str_key, INTERN_NS_CREAT);
}


/*

FUNCDOC: Parrot_get_namespace_autobase

Find a namespace with the key C<key>, which may be a String, a Key, or an
array of strings. If it is a String, then the lookup is relative to the
current namespace. Otherwise, it is relative to the current HLL root
namespace. Return the namespace, or NULL if not found.

FUNCDOC: Parrot_make_namespace_autobase

Find, or create if necessary, a namespace with the key C<key>, which may be a
String, a Key, or an array of strings. If it is a String, then the lookup is
relative to the current namespace. Otherwise, it is relative to the current HLL
root namespace. Return the namespace.  Errors will result in exceptions.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_make_namespace_autobase(PARROT_INTERP, NULLOK(PMC *key))
{
    PMC *base_ns;
    if (VTABLE_isa(interp, key, string_from_literal(interp, "String")))
        base_ns = CONTEXT(interp->ctx)->current_namespace;
    else
        base_ns = VTABLE_get_pmc_keyed_int(interp, interp->HLL_namespace,
            CONTEXT(interp->ctx)->current_HLL);
    return Parrot_make_namespace_keyed(interp, base_ns, key);
}

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_get_namespace_autobase(PARROT_INTERP, NULLOK(PMC *key))
{
    PMC *base_ns;
    if (VTABLE_isa(interp, key, string_from_literal(interp, "String")))
        base_ns = CONTEXT(interp->ctx)->current_namespace;
    else
        base_ns = VTABLE_get_pmc_keyed_int(interp, interp->HLL_namespace,
            CONTEXT(interp->ctx)->current_HLL);
    return Parrot_get_namespace_keyed(interp, base_ns, key);
}


/*

FUNCDOC: Parrot_get_global

Parrot_get_global allows a null namespace without throwing an exception; it
simply returns PMCNULL in that case.

NOTE: At present the use of the {get,set}_global functions is mandatory due to the
      wacky namespace typing of the default Parrot namespace.  Eventually it will be
      safe to just use the standard hash interface (if desired).

Look up the global named C<globalname> in the namespace C<ns>.  Return the
global, or return PMCNULL if C<ns> is null or if the global is not found.

KLUDGE ALERT: Currently prefers non-namespaces in case of collision.

FUNCDOC: Parrot_set_global

Set the global named C<globalname> in the namespace C<ns> to the value C<val>.

*/


/*
 * {get,set}_global.
 *
 * Parrot_get_global allows a null namespace without throwing an exception; it
 * simply returns PMCNULL in that case.
 *
 * NOTE: At present the use of the {get,set}_global functions is mandatory due to the
 *       wacky namespace typing of the default Parrot namespace.  Eventually it will be
 *       safe to just use the standard hash interface (if desired).
 */

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_get_global(PARROT_INTERP, NULLOK(PMC *ns), NULLOK(STRING *globalname))
{
    if (PMC_IS_NULL(ns))
        return PMCNULL;

    return (PMC *)VTABLE_get_pointer_keyed_str(interp, ns, globalname);
}

PARROT_API
void
Parrot_set_global(PARROT_INTERP, NULLOK(PMC *ns), NULLOK(STRING *globalname), NULLOK(PMC *val))
{
    VTABLE_set_pmc_keyed_str(interp, ns, globalname, val);
}


/*

FUNCDOC: Parrot_find_global_n

Search the namespace PMC C<ns> for an object with name C<globalname>.
Return the object, or NULL if not found.

XXX - For now this function prefers non-namespaces, it will eventually
entirely use the untyped interface.

FUNCDOC: Parrot_find_global_k

Search the namespace designated by C<pmc_key>, which may be a key PMC,
an array of namespace name strings, or a string PMC, for an object
with name C<globalname>.  Return the object, or NULL if not found.

XXX - For now this function prefers non-namespaces, it will eventually
entirely use the untyped interface.

FUNCDOC: Parrot_find_global_s

Search the namespace designated by C<str_key>, or the HLL root if
C<str_key> is NULL, for an object with name C<globalname>.  Return the
object, or NULL if not found.

XXX - For now this function prefers non-namespaces, it will eventually
entirely use the untyped interface.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_find_global_n(PARROT_INTERP, NULLOK(PMC *ns), NULLOK(STRING *globalname))
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
        res = (PMC *)VTABLE_get_pointer_keyed_str(interp, ns, globalname);
    }

    return PMC_IS_NULL(res) ? NULL : res;
}

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_find_global_cur(PARROT_INTERP, NULLOK(STRING *globalname))
{
    PMC * const ns = CONTEXT(interp->ctx)->current_namespace;
    return Parrot_find_global_n(interp, ns, globalname);
}

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_find_global_k(PARROT_INTERP, NULLOK(PMC *pmc_key), NOTNULL(STRING *globalname))
{
    PMC * const ns =
        Parrot_get_namespace_keyed(interp,
                                   Parrot_get_ctx_HLL_namespace(interp),
                                   pmc_key);
    return Parrot_find_global_n(interp, ns, globalname);
}

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_find_global_s(PARROT_INTERP, NULLOK(STRING *str_key), NULLOK(STRING *globalname))
{
    PMC *const ns =
        Parrot_get_namespace_keyed_str(interp,
                                       Parrot_get_ctx_HLL_namespace(interp),
                                       str_key);
    return Parrot_find_global_n(interp, ns, globalname);
}

/*

FUNCDOC: Parrot_store_global_n

Store the PMC C<val> into the namespace PMC C<ns> with name C<globalname>.

FUNCDOC: Parrot_store_global_k

Store the PMC C<val> into the namespace designated by C<pmc_key>,
which may be a key PMC, an array of namespace name strings, or a
string PMC, with name C<globalname>.

XXX - For now this function prefers non-namespaces, it will eventually
entirely use the untyped interface.

FUNCDOC: Parrot_store_global_s

Store the PMC C<val> into the namespace designated by C<str_key>, or
the HLL root if C<str_key> is NULL, with the name C<globalname>.

*/

PARROT_API
void
Parrot_store_global_n(PARROT_INTERP, NULLOK(PMC *ns),
                      NULLOK(STRING *globalname), NULLOK(PMC *val))
{
#if DEBUG_GLOBAL
    if (globalname)
        PIO_printf(interp, "store_global name '%Ss'\n", globalname);
#endif

    if (PMC_IS_NULL(ns))
        return;

    VTABLE_set_pmc_keyed_str(interp, ns, globalname, val);
}

PARROT_API
void
Parrot_store_global_cur(PARROT_INTERP, NULLOK(STRING *globalname), NULLOK(PMC *val))
{
    Parrot_store_global_n(interp,
                          CONTEXT(interp->ctx)->current_namespace,
                          globalname, val);

    /* FIXME - method cache invalidation should occur */
}

PARROT_API
void
Parrot_store_global_k(PARROT_INTERP, NOTNULL(PMC *pmc_key),
                      NULLOK(STRING *globalname), NULLOK(PMC *val))
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

PARROT_API
void
Parrot_store_global_s(PARROT_INTERP, NULLOK(STRING *str_key),
                      NULLOK(STRING *globalname), NULLOK(PMC *val))
{
    PMC * const ns = Parrot_make_namespace_keyed_str(interp,
                                         Parrot_get_ctx_HLL_namespace(interp),
                                         str_key);

    Parrot_store_global_n(interp, ns, globalname, val);

    /* FIXME - method cache invalidation should be a namespace function */
    Parrot_invalidate_method_cache(interp, str_key, globalname);
}


/*

FUNCDOC: Parrot_find_global_op

If the global exists in the given namespace PMC, return it.  If not, return
PMCNULL.

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_find_global_op(PARROT_INTERP, NOTNULL(PMC *ns),
        NOTNULL(STRING *globalname), NULLOK(void *next))
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

FUNCDOC: Parrot_find_name_op

TODO - THIS IS BROKEN - it doesn't walk up the scopes yet - TODO

Find the given C<name> in lexicals, then the current namespace, then the HLL
root namespace, and finally Parrot builtins.  If the name isn't found
anywhere, return PMCNULL.

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_find_name_op(PARROT_INTERP, NOTNULL(STRING *name), SHIM(void *next))
{
    parrot_context_t * const ctx = CONTEXT(interp->ctx);
    PMC * const lex_pad = Parrot_find_pad(interp, name, ctx);
    PMC *g;

    if (!PMC_IS_NULL(lex_pad))
        g = VTABLE_get_pmc_keyed_str(interp, lex_pad, name);
    else
        g = PMCNULL;

    /* TODO TODO TODO - walk up the scopes!  duh!! */

    if (PMC_IS_NULL(g))
        g = Parrot_find_global_cur(interp, name);

    if (PMC_IS_NULL(g))
        g = Parrot_find_global_n(interp,
                                 Parrot_get_ctx_HLL_namespace(interp),
                                 name);

    if (PMC_IS_NULL(g))
        g = Parrot_find_builtin(interp, name);

    if (! PMC_IS_NULL(g))
        return g;
    else
        return PMCNULL;
}

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC *
get_namespace_pmc(PARROT_INTERP, NOTNULL(PMC *sub))
{
    PMC * const nsname = PMC_sub(sub)->namespace_name;
    PMC * const nsroot = Parrot_get_HLL_namespace(interp, PMC_sub(sub)->HLL_id);

    /* If we have a NULL, return the HLL namespace */
    if (PMC_IS_NULL(nsname))
        return nsroot;
    /* If we have a String, do a string lookup */
    else if (nsname->vtable->base_type == enum_class_String)
        return Parrot_make_namespace_keyed_str(interp, nsroot, PMC_str_val(nsname));
    /* Otherwise, do a PMC lookup */
    else
        return Parrot_make_namespace_keyed(interp, nsroot, nsname);
}

static void
store_sub_in_multi(PARROT_INTERP, NOTNULL(PMC *sub), NOTNULL(PMC *ns))
{
    INTVAL func_nr;
    char *c_meth;
    STRING *subname = PMC_sub(sub)->name;
    PMC   *multisub = VTABLE_get_pmc_keyed_str(interp, ns, subname);

    /* is there an existing MultiSub PMC? or do we need to create one? */
    if (PMC_IS_NULL(multisub)) {
        multisub = pmc_new(interp, enum_class_MultiSub);
        /* we have to push the sub onto the MultiSub before we try to store
        it because storing requires information from the sub */
        VTABLE_push_pmc(interp, multisub, sub);
        VTABLE_set_pmc_keyed_str(interp, ns, subname, multisub);
    }
    else
        VTABLE_push_pmc(interp, multisub, sub);

    c_meth = string_to_cstring(interp, subname);
    func_nr = Parrot_MMD_method_idx(interp, c_meth);
    if (func_nr >= 0)
        Parrot_mmd_rebuild_table(interp, -1, func_nr);
    string_cstring_free(c_meth);
}

PARROT_API
void
Parrot_store_sub_in_namespace(PARROT_INTERP, NOTNULL(PMC *sub))
{
    const INTVAL cur_id = CONTEXT(interp->ctx)->current_HLL;

    PMC *ns;
    /* PF structures aren't fully constructed yet */
    Parrot_block_DOD(interp);
    /* store relative to HLL namespace */
    CONTEXT(interp->ctx)->current_HLL = PMC_sub(sub)->HLL_id;

    ns = get_namespace_pmc(interp, sub);

    /* attach a namespace to the sub for lookups */
    PMC_sub(sub)->namespace_stash = ns;

    /* store a :multi sub */
    if (!PMC_IS_NULL(PMC_sub(sub)->multi_signature))
        store_sub_in_multi(interp, sub, ns);
    /* store other subs (as long as they're not :anon) */
    else if (!(PObj_get_FLAGS(sub) & SUB_FLAG_PF_ANON)) {
        STRING * const name   = PMC_sub(sub)->name;
        PMC    * const nsname = PMC_sub(sub)->namespace_name;

        Parrot_store_global_n(interp, ns, name, sub);

        /* TEMPORARY HACK - cache invalidation should be a namespace function */
        if (!PMC_IS_NULL(nsname)) {
            STRING * const nsname_s = VTABLE_get_string(interp, nsname);
            Parrot_invalidate_method_cache(interp, nsname_s, name);
        }
    }

    /* restore HLL_id */
    CONTEXT(interp->ctx)->current_HLL = cur_id;
    Parrot_unblock_DOD(interp);
}

/*

=head1 SEE ALSO

F<include/parrot/global.h>

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
