/*
Copyright (C) 2004-2010, Parrot Foundation.

=head1 NAME

src/namespace.c

=head1 DESCRIPTION

Common routines for storing and finding elements in namespaces

=cut

*/

#include "parrot/parrot.h"
#include "namespace.str"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"

/* HEADERIZER HFILE: include/parrot/namespace.h */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC * get_namespace_pmc(PARROT_INTERP, ARGIN(PMC *sub_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC * internal_ns_keyed(PARROT_INTERP,
    ARGIN(PMC *base_ns),
    ARGIN(PMC *pmc_key),
    int flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC * internal_ns_keyed_key(PARROT_INTERP,
    ARGIN(PMC *ns),
    ARGIN(PMC *key),
    int flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC * internal_ns_keyed_str(PARROT_INTERP,
    ARGIN(PMC *base_ns),
    ARGIN(STRING *key),
    int flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC * internal_ns_maybe_create(PARROT_INTERP,
    ARGIN(PMC *ns),
    ARGIN(STRING *key),
    int flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void store_sub_in_multi(PARROT_INTERP,
    ARGIN(PMC *sub_pmc),
    ARGIN(PMC *ns))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_get_namespace_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_pmc))
#define ASSERT_ARGS_internal_ns_keyed __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(base_ns) \
    , PARROT_ASSERT_ARG(pmc_key))
#define ASSERT_ARGS_internal_ns_keyed_key __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ns) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_internal_ns_keyed_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(base_ns) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_internal_ns_maybe_create __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ns) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_store_sub_in_multi __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_pmc) \
    , PARROT_ASSERT_ARG(ns))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* flags for internal_ns_keyed */
#define INTERN_NS_CREAT 1       /* I'm a fan of the classics */

/*

=head1 Internal Static Functions

=over 4

=item C<static PMC * internal_ns_keyed_str(PARROT_INTERP, PMC *base_ns, STRING
*key, int flags)>

Looks up a nested NameSpace PMC starting from C<base_ns> and doing a relative
lookup. C<key> is a STRING containing the name of the NameSpace to look up.
Flags can be 0 or INTERN_NS_CREAT. In the former case, PMCNULL is returned
if the namespace is not found. In the later, a new namespace with the given
is created and returned if it is not found.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC *
internal_ns_keyed_str(PARROT_INTERP, ARGIN(PMC *base_ns),
    ARGIN(STRING *key), int flags)
{
    ASSERT_ARGS(internal_ns_keyed_str)
    PMC    * const ns     = VTABLE_get_pmc_keyed_str(interp, base_ns, key);
    STRING * const namesp = CONST_STRING(interp, "NameSpace");

    if (!PMC_IS_NULL(ns)
    && (ns->vtable->base_type == enum_class_NameSpace
     || VTABLE_isa(interp, ns, namesp)))
        return ns;

    return internal_ns_maybe_create(interp, base_ns, key, flags);
}

/*

=item C<static PMC * internal_ns_keyed_key(PARROT_INTERP, PMC *ns, PMC *key, int
flags)>

Internal function to do keyed namespace lookup relative to a given namespace
PMC. The namespace to find is located by C<key> relative to C<ns>. C<flags>
determines what happens when an existing namespace is not found. 0 means
PMCNULL is returned, INTERN_NS_CREAT means a new namespace is created.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC *
internal_ns_keyed_key(PARROT_INTERP, ARGIN(PMC *ns), ARGIN(PMC *key), int flags)
{
    ASSERT_ARGS(internal_ns_keyed_key)
    while (key) {
        STRING * const part = VTABLE_get_string(interp, key);
        PMC    *sub_ns      = VTABLE_get_pmc_keyed_str(interp, ns, part);

        if (PMC_IS_NULL(sub_ns) || !VTABLE_isa(interp, sub_ns, CONST_STRING(interp, "NameSpace"))) {
            sub_ns = internal_ns_maybe_create(interp, ns, part, flags);

            if (PMC_IS_NULL(sub_ns))
                return PMCNULL;
        }

        ns  = sub_ns;
        key = VTABLE_shift_pmc(interp, key);
    }

    return ns;
}

/*

=item C<static PMC * internal_ns_keyed(PARROT_INTERP, PMC *base_ns, PMC
*pmc_key, int flags)>

Search for a namespace PMC starting from a base namespace C<base_ns> and
following C<pmc_key> to the nested namespace. C<pmc_key> can be a String,
a Key, or an array of strings (such as an ResizableStringArray, or a
ResizablePMCArray that contains Strings). Flags determines what we do if the
requested namespace is not found: 0 means we return PMCNULL, INTERN_NS_CREAT
means we create the new namespace and return it.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC *
internal_ns_keyed(PARROT_INTERP, ARGIN(PMC *base_ns), ARGIN(PMC *pmc_key), int flags)
{
    ASSERT_ARGS(internal_ns_keyed)

    if (PMC_IS_TYPE(pmc_key, Key))
        return internal_ns_keyed_key(interp, base_ns, pmc_key, flags);
    else if (VTABLE_isa(interp, pmc_key, CONST_STRING(interp, "String"))) {
        STRING * const str_key = VTABLE_get_string(interp, pmc_key);
        return internal_ns_keyed_str(interp, base_ns, str_key, flags);
    }
    else {
        /* array of strings */
        STRING * const isans = CONST_STRING(interp, "NameSpace");
        const INTVAL n = VTABLE_elements(interp, pmc_key);
        INTVAL i;
        PMC *ns = base_ns;

        for (i = 0; i < n; ++i) {
            STRING * const part = VTABLE_get_string_keyed_int(interp, pmc_key, i);
            PMC *sub_ns = VTABLE_get_pmc_keyed_str(interp, ns, part);

            if (PMC_IS_NULL(sub_ns) || !VTABLE_isa(interp, sub_ns, isans)) {
                sub_ns = internal_ns_maybe_create(interp, ns, part, flags);
                if (PMC_IS_NULL(sub_ns))
                    return PMCNULL;
            }
            ns = sub_ns;
        }
        return ns;
    }
}

/*

=item C<static PMC * internal_ns_maybe_create(PARROT_INTERP, PMC *ns, STRING
*key, int flags)>

Given a namespace PMC C<ns>, a STRING C<key> containing a name, and flags from
C<internal_ns_keyed> or C<internal_ns_keyed_str>, creates and returns a new
namespace with the given name as a child of the given namespace.  This is an
internal function only.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC *
internal_ns_maybe_create(PARROT_INTERP, ARGIN(PMC *ns), ARGIN(STRING *key), int flags)
{
    ASSERT_ARGS(internal_ns_maybe_create)

    /* TT #1220 - stop depending on typed namespace */
    if (!(flags & INTERN_NS_CREAT))
        return PMCNULL;
    else {
        const INTVAL type_id = Parrot_hll_get_ctx_HLL_type(interp, enum_class_NameSpace);
        /* TT #1221 - match HLL of enclosing namespace? */
        PMC * const sub_ns = Parrot_pmc_new(interp, type_id);

        if (PMC_IS_NULL(sub_ns))
            return PMCNULL;

        VTABLE_set_pmc_keyed_str(interp, ns, key, sub_ns);
        return sub_ns;
    }
}

/*

=item C<static PMC * get_namespace_pmc(PARROT_INTERP, PMC *sub_pmc)>

Return the namespace PMC associated with the PMC C<sub>. If there is no
NameSpace associated with the sub, return it's HLL NameSpace PMC instead.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC *
get_namespace_pmc(PARROT_INTERP, ARGIN(PMC *sub_pmc))
{
    ASSERT_ARGS(get_namespace_pmc)
    Parrot_Sub_attributes *sub;
    PMC        *nsname, *nsroot;

    PMC_get_sub(interp, sub_pmc, sub);
    nsname = sub->namespace_name;
    nsroot = Parrot_hll_get_HLL_namespace(interp, sub->HLL_id);

    /* If we have a NULL, return the HLL namespace */
    if (PMC_IS_NULL(nsname))
        return nsroot;
    /* If we have a String, do a string lookup */
    else if (nsname->vtable->base_type == enum_class_String)
        return Parrot_ns_make_namespace_keyed_str(interp, nsroot,
                VTABLE_get_string(interp, nsname));
    /* Otherwise, do a PMC lookup */
    else
        return Parrot_ns_make_namespace_keyed(interp, nsroot, nsname);
}

/*

=item C<static void store_sub_in_multi(PARROT_INTERP, PMC *sub_pmc, PMC *ns)>

Adds the sub C<sub> into a multisub of the same name in the namespace C<ns>.
If no multisub by that name currently exists, we create one.

=cut

*/

static void
store_sub_in_multi(PARROT_INTERP, ARGIN(PMC *sub_pmc), ARGIN(PMC *ns))
{
    ASSERT_ARGS(store_sub_in_multi)
    Parrot_Sub_attributes *sub;
    STRING     *ns_entry_name;
    PMC        *multisub;

    PMC_get_sub(interp, sub_pmc, sub);
    ns_entry_name = sub->ns_entry_name;
    multisub      = VTABLE_get_pmc_keyed_str(interp, ns, ns_entry_name);

    /* is there an existing MultiSub PMC? or do we need to create one? */
    if (PMC_IS_NULL(multisub)) {
        multisub = Parrot_pmc_new(interp,
                                  Parrot_hll_get_ctx_HLL_type(interp, enum_class_MultiSub));
        /* we have to push the sub onto the MultiSub before we try to store
        it because storing requires information from the sub */
        VTABLE_push_pmc(interp, multisub, sub_pmc);
        VTABLE_set_pmc_keyed_str(interp, ns, ns_entry_name, multisub);
    }
    else
        VTABLE_push_pmc(interp, multisub, sub_pmc);
}

/*

=back

=head1 NameSpace API Functions

=over 4

=item C<PMC * Parrot_ns_get_namespace_keyed(PARROT_INTERP, PMC *base_ns, PMC
*pmc_key)>

Find the namespace relative to the namespace C<base_ns> with the key
C<pmc_key>, which may be a String, a Key, or an array of strings.  Return
the namespace, or NULL if not found.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_ns_get_namespace_keyed(PARROT_INTERP, ARGIN(PMC *base_ns), ARGIN(PMC *pmc_key))
{
    ASSERT_ARGS(Parrot_ns_get_namespace_keyed)
    return internal_ns_keyed(interp, base_ns, pmc_key, 0);
}

/*

=item C<PMC * Parrot_ns_get_namespace_keyed_str(PARROT_INTERP, PMC *base_ns,
STRING *str_key)>

Find the namespace relative to the namespace C<base_ns> with the string key
C<str_key>.  Return the namespace, or NULL if not found.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_ns_get_namespace_keyed_str(PARROT_INTERP, ARGIN(PMC *base_ns),
        ARGIN_NULLOK(STRING *str_key))
{
    ASSERT_ARGS(Parrot_ns_get_namespace_keyed_str)
    return internal_ns_keyed_str(interp, base_ns, str_key, 0);
}

/*

=item C<PMC * Parrot_ns_make_namespace_keyed(PARROT_INTERP, PMC *base_ns, PMC
*pmc_key)>

Find, or create if necessary, the namespace relative to the namespace
C<base_ns> with the key C<pmc_key>, which may be a String, a Key, or an
array of strings.  Return the namespace.  Errors will result in exceptions.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_ns_make_namespace_keyed(PARROT_INTERP, ARGIN(PMC *base_ns),
        ARGIN(PMC *pmc_key))
{
    ASSERT_ARGS(Parrot_ns_make_namespace_keyed)
    return internal_ns_keyed(interp, base_ns, pmc_key, INTERN_NS_CREAT);
}

/*

=item C<PMC * Parrot_ns_make_namespace_keyed_str(PARROT_INTERP, PMC *base_ns,
STRING *str_key)>

Find, or create if necessary, the namespace relative to the namespace
C<base_ns> with the string key C<str_key>.  Return the namespace.  Errors
will result in exceptions.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_ns_make_namespace_keyed_str(PARROT_INTERP, ARGIN(PMC *base_ns),
        ARGIN(STRING *str_key))
{
    ASSERT_ARGS(Parrot_ns_make_namespace_keyed_str)
    return internal_ns_keyed_str(interp, base_ns, str_key, INTERN_NS_CREAT);
}

/*

=item C<PMC * Parrot_ns_make_namespace_autobase(PARROT_INTERP, PMC *key)>

Find, or create if necessary, a namespace with the key C<key>, which may be a
String, a Key, or an array of strings. If it is a String, then the lookup is
relative to the current namespace. Otherwise, it is relative to the current HLL
root namespace. Return the namespace.  Errors will result in exceptions.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_ns_make_namespace_autobase(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(Parrot_ns_make_namespace_autobase)
    PMC *base_ns;
    if (VTABLE_isa(interp, key, CONST_STRING(interp, "String")))
        base_ns = Parrot_pcc_get_namespace(interp, CURRENT_CONTEXT(interp));
    else
        base_ns = VTABLE_get_pmc_keyed_int(interp, interp->HLL_namespace,
            Parrot_pcc_get_HLL(interp, CURRENT_CONTEXT(interp)));
    return Parrot_ns_make_namespace_keyed(interp, base_ns, key);
}

/*

=item C<PMC * Parrot_ns_get_name(PARROT_INTERP, PMC *_namespace)>

Get the name of the namespace, as a ResizableStringArray. For instance, the
namespace Foo:Bar:Baz would return an RSA with three elements.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_ns_get_name(PARROT_INTERP, ARGIN(PMC *_namespace))
{
    ASSERT_ARGS(Parrot_ns_get_name)
    PMC *names;
    STRING * const get_name = CONST_STRING(interp, "get_name");
    Parrot_pcc_invoke_method_from_c_args(interp, _namespace, get_name, "->P", &names);
    return names;
}

/*

=item C<PMC * Parrot_ns_get_global(PARROT_INTERP, PMC *ns, STRING *globalname)>

Look up the global named C<globalname> in the namespace C<ns>.  Return the
global, or return PMCNULL if C<ns> is null or if the global is not found.

Parrot_ns_get_global allows a null namespace without throwing an exception; it
simply returns PMCNULL in that case.

NOTE: At present the use of the {get, set}_global functions is mandatory due
      to the wacky namespace typing of the default Parrot namespace.
      Eventually it will be safe to just use the standard hash interface
      (if desired).

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_ns_get_global(PARROT_INTERP, ARGIN_NULLOK(PMC *ns), ARGIN_NULLOK(STRING *globalname))
{
    ASSERT_ARGS(Parrot_ns_get_global)
    if (PMC_IS_NULL(ns))
        return PMCNULL;

    return (PMC *)VTABLE_get_pointer_keyed_str(interp, ns, globalname);
}

/*

=item C<void Parrot_ns_set_global(PARROT_INTERP, PMC *ns, STRING *globalname,
PMC *val)>

Set the global named C<globalname> in the namespace C<ns> to the value C<val>.

=cut

*/

PARROT_EXPORT
void
Parrot_ns_set_global(PARROT_INTERP, ARGIN(PMC *ns),
        ARGIN_NULLOK(STRING *globalname), ARGIN_NULLOK(PMC *val))
{
    ASSERT_ARGS(Parrot_ns_set_global)
    VTABLE_set_pmc_keyed_str(interp, ns, globalname, val);
}


/*

=item C<PMC * Parrot_ns_find_namespace_global(PARROT_INTERP, PMC *ns, STRING
*globalname)>

Search the namespace PMC C<ns> for an object with name C<globalname>.
Return the object, or PMCNULL if not found.

TT #1222 - For now this function prefers non-namespaces, it will eventually
entirely use the untyped interface.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_ns_find_namespace_global(PARROT_INTERP,
        ARGIN_NULLOK(PMC *ns), ARGIN_NULLOK(STRING *globalname))
{
    ASSERT_ARGS(Parrot_ns_find_namespace_global)
    PMC *res;

    if (PMC_IS_NULL(ns))
        res = PMCNULL;
    else {
        /*
         * TT #1219 - we should be able to use 'get_pmc_keyed' here,
         * but we can't because Parrot's default namespaces are not
         * fully typed and there's a pseudo-typed interface that
         * distinguishes 'get_pmc_keyed' from 'get_pointer_keyed';
         * the former is for NS and the latter is for non-NS.
         */
        res = (PMC *)VTABLE_get_pointer_keyed_str(interp, ns, globalname);
    }

    return PMC_IS_NULL(res) ? PMCNULL : res;
}

/*

=item C<PMC * Parrot_ns_find_current_namespace_global(PARROT_INTERP, STRING
*globalname)>

Finds and returns the data time named C<globalname> in the current namespace.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_ns_find_current_namespace_global(PARROT_INTERP, ARGIN_NULLOK(STRING *globalname))
{
    ASSERT_ARGS(Parrot_ns_find_current_namespace_global)
    PMC * const ns = Parrot_pcc_get_namespace(interp, CURRENT_CONTEXT(interp));
    return Parrot_ns_find_namespace_global(interp, ns, globalname);
}

/*

=item C<void Parrot_ns_store_global(PARROT_INTERP, PMC *ns, STRING *globalname,
PMC *val)>

Store the PMC C<val> into the namespace PMC C<ns> with name C<globalname>. If
the namespace is null, do nothing.

=cut

*/

PARROT_EXPORT
void
Parrot_ns_store_global(PARROT_INTERP, ARGIN_NULLOK(PMC *ns),
        ARGIN_NULLOK(STRING *globalname), ARGIN_NULLOK(PMC *val))
{
    ASSERT_ARGS(Parrot_ns_store_global)

    if (PMC_IS_NULL(ns))
        return;

    VTABLE_set_pmc_keyed_str(interp, ns, globalname, val);
}

/*

=item C<PMC * Parrot_ns_find_global_from_op(PARROT_INTERP, PMC *ns, STRING
*globalname, void *next)>

If the global exists in the given namespace PMC, return it.  If not, return
PMCNULL. Throw an exception if a NULL name is passed.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_ns_find_global_from_op(PARROT_INTERP, ARGIN(PMC *ns),
        ARGIN_NULLOK(STRING *globalname), ARGIN_NULLOK(void *next))
{
    ASSERT_ARGS(Parrot_ns_find_global_from_op)
    if (STRING_IS_NULL(globalname))
        Parrot_ex_throw_from_c_args(interp, next, EXCEPTION_GLOBAL_NOT_FOUND,
            "Tried to get null global");
    else {
        PMC * const res = Parrot_ns_find_namespace_global(interp, ns, globalname);
        return res;
    }
}


/*

=item C<PMC * Parrot_ns_find_named_item(PARROT_INTERP, STRING *name, void
*next)>

TT #1223 - THIS IS BROKEN - it doesn't walk up the scopes yet

Find the given C<name> in lexicals, then the current namespace, then the HLL
root namespace, and finally Parrot builtins.  If the name isn't found
anywhere, return PMCNULL.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_ns_find_named_item(PARROT_INTERP, ARGIN(STRING *name), ARGIN(SHIM(void *next)))
{
    ASSERT_ARGS(Parrot_ns_find_named_item)
    PMC * const ctx     = CURRENT_CONTEXT(interp);
    PMC * const lex_pad = Parrot_sub_find_pad(interp, name, ctx);
    PMC * g = PMCNULL;

    if (!PMC_IS_NULL(lex_pad)) {
        g = VTABLE_get_pmc_keyed_str(interp, lex_pad, name);

        /* TT #1223 - walk up the scopes!  duh!! */
        if (!PMC_IS_NULL(g))
            return g;
    }

    g = Parrot_ns_find_current_namespace_global(interp, name);
    if (!PMC_IS_NULL(g))
        return g;

    g = Parrot_ns_find_namespace_global(interp, Parrot_hll_get_ctx_HLL_namespace(interp), name);
    if (!PMC_IS_NULL(g))
        return g;
    return PMCNULL;
}

/*

=item C<void Parrot_ns_store_sub(PARROT_INTERP, PMC *sub_pmc)>

Adds the PMC C<sub> into the current namespace. Adds the sub to a multi of the
same name if it's defined as a multi.

=cut

*/

PARROT_EXPORT
void
Parrot_ns_store_sub(PARROT_INTERP, ARGIN(PMC *sub_pmc))
{
    ASSERT_ARGS(Parrot_ns_store_sub)
    const INTVAL cur_id = Parrot_pcc_get_HLL(interp, CURRENT_CONTEXT(interp));

    PMC *ns;
    Parrot_Sub_attributes *sub;

    /* store relative to HLL namespace */
    PMC_get_sub(interp, sub_pmc, sub);
    Parrot_pcc_set_HLL(interp, CURRENT_CONTEXT(interp), sub->HLL_id);

    ns = get_namespace_pmc(interp, sub_pmc);

    /* attach a namespace to the sub for lookups */
    sub->namespace_stash = ns;

    /* store a :multi sub */
    if (!PMC_IS_NULL(sub->multi_signature))
        store_sub_in_multi(interp, sub_pmc, ns);

    /* store other subs (as long as they're not :anon) */
    else if (!(PObj_get_FLAGS(sub_pmc) & SUB_FLAG_PF_ANON)
        || sub->vtable_index != -1) {
        STRING * const ns_entry_name = sub->ns_entry_name;
        PMC    * const nsname        = sub->namespace_name;

        Parrot_ns_store_global(interp, ns, ns_entry_name, sub_pmc);

        /* TT #1224:
           TEMPORARY HACK - cache invalidation should be a namespace function
         */
        if (!PMC_IS_NULL(nsname)) {
            STRING * const nsname_s = VTABLE_get_string(interp, nsname);
            Parrot_invalidate_method_cache(interp, nsname_s);
        }
    }

    /* restore HLL_id */
    Parrot_pcc_set_HLL(interp, CURRENT_CONTEXT(interp), cur_id);
}

/*

=back

=head1 SEE ALSO

F<include/parrot/namespace.h>

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
