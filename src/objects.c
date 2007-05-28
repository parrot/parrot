/*
Copyright (C) 2001-2007, The Perl Foundation.
$Id$

=head1 NAME

objects.c - Class and object

=head1 DESCRIPTION

Handles class and object manipulation.

=head2 Functions

=over 4

=cut

*/

#define PARROT_IN_OBJECTS_C
#include "parrot/parrot.h"
#include <assert.h>

#include "objects.str"

static void parrot_class_register(Interp *interp, PMC *name,
        PMC *new_class, PMC *parent, PMC *mro);

/*

=item C<INTVAL Parrot_get_vtable_index(Interp *interp, STRING *name)>

Return index if C<name> is a valid vtable slot name.

=cut

*/

INTVAL
Parrot_get_vtable_index(Interp *interp, STRING *name)
{
    char * const name_c = string_to_cstring(interp, name);
    INTVAL low    = 0;
    INTVAL high   = NUM_VTABLE_FUNCTIONS - 1;

    /* some of the first "slots" don't have names. skip 'em. */
    while (!Parrot_vtable_slot_names[low]) {
        low++;
        high++;
    }

    while (low < high) {
        const INTVAL       i      = (low + high) / 2;
        const char * const meth_c = Parrot_vtable_slot_names[i];

        /* XXX slot_names still have __ in front */
        const INTVAL cmp = strcmp(name_c, meth_c + 2);

        if (cmp == 0) {
            string_cstring_free(name_c);
            return i;
        }
        else if (cmp > 0)
            low  = i + 1;
        else
            high = i;
    }

    string_cstring_free(name_c);

    return -1;
}

/*

=item C<static PMC* find_vtable_meth_ns(Interp *interp, PMC *ns,
        INTVAL vtable_index)>

Return Sub PMC if a method with the vtable name exists in ns

=cut

*/

static PMC*
find_vtable_meth_ns(Interp *interp, PMC *ns, INTVAL vtable_index)
{
    const INTVAL k   = VTABLE_elements(interp, ns);
    PMC   * const key = VTABLE_nextkey_keyed(interp, key_new(interp), ns,
        ITERATE_FROM_START);

    const char * const meth     = Parrot_vtable_slot_names[vtable_index];
    STRING     * const meth_str = string_from_cstring(interp, meth, strlen(meth));

    int         j;

    for (j = 0; j < k; ++j) {
        STRING * const ns_key = (STRING *)parrot_hash_get_idx(interp,
                            (Hash *)PMC_struct_val(ns), key);
        PMC * const res    = VTABLE_get_pmc_keyed_str(interp, ns, ns_key);

        /* success if matching vtable index or double-underscored name */
        if (res->vtable->base_type == enum_class_Sub &&
               (PMC_sub(res)->vtable_index == vtable_index ||
                string_compare(interp, meth_str, ns_key) == 0))
            return res;
    }

    return PMCNULL;
}

/*

=item C<PMC* Parrot_find_vtable_meth(Interp *interp, PMC *pmc, STRING *meth)>

Given pmc, run through its mro looking for the meth vtable method.
Return the vtable method PMC if found.

=cut

*/

PMC*
Parrot_find_vtable_meth(Interp *interp, PMC *pmc, STRING *meth)
{
    INTVAL i, n;
    PMC   *ns, *mro, *self_class;
    PMC   *_class       = pmc;

    /* Get index in Parrot_vtable_slot_names[]. */
    const INTVAL vtable_index = Parrot_get_vtable_index(interp, meth);

    if (vtable_index == -1)
        return PMCNULL;

    /* Get class. */
    if (PObj_is_object_TEST(pmc))
        _class = self_class = GET_CLASS(PMC_data_typed(pmc, Buffer), pmc);

    /* Get MRO and iterate over it to find method with a matching
       vtable index or double-underscored name. */
    mro = _class->vtable->mro;
    n   = VTABLE_elements(interp, mro);

    for (i = 0; i < n; ++i) {
        _class = VTABLE_get_pmc_keyed_int(interp, mro, i);
        ns     = VTABLE_pmc_namespace(interp, _class);

        if (!PMC_IS_NULL(ns)) {
            PMC * const res = find_vtable_meth_ns(interp, ns, vtable_index);

            if (!PMC_IS_NULL(res))
                return res;
        }
    }

    /* If we get here, method is not overridden in the class. */
    return PMCNULL;
}

/*

=item C<STRING* readable_name(Interp *interp, PMC *name)>

Given a String or Key PMC return the STRING* representation

=cut

XXX this function, key_set_to_string, and the key PMC get_repr should be consolidated
*/

STRING*
readable_name(Interp *interp, PMC *name)
{
    STRING *join_on;
    PMC    *array;

    if (name->vtable->base_type == enum_class_String)
        return VTABLE_get_string(interp, name);

    join_on = CONST_STRING(interp, ";");
    array   = pmc_new(interp, enum_class_ResizableStringArray);

    assert(name->vtable->base_type == enum_class_Key);

    while (name) {
        VTABLE_push_string(interp, array, key_string(interp, name));
        name = key_next(interp, name);
    }

    return string_join(interp, join_on, array);
}

/*

=item C< static void fail_if_exist(Interp *interp, PMC *name)>

Throws an exception if a PMC or class with the same name already exists.

=cut

XXX uses global class registry

*/

static void
fail_if_exist(Interp *interp, PMC *name)
{
    INTVAL      type;

    PMC * const classname_hash = interp->class_hash;
    PMC        *type_pmc       = (PMC *)VTABLE_get_pointer_keyed(interp,
                                        classname_hash, name);
    if (PMC_IS_NULL(type_pmc) ||
            type_pmc->vtable->base_type == enum_class_NameSpace)
        type = 0;
    else
        type = VTABLE_get_integer(interp, type_pmc);

    if (type > enum_type_undef) {
        /* TODO get printable name */
        real_exception(interp, NULL, INVALID_OPERATION,
                "Class %Ss already registered!\n",
                VTABLE_get_string(interp, name));
    }

    if (type < enum_type_undef)
        real_exception(interp, NULL, INVALID_OPERATION,
                "native type with name '%s' already exists - "
                "can't register Class", data_types[type].name);
}

/*
 * FIXME make array clone shallow
 */
static PMC *
clone_array(Interp *interp, PMC *source_array)
{
    PMC * const new_array = pmc_new(interp,
                                    source_array->vtable->base_type);
    const INTVAL count    = VTABLE_elements(interp, source_array);
    INTVAL                  i;

    /*
     * preserve type, we have OrderedHash and Array
     * XXX this doesn't preserve the keys of the ordered hash
     *     (but the keys aren't used -leo)
     */
    VTABLE_set_integer_native(interp, new_array, count);

    for (i = 0; i < count; i++) {
        VTABLE_set_pmc_keyed_int(interp, new_array, i,
                VTABLE_get_pmc_keyed_int(interp, source_array, i));
    }

    return new_array;
}

/* Take the class and completely rebuild the attribute stuff for
   it. Horribly destructive, and definitely not a good thing to do if
   there are instantiated objects for the class */
static void
rebuild_attrib_stuff(Interp *interp, PMC *_class)
{
    INTVAL    attr_count, cur_offset, n_class, n_mro, offset;
    PMC      *attr_offset_hash, *mro, *attribs;
    STRING   *classname, *partial_name;
    SLOTTYPE *class_slots;

#ifndef NDEBUG
    PMC * const orig_class = _class;
#endif

    /* attrib count isn't set yet, a GC caused by concat could
     * corrupt data under construction
     */
    Parrot_block_DOD(interp);

    class_slots      = PMC_data_typed(_class, SLOTTYPE *);
    attr_offset_hash = pmc_new(interp, enum_class_Hash);
    set_attrib_num(_class, class_slots, PCD_ATTRIBUTES, attr_offset_hash);

    mro   = _class->vtable->mro;
    n_mro = VTABLE_elements(interp, mro);

    /* walk from oldest parent down to n_class == 0 which is this class */
    cur_offset = 0;

    for (n_class = n_mro - 1; n_class >= 0; --n_class) {
        _class = VTABLE_get_pmc_keyed_int(interp, mro, n_class);

        /* this Class isa PMC - no attributes there */
        if (!PObj_is_class_TEST(_class))
            continue;

        class_slots = PMC_data_typed(_class, SLOTTYPE *);
        classname   = VTABLE_get_string(interp,
                    get_attrib_num(class_slots, PCD_CLASS_NAME));
        attribs    = get_attrib_num(class_slots, PCD_CLASS_ATTRIBUTES);
        attr_count = VTABLE_elements(interp, attribs);

        if (attr_count) {
            STRING *attr_name, *full_name;

            partial_name = string_concat(interp, classname,
                    string_from_cstring(interp, "\0", 1), 0);

            for (offset = 0; offset < attr_count; offset++) {
               attr_name = VTABLE_get_string_keyed_int(interp, attribs, offset);
               full_name = string_concat(interp, partial_name, attr_name, 0);

                /* store this attribute with short and full name */

                VTABLE_set_integer_keyed_str(interp, attr_offset_hash,
                        attr_name, cur_offset);
                VTABLE_set_integer_keyed_str(interp, attr_offset_hash,
                        full_name, cur_offset);
                cur_offset++;
            }
        }
    }

#ifndef NDEBUG
    assert(_class == orig_class);
#endif

    /* And note the totals */
    CLASS_ATTRIB_COUNT(_class) = cur_offset;
    Parrot_unblock_DOD(interp);
}

/*

=item C<static void create_deleg_pmc_vtable(Interp *, PMC *_class, PMC *class_name, int full)>

Create a vtable that dispatches either to the contained PMC in the first
attribute (deleg_pmc) or to an overridden method (delegate), depending
on the existence of the method for this class.

=cut

*/

static void
create_deleg_pmc_vtable(Interp *interp, PMC *_class, PMC *class_name, int full)
{
    int         i;
    const char *meth;
    STRING      meth_str;
    DECL_CONST_CAST;

    PMC * const vtable_pmc          = get_attrib_num(PMC_data_typed(_class,
                                       SLOTTYPE *), PCD_OBJECT_VTABLE);
    VTABLE * const vtable           = (VTABLE *)PMC_struct_val(vtable_pmc);
    VTABLE * const ro_vtable        = vtable->ro_variant_vtable;
    VTABLE * const deleg_pmc_vtable = interp->vtables[enum_class_deleg_pmc];
    VTABLE * const object_vtable    = interp->vtables[enum_class_ParrotObject];
    VTABLE * const ro_object_vtable = object_vtable->ro_variant_vtable;
    VTABLE * const delegate_vtable  = interp->vtables[enum_class_delegate];

    memset(&meth_str, 0, sizeof (meth_str));

    meth_str.encoding = Parrot_fixed_8_encoding_ptr;
    meth_str.charset  = Parrot_default_charset_ptr;

    for (i = 0; (meth = Parrot_vtable_slot_names[i]) != NULL; ++i) {
        if (!*meth)
            continue;

        /* strip underscores from method name */
        meth_str.strstart = (char *)const_cast(meth + 2);
        meth_str.strlen   = meth_str.bufused = strlen(meth) - 2;
        meth_str.hashval  = 0;

        if (!PMC_IS_NULL(Parrot_find_vtable_meth(interp, _class, &meth_str))) {
            /* the method exists; keep the ParrotObject delegate vtable slot */
            ((void **)vtable)[i] = ((void**)object_vtable)[i];
            if (ro_vtable)
                ((void **)ro_vtable)[i] = ((void**)ro_object_vtable)[i];
        }
        else if (full) {
            /*
             * the method doesn't exist; put in the deleg_pmc vtable,
             * but only if ParrotObject hasn't overridden the method
             */
            if (((void **)delegate_vtable)[i] == ((void**)object_vtable)[i]) {
                if (ro_vtable)
                    ((void **)ro_vtable)[i] = ((void**)deleg_pmc_vtable)[i];
                ((void **)vtable)[i] = ((void**)deleg_pmc_vtable)[i];
            }
            else {
                ((void **)vtable)[i] = ((void**)object_vtable)[i];
                if (ro_vtable)
                    ((void **)ro_vtable)[i] = ((void**)ro_object_vtable)[i];

            }
        }
    }
}

/*

=item C<const char* Parrot_MMD_method_name(Interp*, INTVAL)>

Return the method name for the given MMD enum.

=item C<INTVAL Parrot_MMD_method_idx(Interp*, STRING *)>

Return the MMD function number for method name or -1 on failure.

TODO allow dynamic expansion at runtime.

=cut

*/
const char*
Parrot_MMD_method_name(Interp *interp, INTVAL idx)
{
    assert(idx >= 0);

    if (idx >= MMD_USER_FIRST)
        return NULL;

    return Parrot_mmd_func_names[idx];
}

INTVAL
Parrot_MMD_method_idx(Interp *interp, char *name)
{
    INTVAL i;

    for (i = 0; i < MMD_USER_FIRST; ++i) {
        if (!strcmp(Parrot_mmd_func_names[i], name))
            return i;
    }

    return -1;
}


/*

=item C<PMC *
Parrot_single_subclass(Interp *interp, PMC *base_class, PMC *child_class_name)>

Subclass a class. Single parent class, nice and straightforward. If
C<child_class> is C<NULL>, this is an anonymous subclass we're creating,
function.

=cut

*/

PMC *
Parrot_single_subclass(Interp *interp, PMC *base_class, PMC *name)
{
    PMC      *child_class, *parents, *temp_pmc, *mro;
    SLOTTYPE *child_class_array;
    int       parent_is_class;

    /* Set the classname, if we have one */
    if (!PMC_IS_NULL(name)) {
        fail_if_exist(interp, name);
    }
    else {
        /* XXX not really threadsafe but good enough for now */
        static int anon_count;
        STRING *child_class_name;
        child_class_name = Parrot_sprintf_c(interp, "%c%canon_%d", 0, 0,
                                ++anon_count);
        name             = pmc_new(interp, enum_class_String);
        VTABLE_set_string_native(interp, name, child_class_name);
    }

    /* ParrotClass is the baseclass anyway, so build just a new class */
    if (base_class == interp->vtables[enum_class_ParrotClass]->pmc_class)
        return pmc_new_init(interp, enum_class_ParrotClass, name);

    parent_is_class = PObj_is_class_TEST(base_class);
    child_class     = pmc_new(interp, enum_class_ParrotClass);

    /* Hang an array off the data pointer */
    set_attrib_array_size(child_class, PCD_MAX);
    child_class_array = PMC_data_typed(child_class, SLOTTYPE *);
    set_attrib_flags(child_class);

    /* We will have five entries in this array */

    /* We have the same number of attributes as our parent */
    CLASS_ATTRIB_COUNT(child_class) = parent_is_class ?
                                        CLASS_ATTRIB_COUNT(base_class) : 0;

    /* Our parent class array has a single member in it */
    parents = pmc_new(interp, enum_class_ResizablePMCArray);

    VTABLE_set_integer_native(interp, parents, 1);
    VTABLE_set_pmc_keyed_int(interp, parents, 0, base_class);

    set_attrib_num(child_class, child_class_array, PCD_PARENTS, parents);
    set_attrib_num(child_class, child_class_array, PCD_CLASS_NAME, name);

    /* Our mro list is a clone of our parent's mro list,
     * with our self unshifted onto the beginning */
    mro = VTABLE_clone(interp, base_class->vtable->mro);
    VTABLE_unshift_pmc(interp, mro, child_class);

    /* But we have no attributes of our own. Yet */
    temp_pmc = pmc_new(interp, enum_class_ResizablePMCArray);
    set_attrib_num(child_class, child_class_array, PCD_CLASS_ATTRIBUTES,
        temp_pmc);

    parrot_class_register(interp, name, child_class, base_class, mro);
    rebuild_attrib_stuff(interp, child_class);

    if (!parent_is_class) {
        /* we append one attribute to hold the PMC */
        Parrot_add_attribute(interp, child_class,
                CONST_STRING(interp, "__value"));
        /*
         * then create a vtable derived from ParrotObject and
         * deleg_pmc - the ParrotObject vtable is already built
         */
        create_deleg_pmc_vtable(interp, child_class, name, 1);
    }
    else {
        /*
         * if any parent isa PMC, then still individual vtables might
         * be overridden in this subclass
         */
        const PMC *parent;
        int i, n, any_pmc_parent;

        n              = VTABLE_elements(interp, mro);
        any_pmc_parent = 0;

        /* 0 = this, 1 = parent (handled above), 2 = grandpa */
        for (i = 2; i < n; ++i) {
            parent = VTABLE_get_pmc_keyed_int(interp, mro, i);
            if (!PObj_is_class_TEST(parent)) {
                any_pmc_parent = 1;
                break;
            }
        }
        if (any_pmc_parent)
            create_deleg_pmc_vtable(interp, child_class, name, 0);
    }

    return child_class;
}

/*

=item C<void
Parrot_new_class(Interp *interp, PMC *_class, PMC *class_name)>

Creates a new class, named C<class_name>.

=cut

*/

void
Parrot_new_class(Interp *interp, PMC *_class, PMC *name)
{
    SLOTTYPE *class_array;
    PMC      *mro;

    /* check against duplicate newclasses */
    fail_if_exist(interp, name);

    /* Hang an array off the data pointer, empty of course */
    set_attrib_array_size(_class, PCD_MAX);
    class_array = PMC_data_typed(_class, SLOTTYPE *);

    /* set_attrib_flags(_class); init does it */

    /* Our parent class array has nothing in it */
    set_attrib_num(_class, class_array, PCD_PARENTS,
                   pmc_new(interp, enum_class_ResizablePMCArray));

    /* TODO create all class structures in constant PMC pool */

    /*
     * create MRO (method resolution order) array
     * first entry is this class itself
     */
    mro = pmc_new(interp, enum_class_ResizablePMCArray);
    VTABLE_push_pmc(interp, mro, _class);

    /* no attributes yet */
    set_attrib_num(_class, class_array, PCD_CLASS_ATTRIBUTES,
            pmc_new(interp, enum_class_ResizablePMCArray));

    /* Set the classname */
    set_attrib_num(_class, class_array, PCD_CLASS_NAME, name);

    parrot_class_register(interp, name, _class, NULL, mro);

    rebuild_attrib_stuff(interp, _class);
}

/*

=item C<PMC *
Parrot_class_lookup(Interp *interp, STRING *class_name)>

=item C<PMC *
Parrot_class_lookup_p(Interp *interp, PMC *class_name)>

Looks for the class named C<class_name> and returns it if it exists.
Otherwise it returns C<PMCNULL>.

=cut

*/

PMC *
Parrot_class_lookup(Interp *interp, STRING *class_name)
{
    const INTVAL type = pmc_type(interp, class_name);
    PMC         *pmc;

    if (type <= 0)
        return PMCNULL;

    pmc = interp->vtables[type]->pmc_class;
    assert(pmc);
    return pmc;
}

PMC *
Parrot_class_lookup_p(Interp *interp, PMC *class_name)
{
    const INTVAL type = pmc_type_p(interp, class_name);
    PMC         *pmc;

    if (type <= 0)
        return PMCNULL;

    pmc = interp->vtables[type]->pmc_class;
    assert(pmc);
    return pmc;
}

static INTVAL
register_type(Interp *interp, PMC *name)
{
    INTVAL type;
    PMC   *classname_hash, *item;

    /* so pt_shared_fixup() can safely do a type lookup */
    LOCK_INTERPRETER(interp);
    classname_hash = interp->class_hash;

    type = interp->n_vtable_max++;

    /* Have we overflowed the table? */
    if (type >= interp->n_vtable_alloced)
        parrot_realloc_vtables(interp);

    /* set entry in name->type hash */
    item              = pmc_new(interp, enum_class_Integer);
    PMC_int_val(item) = type;

    VTABLE_set_pmc_keyed(interp, classname_hash, name, item);
    UNLOCK_INTERPRETER(interp);

    return type;
}

/*

=item C<static void
parrot_class_register(Interp *interp, PMC *class_name, PMC *new_class, PMC *mro)>

This is the way to register a new Parrot class as an instantiable
type. Doing this involves putting it in the class hash, setting its
vtable so that the C<init> method initializes objects of the class rather than
the class itself, and adding it to the interpreter's base type table so
you can create a new C<foo> in PASM like this: C<new Px, foo>.

=cut

*/

static void
parrot_class_register(Interp *interp, PMC *name,
        PMC *new_class, PMC *parent, PMC *mro)
{
    VTABLE *new_vtable, *parent_vtable;
    PMC    *vtable_pmc, *ns, *top;
    INTVAL  new_type = register_type(interp, name);

    /* Build a new vtable for this class
     * The child class PMC gets the vtable of its parent class or
     * a ParrotClass vtable
     */
    if (parent && PObj_is_class_TEST(parent))
        parent_vtable = parent->vtable;
    else
        parent_vtable = new_class->vtable;

    new_vtable = Parrot_clone_vtable(interp, parent_vtable);

    /* Set the vtable's type to the newly allocated type */
    new_vtable->base_type = new_type;

    /* And cache our class PMC in the vtable so we can find it later */
    new_vtable->pmc_class = new_class;
    new_vtable->mro       = mro;

    if (parent_vtable->ro_variant_vtable)
        new_vtable->ro_variant_vtable =
            Parrot_clone_vtable(interp, parent_vtable->ro_variant_vtable);

    /* Reset the init method to our instantiation method */
    new_vtable->init          = Parrot_instantiate_object;
    new_vtable->init_pmc      = Parrot_instantiate_object_init;
    new_class->vtable         = new_vtable;

    /* Put our new vtable in the global table */
    interp->vtables[new_type] = new_vtable;

    /* check if we already have a NameSpace */
    top = CONTEXT(interp->ctx)->current_namespace;
    ns  = VTABLE_get_pmc_keyed(interp, top, name);

    /* XXX nested, use current as base ? */
    if (PMC_IS_NULL(ns)) {
        /* XXX try HLL namespace too XXX */
        top = Parrot_get_ctx_HLL_namespace(interp);
        ns  = VTABLE_get_pmc_keyed(interp, top, name);
    }

    if (PMC_IS_NULL(ns)) {
        ns = pmc_new(interp, enum_class_NameSpace);
        VTABLE_set_pmc_keyed(interp, top, name, ns);
    }

    /* attach namespace to vtable */
    new_vtable->_namespace = ns;

    if (new_vtable->ro_variant_vtable) {
        VTABLE *ro_vt;
        ro_vt             = new_vtable->ro_variant_vtable;
        ro_vt->base_type  = new_vtable->base_type;
        ro_vt->pmc_class  = new_vtable->pmc_class;
        ro_vt->mro        = new_vtable->mro;
        ro_vt->_namespace = new_vtable->_namespace;
    }

    /*
     * prepare object vtable - again that of the parent or
     * a ParrotObject vtable
     */
    if (parent && PObj_is_class_TEST(parent)) {
        vtable_pmc    =
            get_attrib_num((SLOTTYPE *)PMC_data(parent), PCD_OBJECT_VTABLE);
        parent_vtable = (VTABLE *)PMC_struct_val(vtable_pmc);
    }
    else
        parent_vtable = interp->vtables[enum_class_ParrotObject];

    new_vtable = Parrot_clone_vtable(interp, parent_vtable);

    if (parent_vtable->ro_variant_vtable)
        new_vtable->ro_variant_vtable =
            Parrot_clone_vtable(interp, parent_vtable->ro_variant_vtable);

    new_vtable->base_type = new_type;
    new_vtable->mro       = mro;
    new_vtable->pmc_class =  new_class;

    set_attrib_num(new_class, (SLOTTYPE*)PMC_data(new_class), PCD_OBJECT_VTABLE,
            vtable_pmc = constant_pmc_new(interp, enum_class_VtableCache));
    PMC_struct_val(vtable_pmc) = new_vtable;

    /* attach namespace to object vtable too */
    new_vtable->_namespace = ns;

    if (new_vtable->ro_variant_vtable) {
        VTABLE *ro_vt;
        ro_vt             = new_vtable->ro_variant_vtable;
        ro_vt->base_type  = new_vtable->base_type;
        ro_vt->pmc_class  = new_vtable->pmc_class;
        ro_vt->mro        = new_vtable->mro;
        ro_vt->_namespace = new_vtable->_namespace;
    }
}

static PMC*
get_init_meth(Interp *interp, PMC *_class, STRING *prop_str, STRING **meth_str)
{
    STRING     *meth;
    HashBucket *b;
    PMC        *props, *ns, *method;

    *meth_str = NULL;
#if 0
    PMC *prop;
    prop = VTABLE_getprop(interp, _class, prop_str);
    if (!VTABLE_defined(interp, prop))
        return PMCNULL;
    meth = VTABLE_get_string(interp, prop);
#else
    props = PMC_metadata(_class);
    if (!props)
        return PMCNULL;
    b = parrot_hash_get_bucket(interp,
                (Hash*) PMC_struct_val(props), prop_str);
    if (!b)
        return PMCNULL;
    meth = PMC_str_val((PMC*) b->value);
#endif

    *meth_str = meth;
    ns        = VTABLE_pmc_namespace(interp, _class);
    method    = VTABLE_get_pmc_keyed_str(interp, ns, meth);

    return method;
}


static void
do_initcall(Interp *interp, PMC* _class, PMC *object, PMC *init)
{
    PMC * const classsearch_array = _class->vtable->mro;
    PMC        *parent_class;
    INTVAL      i, nparents;

    /*
     * 1) if class has a CONSTRUCT property run it on the object
     *    no redispatch
     *
     * XXX isn't CONSTRUCT for creating new objects?
     */
    STRING *meth_str;
    PMC    *meth = get_init_meth(interp, _class,
            CONST_STRING(interp, "CONSTRUCT"), &meth_str);
    int     default_meth;

    if (!PMC_IS_NULL(meth)) {
        if (init)
            Parrot_run_meth_fromc_args(interp, meth,
                    object, meth_str, "vP", init);
        else
            Parrot_run_meth_fromc_args(interp, meth,
                    object, meth_str, "v");
    }
    /*
     * 2. if class has a BUILD property call it for all classes
     *    in reverse search order - this class last.
     *
     *    Note: mro contains this class as first element
     */
    nparents = VTABLE_elements(interp, classsearch_array);

    for (i = nparents - 1; i >= 0; --i) {
        parent_class = VTABLE_get_pmc_keyed_int(interp,
                classsearch_array, i);
        /* if it's a PMC, we put one PMC of that type into
         * the attribute slot #0 and call init() on that PMC
         */
        if (!PObj_is_class_TEST(parent_class)) {
            PMC *attr, *next_parent;
            SLOTTYPE *obj_data;

            /*
             * but only if init isn't inherited
             * or rather just on the last non-class parent
             */
            assert(i >= 1);
            next_parent = VTABLE_get_pmc_keyed_int(interp,
                    classsearch_array, i - 1);
            if (!PObj_is_class_TEST(next_parent))
                continue;

            attr     = pmc_new_noinit(interp, parent_class->vtable->base_type);
            obj_data = PMC_data_typed(object, SLOTTYPE *);
            set_attrib_num(object, obj_data, 0, attr);
            VTABLE_init(interp, attr);
            continue;
        }
        meth = get_init_meth(interp, parent_class,
                CONST_STRING(interp, "BUILD"), &meth_str);
        /* no method found and no BUILD property set? */
        if (PMC_IS_NULL(meth) && meth_str == NULL) {
            PMC   *ns;
            INTVAL vtable_index;

            /* use __init or __init_pmc (depending on if an argument was passed)
             * as fallback constructor method, if it exists */
            if (init)
                meth_str = CONST_STRING(interp, "init_pmc");
            else
                meth_str = CONST_STRING(interp, "init");

            ns   = VTABLE_pmc_namespace(interp, parent_class);

            /* can't use find_method, it walks mro */
            vtable_index = Parrot_get_vtable_index(interp, meth_str);
            meth         = find_vtable_meth_ns(interp, ns, vtable_index);
            default_meth = 1;
        }
        else
            default_meth = 0;

        if (!PMC_IS_NULL(meth)) {
            if (init)
                Parrot_run_meth_fromc_args(interp, meth,
                        object, meth_str, "vP", init);
            else
                Parrot_run_meth_fromc_args(interp, meth,
                        object, meth_str, "v");
        }
        else if (meth_str != NULL &&
                string_length(interp, meth_str) != 0 && !default_meth) {
            real_exception(interp, NULL, METH_NOT_FOUND,
                    "Class BUILD method ('%Ss') not found", meth_str);
        }
    }
}

/*

=item C<void
Parrot_instantiate_object(Interp *interp, PMC *object, PMC *init)>

Creates a Parrot object. Takes a passed-in class PMC that has sufficient
information to describe the layout of the object and, well, makes the
darned object.

=cut

*/

static void instantiate_object(Interp*, PMC *object, PMC *init);

void
Parrot_instantiate_object_init(Interp *interp, PMC *object, PMC *init)
{
    instantiate_object(interp, object, init);
}

void
Parrot_instantiate_object(Interp *interp, PMC *object)
{
    instantiate_object(interp, object, NULL);
}

static void
instantiate_object(Interp *interp, PMC *object, PMC *init)
{
    SLOTTYPE *new_object_array;
    INTVAL    attrib_count, i;

    PMC * const _class = object->vtable->pmc_class;
    /*
     * put in the real vtable
     */
    PMC * const vtable_pmc = get_attrib_num((SLOTTYPE *)PMC_data(_class),
                                            PCD_OBJECT_VTABLE);
    object->vtable         = (VTABLE *)PMC_struct_val(vtable_pmc);

    /* Grab the attribute count from the class */
    attrib_count = CLASS_ATTRIB_COUNT(_class);

    /* Build the array that hangs off the new object */
    /* First presize it */
    set_attrib_array_size(object, attrib_count);
    new_object_array = PMC_data_typed(object, SLOTTYPE *);

    /* fill with PMCNULL, so that access doesn't segfault */
    for (i = 0; i < attrib_count; ++i)
        set_attrib_num(object, new_object_array, i, PMCNULL);

    /* turn marking on */
    set_attrib_flags(object);

    /* We are an object now */
    PObj_is_object_SET(object);

    /* We really ought to call the class init routines here...
     * this assumes that an object isa delegate
     */
    do_initcall(interp, _class, object, init);
}

/*

=item C<PMC *
Parrot_add_parent(Interp *interp, PMC *_class, PMC *parent)>

Add the parent class to the current class' parent list. This also
involved adding all the parent's parents, as well as all attributes of
the parent classes that we're adding in.

The MRO (method resolution order) is the C3 algorithm used by Perl6
and Python (>= 2.3). See also:
L<http://pugs.blogs.com/pugs/2005/07/day_165_r5671_j.html>

=cut

*/

/* create a list if non-empty lists */
static PMC*
not_empty(Interp *interp, PMC *seqs)
{
    INTVAL i;
    PMC * const nseqs = pmc_new(interp, enum_class_ResizablePMCArray);
    PMC        *list;

    for (i = 0; i < VTABLE_elements(interp, seqs); ++i) {
        list = VTABLE_get_pmc_keyed_int(interp, seqs, i);

        if (VTABLE_elements(interp, list))
            VTABLE_push_pmc(interp, nseqs, list);
    }

    return nseqs;
}

/* merge the list if lists */
static PMC*
class_mro_merge(Interp *interp, PMC *seqs)
{
    PMC   *seq, *nseqs, *s;
    INTVAL i, j, k;

    /* silence compiler uninit warning */
    PMC *cand = NULL;
    PMC *res  = pmc_new(interp, enum_class_ResizablePMCArray);

    while (1) {
        nseqs = not_empty(interp, seqs);
        if (!VTABLE_elements(interp, nseqs))
            break;

        for (i = 0; i < VTABLE_elements(interp, nseqs); ++i) {
            seq  = VTABLE_get_pmc_keyed_int(interp, nseqs, i);
            cand = VTABLE_get_pmc_keyed_int(interp, seq, 0);

            /* check if candidate is valid */
            for (j = 0; j < VTABLE_elements(interp, nseqs); ++j) {
                s = VTABLE_get_pmc_keyed_int(interp, nseqs, j);

                for (k = 1; k < VTABLE_elements(interp, s); ++k)
                    if (VTABLE_get_pmc_keyed_int(interp, s, k) == cand) {
                        cand = NULL;
                        break;
                    }
            }
            if (cand)
                break;
        }
        if (!cand)
            real_exception(interp, NULL, E_TypeError,
                    "inconsisten class hierarchy");

        /* push candidate onto mro result */
        VTABLE_push_pmc(interp, res, cand);

        /* remove candidate from head of lists */
        for (i = 0; i < VTABLE_elements(interp, nseqs); ++i) {
            seq = VTABLE_get_pmc_keyed_int(interp, nseqs, i);

            if (VTABLE_get_pmc_keyed_int(interp, seq, 0) == cand)
                VTABLE_shift_pmc(interp, seq);
        }
    }

    return res;
}

/* create C3 MRO */
static PMC*
create_class_mro(Interp *interp, PMC *_class)
{
    PMC   *lparents, *bases, *base, *lmap;
    INTVAL i;

    /* list of lists
     * [ [class] [mro of bases] [bases] ]
     */
    PMC * const lall = pmc_new(interp, enum_class_ResizablePMCArray);
    PMC * const lc   = pmc_new(interp, enum_class_ResizablePMCArray);

    VTABLE_push_pmc(interp, lc, _class);
    VTABLE_push_pmc(interp, lall, lc);

    bases = get_attrib_num(PMC_data(_class), PCD_PARENTS);

    for (i = 0; i < VTABLE_elements(interp, bases); ++i) {
        base = VTABLE_get_pmc_keyed_int(interp, bases, i);
        lmap = PObj_is_class_TEST(base) ?
            create_class_mro(interp, base) : base->vtable->mro;
        VTABLE_push_pmc(interp, lall, lmap);
    }

    lparents = VTABLE_clone(interp, bases);
    VTABLE_push_pmc(interp, lall, lparents);

    return class_mro_merge(interp, lall);
}

void
Parrot_add_parent(Interp *interp, PMC *_class, PMC *parent)
{
    PMC *current_parent_array;

    if (!PObj_is_class_TEST(_class))
        internal_exception(1, "Class isn't a ParrotClass");

    if (!PObj_is_class_TEST(parent) && parent == parent->vtable->pmc_class) {
        /* Permit inserting non-classes so at least thaw'ing classes
         * is easy. Adding these parents after classes have been
         * subclassed is dangerous, however.
         */
        PMC *class_name;

        if (CLASS_ATTRIB_COUNT(_class) != 0)
            internal_exception(1, "Subclassing built-in type too late");

        Parrot_add_attribute(interp, _class, CONST_STRING(interp, "__value"));

        class_name = pmc_new(interp, enum_class_String);

        VTABLE_set_string_native(interp, class_name,
            VTABLE_name(interp, _class));

        create_deleg_pmc_vtable(interp, _class, class_name, 1);
    } else if (!PObj_is_class_TEST(parent)) {
        internal_exception(1, "Parent isn't a ParrotClass");
    }

    current_parent_array = get_attrib_num(PMC_data(_class), PCD_PARENTS);
    VTABLE_push_pmc(interp, current_parent_array, parent);

    _class->vtable->mro  = create_class_mro(interp, _class);

    rebuild_attrib_stuff(interp, _class);
}

/*

=item C<PMC * Parrot_remove_parent(Interp *interp, PMC *removed_class,
    PMC *existing_class)>

This currently does nothing but return C<PMCNULL>.

=cut

*/

PMC *
Parrot_remove_parent(Interp *interp, PMC *removed_class, PMC *existing_class) {
    return PMCNULL;
}

/*

=item C<PMC *
Parrot_multi_subclass(Interp *interp, PMC *base_class_array,
    STRING *child_class_name)>

This currently does nothing but return C<PMCNULL>.

=cut

*/

PMC *
Parrot_multi_subclass(Interp *interp, PMC *base_class_array,
    STRING *child_class_name) {
    return PMCNULL;
}

/*

=item C<INTVAL
Parrot_object_isa(Interp *interp, PMC *pmc, PMC *_class)>

Returns whether the object C<pmc> is an instance of class C<_class>.

=cut

*/

INTVAL
Parrot_object_isa(Interp *interp, PMC *pmc, PMC *_class)
{
    PMC   *mro;
    INTVAL i, classcount;

    /* if this is not a class */
    if (!PObj_is_class_TEST(pmc))
        pmc = VTABLE_get_class(interp, pmc);

    mro        = pmc->vtable->mro;
    classcount = VTABLE_elements(interp, mro);

    for (i = 0; i < classcount; ++i) {
        if (VTABLE_get_pmc_keyed_int(interp, mro, i) == _class)
            return 1;
    }

    return 0;
}

/*

=item C<PMC *
Parrot_new_method_cache(Interp *interp)>

This should create and return a new method cache PMC.

Currently it does nothing but return C<PMCNULL>.

=cut

*/

PMC *
Parrot_new_method_cache(Interp *interp) {
    return PMCNULL;
}

/*

=item C<PMC *
Parrot_find_method_with_cache(Interp *interp, PMC *_class, STRING *method_name)>

Find a method PMC for a named method, given the class PMC, current
interp, and name of the method.

This routine should use the current scope's method cache, if there is
one. If not, it creates a new method cache. Or, rather, it will when
we've got that bit working. For now it unconditionally goes and looks up
the name in the global stash.

=item C<PMC *
Parrot_find_method_direct(Interp *interp, PMC *_class, STRING *method_name)>

Find a method PMC for a named method, given the class PMC, current
interpreter, and name of the method. Don't use a possible method cache.

=item void Parrot_invalidate_method_cache(Interp *, STRING *_class)

Clear method cache for the given class. If class is NULL, caches for
all classes are invalidated.

=cut

*/

static PMC* find_method_direct_1(Interp*, PMC *, STRING*);

void
mark_object_cache(Interp *interp) {
}

void
init_object_cache(Interp *interp) {
    Caches * const mc = interp->caches = mem_allocate_zeroed_typed(Caches);
    SET_NULL(mc->idx);
}

void
destroy_object_cache(Interp *interp)
{
    UINTVAL i;
    Caches * const mc = interp->caches;

    for (i = 0; i < mc->mc_size; i++) {
        if (mc->idx[i])
            mem_sys_free(mc->idx[i]);
    }

    mem_sys_free(mc->idx);
    mem_sys_free(mc);
}

#define TBL_SIZE_MASK 0x1ff   /* x bits 2..10 */
#define TBL_SIZE (1 + TBL_SIZE_MASK)

static void
invalidate_type_caches(Interp *interp, UINTVAL type)
{
    Caches * const mc = interp->caches;
    INTVAL i;

    if (!mc)
        return;

    /* is it a valid entry */
    if (type >= mc->mc_size || !mc->idx[type])
        return;

    for (i = 0; i < TBL_SIZE; ++i) {
        Meth_cache_entry *e;
        for (e = mc->idx[type][i]; e;) {
            Meth_cache_entry * const next = e->next;
            mem_sys_free(e);
            e = next;
        }
    }

    mem_sys_free(mc->idx[type]);
    mc->idx[type] = NULL;
}

static void
invalidate_all_caches(Interp *interp)
{
    UINTVAL i;
    for (i = 1; i < (UINTVAL)interp->n_vtable_max; ++i)
        invalidate_type_caches(interp, i);
}

void
Parrot_invalidate_method_cache(Interp *interp, STRING *_class, STRING *meth)
{
    INTVAL type;

    /* during interp creation and NCI registration the class_hash
     * isn't yet up */
    if (!interp->class_hash)
        return;

    if (interp->resume_flag & RESUME_INITIAL)
        return;

    if (!_class) {
        invalidate_all_caches(interp);
        return;
    }

    type = pmc_type(interp, _class);

    if (type < 0)
        return;

    if (type == 0) {
        invalidate_all_caches(interp);
        return;
    }

    invalidate_type_caches(interp, (UINTVAL)type);
}

/*
 * quick'n'dirty method cache
 * TODO: use a hash if method_name is not constant
 *       i.e. from obj.$Sreg(args)
 *       If this hash is implemented mark it during DOD
 */

PMC *
Parrot_find_method_direct(Interp *interp, PMC *_class, STRING *method_name)
{
    PMC * const found = find_method_direct_1(interp, _class, method_name);
    STRING *s1, *s2;

    if (!PMC_IS_NULL(found))
        return found;

    s1 = CONST_STRING(interp, "__get_string");
    s2 = CONST_STRING(interp, "__get_repr");

    if (string_equal(interp, method_name, s1) == 0)
        return find_method_direct_1(interp, _class, s2);

    return PMCNULL;
}

PMC *
Parrot_find_method_with_cache(Interp *interp, PMC *_class, STRING *method_name /* NN */)
{
    UINTVAL type, bits, i;

    Caches           *mc;
    Meth_cache_entry *e, *old;

    assert(method_name != 0);

#if DISABLE_METH_CACHE
    return Parrot_find_method_direct(interp, _class, method_name);
#endif

    if (! PObj_constant_TEST(method_name))
        return Parrot_find_method_direct(interp, _class, method_name);

    mc   = interp->caches;
    type = _class->vtable->base_type;
    bits = (((UINTVAL) method_name->strstart) >> 2) & TBL_SIZE_MASK;

    if (type >= mc->mc_size) {
        if (mc->idx) {
            mc->idx = (Meth_cache_entry ***)mem_sys_realloc(mc->idx,
                sizeof (Meth_cache_entry ***) * (type + 1));
        }
        else {
            mc->idx = (Meth_cache_entry ***)mem_sys_allocate(
                sizeof (Meth_cache_entry ***) * (type + 1));
        }

        for (i = mc->mc_size; i <= type; ++i)
            mc->idx[i] = NULL;

        mc->mc_size = type + 1;
    }

    if (!mc->idx[type]) {
        mc->idx[type] = (Meth_cache_entry **)mem_sys_allocate(
            sizeof (Meth_cache_entry *) * TBL_SIZE);

        for (i = 0; i < TBL_SIZE; ++i)
            mc->idx[type][i] = NULL;
    }

    e   = mc->idx[type][bits];
    old = NULL;

    while (e && e->strstart != method_name->strstart) {
        old = e;
        e   = e->next;
    }

    if (!e) {
        /* when here no or no correct entry was at [bits] */
        e     = mem_allocate_typed(Meth_cache_entry);

        if (old)
            old->next = e;
        else
            mc->idx[type][bits] = e;

        e->pmc      = Parrot_find_method_direct(interp, _class, method_name);
        e->next     = NULL;
        e->strstart = method_name->strstart;
    }

    return e->pmc;
}

#ifdef NDEBUG
#  define TRACE_FM(i, c, m, sub)
#else
static void
debug_trace_find_meth(Interp *interp, PMC *_class, STRING *name, PMC *sub)
{
    STRING *class_name;
    const char *result;
    Interp *tracer;

    if (!Interp_trace_TEST(interp, PARROT_TRACE_FIND_METH_FLAG))
        return;
    if (PObj_is_class_TEST(_class)) {
        SLOTTYPE * const class_array = PMC_data_typed(_class, SLOTTYPE *);
        PMC *const class_name_pmc = get_attrib_num(class_array, PCD_CLASS_NAME);
        class_name = PMC_str_val(class_name_pmc);
    }
    else
        class_name = _class->vtable->whoami;
    if (sub) {
        if (sub->vtable->base_type == enum_class_NCI)
            result = "NCI";
        else
            result = "Sub";
    }
    else
        result = "no";
    tracer = interp->debugger ?
        interp->debugger : interp;
    PIO_eprintf(tracer,
            "# find_method class '%Ss' method '%Ss': %s\n",
            class_name, name, result);
}

#  define TRACE_FM(i, c, m, sub) \
    debug_trace_find_meth(i, c, m, sub)
#endif

static PMC *
find_method_direct_1(Interp *interp, PMC *_class,
                              STRING *method_name)
{
    PMC* method, *ns;
    INTVAL i;

    PMC * const mro = _class->vtable->mro;
    const INTVAL n = VTABLE_elements(interp, mro);
    for (i = 0; i < n; ++i) {
        _class = VTABLE_get_pmc_keyed_int(interp, mro, i);
        ns = VTABLE_pmc_namespace(interp, _class);
        method = VTABLE_get_pmc_keyed_str(interp, ns, method_name);
        TRACE_FM(interp, _class, method_name, method);
        if (!PMC_IS_NULL(method)) {
            return method;
        }
    }
    TRACE_FM(interp, _class, method_name, NULL);
    return PMCNULL;
}

/*
=item C<void
Parrot_note_method_offset(Interp *interp, UINTVAL offset, PMC *method)>

Notes where in the hierarchy we just found a method. Used so that we
can do a next and continue the search through the hierarchy for the
next instance of this method.

*/
void
Parrot_note_method_offset(Interp *interp, UINTVAL offset, PMC *method) {
}

/*

=item C<INTVAL
Parrot_add_attribute(Interp *interp, PMC* _class, STRING* attr)>

Adds the attribute C<attr> to the class.

=cut

*/

/* Life is ever so much easier if a class keeps its attributes at the
   end of the attribute array, since we don't have to insert and
   reorder attributes. Inserting's no big deal, especially since we're
   going to break horribly if you insert into a class that's been
   subclassed, but it'll do for now */

INTVAL
Parrot_add_attribute(Interp *interp, PMC* _class, STRING* attr)
{
    STRING *full_attr_name;
    char   *c_error;

    SLOTTYPE * const class_array = (SLOTTYPE *)PMC_data(_class);
    STRING   * const class_name  = VTABLE_get_string(interp,
            get_attrib_num(class_array, PCD_CLASS_NAME));
    PMC      * const attr_array  = get_attrib_num(class_array,
            PCD_CLASS_ATTRIBUTES);
    PMC      * const attr_hash   = get_attrib_num(class_array, PCD_ATTRIBUTES);
    INTVAL           idx         = VTABLE_elements(interp, attr_array);

    VTABLE_set_integer_native(interp, attr_array, idx + 1);
    VTABLE_set_string_keyed_int(interp, attr_array, idx, attr);

    full_attr_name = string_concat(interp, class_name,
            string_from_cstring(interp, "\0", 1), 0);

    full_attr_name = string_concat(interp, full_attr_name, attr, 0);

    /* TODO escape NUL char */
    if (VTABLE_exists_keyed_str(interp, attr_hash, full_attr_name))
    {
        c_error = string_to_cstring(interp, full_attr_name);
        internal_exception(1, "Attribute '%s' already exists", c_error);
        string_cstring_free(c_error);
    }

    /*
     * TODO check if someone is trying to add attributes to a parent class
     * while there are already child class attrs
     */
    idx = CLASS_ATTRIB_COUNT(_class)++;
    VTABLE_set_integer_keyed_str(interp, attr_hash, attr, idx);
    VTABLE_set_integer_keyed_str(interp, attr_hash, full_attr_name, idx);

    return idx;
}

/*

=item C<PMC *
Parrot_get_attrib_by_num(Interp *interp, PMC *object, INTVAL attrib)>

Returns attribute number C<attrib> from C<object>. Presumably the code
is asking for the correct attribute number.

=item C<PMC *
Parrot_get_attrib_by_str(Interp *interp, PMC *object, STRING *attr)>

Returns attribute with full qualified name C<attr> from C<object>.

=cut

*/

PMC *
Parrot_get_attrib_by_num(Interp *interp, PMC *object, INTVAL attrib)
{
    /*
     * this is called from ParrotObject's vtable now, so
     * there is no need for checking object being a valid object PMC
     */
    SLOTTYPE * const attrib_array = PMC_data_typed(object, SLOTTYPE *);
    const INTVAL attrib_count     = PMC_int_val(object);

    if (attrib >= attrib_count || attrib < 0)
        real_exception(interp, NULL, ATTRIB_NOT_FOUND,
                "No such attribute #%d", (int)attrib);

    return get_attrib_num(attrib_array, attrib);
}

static INTVAL
attr_str_2_num(Interp *interp, PMC *object, STRING *attr)
{
    PMC        *_class, *attr_hash;
    SLOTTYPE   *class_array;
    HashBucket *b;
    STRING     *delimit, *attr_name, *obj_name;
    int         idx, length;

    if (!PObj_is_object_TEST(object))
        internal_exception(INTERNAL_NOT_IMPLEMENTED,
                "Can't set non-core object attribs yet");

    _class = GET_CLASS((SLOTTYPE *)PMC_data(object), object);

    /* XXX Shared objects have the 'wrong' class stored in them
    * (because of the reference to the namespace and because it
    * references PMCs that may go away),
    * since we actually want one from the current interpreter. */
    if (PObj_is_PMC_shared_TEST(object))
        _class = VTABLE_get_class(interp, object);

    class_array = PMC_data_typed(_class, SLOTTYPE *);
    attr_hash   = get_attrib_num(class_array, PCD_ATTRIBUTES);
    b           = parrot_hash_get_bucket(interp,
                (Hash*) PMC_struct_val(attr_hash), attr);

    if (b)
        return PMC_int_val((PMC *)b->value);

    /* Create a delimiter for splitting up the Class\0attribute syntax. */
    delimit = string_from_cstring(interp, "\0", 1);

    /* Calculate the offset and the length of the attribute string. */
    idx     = string_str_index(interp, attr, delimit, 0) + 1;

    if (!idx) {
        real_exception(interp, NULL, ATTRIB_NOT_FOUND,
                "No such attribute '%Ss'", attr);
        return 0;
    }

    length = string_length(interp, attr) - idx;

    /* Extract the attribute and object name. */
    attr_name = string_substr(interp, attr, idx,  length, 0, 0);
    obj_name  = string_substr(interp, attr,   0, idx - 1, 0, 0);

    real_exception(interp, NULL, ATTRIB_NOT_FOUND,
            "No such attribute '%Ss\\0%Ss'", obj_name, attr_name);

    return 0;
}

PMC *
Parrot_get_attrib_by_str(Interp *interp, PMC *object, STRING *attr)
{
    return Parrot_get_attrib_by_num(interp, object,
                attr_str_2_num(interp, object, attr));
}

/*

=item C<PMC *
Parrot_set_attrib_by_num(Interp *interp, PMC *object,
  INTVAL attrib, PMC *value)>

Set attribute number C<attrib> from C<object> to C<value>. Presumably the code
is asking for the correct attribute number.

=item C<PMC *
Parrot_set_attrib_by_str(Interp *interp, PMC *object, STRING *attr, PMC *value)>

Sets attribute with full qualified name C<attr> from C<object> to C<value>.

=cut

*/

void
Parrot_set_attrib_by_num(Interp *interp, PMC *object, INTVAL attrib, PMC *value) {
    SLOTTYPE * const attrib_array = PMC_data_typed(object, SLOTTYPE *);
    const INTVAL     attrib_count = PMC_int_val(object);

    if (attrib >= attrib_count || attrib < 0)
        real_exception(interp, NULL, ATTRIB_NOT_FOUND,
                "No such attribute #%d", (int)attrib);

    set_attrib_num(object, attrib_array, attrib, value);
}

void
Parrot_set_attrib_by_str(Interp *interp, PMC *object, STRING *attr, PMC *value) {
    Parrot_set_attrib_by_num(interp, object,
        attr_str_2_num(interp, object, attr), value);
}

INTVAL
Parrot_class_offset(Interp *interp, PMC *object, STRING *_class) {
    PMC *class_pmc, *mro, *attribs;
    INTVAL offset, i, n, attr_count;

    if (!PObj_is_object_TEST(object))
        real_exception(interp, NULL, 1, "Not an object");

    class_pmc = GET_CLASS(PMC_data_typed(object, SLOTTYPE *), object);

    /* unroll common case - object is this class */
    attribs    = get_attrib_num(PMC_data(class_pmc), PCD_CLASS_ATTRIBUTES);
    attr_count = VTABLE_elements(interp, attribs);
    offset     = PMC_int_val(object) - attr_count;

    if (!string_equal(interp, VTABLE_name(interp, class_pmc), _class))
        return offset;

    /* now check mro */
    mro = class_pmc->vtable->mro;
    n   = VTABLE_elements(interp, mro);

    for (i = 1; i < n; ++i) {
        class_pmc  = VTABLE_get_pmc_keyed_int(interp, mro, i);
        attribs    = get_attrib_num(PMC_data(class_pmc), PCD_CLASS_ATTRIBUTES);
        attr_count = VTABLE_elements(interp, attribs);
        offset    -= attr_count;

        if (!string_equal(interp, VTABLE_name(interp, class_pmc), _class))
            return offset;
    }

    /* error caught in opcode */
    return -1;
}

/*

=item C<PMC *Parrot_find_class_constructor(Interp *interp,
                                           STRING *_class, INTVAL classtoken)>

Find and return the constructor method PMC for the named sub. The
classtoken is an identifier for the class used for fast lookup, or 0
if you don't have an identifier token (which, as they're currently
undefined, is pretty likely).

=cut

*/

PMC *Parrot_find_class_constructor(Interp *interp, STRING *_class,
                                   INTVAL classtoken) {
    return PMCNULL;
}

PMC *Parrot_find_class_destructor(Interp *interp, STRING *_class,
                                  INTVAL classtoken) {
    return PMCNULL;
}

PMC *Parrot_find_class_fallback(Interp *interp, STRING *_class,
                                INTVAL classtoken) {
    return PMCNULL;
}

void Parrot_set_class_constructor(Interp *interp, STRING *_class,
                                  INTVAL classtoken, STRING *method) {
}

void Parrot_set_class_destructor(Interp *interp, STRING *_class,
                                 INTVAL classtoken, STRING *method) {
}

void Parrot_set_class_fallback(Interp *interp, STRING *_class,
                               INTVAL classtoken, STRING *method) {
}


/* ************************************************************************ */
/* ********* BELOW HERE IS NEW PPD15 IMPLEMENTATION RELATED STUFF ********* */
/* ************************************************************************ */

/*

=item C<PMC* Parrot_ComputeMRO_C3(Interp *interp, PMC *_class)>

Computes the C3 linearization for the given class.

=cut

*/

static PMC* C3_merge(Interp *interp, PMC *merge_list)
{
    PMC *result    = pmc_new(interp, enum_class_ResizablePMCArray);
    int list_count = VTABLE_elements(interp, merge_list);
    int cand_count = 0;
    int i, reject;
    PMC *accepted  = PMCNULL;

    /* Try and find something appropriate to add to the MRO - basically, the
     * first list head that is not in the tail of all the other lists. */
    for (i = 0; i < list_count; i++) {
        PMC *cand_list, *cand_class;
        int reject, j;

        reject    = 0;
        cand_list = VTABLE_get_pmc_keyed_int(interp, merge_list, i);

        if (VTABLE_elements(interp, cand_list) == 0)
            continue;

        cand_class = VTABLE_get_pmc_keyed_int(interp, cand_list, 0);
        cand_count++;

        for (j = 0; j < list_count; j++) {
            /* Skip the current list. */
            if (j != i) {
                /* Is it in the tail? If so, reject. */
                PMC *check_list;
                int  check_length, k;

                check_list   = VTABLE_get_pmc_keyed_int(interp, merge_list, j);
                check_length = VTABLE_elements(interp, check_list);

                for (k = 1; k < check_length; k++) {
                    if (VTABLE_get_pmc_keyed_int(interp, check_list, k) ==
                        cand_class) {
                        reject = 1;
                        break;
                    }
                }
            }
        }

        /* If we didn't reject it, this candidate will do. */
        if (!reject) {
            accepted = cand_class;
            break;
        }
    }

    /* If we never found any candidates, return an empty list. */
    if (cand_count == 0)
        return pmc_new(interp, enum_class_ResizablePMCArray);

    /* If we didn't find anything to accept, error. */
    if (PMC_IS_NULL(accepted)) {
        real_exception(interp, NULL, ILL_INHERIT,
            "Could not build C3 linearization: ambiguous hierarchy");
        return PMCNULL;
    }

    /* Otherwise, remove what was accepted from the merge lists. */
    for (i = 0; i < list_count; i++) {
        PMC *list;
        int list_count, j;

        list       = VTABLE_get_pmc_keyed_int(interp, merge_list, i);
        list_count = VTABLE_elements(interp, list);

        for (j = 0; j < list_count; j++) {
            if (VTABLE_get_pmc_keyed_int(interp, list, j) == accepted) {
                VTABLE_delete_keyed_int(interp, list, j);
                break;
            }
        }
    }

    /* Need to merge what remains of the list, then put what was accepted on
     * the start of the list, and we're done. */
    result = C3_merge(interp, merge_list);
    VTABLE_unshift_pmc(interp, result, accepted);

    return result;
}

PMC* Parrot_ComputeMRO_C3(Interp *interp, PMC *_class)
{
    PMC *result;
    PMC *merge_list = pmc_new(interp, enum_class_ResizablePMCArray);
    PMC *immediate_parents;
    int i, parent_count;

    /* Now get immediate parents list. */
    Parrot_PCCINVOKE(interp, _class,
         string_from_const_cstring(interp, "parents", 0),
        "->P", &immediate_parents);

    if (immediate_parents == NULL) {
        real_exception(interp, NULL, METH_NOT_FOUND,
            "Failed to get parents list from class!");
        return PMCNULL;
    }

    parent_count = VTABLE_elements(interp, immediate_parents);

    if (parent_count == 0)
    {
        /* No parents - MRO just contains this class. */
        result = pmc_new(interp, enum_class_ResizablePMCArray);
        VTABLE_push_pmc(interp, result, _class);
        return result;
    }

    /* Otherwise, need to do merge. For that, need linearizations of all of
     * our parents added to the merge list. */
    for (i = 0; i < parent_count; i++) {
        PMC *lin;
        lin = Parrot_ComputeMRO_C3(interp,
            VTABLE_get_pmc_keyed_int(interp, immediate_parents, i));

        if (PMC_IS_NULL(lin))
            return PMCNULL;

        VTABLE_push_pmc(interp, merge_list, lin);
    }

    /* Finally, need list of direct parents on the end of the merge list, then
     * we can merge. */
    VTABLE_push_pmc(interp, merge_list, immediate_parents);
    result = C3_merge(interp, merge_list);

    if (PMC_IS_NULL(result))
        return PMCNULL;

    /* Merged result needs this class on the start, and then we're done. */
    VTABLE_unshift_pmc(interp, result, _class);

    return result;
}

/*

=item C<void Parrot_ComposeRole(Interp *interp, PMC *role,
                        PMC *exclude, int got_exclude,
                        PMC *alias,   int got_alias,
                        PMC *methods_hash, PMC *roles_list)>

Used by the Class and Object PMCs internally to compose a role into either of
them. The C<role> parameter is the role that we are composing into the class
or role. C<methods_hash> is the hash of method names to invokable PMCs that
contains the methods the class or role has. C<roles_list> is the list of roles
the the class or method does.

The C<role> parameter is only dealt with by its external interface. Whether
this routine is usable by any other object system implemented in Parrot very
much depends on how closely the role composition semantics they want are to
the default implementation.

=cut

*/

void Parrot_ComposeRole(Interp *interp, PMC *role,
                        PMC *exclude, int got_exclude,
                        PMC *alias,   int got_alias,
                        PMC *methods_hash, PMC *roles_list)
{
    PMC *methods;
    PMC *methods_iter;
    PMC *roles_of_role;
    PMC *proposed_add_methods;

    int i, j, roles_count, roles_of_role_count;

    /* Check we have not already composed the role; if so, just ignore it. */
    roles_count = VTABLE_elements(interp, roles_list);

    for (i = 0; i < roles_count; i++) {
        if (VTABLE_get_pmc_keyed_int(interp, roles_list, i) == role)
            return;
    }

    /* Get the methods from the role. */
    Parrot_PCCINVOKE(interp, role,
        string_from_const_cstring(interp, "methods", 0), "->P", &methods);

    if (PMC_IS_NULL(methods))
        return;

    /* We need to check for conflicts before we do the composition. We
     * put each method that would be OK to add into a proposal list, and
     * bail out right away if we find a problem. */
    proposed_add_methods = pmc_new(interp, enum_class_Hash);
    methods_iter         = VTABLE_get_iter(interp, methods);

    while (VTABLE_get_bool(interp, methods_iter)) {
        /* Get current method and its name. */
        STRING *method_name;
        PMC    *cur_method;
        int     excluded;

        method_name = VTABLE_shift_string(interp, methods_iter);
        cur_method  = VTABLE_get_pmc_keyed_str(interp, methods, method_name);

        /* Need to find the name we'll check for a conflict on. */
        excluded = 0;

        /* Check if it's in the exclude list. */
        if (got_exclude) {
            int exclude_count;

            exclude_count = VTABLE_elements(interp, exclude);

            for (i = 0; i < exclude_count; i++) {
                STRING *check;

                check = VTABLE_get_string_keyed_int(interp, exclude, i);

                if (string_equal(interp, check, method_name) == 0) {
                    excluded = 1;
                    break;
                }
            }
        }

        /* If we weren't excluded... */
        if (!excluded) {
            /* Is there a method with this name already in the class?
             * XXX TODO: multi-method handling. */
            if (VTABLE_exists_keyed_str(interp, methods_hash, method_name)) {
                /* Conflicts with something already in the class. */
                real_exception(interp, NULL, ROLE_COMPOSITION_METH_CONFLICT,
                    "A conflict occurred during role composition "
                    "due to method '%S'.", method_name);
                return;
            }

            /* What about a conflict with ourslef? */
            if (VTABLE_exists_keyed_str(interp, proposed_add_methods,
                method_name)) {
                /* Something very weird is going on. */
                real_exception(interp, NULL, ROLE_COMPOSITION_METH_CONFLICT,
                    "A conflict occurred during role composition;"
                    " the method '%S' from the role managed to conflict "
                    "with itself somehow.", method_name);
                return;
            }

            /* If we got here, no conflicts! Add method to the "to compose"
             * list. */
            VTABLE_set_pmc_keyed_str(interp, proposed_add_methods,
                method_name, cur_method);
        }

        /* Now see if we've got an alias. */
        if (got_alias && VTABLE_exists_keyed_str(interp, alias, method_name)) {
            /* Got one. Get name to alias it to. */
            STRING *alias_name;

            alias_name = VTABLE_get_string_keyed_str(interp,
                alias, method_name);

            /* Is there a method with this name already in the class?
             * XXX TODO: multi-method handling. */
            if (VTABLE_exists_keyed_str(interp, methods_hash, alias_name)) {
                /* Conflicts with something already in the class. */
                real_exception(interp, NULL, ROLE_COMPOSITION_METH_CONFLICT,
                    "A conflict occurred during role composition"
                    " due to the aliasing of '%S' to '%S'.",
                    method_name, alias_name);
                return;
            }

            /* What about a conflict with ourslef? */
            if (VTABLE_exists_keyed_str(interp, proposed_add_methods,
                    alias_name)) {
                real_exception(interp, NULL, ROLE_COMPOSITION_METH_CONFLICT,
                    "A conflict occurred during role composition"
                    " due to the aliasing of '%S' to '%S' (role already has"
                    " a method '%S').",
                    method_name, alias_name, alias_name);
                return;
            }

            /* If we got here, no conflicts! Add method to the "to compose"
             * list with its alias. */
            VTABLE_set_pmc_keyed_str(interp, proposed_add_methods,
                alias_name, cur_method);
        }
    }

    /* If we get here, we detected no conflicts. Go ahead and compose the
     * methods. */
    methods_iter = VTABLE_get_iter(interp, proposed_add_methods);

    while (VTABLE_get_bool(interp, methods_iter)) {
        /* Get current method and its name. */
        STRING *method_name;
        PMC    *cur_method;

        method_name = VTABLE_shift_string(interp, methods_iter);
        cur_method  = VTABLE_get_pmc_keyed_str(interp, proposed_add_methods,
            method_name);

        /* Add it to the methods of the class. */
        VTABLE_set_pmc_keyed_str(interp, methods_hash, method_name, cur_method);
    }

    /* Add this role to the roles list. */
    VTABLE_push_pmc(interp, roles_list, role);
    roles_count++;

    /* As a result of composing this role, we will also now do the roles
     * that it did itself. Note that we already have the correct methods
     * as roles "flatten" the methods they get from other roles into their
     * own method list. */
    Parrot_PCCINVOKE(interp, role,
        string_from_const_cstring(interp, "roles", 0), "->P", &roles_of_role);
    roles_of_role_count = VTABLE_elements(interp, roles_of_role);

    for (i = 0; i < roles_of_role_count; i++) {
        /* Only add if we don't already have it in the list. */
        PMC *cur_role;
        cur_role = VTABLE_get_pmc_keyed_int(interp, roles_of_role, i);

        for (j = 0; j < roles_count; j++) {
            if (VTABLE_get_pmc_keyed_int(interp, roles_list, j) == cur_role) {
                /* We ain't be havin' it. */
                VTABLE_push_pmc(interp, roles_list, cur_role);
            }
        }
    }
}

/*

=back

=head1 SEE ALSO

F<include/parrot/objects.h>, F<docs/pdds/pdd15_objects.pod>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
