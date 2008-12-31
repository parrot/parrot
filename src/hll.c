/*
Copyright (C) 2005-2008, The Perl Foundation.
$Id$

=head1 NAME

src/hll.c - High Level Language support

=head1 DESCRIPTION

The Parrot core sometimes has to create new PMCs which should map to the
current HLL's defaults. The current language and a typemap provides this
feature.

=head1 DATA

   interp->HLL_info

   @HLL_info = [
     [ hll_name, hll_lib, { core_type => HLL_type, ... }, namespace, hll_id ],
     ...
     ]

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/dynext.h"
#include "hll.str"

/* HEADERIZER HFILE: include/parrot/hll.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC* new_hll_entry(PARROT_INTERP, ARGIN_NULLOK(STRING *entry_name))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_new_hll_entry assert(interp);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* for shared HLL data, do COW stuff */
#define START_READ_HLL_INFO(interp, hll_info)
#define END_READ_HLL_INFO(interp, hll_info)
#define START_WRITE_HLL_INFO(interp, hll_info) \
    do { \
        if (PMC_sync((interp)->HLL_info)) { \
            (hll_info) = (interp)->HLL_info = \
                Parrot_clone((interp), (interp)->HLL_info); \
            if (PMC_sync((interp)->HLL_info)) \
                mem_internal_free(PMC_sync((interp)->HLL_info)); \
        } \
    } while (0)
#define END_WRITE_HLL_INFO(interp, hll_info)


/*

=item C<static PMC* new_hll_entry>

Create a new HLL information table entry.
Takes an interpreter name and (optional) entry name.
Returns a pointer to the new entry.
Used by Parrot_register_HLL and Parrot_register_HLL_lib.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC*
new_hll_entry(PARROT_INTERP, ARGIN_NULLOK(STRING *entry_name))
{
    PMC * const hll_info = interp->HLL_info;
    const INTVAL id      = VTABLE_elements(interp, hll_info);

    PMC *entry_id;

    /*
     * ATT: all items that are owned by the HLL_info structure
     *      have to be created as constant objects, because
     *      this structure isn't marked by DOD/GC
     */
    PMC * const entry = constant_pmc_new(interp, enum_class_FixedPMCArray);

    if (entry_name && !STRING_IS_EMPTY(entry_name)) {
        char   *cstring    = string_to_cstring(interp, entry_name);
        UINTVAL len        = string_length(interp, entry_name);
        STRING *const_name = string_make_direct(interp, cstring,
            len, PARROT_DEFAULT_ENCODING, PARROT_DEFAULT_CHARSET,
            PObj_constant_FLAG);

        string_cstring_free(cstring);
        VTABLE_set_pmc_keyed_str(interp, hll_info, const_name, entry);
    }
    else
        VTABLE_push_pmc(interp, hll_info, entry);

    VTABLE_set_integer_native(interp, entry, e_HLL_MAX);

    entry_id = constant_pmc_new(interp, enum_class_Integer);
    VTABLE_set_integer_native(interp, entry_id, id);
    VTABLE_set_pmc_keyed_int(interp, entry, e_HLL_id, entry_id);

    return entry;
}


/*

=item C<void Parrot_init_HLL>

Initialises the HLL_info and HLL_namespace fields.  Takes an interpreter and
calls C<Parrot_register_HLL> to register name within Parrot core.

=cut

*/

void
Parrot_init_HLL(PARROT_INTERP)
{
    interp->HLL_info      =
        constant_pmc_new(interp, enum_class_OrderedHash);
    interp->HLL_namespace =
        constant_pmc_new(interp, enum_class_ResizablePMCArray);

    Parrot_register_HLL(interp, CONST_STRING(interp, "parrot"));
}

/*

=item C<INTVAL Parrot_register_HLL>

Return the HLL id if C<hll_name> is already registered in the interpreter.

Otherwise register the HLL C<hll_name> within the interpreter.
Creates a root namespace for the HLL named C<hll_name>.
Returns a type ID for this HLL or 0 on error.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_register_HLL(PARROT_INTERP, ARGIN(STRING *hll_name))
{
    PMC   *entry, *name, *type_hash, *ns_hash, *hll_info;
    INTVAL idx;

    /* TODO LOCK or disallow in threads */

    idx = Parrot_get_HLL_id(interp, hll_name);

    if (idx >= 0)
        return idx;

    hll_info = interp->HLL_info;

    START_WRITE_HLL_INFO(interp, hll_info);

    idx      = VTABLE_elements(interp, hll_info);
    entry    = new_hll_entry(interp, hll_name);

    /* register HLL name */
    name     = constant_pmc_new_noinit(interp, enum_class_String);

    VTABLE_set_string_native(interp, name, hll_name);
    VTABLE_set_pmc_keyed_int(interp, entry, e_HLL_name, name);

    /* create HLL namespace using the *constant* name */
    hll_name = string_downcase(interp, VTABLE_get_string(interp, name));

    /* HLL type mappings aren't yet created, we can't create
     * a namespace in HLL's flavor yet - maybe promote the
     * ns_hash to another type, if mappings provide one
     * XXX - FIXME
     */
    ns_hash = Parrot_make_namespace_keyed_str(interp, interp->root_namespace,
                                              hll_name);

    /* cache HLL's toplevel namespace */
    VTABLE_set_pmc_keyed_int(interp, interp->HLL_namespace, idx, ns_hash);

    /* create HLL typemap hash */
    type_hash = Parrot_new_INTVAL_hash(interp, PObj_constant_FLAG);
    VTABLE_set_pmc_keyed_int(interp, entry, e_HLL_typemap, type_hash);

    /* UNLOCK */
    END_WRITE_HLL_INFO(interp, hll_info);

    return idx;
}

/*

=item C<INTVAL Parrot_register_HLL_lib>

Register an HLL library.
Takes an interpreter name and a pointer to a library name.
If the name matches one already registered, return the list position.
Otherwise, add the entry to the list and return 0.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_register_HLL_lib(PARROT_INTERP, ARGIN(STRING *hll_lib))
{
    PMC   *hll_info = interp->HLL_info;
    PMC   *entry, *name;
    INTVAL nelements, i;

    START_WRITE_HLL_INFO(interp, hll_info);

    nelements = VTABLE_elements(interp, hll_info);

    for (i = 0; i < nelements; ++i) {
        PMC * const entry    = VTABLE_get_pmc_keyed_int(interp, hll_info, i);
        PMC * const lib_name = VTABLE_get_pmc_keyed_int(interp, entry, e_HLL_lib);

        if (!PMC_IS_NULL(lib_name)) {
            const STRING * const name = VTABLE_get_string(interp, lib_name);
            if (string_equal(interp, name, hll_lib) == 0)
                break;
        }
    }

    if (i < nelements)
        return i;

    entry    = new_hll_entry(interp, NULL);

    VTABLE_set_pmc_keyed_int(interp, entry, e_HLL_name, PMCNULL);

    /* register dynlib */
    name    = constant_pmc_new_noinit(interp, enum_class_String);

    VTABLE_set_string_native(interp, name, hll_lib);
    VTABLE_set_pmc_keyed_int(interp, entry, e_HLL_lib, name);

    END_WRITE_HLL_INFO(interp, hll_info);

    return 0;
}

/*

=item C<INTVAL Parrot_get_HLL_id>

Return the ID of the given HLL name or -1 on error. C<parrot> has ID 0.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_get_HLL_id(PARROT_INTERP, ARGIN_NULLOK(STRING *hll_name))
{
    PMC * const hll_info = interp->HLL_info;
    INTVAL      i;

    START_READ_HLL_INFO(interp, hll_info);

    if (!hll_name || !VTABLE_exists_keyed_str(interp, hll_info, hll_name))
        i = -1;
    else {
        PMC * const entry    = VTABLE_get_pmc_keyed_str(interp, hll_info, hll_name);
        PMC * const entry_id = VTABLE_get_pmc_keyed_int(interp, entry, e_HLL_id);
        i = VTABLE_get_integer(interp, entry_id);
    }

    END_READ_HLL_INFO(interp, hll_info);

    return i;
}

/*

=item C<STRING * Parrot_get_HLL_name>

Returns the corresponding PMC's name.
Takes an interpreter name and an id.
If the id is out of range, or the PMC name is NULL,
returns NULL.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
STRING *
Parrot_get_HLL_name(PARROT_INTERP, INTVAL id)
{
    PMC * const  hll_info  = interp->HLL_info;
    const INTVAL nelements = VTABLE_elements(interp, hll_info);

    PMC         *entry, *name_pmc;

    if (id < 0 || id >= nelements)
        return NULL;

    START_READ_HLL_INFO(interp, hll_info);

    entry    = VTABLE_get_pmc_keyed_int(interp, hll_info, id);
    name_pmc = VTABLE_get_pmc_keyed_int(interp, entry, e_HLL_name);

    END_READ_HLL_INFO(interp, hll_info);

    /* loadlib-created 'HLL's are nameless */
    if (PMC_IS_NULL(name_pmc))
        return NULL;
    else
        return VTABLE_get_string(interp, name_pmc);
}

/*

=item C<void Parrot_register_HLL_type>

Register a type mapping of C<< core_type => hll_type >> for the given HLL.

=cut

*/

PARROT_EXPORT
void
Parrot_register_HLL_type(PARROT_INTERP, INTVAL hll_id,
        INTVAL core_type, INTVAL hll_type)
{
    PMC  *entry, *type_hash;
    PMC  *hll_info = interp->HLL_info;
    const INTVAL n = VTABLE_elements(interp, hll_info);

    if (hll_id >= n)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_GLOBAL_NOT_FOUND,
            "no such HLL ID (%vd)", hll_id);

    /* the type might already be registered in a non-conflicting way, in which
     * case we can avoid copying */
    if (PMC_sync(hll_info)) {
        if (hll_type == Parrot_get_HLL_type(interp, hll_id, core_type))
            return;
    }

    START_WRITE_HLL_INFO(interp, hll_info);

    entry     = VTABLE_get_pmc_keyed_int(interp, hll_info, hll_id);
    PARROT_ASSERT(!PMC_IS_NULL(entry));

    type_hash = VTABLE_get_pmc_keyed_int(interp, entry, e_HLL_typemap);
    PARROT_ASSERT(!PMC_IS_NULL(type_hash));

    VTABLE_set_integer_keyed_int(interp, type_hash, core_type, hll_type);

    END_WRITE_HLL_INFO(interp, hll_info);
}

/*

=item C<INTVAL Parrot_get_HLL_type>

Get an equivalent HLL type number for the language C<hll_id>.  If the given HLL
doesn't remap the given type, or if C<hll_id> is the special value
C<PARROT_HLL_NONE>, returns C<core_type> unchanged.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_get_HLL_type(PARROT_INTERP, INTVAL hll_id, INTVAL core_type)
{
    PMC    *entry, *type_hash, *hll_info;
    INTVAL  n, id;

    if (hll_id == PARROT_HLL_NONE || hll_id == 0)
        return core_type;

    if (hll_id < 0)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_GLOBAL_NOT_FOUND,
            "no such HLL ID (%vd)", hll_id);

    hll_info = interp->HLL_info;
    n        = VTABLE_elements(interp, hll_info);

    if (hll_id >= n)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_GLOBAL_NOT_FOUND,
            "no such HLL ID (%vd)", hll_id);

    START_READ_HLL_INFO(interp, hll_info);
    entry     = VTABLE_get_pmc_keyed_int(interp, hll_info, hll_id);
    END_READ_HLL_INFO(interp, hll_info);

    type_hash = VTABLE_get_pmc_keyed_int(interp, entry, e_HLL_typemap);

    if (PMC_IS_NULL(type_hash))
        return core_type;

    id = VTABLE_get_integer_keyed_int(interp, type_hash, core_type);

    return id ? id : core_type;
}

/*

=item C<INTVAL Parrot_get_ctx_HLL_type>

Return an equivalent PMC type number according to the current HLL setings in
the context.  If no type is registered, returns C<core_type>.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_get_ctx_HLL_type(PARROT_INTERP, INTVAL core_type)
{
    const INTVAL hll_id = CONTEXT(interp)->current_HLL;

    return Parrot_get_HLL_type(interp, hll_id, core_type);
}

/*

=item C<PMC* Parrot_get_ctx_HLL_namespace>

Return root namespace of the current HLL.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_get_ctx_HLL_namespace(PARROT_INTERP)
{
    return Parrot_get_HLL_namespace(interp, CONTEXT(interp)->current_HLL);
}

/*

=item C<PMC* Parrot_get_HLL_namespace>

Return root namespace of the HLL with the ID of I<hll_id>.  If C<hll_id> is the
special value C<PARROT_HLL_NONE>, return the global root namespace.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_get_HLL_namespace(PARROT_INTERP, int hll_id)
{
    if (hll_id == PARROT_HLL_NONE)
        return interp->root_namespace;

    if (PMC_int_val(interp->HLL_namespace) < hll_id)
        return PMCNULL;

    return VTABLE_get_pmc_keyed_int(interp, interp->HLL_namespace, hll_id);
}

/*

=item C<void Parrot_regenerate_HLL_namespaces>

Create all HLL namespaces that don't already exist. This is necessary when
creating a new interpreter which shares an old interpreter's HLL_info.

=cut

*/

PARROT_EXPORT
void
Parrot_regenerate_HLL_namespaces(PARROT_INTERP)
{
    const INTVAL n = VTABLE_elements(interp, interp->HLL_info);
    INTVAL       hll_id;

    /* start at one since the 'parrot' namespace should already have been
     * created */

    for (hll_id = 1; hll_id < n; ++hll_id) {
        PMC *ns_hash =
            VTABLE_get_pmc_keyed_int(interp, interp->HLL_namespace, hll_id);

        if (PMC_IS_NULL(ns_hash) ||
                ns_hash->vtable->base_type == enum_class_Undef)
        {
            STRING * const hll_name = Parrot_get_HLL_name(interp, hll_id);
            if (!hll_name)
                continue;

            string_downcase_inplace(interp, hll_name);

            /* XXX as in Parrot_register_HLL() this needs to be fixed to use
             * the correct type of namespace. It's relatively easy to do that
             * here because the typemap already exists, but it is not currently
             * done for consistency.
             */
            ns_hash = Parrot_make_namespace_keyed_str(interp,
                interp->root_namespace, hll_name);

            VTABLE_set_pmc_keyed_int(interp, interp->HLL_namespace,
                                     hll_id, ns_hash);
        }
    }
}

/*

=back

=head1 AUTHOR

Leopold Toetsch

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
