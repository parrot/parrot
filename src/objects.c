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

#include "parrot/parrot.h"
#include <assert.h>


static PMC *
clone_array(Parrot_Interp interpreter, PMC *source_array)
{
    PMC *new_array;
    INTVAL count;
    INTVAL i;

    count = VTABLE_elements(interpreter, source_array);
    /*
     * preserve type, we have OrderedHash and Array
     */
    new_array = pmc_new(interpreter, source_array->vtable->base_type);
    VTABLE_set_integer_native(interpreter, new_array, count);
    for (i = 0; i < count; i++) {
        VTABLE_set_pmc_keyed_int(interpreter, new_array, i,
                VTABLE_get_pmc_keyed_int(interpreter, source_array, i));
    }
    return new_array;
}

/*

=item C<static PMC *
find_global(Parrot_Interp interpreter, STRING *class, STRING *globalname)>

This should be public, but for right now it's internal.

=cut

v*/

static PMC *
find_global(Parrot_Interp interpreter, STRING *class, STRING *globalname)
{
    PMC *stash;
#if 1
    /*
     * we are cheating a bit and use PerlHash internals to avoid
     * hash lookup duplication
     */
    HashBucket *b;
#ifdef FIND_DEBUG
    PIO_printf(interpreter, "find_global class '%Ss' meth '%Ss\n",
            class, globalname);
#endif
    stash = interpreter->globals->stash_hash;
    if (class) {
        b = hash_get_bucket(interpreter,
                (Hash*) PMC_struct_val(stash), class);
        if (!b)
            return NULL;
        stash = b->value;
        b = hash_get_bucket(interpreter,
                (Hash*) PMC_struct_val(stash), globalname);
        if (!b)
            return NULL;
        return VTABLE_get_pmc_keyed_int(interpreter, stash,
                PMC_int_val((PMC*)b->value));
    }
    b = hash_get_bucket(interpreter,
                (Hash*) PMC_struct_val(stash), globalname);
    if (!b)
        return NULL;
    return b->value;

#else
    if (class) {
        if (!VTABLE_exists_keyed_str(interpreter,
                                     interpreter->globals->stash_hash,
                                     class)) {
            return NULL;
        }
        stash = VTABLE_get_pmc_keyed_str(interpreter,
                                         interpreter->globals->stash_hash,
                                         class);
    }
    else {
        stash = interpreter->globals->stash_hash;
    }
    if (!VTABLE_exists_keyed_str(interpreter, stash, globalname)) {
        return NULL;
    }
    return VTABLE_get_pmc_keyed_str(interpreter,
            stash, globalname);
#endif
}

/* Take the class and completely rebuild the atttribute stuff for
   it. Horribly destructive, and definitely not a good thing to do if
   there are instantiated objects for the class */
static void
rebuild_attrib_stuff(Parrot_Interp interpreter, PMC *class) {
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
    class_offset_hash = pmc_new(interpreter, enum_class_OrderedHash);
    parent_array = get_attrib_num(class_slots, PCD_ALL_PARENTS);
    parent_class_count = VTABLE_elements(interpreter, parent_array);
    if (parent_class_count) {
        for (class_offset = 0; class_offset < parent_class_count;
             class_offset++) {
            INTVAL parent_attr_count;
            SLOTTYPE *parent_slots;
            PMC *parent_attrib_array;
            a_parent_class = VTABLE_get_pmc_keyed_int(interpreter,
                                                      parent_array,
                                                      class_offset);
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
                STRING *FQ_name;
                STRING *partial_name;
                parent_name = VTABLE_get_string(interpreter,
                                                get_attrib_num(parent_slots,
                                                               PCD_CLASS_NAME));
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
                    attr_name = VTABLE_get_string_keyed_int(interpreter, parent_attrib_array, parent_offset);
                    full_name = string_concat(interpreter, partial_name, attr_name, 0);
                    VTABLE_set_integer_keyed_str(interpreter, attr_offset_hash, full_name, cur_offset++);
                }
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
            if (attr_count) {
                for (offset = 0; offset < attr_count; offset++) {
                    STRING *attr_name;
                    STRING *full_name;
                    attr_name = VTABLE_get_string_keyed_int(interpreter, attribs,
                                                            offset);
                    full_name = string_concat(interpreter, partial_name, attr_name, 0);
                    VTABLE_set_integer_keyed_str(interpreter, attr_offset_hash, full_name, cur_offset++);
                }
            }
        }
    }

    /* And replace what was in there with the new ones */
    set_attrib_num(class_slots, PCD_ATTRIBUTES, attr_offset_hash);
    set_attrib_num(class_slots, PCD_ATTRIB_OFFS, class_offset_hash);
    /* And note the totals */
    class->cache.int_val = cur_offset - POD_FIRST_ATTRIB;
    return;
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
    PMC *child_class_array;
    PMC *classname_pmc;
    PMC *parents, *temp_pmc;
    VTABLE *new_vtable;
    INTVAL new_class_number;

    if (!PObj_is_class_TEST(base_class)) {
        internal_exception(NO_CLASS, "Can't subclass a non-class!");
    }

    child_class = pmc_new(interpreter, enum_class_ParrotClass);
    /* Hang an array off the data pointer */
    child_class_array = PMC_data(child_class) =
        new_attrib_array();
    set_attrib_flags(child_class);
    /* We will have five entries in this array */
    set_attrib_array_size(child_class_array, PCD_MAX);

    /* We have the same number of attributes as our parent */
    child_class->cache.int_val = base_class->cache.int_val;

    /* Our parent class array has a single member in it */
    parents = pmc_new(interpreter, enum_class_Array);
    VTABLE_set_integer_native(interpreter, parents, 1);
    VTABLE_set_pmc_keyed_int(interpreter, parents, 0, base_class);
    set_attrib_num(child_class_array, PCD_PARENTS, parents);

    /* Set the classname, if we have one */
    classname_pmc = pmc_new(interpreter, enum_class_PerlString);
    if (child_class_name) {
        VTABLE_set_string_native(interpreter, classname_pmc, child_class_name);

        /* Add ourselves to the interpreter's class hash */
        VTABLE_set_pmc_keyed_str(interpreter, interpreter->class_hash,
                child_class_name, child_class);
    }
    else {
        child_class_name = string_make(interpreter,
                "\0\0anonymous", 11, NULL, 0, NULL);
        VTABLE_set_string_native(interpreter, classname_pmc,
                child_class_name );
    }

    set_attrib_num(child_class_array, PCD_CLASS_NAME, classname_pmc);

    /* Our penultimate parent list is a clone of our parent's parent
       list, with our parent unshifted onto the beginning */
    temp_pmc =
        clone_array(interpreter,
                    get_attrib_num((SLOTTYPE *)PMC_data(base_class),
                                   PCD_ALL_PARENTS));
    VTABLE_unshift_pmc(interpreter, temp_pmc, base_class);
    set_attrib_num(child_class_array, PCD_ALL_PARENTS, temp_pmc);

    /* Our attribute list is our parent's attribute list */
    temp_pmc = clone_array(interpreter,
                           get_attrib_num((SLOTTYPE *)PMC_data(base_class),
                                          PCD_ATTRIB_OFFS));
    set_attrib_num(child_class_array, PCD_ATTRIB_OFFS, temp_pmc);

    /* And our full keyed attribute list is our parent's */
    temp_pmc = clone_array(interpreter,
                           get_attrib_num((SLOTTYPE *)PMC_data(base_class),
                                          PCD_ATTRIBUTES));
    set_attrib_num(child_class_array, PCD_ATTRIBUTES, temp_pmc);

    /* But we have no attributes of our own. Yet */
    temp_pmc = pmc_new(interpreter, enum_class_Array);
    set_attrib_num(child_class_array, PCD_CLASS_ATTRIBUTES, temp_pmc);

    Parrot_class_register(interpreter, child_class_name, child_class);

    rebuild_attrib_stuff(interpreter, child_class);

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
    PMC *class_array;
    PMC *classname_pmc;
    INTVAL new_class_number;
    VTABLE *new_vtable;
    PMC *temp_pmc;

    /* Hang an array off the data pointer, empty of course */
    class_array = PMC_data(class) = new_attrib_array();
    set_attrib_flags(class);
    /* We will have five entries in this array */
    set_attrib_array_size(class_array, PCD_MAX);
    /* Our parent class array has nothing in it */
    set_attrib_num(class_array, PCD_PARENTS,
                   pmc_new(interpreter, enum_class_Array));
    set_attrib_num(class_array, PCD_ALL_PARENTS,
                   pmc_new(interpreter, enum_class_Array));
    set_attrib_num(class_array, PCD_ATTRIB_OFFS,
            pmc_new(interpreter, enum_class_OrderedHash));
    set_attrib_num(class_array, PCD_ATTRIBUTES,
            pmc_new(interpreter, enum_class_OrderedHash));
    set_attrib_num(class_array, PCD_CLASS_ATTRIBUTES,
            pmc_new(interpreter, enum_class_Array));



    /* Set the classname, if we have one */
    classname_pmc = pmc_new(interpreter, enum_class_PerlString);
    VTABLE_set_string_native(interpreter, classname_pmc, class_name);
    set_attrib_num(class_array, PCD_CLASS_NAME, classname_pmc);

    Parrot_class_register(interpreter, class_name, class);

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
    if (VTABLE_exists_keyed_str(interpreter, interpreter->class_hash,
                class_name))
        return VTABLE_get_pmc_keyed_str(interpreter, interpreter->class_hash,
                class_name);
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
        PMC *new_class)
{
    INTVAL new_type;
    VTABLE *new_vtable;
    PMC *vtable_pmc;

    /*
     * register the class in the PMCs name hash and in the
     * class_name hash
     */
    if ((new_type = pmc_type(interpreter, class_name)) > enum_type_undef) {
        internal_exception(1, "Class %s already registered!\n",
                string_to_cstring(interpreter, class_name));
    }
    new_type = pmc_register(interpreter, class_name);
    /* Build a new vtable for this class
     * The child class PMC gets a ParrotClass vtable, which is a
     * good base to work from
     * XXX we are leaking this vtable
     */
    new_vtable = Parrot_clone_vtable(interpreter, new_class->vtable);

    /* register the class */
    VTABLE_set_pmc_keyed_str(interpreter, interpreter->class_hash,
            class_name, new_class);

    /* Set the vtable's type to the newly allocated type */
    Parrot_vtable_set_type(interpreter, new_vtable, new_type);

    /* And cache our class PMC in the vtable so we can find it later
    */
    Parrot_vtable_set_data(interpreter, new_vtable, new_class);

    /* Reset the init method to our instantiation method */
    new_vtable->init = Parrot_instantiate_object;
    new_class->vtable = new_vtable;

    /* Put our new vtable in the global table */
    Parrot_base_vtables[new_type] = new_vtable;

    /*
     * prepare object vtable
     */
    new_vtable = Parrot_clone_vtable(interpreter,
            Parrot_base_vtables[enum_class_ParrotObject]);
    new_vtable->base_type = new_type;
    set_attrib_num((SLOTTYPE*)PMC_data(new_class), PCD_OBJECT_VTABLE,
                   vtable_pmc = pmc_new(interpreter, enum_class_VtableCache));
    PMC_struct_val(vtable_pmc) = new_vtable;

    return new_type;
}


static void
do_initcall(Parrot_Interp interpreter, PMC* class, PMC *object)
{

    SLOTTYPE *class_data = PMC_data(class);
    PMC *classsearch_array = get_attrib_num(class_data, PCD_ALL_PARENTS);
    PMC *parent_class;
    INTVAL i, nparents;

    nparents = VTABLE_elements(interpreter, classsearch_array);
    for (i = nparents - 1; i >= 0; --i) {
        parent_class = VTABLE_get_pmc_keyed_int(interpreter,
                classsearch_array, i);
        Parrot_base_vtables[enum_class_delegate]->init_pmc(interpreter,
                object, parent_class);
    }
    Parrot_base_vtables[enum_class_delegate]->init(interpreter, object);
}

/*

=item C<void
Parrot_instantiate_object(Parrot_Interp interpreter, PMC *object)>

Creates a Parrot object. Takes a passed-in class PMC that has sufficient
information to describe the layout of the object and, well, makes the
darned object.

=cut

*/

void
Parrot_instantiate_object(Parrot_Interp interpreter, PMC *object) {
    SLOTTYPE *new_object_array;
    INTVAL attrib_count;
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
    attrib_count = class->cache.int_val;

    class_array = PMC_data(class);
    class_name = get_attrib_num(class_array, PCD_CLASS_NAME);

    /* Build the array that hangs off the new object */
    new_object_array = new_attrib_array();
    PMC_data(object) = new_object_array;
    /* set_attrib_flags(object); */
    PObj_custom_mark_SET(object);

    /* Presize it */
    set_attrib_array_size(new_object_array,
                          attrib_count + POD_FIRST_ATTRIB);
    /* 0 - class PMC, 1 - class name */
    set_attrib_num(new_object_array, POD_CLASS, class);
    set_attrib_num(new_object_array, POD_CLASS_NAME, class_name);

    /* Note the number of used slots */
    object->cache.int_val = POD_FIRST_ATTRIB + attrib_count;

    /* We are an object now */
    PObj_is_object_SET(object);

    /* We really ought to call the class init routines here...
     * this assumes that an object isa delegate
     */
    do_initcall(interpreter, class, object);
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
           PMC *add_on_class_obj) {
    SLOTTYPE *current_class;
    SLOTTYPE *add_on_class;
    PMC *current_class_array;
    PMC *current_parent_array;
    PMC *add_on_class_array;
    INTVAL current_count, add_on_count, current_offset, add_on_offset;
    INTVAL current_size;
    INTVAL already_in = 0;

    /* Grab the useful stuff from the guts of the class PMC */
    current_class = PMC_data(current_class_obj);
    add_on_class = PMC_data(add_on_class_obj);

    /* Start with the current list */
    current_class_array = get_attrib_num(current_class,
                                         PCD_ALL_PARENTS);
    add_on_class_array = get_attrib_num(add_on_class,
                                        PCD_ALL_PARENTS);
    current_parent_array = get_attrib_num(current_class,
                                          PCD_PARENTS);

    /* Tack on the new parent class to the end of the immediate parent
       list */
    current_size = VTABLE_elements(interpreter, current_parent_array);
    VTABLE_set_integer_native(interpreter, current_parent_array,
                              current_size + 1);
    VTABLE_set_pmc_keyed_int(interpreter, current_parent_array, current_size,
                            add_on_class_obj);

    /* Loop through them. We can assume that we can just tack on any
       new classes to the end of the current class array. Attributes
       are a bit more interesting, unfortunately */
    current_count = VTABLE_elements(interpreter, current_class_array);
    add_on_count = VTABLE_elements(interpreter, add_on_class_array);

    /* Check to see if the parent class is already in the list. */
    for (current_offset = 0;
         current_offset < current_count;
         current_offset++) {
        if (add_on_class_obj == VTABLE_get_pmc_keyed_int(interpreter,
                                                         current_class_array,
                                                         current_offset)) {
            already_in = 1;
        }
    }

    /* If the parent class isn't already in the list (which can happen
       in a MI situation) go loop through all the classes in the
       parent list and add them into the child if they're not already
       in the child list */
    if (!already_in) {
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
        /* else get the objects class and the data array */
        t = get_attrib_num(object_array, POD_CLASS);
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

=cut

*/

static PMC * find_method_with_cache(Parrot_Interp, PMC *, STRING*);

typedef struct _meth_cache_entry {
    void * strstart;    /* string address */
    PMC  * pmc;         /* the method sub pmc */
    struct _meth_cache_entry *next;
} Meth_cache_entry;

typedef struct {
    UINTVAL size;               /* sizeof table */
    Meth_cache_entry ***idx;    /* bufstart idx */
    /* PMC **hash */            /* for non-constant keys */
    PMC *retc_free_list;        /* recycled return continuations */
    int dont_cache_retc;        /* after the first real Continuation
                                   is built, we can't use this
                                   optimization anymore */
} Meth_cache;

/*
 * XXX RetContinution free_list handling is currently here
 */
#define DISABLE_METH_CACHE 0
#define DISBALE_RETC_RECYCLING 0
void add_to_retc_free_list(Parrot_Interp, PMC*);
PMC *get_retc_from_free_list(Parrot_Interp);
void mark_object_cache(Parrot_Interp);

void
add_to_retc_free_list(Parrot_Interp interpreter, PMC *sub)
{
    Meth_cache *mc = interpreter->method_cache;
    /* is it created from new_ret_continuation_pmc() i.e.
     * from invokecc or callmethodcc
     */
    if (!(PObj_get_FLAGS(sub) & PObj_private2_FLAG) ||
            DISBALE_RETC_RECYCLING)
        return;
    PMC_struct_val(sub) = mc->retc_free_list;
    mc->retc_free_list = sub;
    /* don't mark the continuation context */
    PObj_custom_mark_CLEAR(sub);
    /* fprintf(stderr, "** add %p\n", sub); */
}

PMC *
get_retc_from_free_list(Parrot_Interp interpreter)
{
    Meth_cache *mc = interpreter->method_cache;
    PMC *retc;

    if (!mc->retc_free_list)
        return NULL;
    retc = mc->retc_free_list;
    mc->retc_free_list = PMC_struct_val(retc);
    PObj_custom_mark_SET(retc);
    /* fprintf(stderr, "** get %p free = %p\n", retc, mc->retc_free_list );*/
    return retc;
}

void
mark_object_cache(Parrot_Interp interpreter)
{
    Meth_cache *mc = interpreter->method_cache;
    PMC *sub;
    sub = mc->retc_free_list;
    while (sub) {
        pobject_lives(interpreter, (PObj*)sub);
        sub = PMC_struct_val(sub);
    }
}

void
init_object_cache(Parrot_Interp interpreter)
{
    Meth_cache *mc;

    mc = interpreter->method_cache = mem_sys_allocate_zeroed(sizeof(*mc));
    SET_NULL(mc->idx)
    SET_NULL(mc->retc_free_list);
}


#define TBL_SIZE_MASK 0x1ff   /* x bits 2..10 */
#define TBL_SIZE (1 + TBL_SIZE_MASK)
/*
 * quick'n'dirty method cache
 * TODO: integrae NCI meth lookup
 * TODO: use a hash if method_name is not constant
 *       i.e. from obj.$Sreg(args)
 *       If this hash is implemented mark it during DOD
 */
PMC *
Parrot_find_method_with_cache(Parrot_Interp interpreter, PMC *class,
                              STRING *method_name)
{

    UINTVAL type = class->vtable->base_type;
    Meth_cache *mc = interpreter->method_cache;
    PMC *found;
    int store_it = 0;
    int is_const = PObj_constant_TEST(method_name);
    UINTVAL bits = (((UINTVAL) method_name->strstart ) >> 2) & TBL_SIZE_MASK;
    Meth_cache_entry *e, *old = NULL;

    if (!is_const || DISABLE_METH_CACHE) {
        /* TODO use hash - for now just go look up */
        goto find_it;
    }

    if (type >= mc->size || !mc->idx[type] || !mc->idx[type][bits]) {
        store_it = 1;
find_it:
        found = find_method_with_cache(interpreter, class, method_name);
    }
    else {
        e = mc->idx[type][bits];
        while (e && e->strstart != method_name->strstart) {
            old = e;
            e = e->next;
        }
        if (!e) {
            found = find_method_with_cache(interpreter, class, method_name);
            goto store_e;
        }
        return e->pmc;
    }
    if (store_it) {
        UINTVAL i;
        if (type >= mc->size) {
            mc->idx = mem_sys_realloc(mc->idx,
                    sizeof(UINTVAL*) * (type + 1));
            for (i = mc->size; i <= type; ++i)
                mc->idx[i] = NULL;
            mc->size = type + 1;
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

static PMC *
find_method_with_cache(Parrot_Interp interpreter, PMC *class,
                              STRING *method_name)
{
    PMC* method = NULL;  /* The method we ultimately return */
    PMC* curclass;          /* PMC for the current search class */
    PMC* classsearch_array; /* The array of classes we're searching
                               for the method in */
    INTVAL searchoffset = 0; /* Where in that array we are */
    INTVAL classcount = 0;   /* The number of classes we need to
                                search */

    /* if its a non-classes, just return the sub */
    if (!PObj_is_class_TEST(class)) {
        return find_global(interpreter,
                           NULL,
                           method_name);
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
    method = find_global(interpreter,
                         VTABLE_get_string(interpreter,
                                  get_attrib_num((SLOTTYPE *)PMC_data(class),
                                                 PCD_CLASS_NAME)),
                         method_name);

    /* Bail immediately if we got something */
    if (NULL != method) {
        return method;
    }

    /* If not, time to walk through the parent class array. Wheee */
    classsearch_array = get_attrib_num((SLOTTYPE *)PMC_data(class),
                                       PCD_ALL_PARENTS);
    classcount = VTABLE_elements(interpreter, classsearch_array);

    for (searchoffset = 0; NULL == method && searchoffset < classcount;
            searchoffset++) {
        curclass = VTABLE_get_pmc_keyed_int(interpreter,
                classsearch_array, searchoffset);
        method = find_global(interpreter,
                             VTABLE_get_string(interpreter,
                                  get_attrib_num((SLOTTYPE *)PMC_data(curclass),
                                                 PCD_CLASS_NAME)),
                             method_name);
        if (method) {
            Parrot_note_method_offset(interpreter, searchoffset, method);
        }
    }
    return method;
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
    PMC *offs_hash;
    PMC *attr_hash = NULL;
    PMC *attr_array;
    STRING *full_attr_name;

    class_array = (SLOTTYPE *)PMC_data(class);
    class_name = VTABLE_get_string(interpreter, get_attrib_num(class_array,
                                                               PCD_CLASS_NAME));
    attr_array = get_attrib_num(class_array, PCD_CLASS_ATTRIBUTES);
    attr_hash = get_attrib_num(class_array, PCD_ATTRIBUTES);
    idx = VTABLE_elements(interpreter, attr_array);
    VTABLE_set_integer_native(interpreter, attr_array, idx + 1);
    VTABLE_set_string_keyed_int(interpreter, attr_array, idx, attr);
    full_attr_name = string_concat(interpreter, class_name, string_from_cstring(interpreter, "\0", 1), 0);
    full_attr_name = string_concat(interpreter, full_attr_name, attr, 0);

    /*
     * TODO check if someone is trying to add attributes to a parent class
     * while there are already child class attrs
     */
    idx = VTABLE_elements(interpreter, attr_hash);
    assert(class->cache.int_val == idx);
    VTABLE_set_integer_keyed_str(interpreter, attr_hash,
            full_attr_name, idx);
    assert(idx + 1 == VTABLE_elements(interpreter, attr_hash));
    class->cache.int_val = idx + 1;
    return idx;
}

/*

=item C<PMC *
Parrot_get_attrib_by_num(Parrot_Interp interpreter, PMC *object, INTVAL attrib)>

Returns attribute number C<attrib> from C<object>. Presumably the code
is asking for the correct attribute number.

*/

PMC *
Parrot_get_attrib_by_num(Parrot_Interp interpreter, PMC *object, INTVAL attrib)
{
    SLOTTYPE *attrib_array;
    if (PObj_is_object_TEST(object)) {
        INTVAL attrib_count;
        attrib_array = PMC_data(object);
        attrib_count = get_attrib_count(attrib_array);
        if (attrib >= attrib_count || attrib < POD_FIRST_ATTRIB) {
            internal_exception(OUT_OF_BOUNDS, "No such attribute");
        }
        return get_attrib_num(attrib_array, attrib);
    }
    else {
        internal_exception(INTERNAL_NOT_IMPLEMENTED, "Can't get non-core object attribs yet");
    }
    return NULL;
}

void
Parrot_set_attrib_by_num(Parrot_Interp interpreter, PMC *object, INTVAL attrib, PMC *value) {
    SLOTTYPE *attrib_array;
    if (PObj_is_object_TEST(object)) {
        INTVAL attrib_count;
        attrib_array = PMC_data(object);
        attrib_count = get_attrib_count(attrib_array);
        if (attrib >= attrib_count || attrib < POD_FIRST_ATTRIB) {
            internal_exception(OUT_OF_BOUNDS, "No such attribute");
        }
        set_attrib_num(attrib_array, attrib, value);
    }
    else {
        internal_exception(INTERNAL_NOT_IMPLEMENTED, "Can't set non-core object attribs yet");
    }
}

INTVAL
Parrot_class_offset(Parrot_Interp interpreter, PMC *object, STRING *class) {
    PMC *offset_hash;
    PMC *class_pmc;
    INTVAL offset;
    HashBucket *b;

    class_pmc = get_attrib_num((SLOTTYPE *)PMC_data(object),
                               POD_CLASS);
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
     * cheat a bit--the offset_hash is an OrderedHash PMC
     */
    b = hash_get_bucket(interpreter,
                (Hash*) PMC_struct_val(offset_hash), class);
    if (!b)
        offset = -1;
    else {
        offset = VTABLE_get_integer_keyed_int(interpreter, offset_hash,
                PMC_int_val((PMC*)b->value));
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
