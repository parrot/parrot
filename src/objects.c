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

/*

=item C<static PMC *
find_global(Parrot_Interp interpreter, STRING *class, STRING *globalname)>

This should be public, but for right now it's internal.

=cut

*/

static PMC *
find_global(Parrot_Interp interpreter, STRING *class, STRING *globalname) {
    PMC *stash;
    if (NULL != class) {
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
}

/*

=item C<PMC *
Parrot_single_subclass(Parrot_Interp interpreter, PMC *base_class,
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

    if (!PObj_is_class_TEST(base_class)) {
        internal_exception(NO_CLASS, "Can't subclass a non-class!");
    }

    child_class = pmc_new(interpreter, enum_class_ParrotClass);
    /* Hang an array off the data pointer */
    child_class_array = PMC_data(child_class) =
        pmc_new(interpreter, enum_class_SArray);
    /* We will have five entries in this array */
    VTABLE_set_integer_native(interpreter, child_class_array, PCD_MAX);

    /* We have the same number of attributes as our parent */
    child_class->cache.int_val = base_class->cache.int_val;

    /* Our parent class array has a single member in it */
    parents = pmc_new(interpreter, enum_class_Array);
    VTABLE_set_integer_native(interpreter, parents, 1);
    VTABLE_set_pmc_keyed_int(interpreter, parents, 0, base_class);
    VTABLE_set_pmc_keyed_int(interpreter, child_class_array, PCD_PARENTS,
            parents);

    /* Set the classname, if we have one */
    classname_pmc = pmc_new(interpreter, enum_class_PerlString);
    if (child_class_name) {
        VTABLE_set_string_native(interpreter, classname_pmc, child_class_name);

        /* Add ourselves to the interpreter's class hash */
        VTABLE_set_pmc_keyed_str(interpreter, interpreter->class_hash,
                child_class_name, child_class);
    }
    else {
        VTABLE_set_string_native(interpreter, classname_pmc,
                string_make(interpreter,
                    "\0\0anonymous",
                    11, NULL, 0, NULL));
    }

    VTABLE_set_pmc_keyed_int(interpreter, child_class_array, PCD_CLASS_NAME,
            classname_pmc);

    /* Our penultimate parent list is a clone of our parent's parent
       list, with our parent unshifted onto the beginning */
    temp_pmc =
        VTABLE_clone(interpreter,
                VTABLE_get_pmc_keyed_int(interpreter,
                    (PMC *)PMC_data(base_class), PCD_ALL_PARENTS));
    VTABLE_unshift_pmc(interpreter, temp_pmc, base_class);
    VTABLE_set_pmc_keyed_int(interpreter, child_class_array, PCD_ALL_PARENTS,
            temp_pmc);

    /* Our attribute list is our parent's attribute list */
    temp_pmc = VTABLE_clone(interpreter,
            VTABLE_get_pmc_keyed_int(interpreter,
                (PMC *)PMC_data(base_class), PCD_ATTRIB_OFFS));
    VTABLE_set_pmc_keyed_int(interpreter, child_class_array, PCD_ATTRIB_OFFS,
            temp_pmc);

    /* And our full keyed attribute list is our parent's */
    temp_pmc = VTABLE_clone(interpreter,
            VTABLE_get_pmc_keyed_int(interpreter,
                (PMC *)PMC_data(base_class), PCD_ATTRIBUTES));
    VTABLE_set_pmc_keyed_int(interpreter, child_class_array, PCD_ATTRIBUTES,
            temp_pmc);

    Parrot_class_register(interpreter, child_class_name, child_class);

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

    /* Hang an array off the data pointer, empty of course */
    class_array = PMC_data(class) = pmc_new(interpreter, enum_class_SArray);
    /* We will have five entries in this array */
    VTABLE_set_integer_native(interpreter, class_array, PCD_MAX);
    /* Our parent class array has nothing in it */
    VTABLE_set_pmc_keyed_int(interpreter, class_array, PCD_PARENTS,
            pmc_new(interpreter, enum_class_Array));
    VTABLE_set_pmc_keyed_int(interpreter, class_array, PCD_ALL_PARENTS,
            pmc_new(interpreter, enum_class_Array));
    VTABLE_set_pmc_keyed_int(interpreter, class_array, PCD_ATTRIB_OFFS,
            pmc_new(interpreter, enum_class_OrderedHash));
    VTABLE_set_pmc_keyed_int(interpreter, class_array, PCD_ATTRIBUTES,
            pmc_new(interpreter, enum_class_OrderedHash));
    VTABLE_set_pmc_keyed_int(interpreter, class_array, PCD_CLASS_ATTRIBUTES,
            pmc_new(interpreter, enum_class_Array));
                             

    /* Set the classname, if we have one */
    classname_pmc = pmc_new(interpreter, enum_class_PerlString);
    VTABLE_set_string_native(interpreter, classname_pmc, class_name);
    VTABLE_set_pmc_keyed_int(interpreter, class_array, PCD_CLASS_NAME,
            classname_pmc);

    Parrot_class_register(interpreter, class_name, class);
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

=item C<void
Parrot_class_register(Parrot_Interp interpreter, STRING *class_name,
        PMC *new_class)>

This is the way to register a new Parrot class as an instantiatable
type. Doing this involves putting it in the class hash, setting its
vtable so that the C<init> method initializes objects of the class rather than
the class itself, and adding it to the interpreter's base type table so
you can create a new C<foo> in PASM like this: C<new Px, foo>.

=cut

*/

void
Parrot_class_register(Parrot_Interp interpreter, STRING *class_name,
        PMC *new_class)
{
    INTVAL new_type;
    VTABLE *new_vtable;

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
    PMC *new_object_array;
    INTVAL attrib_count;
    PMC *class_array;
    PMC *class;
    INTVAL class_enum;
    PMC *class_name;

    class = object->vtable->data;
    /* * remember PMC type */
    class_enum = object->vtable->base_type;
    /* put in the real vtable
     * XXX we are leaking ths vtable
     */
    object->vtable = Parrot_clone_vtable(interpreter,
                Parrot_base_vtables[enum_class_ParrotObject]);
    /* and set type of class */
    object->vtable->base_type = class_enum;

    /* Grab the attribute count from the parent */
    attrib_count = class->cache.int_val;

    class_array = PMC_data(class);
    class_name = VTABLE_get_pmc_keyed_int(interpreter, class_array,
            PCD_CLASS_NAME);

    /* Build the array that hangs off the new object */
    new_object_array = pmc_new(interpreter, enum_class_Array);
    /* Presize it */
    VTABLE_set_integer_native(interpreter, new_object_array,
            attrib_count + POD_FIRST_ATTRIB);
    /* 0 - class PMC, 1 - class name */
    VTABLE_set_pmc_keyed_int(interpreter, new_object_array, POD_CLASS, class);
    VTABLE_set_pmc_keyed_int(interpreter, new_object_array, POD_CLASS_NAME,
            class_name);

    /* Note the number of used slots */
    object->cache.int_val = POD_FIRST_ATTRIB + attrib_count;

    PMC_data(object) = new_object_array;
    PObj_flag_SET(is_PMC_ptr, object);
    /* We are an object now */
    PObj_is_object_SET(object);

    /* TODO We really ought to call the class init routines here... */
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
    PMC *current_class;
    PMC *add_on_class;
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
    current_class_array = VTABLE_get_pmc_keyed_int(interpreter, current_class,
                                                   PCD_ALL_PARENTS);
    add_on_class_array = VTABLE_get_pmc_keyed_int(interpreter, add_on_class,
                                                  PCD_ALL_PARENTS);
    current_parent_array = VTABLE_get_pmc_keyed_int(interpreter, current_class,
                                                    PCD_PARENTS);

    /* Tack on the new parent class to the end of the immediate parent
       list */
    current_size = VTABLE_elements(interpreter, current_parent_array);
    VTABLE_set_integer_native(interpreter, current_parent_array,
                              current_size + 1);
    VTABLE_set_pmc_keyed_int(interpreter, current_parent_array, current_size,
                            add_on_class);

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
            puts("Already there");
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

Return whether the object C<pmc> is an instance of class Ccl>.

=cut

*/

INTVAL
Parrot_object_isa(Parrot_Interp interpreter, PMC *pmc, PMC *cl) {
    PMC * t;
    PMC * object_array = PMC_data(pmc);
    PMC* classsearch_array; /* The array of classes we're searching */
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
        t = VTABLE_get_pmc_keyed_int(interpreter, object_array, POD_CLASS);
        object_array = PMC_data(t);
    }
    if (t == cl)
        return 1;
    /* If not, time to walk through the parent class array. Wheee */
    classsearch_array =
        VTABLE_get_pmc_keyed_int(interpreter, object_array, PCD_ALL_PARENTS);
    classcount = VTABLE_get_integer(interpreter, classsearch_array);
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

PMC *
Parrot_find_method_with_cache(Parrot_Interp interpreter, PMC *class,
                              STRING *method_name) {
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
                         VTABLE_get_string_keyed_int(interpreter,
                               (PMC *)PMC_data(class), PCD_CLASS_NAME),
                         method_name);

    /* Bail immediately if we got something */
    if (NULL != method) {
        return method;
    }

    /* If not, time to walk through the parent class array. Wheee */
    classsearch_array =
        VTABLE_get_pmc_keyed_int(interpreter, (PMC *)PMC_data(class),
                PCD_ALL_PARENTS);
    classcount = VTABLE_get_integer(interpreter, classsearch_array);

    for (searchoffset = 0; NULL == method && searchoffset < classcount;
            searchoffset++) {
        curclass = VTABLE_get_pmc_keyed_int(interpreter,
                classsearch_array, searchoffset);
        method = find_global(interpreter,
                             VTABLE_get_string_keyed_int(interpreter,
                                (PMC *)PMC_data(curclass), PCD_CLASS_NAME),
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
    PMC *class_array;
    STRING *class_name;
    INTVAL idx;
    PMC *offs_hash;
    PMC *attr_hash = NULL;
    PMC *attr_array;
    STRING *full_attr_name;

    class_array = (PMC*) PMC_data(class);
    class_name = VTABLE_get_string_keyed_int(interpreter,
            class_array, PCD_CLASS_NAME);
    attr_array = VTABLE_get_pmc_keyed_int(interpreter, class_array, PCD_CLASS_ATTRIBUTES);
    attr_hash = VTABLE_get_pmc_keyed_int(interpreter, class_array, PCD_ATTRIBUTES);
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
    PMC *attrib_array;
    if (PObj_is_object_TEST(object)) {
        attrib_array = PMC_data(object);
        return VTABLE_get_pmc_keyed_int(interpreter, attrib_array, attrib);
    }
    else {
        internal_exception(INTERNAL_NOT_IMPLEMENTED, "Can't get non-core object attribs yet");
    }
    return NULL;
}

void
Parrot_set_attrib_by_num(Parrot_Interp interpreter, PMC *object, INTVAL attrib, PMC *value) {
    PMC *attrib_array;
    if (PObj_is_object_TEST(object)) {
        attrib_array = PMC_data(object);
        VTABLE_set_pmc_keyed_int(interpreter, attrib_array, attrib, value);
    }
    else {
        internal_exception(INTERNAL_NOT_IMPLEMENTED, "Can't set non-core object attribs yet");
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
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
