/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
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

static void* instantiate_py_object(Interp*, PMC*, void*);
extern void
parrot_py_set_vtable(Parrot_Interp interpreter, PMC* class);

static PMC *
clone_array(Parrot_Interp interpreter, PMC *source_array)
{
    PMC *new_array;
    INTVAL count;
    INTVAL i;

    count = VTABLE_elements(interpreter, source_array);
    /*
     * preserve type, we have OrderedHash and Array
     * XXX this doesn't preserve the keys of the ordered hash
     *     (but the keys aren't used -leo)
     */
    new_array = pmc_new(interpreter, source_array->vtable->base_type);
    VTABLE_set_integer_native(interpreter, new_array, count);
    for (i = 0; i < count; i++) {
        VTABLE_set_pmc_keyed_int(interpreter, new_array, i,
                VTABLE_get_pmc_keyed_int(interpreter, source_array, i));
    }
    return new_array;
}

/* Take the class and completely rebuild the atttribute stuff for
   it. Horribly destructive, and definitely not a good thing to do if
   there are instantiated objects for the class */
static void
rebuild_attrib_stuff(Parrot_Interp interpreter, PMC *class)
{
    INTVAL cur_offset = POD_FIRST_ATTRIB;
    SLOTTYPE *class_slots;
    PMC *attr_offset_hash;
    PMC *class_offset_hash;
    PMC *parent_array;
    PMC *a_parent_class;
    STRING *classname;
    INTVAL class_offset;
    INTVAL parent_class_count;

    class_slots = PMC_data(class);
    attr_offset_hash = pmc_new(interpreter, enum_class_OrderedHash);
    class_offset_hash = pmc_new(interpreter, enum_class_Hash);
    parent_array = get_attrib_num(class_slots, PCD_ALL_PARENTS);
    parent_class_count = VTABLE_elements(interpreter, parent_array);

    for (class_offset = 0; class_offset < parent_class_count; class_offset++) {
        INTVAL parent_attr_count;
        SLOTTYPE *parent_slots;
        PMC *parent_attrib_array;

        a_parent_class = VTABLE_get_pmc_keyed_int(interpreter,
                parent_array, class_offset);
        if (!PObj_is_class_TEST(a_parent_class)) {
            /* this Class inherits from a PMC -
             * no attributes there
             */
            break;
        }
        parent_slots = PMC_data(a_parent_class);
        parent_attrib_array = get_attrib_num(parent_slots,
                PCD_CLASS_ATTRIBUTES);
        parent_attr_count = VTABLE_elements(interpreter,
                parent_attrib_array);

        /* If there are any parent attributes, then go add the
           parent to this class' attribute info things */
        if (parent_attr_count) {
            STRING *parent_name;
            INTVAL parent_offset;
            STRING *partial_name;

            parent_name = VTABLE_get_string(interpreter,
                    get_attrib_num(parent_slots, PCD_CLASS_NAME));
            /* Note the current offset as where this class'
               attributes start */
            VTABLE_set_integer_keyed_str(interpreter,
                    class_offset_hash,
                    parent_name, cur_offset);
            partial_name = string_concat(interpreter, parent_name,
                    string_from_cstring(interpreter, "\0", 1),
                    0);
            for (parent_offset = 0; parent_offset < parent_attr_count;
                    parent_offset++) {
                STRING *attr_name;
                STRING *full_name;

                attr_name = VTABLE_get_string_keyed_int(interpreter,
                        parent_attrib_array, parent_offset);
                full_name = string_concat(interpreter, partial_name,
                        attr_name, 0);
                VTABLE_set_integer_keyed_str(interpreter, attr_offset_hash,
                        full_name, cur_offset++);
            }
        }

    }
    /* Now append our own. To make things easier, we make sure we
       always appear in the offset list, even if we don't have any
       attributes. That way the append code for adding attributes to a
       child class works better */
    classname = VTABLE_get_string(interpreter, get_attrib_num(class_slots,
                PCD_CLASS_NAME));
    VTABLE_set_integer_keyed_str(interpreter, class_offset_hash, classname,
            cur_offset);
    {
        PMC *attribs;
        INTVAL attr_count;

        attribs = get_attrib_num(class_slots, PCD_CLASS_ATTRIBUTES);
        attr_count = VTABLE_elements(interpreter, attribs);
        if (attr_count) {
            STRING *partial_name;
            INTVAL offset;

            partial_name = string_concat(interpreter, classname,
                    string_from_cstring(interpreter, "\0", 1),
                    0);
            for (offset = 0; offset < attr_count; offset++) {
                STRING *attr_name;
                STRING *full_name;

                attr_name = VTABLE_get_string_keyed_int(interpreter, attribs,
                        offset);
                full_name = string_concat(interpreter, partial_name,
                        attr_name, 0);
                VTABLE_set_integer_keyed_str(interpreter, attr_offset_hash,
                        full_name, cur_offset++);
            }
        }
    }

    /* And replace what was in there with the new ones */
    set_attrib_num(class, class_slots, PCD_ATTRIBUTES, attr_offset_hash);
    set_attrib_num(class, class_slots, PCD_ATTRIB_OFFS, class_offset_hash);
    /* And note the totals */
    ATTRIB_COUNT(class) = cur_offset - POD_FIRST_ATTRIB;
}

/*

=item C<static void create_deleg_pmc_vtable(Interp *, PMC *class, STRING *name)>

Create a vtable that dispatches either to the contained PMC in the first
attribute (deleg_pmc) or to an overridden method (delegate), depending
on the existance of the method for this class.

=cut

*/

static void
create_deleg_pmc_vtable(Interp *interpreter, PMC *class, STRING *class_name)
{
    PMC *vtable_pmc;
    VTABLE *vtable, *deleg_pmc_vtable, *delegate_vtable, *object_vtable;
    int i;
    const char *meth;
    STRING meth_str;
    union {
        const void * __c_ptr;
        void * __ptr;
    } __ptr_u;

    vtable_pmc = get_attrib_num((SLOTTYPE*)PMC_data(class),
            PCD_OBJECT_VTABLE);
    vtable = PMC_struct_val(vtable_pmc);
    deleg_pmc_vtable = Parrot_base_vtables[enum_class_deleg_pmc];
    object_vtable = Parrot_base_vtables[enum_class_ParrotObject];
    delegate_vtable = Parrot_base_vtables[enum_class_delegate];

    memset(&meth_str, 0, sizeof(meth_str));
    meth_str.encoding = Parrot_fixed_8_encoding_ptr;
    meth_str.charset = Parrot_iso_8859_1_charset_ptr;
    for (i = 0; (meth = Parrot_vtable_slot_names[i]); ++i) {
        if (!*meth)
            continue;
        meth_str.strstart = const_cast(meth);
        meth_str.strlen = meth_str.bufused = strlen(meth);
        meth_str.hashval = 0;
        if (Parrot_find_global(interpreter, class_name, &meth_str)) {
            /*
             * if the method exists, keep the ParrotObject aka delegate vtable
             * slot
             */
            LVALUE_CAST(void **,vtable)[i] = ((void**)object_vtable)[i];
#if 0
            PIO_eprintf(interpreter, "deleg_pmc class '%Ss' found '%s'\n",
                    class_name, meth);
#endif
        }
        else {
            /*
             * if the method doesn't exist, put in the deleg_pmc vtable,
             * but only if ParrotObject hasn't overridden the method
             */
            if (((void **)delegate_vtable)[i] == ((void**)object_vtable)[i])
                LVALUE_CAST(void **,vtable)[i] = ((void**)deleg_pmc_vtable)[i];
            else
                LVALUE_CAST(void **,vtable)[i] = ((void**)object_vtable)[i];
        }
    }
    /*
     * TODO create a MMD name mapping and call mmd_register
     */

    /*
     * finally if the methods are changed dynamically
     * this vtable must be changed too
     * s. src/global.c:Parrot_store_global()
     */
}

/*

=item C<PMC *
Parrot_single_subclass(Parrot_Interp ointerpreter, PMC *base_class,
                       STRING *child_class_name)>

Subclass a class. Single parent class, nice and straightforward. If
C<child_class> is C<NULL>, this is an anonymous subclass we're creating,
which happens commonly enough to warrant an actual single-subclass
function.

=cut

*/

PMC *
Parrot_single_subclass(Parrot_Interp interpreter, PMC *base_class,
                       STRING *child_class_name)
{
    PMC *child_class;
    SLOTTYPE *child_class_array;
    PMC *classname_pmc;
    PMC *parents, *temp_pmc;
    int parent_is_class;
    int is_python = 0;

    if (base_class->vtable->base_type == enum_class_FixedPMCArray) {
        PMC *tuple = base_class;
        /* got a tuple holding parents - Python!
        */
        INTVAL n = VTABLE_elements(interpreter, tuple);
        is_python = 1;
        if (!n) {
            PMC* class = pmc_new(interpreter, enum_class_ParrotClass);
            Parrot_new_class(interpreter, class, child_class_name);
            parrot_py_set_vtable(interpreter, class);
            return class;
        }
        if (n > 1)
            internal_exception(1, "subclass: unimp multiple parents");
        base_class = VTABLE_get_pmc_keyed_int(interpreter, tuple, 0);
    }
    /*
     * ParrotClass is the baseclass anyway, so build just a new class
     */
    if (base_class == Parrot_base_vtables[enum_class_ParrotClass]->data) {
        PMC* class = pmc_new(interpreter, enum_class_ParrotClass);
        Parrot_new_class(interpreter, class, child_class_name);
        if (is_python)
            parrot_py_set_vtable(interpreter, class);
        return class;
    }
    parent_is_class = PObj_is_class_TEST(base_class);

    child_class = pmc_new(interpreter, enum_class_ParrotClass);
    /* Hang an array off the data pointer */
    set_attrib_array_size(child_class, PCD_MAX);
    child_class_array = PMC_data(child_class);
    set_attrib_flags(child_class);
    /* We will have five entries in this array */

    /* We have the same number of attributes as our parent */
    ATTRIB_COUNT(child_class) = ATTRIB_COUNT(base_class);

    /* Our parent class array has a single member in it */
    parents = pmc_new(interpreter, enum_class_Array);
    VTABLE_set_integer_native(interpreter, parents, 1);
    VTABLE_set_pmc_keyed_int(interpreter, parents, 0, base_class);
    set_attrib_num(child_class, child_class_array, PCD_PARENTS, parents);

    /* Set the classname, if we have one */
    classname_pmc = pmc_new(interpreter, enum_class_String);
    if (child_class_name) {
        VTABLE_set_string_native(interpreter, classname_pmc, child_class_name);
    }
    else {
        child_class_name = string_make(interpreter,
                "\0\0anonymous", 11, "iso-8859-1", 0);
        VTABLE_set_string_native(interpreter, classname_pmc,
                child_class_name );
    }

    set_attrib_num(child_class, child_class_array, PCD_CLASS_NAME, classname_pmc);

    /* Our penultimate parent list is a clone of our parent's parent
       list, with our parent unshifted onto the beginning */
    if (parent_is_class) {
        PMC *all_parents;
        all_parents = get_attrib_num((SLOTTYPE *)PMC_data(base_class),
                PCD_ALL_PARENTS);
        temp_pmc = clone_array(interpreter, all_parents);

    }
    else {
        /*
         * we have 1 parent, that gets unshifted below
         */
        temp_pmc = pmc_new(interpreter, enum_class_Array);
        VTABLE_set_integer_native(interpreter, temp_pmc, 0);
    }
    VTABLE_unshift_pmc(interpreter, temp_pmc, base_class);
    set_attrib_num(child_class, child_class_array, PCD_ALL_PARENTS, temp_pmc);


    /* But we have no attributes of our own. Yet */
    temp_pmc = pmc_new(interpreter, enum_class_Array);
    set_attrib_num(child_class, child_class_array, PCD_CLASS_ATTRIBUTES,
            temp_pmc);

    Parrot_class_register(interpreter, child_class_name, child_class,
            base_class);

    rebuild_attrib_stuff(interpreter, child_class);

    if (!parent_is_class) {
        /* we append one attribute to hold the PMC */
        Parrot_add_attribute(interpreter, child_class,
                CONST_STRING(interpreter, "__value"));
        /*
         * then create a vtable derived from ParrotObject and
         * deleg_pmc - the ParrotObject vtable is already built
         */
        create_deleg_pmc_vtable(interpreter, child_class, child_class_name);
    }
    if (is_python)
        parrot_py_set_vtable(interpreter, child_class);
    return child_class;
}

/*

=item C<void
Parrot_new_class(Parrot_Interp interpreter, PMC *class, STRING *class_name)>

Creates a new class, named C<class_name>.

=cut

*/

void
Parrot_new_class(Parrot_Interp interpreter, PMC *class, STRING *class_name)
{
    SLOTTYPE *class_array;
    PMC *classname_pmc;

    /* Hang an array off the data pointer, empty of course */
    set_attrib_array_size(class, PCD_MAX);
    class_array = PMC_data(class);
    /* set_attrib_flags(class); init does it */

    /* We will have five entries in this array */
    /* Our parent class array has nothing in it */
    set_attrib_num(class, class_array, PCD_PARENTS,
                   pmc_new(interpreter, enum_class_Array));
    set_attrib_num(class, class_array, PCD_ALL_PARENTS,
                   pmc_new(interpreter, enum_class_Array));
    set_attrib_num(class, class_array, PCD_CLASS_ATTRIBUTES,
            pmc_new(interpreter, enum_class_Array));


    /* Set the classname, if we have one */
    classname_pmc = pmc_new(interpreter, enum_class_String);
    VTABLE_set_string_native(interpreter, classname_pmc, class_name);
    set_attrib_num(class, class_array, PCD_CLASS_NAME, classname_pmc);

    Parrot_class_register(interpreter, class_name, class, NULL);

    rebuild_attrib_stuff(interpreter, class);
}

/*

=item C<PMC *
Parrot_class_lookup(Parrot_Interp interpreter, STRING *class_name)>

Looks for the class named C<class_name> and returns it if it exists.
Otherwise it returns C<PMCNULL>.

=cut

*/

PMC *
Parrot_class_lookup(Parrot_Interp interpreter, STRING *class_name)
{
    HashBucket *b;
    b = hash_get_bucket(interpreter,
                (Hash*) PMC_struct_val(interpreter->class_hash), class_name);
    if (b) {
        INTVAL type = PMC_int_val((PMC*)b->value);
        PMC *pmc = Parrot_base_vtables[type]->data;
        if (!pmc) {
            pmc = Parrot_base_vtables[type]->data =
                pmc_new_noinit(interpreter, type);
        }
        return pmc;
    }
    return PMCNULL;
}

/*

=item C<INTVAL
Parrot_class_register(Parrot_Interp interpreter, STRING *class_name,
        PMC *new_class)>

This is the way to register a new Parrot class as an instantiatable
type. Doing this involves putting it in the class hash, setting its
vtable so that the C<init> method initializes objects of the class rather than
the class itself, and adding it to the interpreter's base type table so
you can create a new C<foo> in PASM like this: C<new Px, foo>.

=cut

*/

INTVAL
Parrot_class_register(Parrot_Interp interpreter, STRING *class_name,
        PMC *new_class, PMC *parent)
{
    INTVAL new_type;
    VTABLE *new_vtable, *parent_vtable;
    PMC *vtable_pmc;

    /*
     * register the class in the PMCs name class_hash
     */
    if ((new_type = pmc_type(interpreter, class_name)) > enum_type_undef) {
        internal_exception(1, "Class %s already registered!\n",
                string_to_cstring(interpreter, class_name));
    }
    new_type = pmc_register(interpreter, class_name);
    /* Build a new vtable for this class
     * The child class PMC gets the vtable of its parent class or
     * a ParrotClass vtable
     *
     * XXX we are leaking this vtable
     */
    parent_vtable = new_class->vtable;
    if (parent && PObj_is_class_TEST(parent))
        parent_vtable = parent->vtable;
    else
        parent_vtable = new_class->vtable;
    new_vtable = Parrot_clone_vtable(interpreter, parent_vtable);

    /* Set the vtable's type to the newly allocated type */
    Parrot_vtable_set_type(interpreter, new_vtable, new_type);

    /* And cache our class PMC in the vtable so we can find it later */
    Parrot_vtable_set_data(interpreter, new_vtable, new_class);

    /* Reset the init method to our instantiation method */
    new_vtable->init = Parrot_instantiate_object;
    new_vtable->init_pmc = Parrot_instantiate_object_init;
    new_vtable->invoke  = instantiate_py_object;
    new_class->vtable = new_vtable;

    /* Put our new vtable in the global table */
    Parrot_base_vtables[new_type] = new_vtable;

    /*
     * prepare object vtable - again that of the parent or
     * a ParrotObject vtable
     */
    if (parent && PObj_is_class_TEST(parent)) {
        vtable_pmc =
            get_attrib_num((SLOTTYPE*)PMC_data(parent), PCD_OBJECT_VTABLE);
        parent_vtable = PMC_struct_val(vtable_pmc);
    }
    else
        parent_vtable = Parrot_base_vtables[enum_class_ParrotObject];

    new_vtable = Parrot_clone_vtable(interpreter, parent_vtable);
    new_vtable->base_type = new_type;
    set_attrib_num(new_class, (SLOTTYPE*)PMC_data(new_class), PCD_OBJECT_VTABLE,
            vtable_pmc = constant_pmc_new(interpreter, enum_class_VtableCache));
    PMC_struct_val(vtable_pmc) = new_vtable;

    return new_type;
}

static PMC*
get_init_meth(Parrot_Interp interpreter, PMC *class,
          STRING *prop_str , STRING **meth_str)
{
    STRING *meth;
    HashBucket *b;
    PMC *props;

    *meth_str = NULL;
#if 0
    PMC *prop;
    prop = VTABLE_getprop(interpreter, class, prop_str);
    if (!VTABLE_defined(interpreter, prop))
        return NULL;
    meth = VTABLE_get_string(interpreter, prop);
#else
    if ( !(props = PMC_metadata(class)))
        return NULL;
    b = hash_get_bucket(interpreter,
                (Hash*) PMC_struct_val(props), prop_str);
    if (!b)
        return NULL;
    meth = PMC_str_val((PMC*) b->value);
#endif
    *meth_str = meth;
    return Parrot_find_method_with_cache(interpreter, class, meth);
}


static void
do_py_initcall(Parrot_Interp interpreter, PMC* class, PMC *object)
{
    SLOTTYPE *class_data = PMC_data(class);
    PMC *classsearch_array = get_attrib_num(class_data, PCD_ALL_PARENTS);
    PMC *parent_class;
    INTVAL nparents;
    STRING *meth_str;
    PMC *meth;
    PMC *arg = REG_PMC(5);

    nparents = VTABLE_elements(interpreter, classsearch_array);
    if (nparents) {
        parent_class = VTABLE_get_pmc_keyed_int(interpreter,
                classsearch_array, nparents - 1);
        /* if it's a PMC, we put one PMC of that type into
         * the attribute slot #0.
         */
        if (!PObj_is_class_TEST(parent_class)) {
            PMC *attr;
            SLOTTYPE *obj_data = PMC_data(object);
            if (parent_class->vtable->base_type != enum_class_ParrotClass)
                VTABLE_invoke(interpreter, parent_class, NULL);
            attr = REG_PMC(5);
            set_attrib_num(object, obj_data, POD_FIRST_ATTRIB, attr);
        }
    }
    meth_str = CONST_STRING(interpreter, "__init__");
    meth = Parrot_find_method_with_cache(interpreter, class, meth_str);
    if (meth) {
        /* this passes arguments according to pdd03 */
        Parrot_run_meth_fromc(interpreter, meth, object, meth_str);
    }
}

static void
do_initcall(Parrot_Interp interpreter, PMC* class, PMC *object, PMC *init)
{
    SLOTTYPE *class_data = PMC_data(class);
    PMC *classsearch_array = get_attrib_num(class_data, PCD_ALL_PARENTS);
    PMC *parent_class;
    INTVAL i, nparents;
    /*
     * 1) if class has a CONSTRUCT property run it on the object
     *    no redispatch
     *
     *  TODO if the first meth is found, save registers, do all init
     *       calls and after the last one restore registers.
     *
     */
    STRING *meth_str;
    PMC *meth = get_init_meth(interpreter, class,
            CONST_STRING(interpreter, "CONSTRUCT"), &meth_str);
    int default_meth;
    if (meth) {
        if (init)
            Parrot_run_meth_fromc_args(interpreter, meth,
                    object, meth_str, "vP", init);
        else
            Parrot_run_meth_fromc(interpreter, meth,
                    object, meth_str);
    }
    /*
     * 2. if class has a BUILD property call it for all classes
     *    in reverse search order - this class last.
     */
    nparents = VTABLE_elements(interpreter, classsearch_array);
    for (i = nparents - 1; i >= 0; --i) {
        parent_class = VTABLE_get_pmc_keyed_int(interpreter,
                classsearch_array, i);
        /* if it's a PMC, we put one PMC of that type into
         * the attribute slot #0 and call init() on that PMC
         */
        if (!PObj_is_class_TEST(parent_class)) {
            PMC *attr = pmc_new_noinit(interpreter,
                    parent_class->vtable->base_type);
            SLOTTYPE *obj_data = PMC_data(object);
            set_attrib_num(object, obj_data, POD_FIRST_ATTRIB, attr);
            VTABLE_init(interpreter, attr);
            continue;
        }
        meth = get_init_meth(interpreter, parent_class,
                CONST_STRING(interpreter, "BUILD"), &meth_str);
        /* no method found and no BUILD property set? */
        if (!meth && meth_str == NULL) {
            /* use __init as fallback constructor method, if it exists */
            meth_str = CONST_STRING(interpreter, "__init");
            meth = Parrot_find_method_with_cache(interpreter,
                    parent_class, meth_str);
            default_meth = 1;
        }
        else
            default_meth = 0;
        if (meth) {
            if (init)
                Parrot_run_meth_fromc_args(interpreter, meth,
                        object, meth_str, "vP", init);
            else
                Parrot_run_meth_fromc(interpreter, meth,
                        object, meth_str);
        }
        else if (meth_str != NULL &&
                string_length(interpreter, meth_str) != 0 && !default_meth) {
            real_exception(interpreter, NULL, METH_NOT_FOUND,
                    "Class BUILD method ('%Ss') not found", meth_str);
        }
    }
    meth = get_init_meth(interpreter, class,
            CONST_STRING(interpreter, "BUILD"), &meth_str);
    /* no method found and no BUILD property set? */
    if (!meth && meth_str == NULL) {
        /* use __init as fallback constructor method, if it exists */
        meth_str = CONST_STRING(interpreter, "__init");
        meth = Parrot_find_method_with_cache(interpreter, class, meth_str);
        default_meth = 1;
    }
    else
        default_meth = 0;
    if (meth) {
        if (init)
            Parrot_run_meth_fromc_args(interpreter, meth,
                    object, meth_str, "vP", init);
        else
            Parrot_run_meth_fromc(interpreter, meth,
                    object, meth_str);
    }
    else if (meth_str != NULL && string_length(interpreter, meth_str) != 0
            && !default_meth) {
        real_exception(interpreter, NULL, METH_NOT_FOUND,
                "Class BUILD method ('%Ss') not found", meth_str);
    }
}

/*

=item C<void
Parrot_instantiate_object(Parrot_Interp interpreter, PMC *object, PMC *init)>

Creates a Parrot object. Takes a passed-in class PMC that has sufficient
information to describe the layout of the object and, well, makes the
darned object.

=cut

*/

static void instantiate_object(Parrot_Interp, PMC *object, PMC *init, int);

void
Parrot_instantiate_object_init(Parrot_Interp interpreter,
        PMC *object, PMC *init)
{
    instantiate_object(interpreter, object, init, 0);
}

void
Parrot_instantiate_object(Parrot_Interp interpreter, PMC *object)
{
    instantiate_object(interpreter, object, NULL, 0);
}

void Parrot_instantiate_py_object(Parrot_Interp, PMC *object);
void
Parrot_instantiate_py_object(Parrot_Interp interpreter, PMC *object)
{
    instantiate_object(interpreter, object, NULL, 1);
}
static void*
instantiate_py_object(Interp* interpreter, PMC* class, void* next)
{
    INTVAL type = class->vtable->base_type;
    PMC *object = NULL;
    if (PObj_is_class_TEST(class)) {
        /* __new__ is a type constructor, it takes a class and
         * arguments and returns a new object
         */
        STRING *meth_str = CONST_STRING(interpreter, "__new__");
        PMC *meth = Parrot_find_method_with_cache(interpreter, class, meth_str);
        if (meth) {
            object = Parrot_run_meth_fromc(interpreter,
                    meth, class, meth_str);
        }
    }
    if (!object)  {
        object = pmc_new_noinit(interpreter, type);
        instantiate_object(interpreter, object, NULL, 1);
    }
    REG_PMC(5) = object;
    return next;
}

static void
instantiate_object(Parrot_Interp interpreter, PMC *object,
        PMC *init, int is_python)
{
    SLOTTYPE *new_object_array;
    INTVAL attrib_count, i;
    SLOTTYPE *class_array;
    PMC *class;
    PMC *class_name;
    PMC *vtable_pmc;

    class = object->vtable->data;
    /*
     * put in the real vtable
     */
    vtable_pmc = get_attrib_num((SLOTTYPE *)PMC_data(class), PCD_OBJECT_VTABLE);
    object->vtable = PMC_struct_val(vtable_pmc);

    /* Grab the attribute count from the parent */
    attrib_count = ATTRIB_COUNT(class);

    class_array = PMC_data(class);
    class_name = get_attrib_num(class_array, PCD_CLASS_NAME);

    /* Build the array that hangs off the new object */
    /* First presize it */
    set_attrib_array_size(object,
                          attrib_count + POD_FIRST_ATTRIB);
    new_object_array = PMC_data(object);

    /* fill with PMCNULL, so that access doesn't segfault */
    for (i = POD_FIRST_ATTRIB; i < attrib_count + POD_FIRST_ATTRIB; ++i)
        set_attrib_num(object, new_object_array, i, PMCNULL);

    /* turn marking on */
    set_attrib_flags(object);
    /* 0 - class PMC, 1 - class name */
    SET_CLASS(new_object_array, object, class);
    set_attrib_num(object, new_object_array, POD_CLASS_NAME, class_name);

    /* Note the number of used slots */
    ATTRIB_COUNT(object) = POD_FIRST_ATTRIB + attrib_count;

    /* We are an object now */
    PObj_is_object_SET(object);

    /* We really ought to call the class init routines here...
     * this assumes that an object isa delegate
     */
    if (is_python) {
        /*
         * we are coming from Python
         */
        do_py_initcall(interpreter, class, object);

    }
    else
        do_initcall(interpreter, class, object, init);
}

/*

=item C<PMC *
Parrot_add_parent(Parrot_Interp interpreter, PMC *new_base_class,
           PMC *existing_class)>

Add the parent class to the current class' parent list. This also
involved adding all the parent's parents, as well as all attributes of
the parent classes that we're adding in.

=cut

*/

PMC *
Parrot_add_parent(Parrot_Interp interpreter, PMC *current_class_obj,
           PMC *add_on_class_obj)
{
    SLOTTYPE *current_class;
    SLOTTYPE *add_on_class;
    PMC *current_class_array;
    PMC *current_parent_array;
    PMC *add_on_class_array;
    INTVAL current_count, add_on_count, current_offset, add_on_offset;
    INTVAL current_size;
    INTVAL already_in = 0;

    if (!PObj_is_class_TEST(current_class_obj))
        internal_exception(1, "Class isn't a ParrotClass");
    if (!PObj_is_class_TEST(add_on_class_obj))
        internal_exception(1, "Parent isn't a ParrotClass");

    /* Grab the useful stuff from the guts of the class PMC */
    current_class = PMC_data(current_class_obj);

    /* Start with the current list */
    current_parent_array = get_attrib_num(current_class,
                                          PCD_PARENTS);
    current_size = VTABLE_elements(interpreter, current_parent_array);
    /*
     * first check, if the add_on class isn't already in our immediate
     * parents list
     */
    for (current_offset = 0;
         current_offset < current_size;
         current_offset++) {
        if (add_on_class_obj == VTABLE_get_pmc_keyed_int(interpreter,
                                                         current_parent_array,
                                                         current_offset)) {
            /*
             * XXX emit warning? error?
             */
            return NULL;
        }
    }

    /* Tack on the new parent class to the end of the immediate parent
       list */
    VTABLE_set_integer_native(interpreter, current_parent_array,
                              current_size + 1);
    VTABLE_set_pmc_keyed_int(interpreter, current_parent_array, current_size,
                            add_on_class_obj);

    /*
     * now check all parents
     */
    current_class_array = get_attrib_num(current_class, PCD_ALL_PARENTS);
    /* Loop through them. We can assume that we can just tack on any
       new classes to the end of the current class array. Attributes
       are a bit more interesting, unfortunately */
    current_count = VTABLE_elements(interpreter, current_class_array);

    /* Check to see if the parent class is already in the list. */
    for (current_offset = 0;
         current_offset < current_count;
         current_offset++) {
        if (add_on_class_obj == VTABLE_get_pmc_keyed_int(interpreter,
                                                         current_class_array,
                                                         current_offset)) {
            already_in = 1;
            break;
        }
    }

    /* If the parent class isn't already in the list (which can happen
       in a MI situation) go loop through all the classes in the
       parent list and add them into the child if they're not already
       in the child list */
    if (!already_in) {
        add_on_class = PMC_data(add_on_class_obj);
        add_on_class_array = get_attrib_num(add_on_class,
                                        PCD_ALL_PARENTS);
        add_on_count = VTABLE_elements(interpreter, add_on_class_array);
        /* First go put the new parent class on the search list */
        current_size = VTABLE_elements(interpreter,
                                       current_class_array);
        VTABLE_set_integer_native(interpreter,
                                  current_class_array,
                                  current_size + 1);
        VTABLE_set_pmc_keyed_int(interpreter, current_class_array,
                                 current_size, add_on_class_obj);
        /* And then go put all the parent class' parents on the list,
           if they're not there already */
        for (add_on_offset = 0; add_on_offset < add_on_count;
             add_on_offset++) {
            INTVAL found = 0;
            PMC *potential = VTABLE_get_pmc_keyed_int(interpreter,
                                                      add_on_class_array,
                                                      add_on_offset);
            for (current_offset = 0;
                 current_offset < current_count;
                 current_offset++) {
                if (potential == VTABLE_get_pmc_keyed_int(interpreter,
                                                          current_class_array,
                                                          current_offset)) {
                    found = 1;
                    break;
                }
            }
            /* We found it. Yay us. Add the parent class to the list */
            if (!found) {
                current_size = VTABLE_elements(interpreter,
                                               current_class_array);
                VTABLE_set_integer_native(interpreter,
                                          current_class_array,
                                          current_size + 1);
                VTABLE_set_pmc_keyed_int(interpreter, current_class_array,
                                         current_size, potential);
            }
        }
    }
    rebuild_attrib_stuff(interpreter, current_class_obj);
    return NULL;
}

/*

=item C<PMC *
Parrot_remove_parent(Parrot_Interp interpreter, PMC *removed_class,
                     PMC *existing_class)>

This currently does nothing but return C<NULL>.

=cut

*/

PMC *
Parrot_remove_parent(Parrot_Interp interpreter, PMC *removed_class,
                     PMC *existing_class) {
    return NULL;
}

/*

=item C<PMC *
Parrot_multi_subclass(Parrot_Interp interpreter, PMC *base_class_array,
                      STRING *child_class_name)>

This currently does nothing but return C<NULL>.

=cut

*/

PMC *
Parrot_multi_subclass(Parrot_Interp interpreter, PMC *base_class_array,
                      STRING *child_class_name) {
    return NULL;
}

/*

=item C<INTVAL
Parrot_object_isa(Parrot_Interp interpreter, PMC *pmc, PMC *cl)>

Return whether the object C<pmc> is an instance of class C<cl>.

=cut

*/

INTVAL
Parrot_object_isa(Parrot_Interp interpreter, PMC *pmc, PMC *cl) {
    PMC * t;
    SLOTTYPE *object_array = PMC_data(pmc);
    PMC *classsearch_array; /* The array of classes we're searching */
    INTVAL i, classcount;

    /* if this is a class */
    if (PObj_is_class_TEST(pmc)) {
        t = pmc;
        /* check if this is self */
        if (pmc == cl)
            return 1;
    }
    else {
        /* else get the object's class and the data array */
        t = GET_CLASS(object_array, pmc);
        object_array = PMC_data(t);
    }
    if (t == cl)
        return 1;
    /* If not, time to walk through the parent class array. Wheee */
    classsearch_array =
        get_attrib_num(object_array, PCD_ALL_PARENTS);
    classcount = VTABLE_elements(interpreter, classsearch_array);
    for (i = 0; i < classcount; ++i) {
        if (VTABLE_get_pmc_keyed_int(interpreter, classsearch_array, i) == cl)
            return 1;
    }
    return 0;
}

/*

=item C<PMC *
Parrot_new_method_cache(Parrot_Interp interpreter)>

This should create and return a new method cache PMC.

Currently it does nothing but return C<NULL>.

=cut

*/

PMC *
Parrot_new_method_cache(Parrot_Interp interpreter) {
    return NULL;
}

/*

=item C<PMC *
Parrot_find_method_with_cache(Parrot_Interp interpreter, PMC *class,
                              STRING *method_name)>

Find a method PMC for a named method, given the class PMC, current
interpreter, and name of the method.

This routine should use the current scope's method cache, if there is
one. If not, it creates a new method cache. Or, rather, it will when
we've got that bit working. For now it unconditionally goes and looks up
the name in the global stash.

=item void Parrot_invalidate_method_cache(Interp *, STRING *class)

Clear method cache for the given class. If class is NULL caches for
all classes are invalidated.

=cut

*/

static PMC* find_method_direct(Parrot_Interp, PMC *, STRING*);

void
mark_object_cache(Parrot_Interp interpreter)
{
    /* mark register frame cache */
    Stack_Chunk_t *chunk = interpreter->caches->frame_cache;

    while (chunk) {
        pobject_lives(interpreter, (PObj*)chunk);
        chunk = PObj_bufstart(chunk);
    }
    mark_retc_cache(interpreter);
}

void
init_object_cache(Parrot_Interp interpreter)
{
    Caches *mc;

    mc = interpreter->caches = mem_sys_allocate_zeroed(sizeof(*mc));
    SET_NULL(mc->idx);
    SET_NULL(mc->frame_cache);
    SET_NULL(mc->retc_cache);
}

#define TBL_SIZE_MASK 0x1ff   /* x bits 2..10 */
#define TBL_SIZE (1 + TBL_SIZE_MASK)

static void
invalidate_type_caches(Interp *interpreter, UINTVAL type)
{
    Caches *mc = interpreter->caches;
    Meth_cache_entry *e, *next;
    INTVAL i;

    if (!mc)
        return;
    /* is it a valid entry */
    if (type >= mc->mc_size || !mc->idx[type])
        return;
    for (i = 0; i < TBL_SIZE; ++i) {
        for (e = mc->idx[type][i]; e; ) {
            next = e->next;
            mem_sys_free(e);
            e = next;
        }
    }
    mem_sys_free(mc->idx[type]);
    mc->idx[type] = NULL;
}

static void
invalidate_all_caches(Interp *interpreter)
{
    UINTVAL i;
    for (i = 1; i < (UINTVAL)enum_class_max; ++i)
        invalidate_type_caches(interpreter, i);
}

void
Parrot_invalidate_method_cache(Interp *interpreter, STRING *class)
{
    INTVAL type;

    /* during interpreter creation and NCI registration the class_hash
     * isn't yet up */
    if (!interpreter->class_hash)
        return;
    if (!class) {
        invalidate_all_caches(interpreter);
        return;
    }
    type = pmc_type(interpreter, class);
    if (type < 0)
        return;
    if (type == 0) {
        invalidate_all_caches(interpreter);
        return;
    }
    invalidate_type_caches(interpreter, (UINTVAL)type);
}

/*
 * quick'n'dirty method cache
 * TODO: use a hash if method_name is not constant
 *       i.e. from obj.$Sreg(args)
 *       If this hash is implemented mark it during DOD
 */
PMC *
Parrot_find_method_with_cache(Parrot_Interp interpreter, PMC *class,
                              STRING *method_name)
{

    UINTVAL type = class->vtable->base_type;
    Caches *mc = interpreter->caches;
    PMC *found;
    int store_it = 0;
    int is_const = PObj_constant_TEST(method_name);
    UINTVAL bits = (((UINTVAL) method_name->strstart ) >> 2) & TBL_SIZE_MASK;
    Meth_cache_entry *e, *old = NULL;

#if DISABLE_METH_CACHE
    return find_method_direct(interpreter, class, method_name);
#endif

    if (!is_const) {
        /* TODO use hash - for now just go look up */
        goto find_it;
    }

    if (type >= mc->mc_size || !mc->idx[type] || !mc->idx[type][bits]) {
        store_it = 1;
find_it:
        found = find_method_direct(interpreter, class, method_name);
    }
    else {
        e = mc->idx[type][bits];
        while (e && e->strstart != method_name->strstart) {
            old = e;
            e = e->next;
        }
        if (!e) {
            found = find_method_direct(interpreter, class, method_name);
            goto store_e;
        }
        return e->pmc;
    }
    if (store_it) {
        UINTVAL i;
        if (type >= mc->mc_size) {
            if (mc->idx) {
                mc->idx = mem_sys_realloc(mc->idx,
                                          sizeof(UINTVAL*) * (type + 1));
            } else {
                mc->idx = mem_sys_allocate(sizeof(UINTVAL*) * (type + 1));
            }
            for (i = mc->mc_size; i <= type; ++i)
                mc->idx[i] = NULL;
            mc->mc_size = type + 1;
        }
        if (!mc->idx[type]) {
            mc->idx[type] = mem_sys_allocate(sizeof(Meth_cache_entry*) *
                    TBL_SIZE);
            for (i = 0; i < TBL_SIZE; ++i)
                mc->idx[type][i] = NULL;
        }
        old = mc->idx[type][bits];
store_e:
        /* when here no or no correct entry was at [bits] */
        e = mem_sys_allocate(sizeof(Meth_cache_entry));
        if (old)
            old->next = e;
        else
            mc->idx[type][bits] = e;

        e->pmc = found;
        e->next = NULL;
        e->strstart = method_name->strstart;
    }
    return found;
}

#ifdef NDEBUG
#  define TRACE_FM(i, c, m, sub)
#else
static void
debug_trace_find_meth(Interp* interpreter, PMC *class, STRING *name, PMC *sub)
{
    STRING *class_name;
    const char *result;
    if (!Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG))
        return;
    if (PObj_is_class_TEST(class)) {
        SLOTTYPE *class_array = PMC_data(class);
        PMC *class_name_pmc = get_attrib_num(class_array, PCD_CLASS_NAME);
        class_name = PMC_str_val(class_name_pmc);
    }
    else
        class_name = class->vtable->whoami;
    if (sub) {
        if (sub->vtable->base_type == enum_class_NCI)
            result = "NCI";
        else
            result = "Sub";
    }
    else
        result = "no";
    PIO_eprintf(interpreter,
            "# find_method class '%Ss' method '%Ss': %s\n",
            class_name, name, result);
}

#  define TRACE_FM(i, c, m, sub) \
    debug_trace_find_meth(i, c, m, sub)
#endif

static PMC *
find_method_direct_1(Parrot_Interp interpreter, PMC *class,
                              STRING *method_name)
{
    PMC* method = NULL;  /* The method we ultimately return */
    PMC* curclass;          /* PMC for the current search class */
    PMC* classsearch_array; /* The array of classes we're searching
                               for the method in */
    INTVAL searchoffset = 0; /* Where in that array we are */
    INTVAL classcount = 0;   /* The number of classes we need to
                                search */

    /*
     * if it's a non-ParrotClass PMC, then the namespace
     * is the PMC's class name
     * see also enter_nci_method()
     */
    if (!PObj_is_class_TEST(class)) {
        STRING *class_name;
        STRING *isa;
        UINTVAL start;
        INTVAL pos;

        class_name = class->vtable->whoami;
        method = Parrot_find_global(interpreter,
                class_name,
                method_name);
        TRACE_FM(interpreter, class, method_name, method);
        if (method) {
            return method;
        }
        /*
         * now look into that PMCs parents
         * the parent classes are in vtable->isa_str as blank
         * terminated class names - suboptimal but good enough for now
         *
         * TODO check vtable standard names
         */
        start = class_name->strlen + 1;
        isa = class->vtable->isa_str;
        while (isa->strlen > start) {
            pos = string_str_index(interpreter, isa,
                    CONST_STRING(interpreter, " "), start);
            if (pos == -1) pos=isa->strlen;
            method = Parrot_find_global(interpreter,
                    string_substr(interpreter, isa, start,
                        pos - start, NULL, 0),
                    method_name);
            TRACE_FM(interpreter, class, method_name, method);
            if (method) {
                return method;
            }
            start = pos + 1;
        }
        /* finally look in namespace "object" */
        method =  Parrot_find_global(interpreter,
                CONST_STRING(interpreter, "object"),
                method_name);
        TRACE_FM(interpreter, class, method_name, method);
        return method;
    }

    /* The order of operations:
     *
     * - Look for the method in the class we were passed
     * - If that doesn't exist, grab the parent class array
     * -  For each element in the parent class array, look for the
     *    method
     * - If none of that works, try again looking for the fallback method
     */

    /* See if we get lucky and its in the class of the PMC */
    method = Parrot_find_global(interpreter,
            VTABLE_get_string(interpreter,
                get_attrib_num((SLOTTYPE *)PMC_data(class),
                    PCD_CLASS_NAME)),
            method_name);

    /* Bail immediately if we got something */
    TRACE_FM(interpreter, class, method_name, method);
    if (method) {
        return method;
    }

    /* If not, time to walk through the parent class array. Wheee */
    classsearch_array = get_attrib_num((SLOTTYPE *)PMC_data(class),
            PCD_ALL_PARENTS);
    classcount = VTABLE_elements(interpreter, classsearch_array);

    for (searchoffset = 0; searchoffset < classcount; searchoffset++) {
        curclass = VTABLE_get_pmc_keyed_int(interpreter,
                classsearch_array, searchoffset);
        if (!PObj_is_class_TEST(curclass)) {
            class = curclass;
            if (class->vtable->base_type == enum_class_delegate)
                break;
            return VTABLE_find_method(interpreter, curclass, method_name);
        }
        method = Parrot_find_global(interpreter,
                VTABLE_get_string(interpreter,
                    get_attrib_num((SLOTTYPE *)PMC_data(curclass),
                        PCD_CLASS_NAME)),
                method_name);
        TRACE_FM(interpreter, curclass, method_name, method);
        if (method) {
            Parrot_note_method_offset(interpreter, searchoffset, method);
            return method;
        }
    }
    TRACE_FM(interpreter, class, method_name, method);
    return method;
}

static PMC *
find_method_direct(Parrot_Interp interpreter, PMC *class,
                              STRING *method_name)
{
    PMC *found = find_method_direct_1(interpreter, class, method_name);
    STRING * s1, *s2;
    if (found)
        return found;
    s1 = CONST_STRING(interpreter, "__get_string");
    s2 = CONST_STRING(interpreter, "__get_repr");
    if (string_equal(interpreter, method_name, s1) == 0)
        return find_method_direct_1(interpreter, class, s2);
    return NULL;
}

/*
=item C<void
Parrot_note_method_offset(Parrot_Interp interpreter, UINTVAL offset, PMC *method)>

Notes where in the hierarchy we just found a method. Used so that we
can do a next and continue the search through the hierarchy for the
next instance of this method.

*/
void
Parrot_note_method_offset(Parrot_Interp interpreter, UINTVAL offset, PMC *method)
{
    interpreter->ctx.current_class_offset = offset;
}

/*

=item C<INTVAL
Parrot_add_attribute(Parrot_Interp interpreter, PMC* class, STRING* attr)>

Adds the attribute C<attr> to the class.

=cut

*/

/* Life is ever so much easiser if a class keeps its attributes at the
   end of the attribute array, since we don't have to insert and
   reorder attributes. Inserting's no big deal, especially since we're
   going to break horribly if you insert into a class that's been
   subclassed, but it'll do for now */

INTVAL
Parrot_add_attribute(Parrot_Interp interpreter, PMC* class, STRING* attr)
{
    SLOTTYPE *class_array;
    STRING *class_name;
    INTVAL idx;
    PMC *attr_hash = NULL;
    PMC *attr_array;
    STRING *full_attr_name;

    class_array = (SLOTTYPE *)PMC_data(class);
    class_name = VTABLE_get_string(interpreter,
            get_attrib_num(class_array, PCD_CLASS_NAME));
    attr_array = get_attrib_num(class_array, PCD_CLASS_ATTRIBUTES);
    attr_hash = get_attrib_num(class_array, PCD_ATTRIBUTES);
    idx = VTABLE_elements(interpreter, attr_array);
    VTABLE_set_integer_native(interpreter, attr_array, idx + 1);
    VTABLE_set_string_keyed_int(interpreter, attr_array, idx, attr);
    full_attr_name = string_concat(interpreter, class_name,
            string_from_cstring(interpreter, "\0", 1), 0);
    full_attr_name = string_concat(interpreter, full_attr_name, attr, 0);
    /* TODO escape NUL char */
    if (VTABLE_exists_keyed_str(interpreter, attr_hash, full_attr_name))
        internal_exception(1, "Attribute '%s' already exists",
                string_to_cstring(interpreter, full_attr_name));

    /*
     * TODO check if someone is trying to add attributes to a parent class
     * while there are already child class attrs
     */
    idx = VTABLE_elements(interpreter, attr_hash);
    assert(ATTRIB_COUNT(class) == idx);
    /*
     * attr_hash is an OrderedHash so the line below could be:
     *
     *   VTABLE_set_string_keyed_str(interpreter, attr_hash,
     *        full_attr_name, attr);
     *
     * so that we have a mapping full_attr_name => attr_name
     * the index is in the OrderedHash anyway
     *
     * if this isn't needed a plain hash is faster
     *
     * -leo
     */
    VTABLE_set_integer_keyed_str(interpreter, attr_hash,
            full_attr_name, idx);
    assert(idx + 1 == VTABLE_elements(interpreter, attr_hash));
    ATTRIB_COUNT(class) = idx + 1;
    return idx;
}

/*

=item C<PMC *
Parrot_get_attrib_by_num(Parrot_Interp interpreter, PMC *object, INTVAL attrib)>

Returns attribute number C<attrib> from C<object>. Presumably the code
is asking for the correct attribute number.

=item C<PMC *
Parrot_get_attrib_by_str(Parrot_Interp interpreter, PMC *object, STRING *attr)>

Returns attribute with full qualified name C<attr> from C<object>.

=cut

*/

PMC *
Parrot_get_attrib_by_num(Parrot_Interp interpreter, PMC *object, INTVAL attrib)
{
    SLOTTYPE *attrib_array;
    INTVAL attrib_count;

    /*
     * this is called from ParrotObject's vtable now, so
     * their is no need for checking object being a valid
     * object PMC
     */
    attrib_array = PMC_data(object);
    attrib_count = ATTRIB_COUNT(object);
    if (attrib >= attrib_count || attrib < POD_FIRST_ATTRIB) {
        internal_exception(OUT_OF_BOUNDS,
                "No such attribute #%d", (int)attrib);
    }
    return get_attrib_num(attrib_array, attrib);
}

static INTVAL
attr_str_2_num(Parrot_Interp interpreter, PMC *object, STRING *attr)
{
    PMC *class;
    PMC *attr_hash;
    SLOTTYPE *class_array;
    HashBucket *b;
    char *cattr, *cobj;

    if (!PObj_is_object_TEST(object))
        internal_exception(INTERNAL_NOT_IMPLEMENTED,
                "Can't set non-core object attribs yet");

    class = GET_CLASS((SLOTTYPE *)PMC_data(object), object);
    class_array = (SLOTTYPE *)PMC_data(class);
    attr_hash = get_attrib_num(class_array, PCD_ATTRIBUTES);
    b = hash_get_bucket(interpreter,
                (Hash*) PMC_struct_val(attr_hash), attr);
    if (b)
        return VTABLE_get_integer(interpreter, (PMC*)b->value);
    /* escape the NUL char */
    cobj = string_to_cstring(interpreter, attr);
    cattr = cobj + strlen(cobj) + 1;
    internal_exception(1, "No such attribute '%s\\0%s'",
            cobj, cattr);
    string_cstring_free(cattr);
    return 0;
}

PMC *
Parrot_get_attrib_by_str(Parrot_Interp interpreter, PMC *object, STRING *attr)
{
    return Parrot_get_attrib_by_num(interpreter, object,
                POD_FIRST_ATTRIB +
                attr_str_2_num(interpreter, object, attr));
}

/*

=item C<PMC *
Parrot_set_attrib_by_num(Parrot_Interp interpreter, PMC *object,
  INTVAL attrib, PMC *value)>

Set attribute number C<attrib> from C<object> to C<value>. Presumably the code
is asking for the correct attribute number.

=item C<PMC *
Parrot_set_attrib_by_str(Parrot_Interp interpreter, PMC *object,
  STRING *attr, PMC *value)>

Sets attribute with full qualified name C<attr> from C<object> to C<value>.

=cut

*/

void
Parrot_set_attrib_by_num(Parrot_Interp interpreter, PMC *object,
        INTVAL attrib, PMC *value)
{
    SLOTTYPE *attrib_array;
    INTVAL attrib_count;

    attrib_array = PMC_data(object);
    attrib_count = ATTRIB_COUNT(object);
    if (attrib >= attrib_count || attrib < POD_FIRST_ATTRIB) {
        internal_exception(OUT_OF_BOUNDS,
                "No such attribute #%d", (int)attrib);
    }
    set_attrib_num(object, attrib_array, attrib, value);
}

void
Parrot_set_attrib_by_str(Parrot_Interp interpreter, PMC *object,
        STRING *attr, PMC *value)
{

    Parrot_set_attrib_by_num(interpreter, object,
                POD_FIRST_ATTRIB +
                attr_str_2_num(interpreter, object, attr),
                value);
}

INTVAL
Parrot_class_offset(Parrot_Interp interpreter, PMC *object, STRING *class) {
    PMC *offset_hash;
    PMC *class_pmc;
    INTVAL offset;
    HashBucket *b;

    if (!PObj_is_object_TEST(object))
        internal_exception(1, "Not an object");
    class_pmc = GET_CLASS((SLOTTYPE *)PMC_data(object), object);
    offset_hash = get_attrib_num((SLOTTYPE *)PMC_data(class_pmc),
                                 PCD_ATTRIB_OFFS);
#if 0
    if (VTABLE_exists_keyed_str(interpreter, offset_hash, class)) {
        offset = VTABLE_get_integer_keyed_str(interpreter, offset_hash, class);
    }
    else {
        offset = -1;
    }
#else
    /*
     * cheat a bit--the offset_hash is a Hash PMC
     */
    b = hash_get_bucket(interpreter,
                (Hash*) PMC_struct_val(offset_hash), class);
    if (!b)
        offset = -1;
    else {
        return PMC_int_val((PMC*)b->value);
    }
#endif
    return offset;
}

/*

=item C<PMC *
Parrot_find_class_constructor(Parrot_Interp interpreter, STRING *class, INTVAL classtoken)>

Find and return the constructor method PMC for the named sub. The
classtoken is an identifier for the class used for fast lookup, or 0
if you don't have an identifier token. Which, as they're currently
undefined, is pretty likely

=cut

*/

PMC *
Parrot_find_class_constructor(Parrot_Interp interpreter, STRING *class, INTVAL classtoken)
{
    return NULL;
}

PMC *
Parrot_find_class_destructor(Parrot_Interp interpreter, STRING *class, INTVAL classtoken)
{
    return NULL;
}

PMC *
Parrot_find_class_fallback(Parrot_Interp interpreter, STRING *class, INTVAL classtoken)
{
    return NULL;
}

void
Parrot_set_class_constructor(Parrot_Interp interpreter, STRING *class, INTVAL classtoken, STRING *method)
{
}

void
Parrot_set_class_destructor(Parrot_Interp interpreter, STRING *class, INTVAL classtoken, STRING *method)
{
}

void
Parrot_set_class_fallback(Parrot_Interp interpreter, STRING *class, INTVAL classtoken, STRING *method)
{
}

/*

=back

=head1 SEE ALSO

F<include/parrot/objects.h>, F<docs/pdds/pdd15_objects.pod>.

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
